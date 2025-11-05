---
description: 'Project-wide conventions and standards for all agents'
applyTo: '**/*.md, **/*.json, **/*.sql, **/*.ps1'
---

# Global Standards

Project-wide conventions that all agents must follow for consistency, security, and maintainability.

## Naming Conventions

### File Names
- Use **kebab-case** for all files: `content-strategist.chatmode.md`, `pillar-template.md`
- Extensions: `.md` (content), `.chatmode.md` (agents), `.instructions.md` (standards), `.prompt.md` (prompts)

### Directory Names
- Use **kebab-case**: `content-inventory/`, `.github/chatmodes/`

### IDs & Identifiers
- Use kebab-case with type prefix: `pillar-dataops-engineering`, `path-airflow-orchestration`, `lesson-branching-logic`

## Security Boundaries

### Prohibited Content
- **No PII**: Never include personally identifiable information
- **No Secrets**: No API keys, credentials, tokens, or passwords in repository
- **No Sensitive Data**: All content must be suitable for public distribution

### Database Safety
**ALWAYS use parameterized queries:**

```powershell
# ✅ CORRECT - Use parameter binding
$query = "INSERT INTO Pillar (name, description) VALUES (@name, @description)"
$cmd.Parameters.AddWithValue("@name", $pillarName)
$cmd.Parameters.AddWithValue("@description", $pillarDescription)

# ❌ FORBIDDEN - String concatenation (SQL injection risk)
$query = "INSERT INTO Pillar (name, description) VALUES ('$name', '$description')"
```

### Access Control
- Content repository is public
- Database should not contain user data or analytics
- Scripts should not access external APIs without explicit configuration

## Version Control Standards

### Commit Messages
Use **Conventional Commits** format: `type(scope): description`

**Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation changes
- `style` - Formatting, whitespace
- `refactor` - Code restructuring
- `test` - Test additions/updates
- `chore` - Maintenance tasks

**Examples:**
- `feat(agent): add content strategist chat mode`
- `docs(readme): update quick start section`
- `fix(database): correct prerequisite relationship query`
- `chore(scripts): update export parameter validation`

### Branch Naming
- **Feature branches:** `feature/###-description` (e.g., `feature/011-content-strategist-agent`)
- **Bug fixes:** `fix/###-description`
- **Documentation:** `docs/###-description`

### Commit Frequency
- Commit after completing meaningful units of work
- Include task numbers when applicable: `feat(structure): create chat mode directory (T001)`

## Agent Handoff Protocol

All agent handoffs MUST include these 9 components:

1. **From Agent** - Source agent name
2. **To Agent** - Target agent with `@mention` syntax
3. **Reason** - One-sentence why
4. **Context Summary** - 2-4 paragraphs of work completed, decisions made, current state
5. **Deliverables Attached** - Files, links, or content passed
6. **What Target Should Do** - Specific numbered tasks
7. **Expected Output** - What target should produce
8. **Success Criteria** - Measurable completion indicators (checkboxes)
9. **Executive Producer Instruction** - Explicit switch instruction

**Template:**
```markdown
## 🔄 HANDOFF REQUIRED

**From**: [Source Agent]  
**To**: @[target-agent]  
**Reason**: [One sentence]

### Context
[2-4 paragraphs...]

### Deliverables Attached
- [File/link 1]
- [File/link 2]

### What [Target] Should Do
1. [Task 1]
2. [Task 2]

### Expected Output
- [Deliverable 1]
- [Deliverable 2]

### Success Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Executive Producer**: Please switch to `@target-agent` and provide [deliverables].
```

## Code Quality Standards

### PowerShell Scripts

#### Parameter Validation
```powershell
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$DatabasePath,
    
    [Parameter(Mandatory=$false)]
    [ValidateSet('Json', 'Yaml')]
    [string]$Format = 'Json'
)
```

#### Comment-Based Help
```powershell
<#
.SYNOPSIS
    Brief description of script purpose

.DESCRIPTION
    Detailed description of what the script does

.PARAMETER ParameterName
    Description of parameter

.EXAMPLE
    .\script-name.ps1 -Parameter "value"
    Description of what this example does

.NOTES
    Author: Ethion Academy
    Version: 1.0.0
#>
```

#### Error Handling
```powershell
$ErrorActionPreference = "Stop"

try {
    # Operations
    Write-Host "✓ Success" -ForegroundColor Green
} catch {
    Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
```

#### Indentation
- Use **4 spaces** (no tabs)
- Consistent indentation for readability

### Database Operations

#### Transaction Management
```powershell
try {
    $connection.BeginTransaction()
    
    # Operation 1
    # Operation 2
    # Operation 3
    
    $connection.Commit()
} catch {
    $connection.Rollback()
    throw
}
```

#### ID Generation
```powershell
# Generate UUID for new content
$id = [guid]::NewGuid().ToString()

# Or use database auto-increment
CREATE TABLE Entity (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ...
)
```

#### Export to JSON
```powershell
$data = Invoke-Query -Query "SELECT * FROM Table"
$data | ConvertTo-Json -Depth 10 | Set-Content -Path "output.json"
```

## Documentation Standards

### Inline Comments
- Add comments for complex logic or non-obvious decisions
- Keep comments concise and relevant
- Update comments when code changes

### README Files
- Every major directory should include a `README.md`
- Explain purpose, contents, and usage
- Link to related documentation

### Error Messages
Provide clear, actionable error messages:

**❌ BAD:**
```
Error: Object reference not set to an instance of an object.
```

**✅ GOOD:**
```
❌ Error: Database file not found at 'content-inventory/content.db'

Solutions:
1. Run: pwsh scripts/init-database.ps1
2. Verify database path in configuration
3. Check that content-inventory directory exists
```

## Logging

Log significant operations with timestamps:

```powershell
function Write-OperationLog {
    param([string]$Message, [string]$Level = "INFO")
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    
    Add-Content -Path "logs/operations.log" -Value $logEntry
    
    $color = switch ($Level) {
        "ERROR" { "Red" }
        "WARNING" { "Yellow" }
        default { "White" }
    }
    Write-Host $logEntry -ForegroundColor $color
}
```

## Related Documentation

- **Content Standards:** See `.github/instructions/content.instructions.md` for frontmatter schemas and tagging
- **Agent Guide:** See `AGENTS.md` for agent roster and responsibilities
- **Workspace Map:** See `WORKSPACE_MAP.md` for directory structure

---

*These standards apply to all agents and contributors across the entire workspace.*
