```instructions
---
description: 'Project-wide conventions and standards for all agents'
applyTo: '**/*.md, **/*.json, **/*.sql, **/*.ps1, **/*.chatmode.md, **/*.prompt.md'
---

# Global Standards

This custom instruction file defines project-wide conventions that all agents and workflows must follow. These standards ensure consistency, quality, and maintainability across the Super-Intelligent Course Designer meta-development system.

---

## Frontmatter Requirements

All content files (pillars, learning paths, courses, modules, lessons) MUST include structured frontmatter following the schemas defined in `content-standards.instructions.md`.

### Required Fields for All Content
- `target_audience`: Array of roles this content serves (e.g., `["Data Engineers", "ML Engineers"]`)
- `topics`: Array of subject areas covered (e.g., `["Airflow", "Workflow Orchestration"]`)
- `goals`: Array of learning objectives or outcomes
- `prerequisites`: Array of required prior knowledge or completed lessons
- `tags`: Categorized metadata (role, level, topic, format, source_type, tech_stack)
- `status`: Current content state (draft, in-review, approved, published, needs-update, deprecated)

### Example

```yaml
---
title: "Apache Airflow Task Dependencies"
target_audience: ["Data Engineers", "ML Engineers"]
topics: ["Airflow", "Workflow Orchestration", "Python"]
goals:
  - "Configure upstream and downstream dependencies"
  - "Implement branching logic with BranchPythonOperator"
  - "Build parallel task execution patterns"
prerequisites: ["Airflow DAG Basics", "Python Functions"]
tags:
  role: ["data-engineer", "ml-engineer"]
  level: "intermediate"
  format: "video"
  source_type: "original"
  tech_stack: ["airflow", "python"]
status: "approved"
created_at: "2025-01-15T10:00:00Z"
updated_at: "2025-01-15T15:30:00Z"
---
```

---

## Database Operations

### Query Safety - MANDATORY
**ALWAYS use parameterized queries. NEVER use string concatenation for SQL queries.**

❌ **FORBIDDEN**:
```powershell
# NEVER DO THIS - SQL injection risk
$query = "INSERT INTO Pillar (name, description) VALUES ('$name', '$description')"
```

✅ **REQUIRED**:
```powershell
# Use parameter binding
$query = "INSERT INTO Pillar (name, description, status) VALUES (@name, @description, @status)"
$cmd = $connection.CreateCommand()
$cmd.CommandText = $query
$cmd.Parameters.AddWithValue("@name", $pillarName)
$cmd.Parameters.AddWithValue("@description", $pillarDescription)
$cmd.Parameters.AddWithValue("@status", "draft")
$result = $cmd.ExecuteNonQuery()
```

### Never Hard-Code IDs
Use UUID generation or database auto-increment:

```powershell
# Generate UUID for new content
$lessonId = [guid]::NewGuid().ToString()

# Or use SQLite auto-increment
CREATE TABLE Pillar (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    ...
)
```

### Export to JSON for Reports
Use structured exports for Git-trackable reports:

```powershell
# Export to JSON with proper formatting
$data = Invoke-DatabaseQuery -Query "SELECT * FROM Pillar WHERE status = 'approved'"
$data | ConvertTo-Json -Depth 10 | Set-Content -Path "content-inventory/exports/pillars.json"
```

### Transaction Management
Always use transactions for multi-step operations:

```powershell
try {
    $connection.BeginTransaction()
    
    # Operation 1: Create pillar
    # Operation 2: Create initial learning path
    # Operation 3: Log action
    
    $connection.Commit()
    Write-Host "✓ All operations complete" -ForegroundColor Green
} catch {
    $connection.Rollback()
    Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
    throw
}
```

---

## Handoff Protocol

All agent handoffs MUST use the standard template from `handoff-protocol.instructions.md`.

### Required Components (9 Components)
Every handoff message must include ALL of these:

1. **From Agent**: Source agent name
2. **To Agent**: Target agent name (with `@mention` syntax)
3. **Reason**: Why handoff is needed
4. **Context Summary**: Brief overview of work done
5. **Deliverables Attached**: Files, links, or content passed
6. **What Target Should Do**: Specific tasks for receiving agent
7. **Expected Output**: What the target agent should produce
8. **Success Criteria**: How to verify completion
9. **Executive Producer Instruction**: Explicit instruction to switch chat mode

### Example Handoff

```markdown
## 🔄 HANDOFF REQUIRED

