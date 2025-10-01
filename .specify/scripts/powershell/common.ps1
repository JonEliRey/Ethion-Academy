#!/usr/bin/env pwsh
# Common helpers shared by scripts
param()
$ErrorActionPreference = 'Stop'
function Write-Info([string]$msg) { Write-Host "[specify] $msg" }
