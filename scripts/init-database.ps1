<#
.SYNOPSIS
    Initialize the Super-Intelligent Course Designer content inventory database.

.DESCRIPTION
    This script creates and initializes the SQLite database for the content inventory
    system by executing the schema.sql file. It creates all tables, indexes, triggers,
    and initial data required for the meta-development system.

.PARAMETER DatabasePath
    Path to the SQLite database file. Defaults to 'content-inventory/content.db'

.PARAMETER SchemaPath
    Path to the schema.sql file. Defaults to 'content-inventory/schema/schema.sql'

.PARAMETER Force
    If specified, will delete and recreate the database if it already exists.
    WARNING: This will destroy all existing data!

.EXAMPLE
    .\init-database.ps1
    # Creates database at default location

.EXAMPLE
    .\init-database.ps1 -DatabasePath "custom/path/content.db" -SchemaPath "custom/schema.sql"
    # Creates database at custom location

.EXAMPLE
    .\init-database.ps1 -Force
    # Recreates database even if it exists (destroys existing data)

.NOTES
    Author: Meta-Development System
    Version: 1.0.0
    Requires: SQLite3
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$DatabasePath = "content-inventory/content.db",
    
    [Parameter(Mandatory=$false)]
    [string]$SchemaPath = "content-inventory/schema/schema.sql",
    
    [Parameter(Mandatory=$false)]
    [switch]$Force
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

# Main execution
try {
    Write-ColorOutput "`n=== Initializing Content Inventory Database ===" "Cyan"
    Write-ColorOutput "Database Path: $DatabasePath"
    Write-ColorOutput "Schema Path: $SchemaPath`n"
    
    # Resolve paths to absolute
    $RepoRoot = Split-Path -Parent $PSScriptRoot
    $DbPath = Join-Path $RepoRoot $DatabasePath
    $SchemaFilePath = Join-Path $RepoRoot $SchemaPath
    
    # Validate schema file exists
    if (-not (Test-Path $SchemaFilePath)) {
        throw "Schema file not found at: $SchemaFilePath"
    }
    
    # Check if database already exists
    if (Test-Path $DbPath) {
        if ($Force) {
            Write-ColorOutput "⚠️  Database exists. Force flag specified - deleting existing database..." "Yellow"
            Remove-Item $DbPath -Force
            Write-ColorOutput "✓ Existing database deleted`n" "Green"
        } else {
            Write-ColorOutput "⚠️  Database already exists at: $DbPath" "Yellow"
            Write-ColorOutput "Use -Force to recreate (WARNING: destroys all data)`n" "Yellow"
            
            $response = Read-Host "Continue anyway to re-run schema? (y/n)"
            if ($response -ne 'y') {
                Write-ColorOutput "`nOperation cancelled." "Yellow"
                exit 0
            }
        }
    }
    
    # Ensure database directory exists
    $DbDirectory = Split-Path -Parent $DbPath
    if (-not (Test-Path $DbDirectory)) {
        Write-ColorOutput "Creating database directory: $DbDirectory" "Gray"
        New-Item -ItemType Directory -Path $DbDirectory -Force | Out-Null
    }
    
    # Read schema file
    Write-ColorOutput "Reading schema file..." "Gray"
    $schemaContent = Get-Content $SchemaFilePath -Raw
    
    # Check if SQLite3 is available
    Write-ColorOutput "Checking for SQLite3..." "Gray"
    $sqlite3Available = $false
    
    try {
        $null = Get-Command sqlite3 -ErrorAction Stop
        $sqlite3Available = $true
        Write-ColorOutput "✓ SQLite3 found`n" "Green"
    } catch {
        Write-ColorOutput "⚠️  SQLite3 not found in PATH" "Yellow"
        Write-ColorOutput "Attempting to use System.Data.SQLite assembly...`n" "Yellow"
    }
    
    if ($sqlite3Available) {
        # Use sqlite3 command-line tool
        Write-ColorOutput "Executing schema using sqlite3..." "Gray"
        
        $schemaContent | sqlite3 $DbPath
        
        if ($LASTEXITCODE -ne 0) {
            throw "SQLite3 execution failed with exit code: $LASTEXITCODE"
        }
        
    } else {
        # Use .NET SQLite assembly
        Write-ColorOutput "Loading System.Data.SQLite assembly..." "Gray"
        
        # Try to load SQLite assembly (requires System.Data.SQLite NuGet package)
        try {
            Add-Type -Path "$env:USERPROFILE\.nuget\packages\System.Data.SQLite.Core\*\lib\net46\System.Data.SQLite.dll" -ErrorAction Stop
        } catch {
            throw "System.Data.SQLite assembly not found. Please install SQLite3 or run: Install-Package System.Data.SQLite.Core"
        }
        
        Write-ColorOutput "Creating database connection..." "Gray"
        $connectionString = "Data Source=$DbPath;Version=3;New=True;"
        $connection = New-Object System.Data.SQLite.SQLiteConnection($connectionString)
        $connection.Open()
        
        Write-ColorOutput "Executing schema..." "Gray"
        $command = $connection.CreateCommand()
        $command.CommandText = $schemaContent
        $command.ExecuteNonQuery() | Out-Null
        
        $connection.Close()
        $connection.Dispose()
    }
    
    Write-ColorOutput "✓ Schema executed successfully`n" "Green"
    
    # Verify tables were created
    Write-ColorOutput "Verifying database structure..." "Gray"
    
    if ($sqlite3Available) {
        $tables = sqlite3 $DbPath ".tables" | Out-String
    } else {
        $connectionString = "Data Source=$DbPath;Version=3;"
        $connection = New-Object System.Data.SQLite.SQLiteConnection($connectionString)
        $connection.Open()
        
        $command = $connection.CreateCommand()
        $command.CommandText = "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;"
        $reader = $command.ExecuteReader()
        
        $tables = @()
        while ($reader.Read()) {
            $tables += $reader.GetString(0)
        }
        
        $reader.Close()
        $connection.Close()
        $connection.Dispose()
        
        $tables = $tables -join ", "
    }
    
    Write-ColorOutput "`n=== Tables Created ===" "Cyan"
    Write-ColorOutput $tables "White"
    
    # Count tables
    $tableCount = ($tables -split '\s+').Count
    Write-ColorOutput "`nTotal tables: $tableCount" "Cyan"
    
    # Success message
    Write-ColorOutput "`n=== ✓ Database Initialization Complete ===" "Green"
    Write-ColorOutput "Database location: $DbPath" "Green"
    Write-ColorOutput "`nNext steps:" "Cyan"
    Write-ColorOutput "  1. Use this database with VS Code chat modes (@librarian, @content-strategist, etc.)" "White"
    Write-ColorOutput "  2. Run export-inventory.ps1 to generate JSON/YAML exports" "White"
    Write-ColorOutput "  3. Follow quickstart.md to validate the agent system`n" "White"
    
} catch {
    Write-ColorOutput "`n❌ Error: $($_.Exception.Message)" "Red"
    Write-ColorOutput "`nStack Trace:" "Red"
    Write-ColorOutput $_.ScriptStackTrace "Red"
    exit 1
}
