<#
.SYNOPSIS
    Build a global research index by scanning lesson-level session files.

.DESCRIPTION
    Scans content/** for date-prefixed markdown files within lesson folders, reads frontmatter only,
    and generates research/_index.md with grouped links by pillar/path/module/lesson.

.PARAMETER ContentRoot
    Root folder for content. Default: 'content'

.PARAMETER OutputPath
    Output path for generated index. Default: 'research/_index.md'

.PARAMETER MaxResults
    Safety cap on number of files processed. Default: 5000

.EXAMPLE
    pwsh scripts/build-research-index.ps1
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]$ContentRoot = 'content',

    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]$OutputPath = 'research/_index.md',

    [Parameter(Mandatory=$false)]
    [ValidateRange(1, 500000)]
    [int]$MaxResults = 5000
)

$ErrorActionPreference = 'Stop'

function Read-Frontmatter {
    param([string]$Path)
    $lines = Get-Content -Path $Path -ErrorAction Stop
    if ($lines.Count -lt 3 -or $lines[0].Trim() -ne '---') { return $null }
    $front = @{}
    $i = 1
    while ($i -lt $lines.Count -and $lines[$i].Trim() -ne '---') {
        $line = $lines[$i]
        $i++
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        # naive YAML: key: value or nested under scope:
        if ($line -match '^(\s*)([A-Za-z0-9_-]+):\s*(.*)$') {
            $indent = $matches[1].Length
            $key = $matches[2]
            $val = $matches[3]
            if ($indent -eq 0) {
                if ($val -eq '') { $front[$key] = @{}; $currentKey = $key }
                else { $front[$key] = $val.Trim('"') }
            } else {
                if (-not $front.ContainsKey($currentKey)) { $front[$currentKey] = @{} }
                if ($val -eq '') { $front[$currentKey][$key] = @{} }
                else { $front[$currentKey][$key] = $val.Trim('"') }
            }
        } elseif ($line -match '^-\s*(.*)$' -and $currentKey) {
            # list item under currentKey
            if (-not ($front[$currentKey] -is [System.Collections.IList])) { $front[$currentKey] = @() }
            $front[$currentKey] += $matches[1]
        }
    }
    return $front
}

function Get-SessionFiles {
    param([string]$Root)
    $pattern = '^[0-9]{4}-[0-9]{2}-[0-9]{2}-.+\.(md|markdown)$'
    Get-ChildItem -Path $Root -Recurse -File -Include *.md, *.markdown | Where-Object { $_.Name -match $pattern }
}

function New-IndexMarkdown {
    param([object[]]$Items)
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine('# Research Index (auto-generated)')
    [void]$sb.AppendLine()
    $groups = $Items | Group-Object { "${($_.scope.pillar)}/${($_.scope.path)}/${($_.scope.module)}/${($_.scope.lesson)}" }
    foreach ($g in $groups | Sort-Object Name) {
        $parts = $g.Name.Split('/')
        $pillar = $parts[0]
        $path   = $parts[1]
        $modulePart = if ($parts[2]) { " / $($parts[2])" } else { '' }
        $lesson = $parts[3]
        if ([string]::IsNullOrEmpty($lesson)) { continue }
        [void]$sb.AppendLine("## $pillar / $path$modulePart / $lesson")
        [void]$sb.AppendLine()
        $g.Group | Sort-Object date -Descending | ForEach-Object {
            $rel = Resolve-Path -Path $_.path -Relative
            $date = $_.date
            $type = $_.type
            $sum  = $_.summary
            [void]$sb.AppendLine("- [$date] ($type) [$sum]($rel)")
        }
        [void]$sb.AppendLine()
    }
    return $sb.ToString()
}

try {
    Write-Host "Scanning session files under '$ContentRoot'..." -ForegroundColor Cyan
    $files = Get-SessionFiles -Root $ContentRoot | Select-Object -First $MaxResults
    $items = @()
    foreach ($f in $files) {
        $fm = Read-Frontmatter -Path $f.FullName
        if ($null -eq $fm) { continue }
        $itm = [ordered]@{
            path    = $f.FullName
            id      = $fm.id
            date    = $fm.date
            scope   = $fm.scope
            type    = $fm.type
            agent   = $fm.agent
            summary = $fm.summary
        }
        $items += (New-Object PSObject -Property $itm)
    }
    $md = New-IndexMarkdown -Items $items
    $outDir = Split-Path -Path $OutputPath -Parent
    if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir | Out-Null }
    Set-Content -Path $OutputPath -Value $md -Encoding UTF8
    Write-Host "✓ Index written to $OutputPath" -ForegroundColor Green
} catch {
    Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Stack Trace: $($_.ScriptStackTrace)" -ForegroundColor Red
    exit 1
}