**From**: Content Strategist  
**To**: @sme  
**Reason**: Technical validation needed for proposed DataOps pillar scope

### Context
Completed demand analysis for "DataOps Engineering" pillar. Identified strong market demand (1,500+ job postings requiring Apache Airflow, dbt, and data quality tools). Proposed scope includes 5 learning paths covering pipeline orchestration, data testing, observability, CI/CD, and incident management.

### Deliverables Attached
- `pillar-dataops-engineering-draft.md` (proposed pillar content)
- Demand analysis spreadsheet (job posting data)

### What SME Should Do
1. Validate technical accuracy of scope and learning path breakdown
2. Identify prerequisites for each learning path
3. Suggest authoritative sources (official documentation, community standards)
4. Flag any missing critical topics or incorrect technical assumptions

### Expected Output
- **Approved scope** with prerequisites identified OR
- **Feedback for revision** with specific technical concerns noted

### Success Criteria
- All technical concepts are accurately described
- Prerequisites correctly sequenced
- Source materials are current and authoritative
- Scope aligns with industry best practices

**Executive Producer**: Please switch to `@sme` and provide the attached `pillar-dataops-engineering-draft.md` for technical review.
```

---

## File Naming Conventions

Use **kebab-case** for all files. Names should be descriptive without spaces or special characters.

### Chat Modes
- **Format**: `{agent-name}.chatmode.md`
- **Examples**:
  - `content-strategist.chatmode.md`
  - `sme.chatmode.md`
  - `monitoring-specialist.chatmode.md`
- **Location**: `.github/chatmodes/`

### Prompt Files
- **Format**: `{action-description}.prompt.md`
- **Examples**:
  - `define-pillar.prompt.md`
  - `create-learning-path.prompt.md`
  - `review-lesson-quality.prompt.md`
- **Location**: `.vscode/prompts/`

### Custom Instructions
- **Format**: `{scope-purpose}.instructions.md`
- **Examples**:
  - `global-standards.instructions.md`
  - `content-standards.instructions.md`
  - `handoff-protocol.instructions.md`
- **Location**: `.github/instructions/`

### Content Files
- **Format**: `{type}-{name}.md`
- **Examples**:
  - `pillar-dataops-engineering.md`
  - `path-airflow-orchestration.md`
  - `course-dag-development.md`
  - `module-task-dependencies.md`
  - `lesson-branching-logic.md`
- **Location**: Content-specific directories

### Database Files
- **Database**: `content.db` (SQLite database)
- **Schema**: `schema.sql` (DDL definitions)
- **Exports**: `{entity-type}.json` (e.g., `pillars.json`, `lessons.json`)

---

## Version Control

### Commit Messages
Follow **Conventional Commits** format: `type(scope): description`

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code restructuring without behavior change
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples**:
```
feat(agent): add monitoring specialist chat mode
docs(plan): update phase 1 agent specifications
fix(database): correct prerequisite relationship query
chore(scripts): update export-inventory parameter validation
refactor(handoff): standardize context passing format
```

### Branch Naming
- **Feature branches**: `feature/###-description` (where ### matches task number from `tasks.md`)
  - Example: `feature/011-content-strategist-agent`
- **Bug fixes**: `fix/###-description`
  - Example: `fix/042-pillar-template-frontmatter`
- **Documentation**: `docs/###-description`
  - Example: `docs/037-quickstart-guide`

### Commit Frequency
- Commit after completing each task (T001, T002, etc.)
- Include task number in commit message: `feat(structure): create chat mode directory (T001)`

