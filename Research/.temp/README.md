# Temporary Research Working Files

This directory contains temporary working files used during active research sessions.

## Purpose

Research agents create temporary working files here to:
- Maintain session state and prevent information loss
- Enable recovery if context window fills
- Provide audit trail of research process
- Track progress across long research sessions

## File Lifecycle

1. **Created** at research session start
2. **Updated** throughout research process
3. **Migrated** to final report in `Research/{Pillar}/`
4. **Deleted** automatically after successful migration

## Naming Convention

```
{YYYYMMDD-HHMMSS}-{topic-slug}-{mode}-WORKING.md
```

Examples:
- `20251004-142300-power-query-learning-WORKING.md`
- `20251004-153000-azure-synapse-deep-WORKING.md`

## Cleanup

Working files are automatically deleted after research completion. If orphaned files remain (due to interrupted sessions), they can be safely deleted.

### Automated Cleanup (PowerShell)

Remove working files older than 7 days:

```powershell
Get-ChildItem -Filter "*-WORKING.md" | 
  Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) } | 
  Remove-Item -Verbose
```

### Manual Cleanup

Simply delete any files in this directory - they are temporary by design.

## .gitignore

This directory is configured to ignore all `*.md` files, so temporary working files are not committed to version control.
