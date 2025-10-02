<#
.SYNOPSIS
    Export content inventory database to JSON/YAML formats.

.DESCRIPTION
    This script exports content from the SQLite database to human-readable JSON or YAML
    files. These exports are useful for Git diffs, documentation, and integration with
    other tools like Obsidian.

.PARAMETER Format
    Export format: 'Json' or 'Yaml'. Defaults to 'Json'.

.PARAMETER Entity
    Which entities to export: 'Pillars', 'Paths', 'Courses', 'Modules', 'Lessons', 'All'.
    Defaults to 'All'.

.PARAMETER OutputDir
    Directory for export files. Defaults to 'content-inventory/exports/'.

.PARAMETER DatabasePath
    Path to the SQLite database. Defaults to 'content-inventory/content.db'.

.PARAMETER Pretty
    If specified, formats output with indentation for readability (default: true).

.EXAMPLE
    .\export-inventory.ps1
    # Exports all entities to JSON with pretty formatting

.EXAMPLE
    .\export-inventory.ps1 -Format Yaml -Entity Pillars
    # Exports only pillars to YAML format

.EXAMPLE
    .\export-inventory.ps1 -Entity Lessons -OutputDir "exports/lessons"
    # Exports lessons to custom directory

.NOTES
    Author: Meta-Development System
    Version: 1.0.0
    Requires: SQLite3 or System.Data.SQLite
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('Json', 'Yaml')]
    [string]$Format = 'Json',
    
    [Parameter(Mandatory=$false)]
    [ValidateSet('Pillars', 'Paths', 'Courses', 'Modules', 'Lessons', 'Assets', 'Tags', 'Sources', 'All')]
    [string]$Entity = 'All',
    
    [Parameter(Mandatory=$false)]
    [string]$OutputDir = "content-inventory/exports",
    
    [Parameter(Mandatory=$false)]
    [string]$DatabasePath = "content-inventory/content.db",
    
    [Parameter(Mandatory=$false)]
    [bool]$Pretty = $true
)

# Error handling
$ErrorActionPreference = "Stop"

# Helper function to write colored output
function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

# Helper function to convert data to JSON
function ConvertTo-PrettyJson {
    param($Data)
    if ($Pretty) {
        return $Data | ConvertTo-Json -Depth 10 -Compress:$false
    } else {
        return $Data | ConvertTo-Json -Depth 10 -Compress
    }
}

# Helper function to convert data to YAML (simplified)
function ConvertTo-Yaml {
    param($Data)
    
    # Simple YAML conversion (for complex YAML, use powershell-yaml module)
    $yaml = "---`n"
    
    if ($Data -is [Array]) {
        foreach ($item in $Data) {
            $yaml += "- "
            $yaml += ($item | ConvertTo-Json -Depth 10 -Compress) + "`n"
        }
    } else {
        $yaml += ($Data | ConvertTo-Json -Depth 10) + "`n"
    }
    
    return $yaml
}

# Helper function to query database
function Invoke-DatabaseQuery {
    param(
        [string]$Query,
        [string]$DbPath
    )
    
    # Check if sqlite3 is available
    $sqlite3Available = $false
    try {
        $null = Get-Command sqlite3 -ErrorAction Stop
        $sqlite3Available = $true
    } catch {}
    
    if ($sqlite3Available) {
        # Use sqlite3 command-line tool
        $result = sqlite3 -json $DbPath $Query
        return $result | ConvertFrom-Json
    } else {
        # Use .NET SQLite assembly
        try {
            Add-Type -Path "$env:USERPROFILE\.nuget\packages\System.Data.SQLite.Core\*\lib\net46\System.Data.SQLite.dll" -ErrorAction Stop
        } catch {
            throw "System.Data.SQLite assembly not found. Please install SQLite3 or run: Install-Package System.Data.SQLite.Core"
        }
        
        $connectionString = "Data Source=$DbPath;Version=3;"
        $connection = New-Object System.Data.SQLite.SQLiteConnection($connectionString)
        $connection.Open()
        
        $command = $connection.CreateCommand()
        $command.CommandText = $Query
        $adapter = New-Object System.Data.SQLite.SQLiteDataAdapter($command)
        $dataSet = New-Object System.Data.DataSet
        $adapter.Fill($dataSet) | Out-Null
        
        $connection.Close()
        $connection.Dispose()
        
        # Convert DataTable to array of objects
        $results = @()
        foreach ($row in $dataSet.Tables[0].Rows) {
            $obj = @{}
            foreach ($col in $dataSet.Tables[0].Columns) {
                $obj[$col.ColumnName] = $row[$col.ColumnName]
            }
            $results += [PSCustomObject]$obj
        }
        
        return $results
    }
}