---

## Code Quality

### PowerShell Scripts - Required Standards

#### 1. Use Approved Verbs
Follow PowerShell verb-noun naming:
- `Get-*`, `Set-*`, `New-*`, `Remove-*`, `Import-*`, `Export-*`, etc.

#### 2. Parameter Validation
Always validate parameters:

```powershell
[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('Json', 'Yaml')]
    [string]$Format = 'Json',
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$DatabasePath,
    
    [Parameter(Mandatory=$false)]
    [ValidateRange(1, 100)]
    [int]$MaxResults = 10
)
```

#### 3. Comment-Based Help
Include comprehensive help documentation:

```powershell
<#
.SYNOPSIS
    Export content inventory database to JSON/YAML formats.

.DESCRIPTION
    This script exports content from the SQLite database to human-readable
    JSON or YAML files for version control and documentation.

.PARAMETER Format
    Export format: 'Json' or 'Yaml'. Defaults to 'Json'.

.PARAMETER DatabasePath
    Path to the SQLite database. Defaults to 'content-inventory/content.db'.

.EXAMPLE
    .\export-inventory.ps1 -Format Json
    # Exports all entities to JSON

.EXAMPLE
    .\export-inventory.ps1 -Format Yaml -DatabasePath "custom/path/db.db"
    # Exports to YAML using custom database path

.NOTES
    Author: Meta-Development System
    Version: 1.0.0
    Requires: SQLite3 or System.Data.SQLite
#>
```

#### 4. Consistent Indentation
Use **4 spaces** (no tabs):

```powershell
function Invoke-DatabaseQuery {
    param(
        [string]$Query,
        [string]$DbPath
    )
    
    try {
        $connection = New-Object System.Data.SQLite.SQLiteConnection
        # ...logic
    } catch {
        Write-Error "Failed to execute query: $($_.Exception.Message)"
    }
}
```

#### 5. Error Handling
Always use try/catch for operations that can fail:

```powershell
$ErrorActionPreference = "Stop"

try {
    # Risky operation
    $result = Invoke-DatabaseQuery -Query $query -DbPath $dbPath
    Write-Host "✓ Operation complete" -ForegroundColor Green
} catch {
    Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Stack Trace: $($_.ScriptStackTrace)" -ForegroundColor Red
    exit 1
}
```

---

## Testing & Validation

### Manual Testing - REQUIRED
Before marking any feature complete:

1. **Execute Quickstart Scenario**: Follow `specs/001-i-need-to/quickstart.md` step-by-step
2. **Test All Agent Handoffs**: Manually invoke each agent and verify handoff messages
3. **Verify Database Operations**: Insert sample data, query, export to JSON
4. **Review Outputs**: Check exported JSON/YAML files for correctness

### Scenario Walkthroughs
Test end-to-end workflows:

**Example - Pillar Approval Cycle**:
1. Load `@content-strategist` → propose pillar
2. Receive handoff → switch to `@sme` → validate
3. Receive handoff → approve as Executive Producer
4. Load `@librarian` → catalog in database
5. Export to JSON → verify `pillars.json` contains new entry

### Validation Checklists
Use agent-specific quality criteria from `.chatmode.md` files:

**Content Strategist**:
- [ ] Demand evidence includes 3+ sources
- [ ] Scope boundaries clearly defined
- [ ] Target audience specified with role × level
- [ ] Handoff message includes all 9 components

**SME**:
- [ ] Technical accuracy verified against official docs
- [ ] Prerequisites correctly identified
- [ ] Sources current (within 6 months for fast-moving tools)
- [ ] Handoff message includes validation summary

---

## Documentation

### Inline Comments
Add comments for complex logic or non-obvious decisions:

