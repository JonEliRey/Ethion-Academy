---
description: 'Project-wide conventions and standards for all agents'
applyTo: '**/*.md, **/*.json, **/*.sql, **/*.ps1, **/*.chatmode.md, **/*.prompt.md'
---

# Global Standards

This custom instruction file defines project-wide conventions that all agents and workflows must follow.

## Content File Requirements

### Frontmatter Standards
All content files (pillars, learning paths, courses, modules, lessons) MUST include:
- `title`: Clear, descriptive title
- `target_audience`: Who this content is for (e.g., "Business Analysts", "Data Engineers")
- `topics`: Array of relevant topics/tags
- `goals`: Learning objectives or outcomes
- `prerequisites`: Required prior knowledge or completed lessons
- `tags`: Categorization tags (role, level, format, source_type, tech_stack)
- `status`: Current status (draft, in-review, approved, published, needs-update)
- `created_at`: ISO 8601 timestamp
- `updated_at`: ISO 8601 timestamp

**Example**:
```yaml
---
title: "Introduction to Power BI Data Modeling"
target_audience: ["Business Analysts", "Data Analysts"]
topics: ["Power BI", "Data Modeling", "DAX"]
goals: ["Understand star schema design", "Create relationships", "Write basic DAX"]
prerequisites: ["Power BI Basics"]
tags:
  role: ["analyst"]
  level: "beginner"
  format: "video"
  source_type: "original"
  tech_stack: ["Power BI"]
status: "approved"
created_at: "2025-10-01T10:00:00Z"
updated_at: "2025-10-01T15:30:00Z"
---
```

## Database Operations

### Query Safety
- ALL database operations MUST use parameterized queries
- NEVER construct SQL with string concatenation
- Use PowerShell's parameter binding or SQLite prepared statements

**Example (PowerShell)**:
```powershell
$query = "INSERT INTO Lesson (id, title, module_id) VALUES (@id, @title, @module_id)"
$cmd = $connection.CreateCommand()
$cmd.CommandText = $query
$cmd.Parameters.AddWithValue("@id", $lessonId)
$cmd.Parameters.AddWithValue("@title", $lessonTitle)
$cmd.Parameters.AddWithValue("@module_id", $moduleId)
$cmd.ExecuteNonQuery()
```

### Transaction Management
- Use transactions for multi-step database operations
- Always include rollback on error
- Commit only after all operations succeed

## Agent Handoff Protocol

### Handoff Message Format
All agent handoffs MUST use the standard template defined in `handoff-protocol.instructions.md`.

### Required Components
Every handoff message must include:
1. Source agent name
2. Target agent name
3. Reason for handoff
4. Context summary
5. Deliverables attached
6. Specific tasks for target agent
7. Expected output
8. Success criteria

### Example
```markdown
## 🔄 HANDOFF REQUIRED

**From**: Content Strategist
**To**: SME
**Reason**: Technical validation needed for proposed pillar scope

### Context
Completed demand analysis for DataOps pillar...

### Deliverables Attached
- pillar-dataops-draft.md

### What SME Should Do
Validate technical accuracy and identify prerequisites...

### Expected Output
- Approved pillar scope OR feedback for revision

### Success Criteria
- All technical concepts are accurate
- Prerequisites are correctly identified

**Executive Producer**: Please switch to @sme and provide the attached context.
```

## File Naming Conventions

### Chat Modes
- Format: `agent-name.chatmode.md`
- Example: `content-strategist.chatmode.md`
- Location: `.github/chatmodes/`

### Prompt Files
- Format: `action-description.prompt.md`
- Example: `define-pillar.prompt.md`
- Location: `.vscode/prompts/`

### Custom Instructions
- Format: `scope-purpose.instructions.md`
- Example: `global-standards.instructions.md`
- Location: `.github/instructions/`

### Content Files
- Format: `type-name.md`
- Examples: `pillar-dataops.md`, `path-excel-fundamentals.md`
- Location: Project-specific directories

## Version Control

### Commit Messages
- Use conventional commits format: `type(scope): description`
- Types: feat, fix, docs, style, refactor, test, chore
- Examples:
  - `feat(agent): add monitoring specialist chat mode`
  - `docs(plan): update phase 1 agent specifications`
  - `fix(database): correct prerequisite relationship query`

### Branch Naming
- Feature branches: `feature/###-description` (where ### is feature number)
- Bug fixes: `fix/###-description`
- Documentation: `docs/###-description`

## Code Quality

### PowerShell Scripts
- Use approved verbs (Get-, Set-, New-, etc.)
- Include parameter validation
- Add comment-based help
- Use consistent indentation (4 spaces)
- Include error handling (try/catch)

### Markdown Files
- Use consistent heading levels (no skipping levels)
- Include blank lines around lists and code blocks
- Use fenced code blocks with language specifiers
- Keep line length reasonable (aim for 120 characters)

## Testing & Validation

### Manual Testing
- Execute quickstart scenario before marking feature complete
- Test all agent handoffs manually
- Verify database operations with sample data
- Export and review JSON/YAML outputs

### Validation Checklists
- Use agent-specific quality criteria from chat mode files
- Check against success criteria in handoff messages
- Verify all frontmatter fields are present and valid
- Confirm database foreign key relationships

## Documentation

### Inline Documentation
- Add comments for complex logic
- Explain non-obvious decisions
- Reference requirements (e.g., "See FR-016 for schema details")

### README Files
- Every major directory should have a README.md
- Explain purpose, structure, and usage
- Include examples where helpful

## Error Handling

### User-Facing Errors
- Provide clear, actionable error messages
- Suggest next steps or corrections
- Include relevant context (what was being attempted)

### Logging
- Log all database operations
- Log agent activations and handoffs
- Include timestamps in logs
- Store logs in `logs/` directory

## Security

### Sensitive Data
- NEVER commit API keys, credentials, or secrets
- Use environment variables or secure vaults
- Add sensitive patterns to `.gitignore`

### Database Access
- Use read-only connections where appropriate
- Validate all user inputs before database operations
- Log access for audit trail

---

**Last Updated**: 2025-10-01  
**Applies To**: All files in repository  
**Related Instructions**: `content-standards.instructions.md`, `handoff-protocol.instructions.md`
