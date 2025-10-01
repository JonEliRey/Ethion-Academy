#!/usr/bin/env pwsh
# Verifies that the required tools are available
param()
$ErrorActionPreference = 'Stop'
$tools = @('pwsh','git')
foreach ($t in $tools) {
  $null = Get-Command $t -ErrorAction Stop
}
Write-Host "All prerequisites available"