```powershell
# Calculate prerequisite depth using recursive CTE (see FR-016 for schema)
$query = @"
WITH RECURSIVE prereq_chain AS (
    SELECT id, name, 0 AS depth FROM Lesson WHERE id = @lessonId
    UNION ALL
    SELECT l.id, l.name, pc.depth + 1
    FROM Lesson l
    INNER JOIN Prerequisite p ON l.id = p.prerequisite_lesson_id
    INNER JOIN prereq_chain pc ON p.lesson_id = pc.id
)
SELECT * FROM prereq_chain ORDER BY depth DESC;
"@
```

### README Files
Every major directory should include a `README.md`:

**Example - `.github/chatmodes/README.md`**:
```markdown
# VS Code Chat Modes

This directory contains 9 AI agent personas implemented as VS Code chat modes.

## Agents
- `content-strategist.chatmode.md` - Demand analysis and pillar proposals
- `sme.chatmode.md` - Technical validation
- `librarian.chatmode.md` - Content cataloging
- ... (list all 9)

## Usage
Invoke agents in VS Code chat with `@agent-name` syntax:
- `@content-strategist` - Start pillar planning
- `@sme` - Review technical accuracy

## Handoff Protocol
Agents pass work using standard handoff messages (see `handoff-protocol.instructions.md`).
```

---

## Error Handling

### User-Facing Error Messages
Provide clear, actionable messages:

❌ **BAD**:
```
Error: Object reference not set to an instance of an object.
```

✅ **GOOD**:
```
❌ Error: Database file not found at 'content-inventory/content.db'

Possible solutions:
1. Run: pwsh scripts/init-database.ps1
2. Verify the database path in your configuration
3. Check that the content-inventory directory exists
```

### Logging
Log all significant operations:

```powershell
function Write-OperationLog {
    param([string]$Message, [string]$Level = "INFO")
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    
    Add-Content -Path "logs/operations.log" -Value $logEntry
    
    # Also output to console with color
    $color = switch ($Level) {
        "ERROR" { "Red" }
        "WARNING" { "Yellow" }
        default { "White" }
    }
    Write-Host $logEntry -ForegroundColor $color
}

# Usage
Write-OperationLog -Message "Database initialized successfully" -Level "INFO"
Write-OperationLog -Message "Agent handoff: @content-strategist → @sme" -Level "INFO"
Write-OperationLog -Message "Query failed: Invalid SQL syntax" -Level "ERROR"
```

---

## Security

### Sensitive Data - NEVER COMMIT
**NEVER** commit API keys, credentials, or secrets to Git.

❌ **FORBIDDEN**:
```powershell
$apiKey = "sk-abc123xyz789"  # NEVER hard-code API keys
```

✅ **REQUIRED**:
```powershell
# Use environment variables
$apiKey = $env:OPENAI_API_KEY

# Or prompt user
$credential = Get-Credential -Message "Enter database password"
```

### Add to `.gitignore`
```
# Secrets
.env
*.key
*secret*
*credential*

# Database files (optional - may want to commit schema, not data)
*.db

# Logs with potential sensitive data
logs/*.log
```

### Database Access
Validate all inputs before database operations:

```powershell
# Validate input format
if ($lessonName -notmatch '^[a-zA-Z0-9\s\-]+$') {
    throw "Invalid lesson name. Only alphanumeric characters, spaces, and hyphens allowed."
}

# Use read-only connections where appropriate
$connectionString = "Data Source=$dbPath;Version=3;Read Only=True;"
```

### Audit Trail
Log all database modifications:

```powershell
# AgentAction table captures all content changes
INSERT INTO AgentAction (agent_name, action_type, content_id, details, created_at)
VALUES ('content-strategist', 'CREATE', 'pillar-dataops', 'Proposed new pillar', datetime('now'));
```

---

## Related Instructions

- **Content Standards**: See `.github/instructions/content-standards.instructions.md` for frontmatter schemas and tagging conventions
- **Handoff Protocol**: See `.github/instructions/handoff-protocol.instructions.md` for agent transition rules

---

*Last Updated*: 2025-01-15  
*Applies To*: All files in repository  
*Version*: 1.0.0
```