# Main execution
try {
    Write-ColorOutput "`n=== Exporting Content Inventory ===" "Cyan"
    Write-ColorOutput "Format: $Format"
    Write-ColorOutput "Entity: $Entity"
    Write-ColorOutput "Output Directory: $OutputDir`n"
    
    # Resolve paths to absolute
    $RepoRoot = Split-Path -Parent $PSScriptRoot
    $DbPath = Join-Path $RepoRoot $DatabasePath
    $ExportPath = Join-Path $RepoRoot $OutputDir
    
    # Validate database exists
    if (-not (Test-Path $DbPath)) {
        throw "Database not found at: $DbPath. Run init-database.ps1 first."
    }
    
    # Ensure output directory exists
    if (-not (Test-Path $ExportPath)) {
        Write-ColorOutput "Creating output directory: $ExportPath" "Gray"
        New-Item -ItemType Directory -Path $ExportPath -Force | Out-Null
    }
    
    # Define entity queries
    $queries = @{
        'Pillars' = "SELECT * FROM Pillar ORDER BY created_at DESC;"
        'Paths' = "SELECT * FROM LearningPath ORDER BY created_at DESC;"
        'Courses' = "SELECT * FROM Course ORDER BY created_at DESC;"
        'Modules' = "SELECT * FROM Module ORDER BY created_at DESC;"
        'Lessons' = "SELECT * FROM Lesson ORDER BY created_at DESC;"
        'Assets' = "SELECT * FROM ContentAsset ORDER BY created_at DESC;"
        'Tags' = "SELECT * FROM Tag ORDER BY category, value;"
        'Sources' = "SELECT * FROM Source ORDER BY last_checked DESC;"
    }
    
    # Determine which entities to export
    $entitiesToExport = if ($Entity -eq 'All') {
        $queries.Keys
    } else {
        @($Entity)
    }
    
    $exportedFiles = @()
    $totalRecords = 0
    
    # Export each entity
    foreach ($entityName in $entitiesToExport) {
        Write-ColorOutput "Exporting $entityName..." "Gray"
        
        $query = $queries[$entityName]
        $data = Invoke-DatabaseQuery -Query $query -DbPath $DbPath
        
        $recordCount = if ($data) { $data.Count } else { 0 }
        $totalRecords += $recordCount
        
        Write-ColorOutput "  Found $recordCount records" "Gray"
        
        if ($recordCount -gt 0) {
            # Determine file extension
            $extension = if ($Format -eq 'Json') { 'json' } else { 'yaml' }
            $fileName = "$($entityName.ToLower()).$extension"
            $filePath = Join-Path $ExportPath $fileName
            
            # Convert and write data
            if ($Format -eq 'Json') {
                $content = ConvertTo-PrettyJson -Data $data
            } else {
                $content = ConvertTo-Yaml -Data $data
            }
            
            Set-Content -Path $filePath -Value $content -Encoding UTF8
            Write-ColorOutput "  ✓ Exported to: $fileName" "Green"
            
            $exportedFiles += $fileName
        } else {
            Write-ColorOutput "  ⊘ No records found, skipping export" "Yellow"
        }
    }
    
    # Export summary
    Write-ColorOutput "`n=== Export Summary ===" "Cyan"
    Write-ColorOutput "Total records exported: $totalRecords" "White"
    Write-ColorOutput "Files created: $($exportedFiles.Count)" "White"
    
    if ($exportedFiles.Count -gt 0) {
        Write-ColorOutput "`nExported files:" "Cyan"
        foreach ($file in $exportedFiles) {
            Write-ColorOutput "  • $file" "White"
        }
    }
    
    Write-ColorOutput "`n=== ✓ Export Complete ===" "Green"
    Write-ColorOutput "Location: $ExportPath`n" "Green"
    
} catch {
    Write-ColorOutput "`n❌ Error: $($_.Exception.Message)" "Red"
    Write-ColorOutput "`nStack Trace:" "Red"
    Write-ColorOutput $_.ScriptStackTrace "Red"
    exit 1
}
