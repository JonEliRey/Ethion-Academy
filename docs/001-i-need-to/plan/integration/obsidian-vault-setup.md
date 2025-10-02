# Obsidian Integration Guide (Optional)

## Overview
Configure Obsidian vault to visualize content relationships using graph view and Dataview queries.

**Note**: This is an optional feature. Core workflow does not depend on Obsidian.

---

## Vault Setup

### Directory Structure
```
content-inventory/obsidian/
├── pillars/
│   └── dataops-engineering.md
├── learning-paths/
│   └── airflow-orchestration.md
├── courses/
│   └── dag-development.md
├── modules/
│   └── task-dependencies.md
└── lessons/
    └── branching-logic.md
```

---

## Generate Markdown Mirrors

### Option 1: PowerShell Script
```powershell
pwsh scripts/generate-obsidian-mirror.ps1 -DatabasePath content-inventory/content.db -OutputDir content-inventory/obsidian/
```

### Option 2: Manual Export
Query database and create Markdown files with frontmatter:
```markdown
---
id: pillar-dataops-engineering
name: DataOps Engineering
type: Pillar
status: approved
tags: [data-engineering, dataops, intermediate]
---

# DataOps Engineering

**Status**: Approved
**Target Audience**: Data Engineers (Intermediate)

## Learning Paths
- [[airflow-orchestration]]
- [[data-quality-engineering]]
- [[monitoring-data-pipelines]]

## Related
- [[data-engineering-fundamentals]]
```

---

## Recommended Plugins

### 1. Dataview
Query content with SQL-like syntax:
```dataview
TABLE status, tags
FROM "pillars"
WHERE status = "approved"
SORT name ASC
```

### 2. Graph View
Visualize relationships:
- Pillars → Learning Paths → Courses → Modules → Lessons
- Prerequisite chains

### 3. SQLite (Community Plugin)
Query `content-inventory/content.db` directly from Obsidian.

---

## Sample Queries

### All Approved Pillars
```dataview
LIST
FROM "pillars"
WHERE status = "approved"
```

### Lessons by Difficulty
```dataview
TABLE level, duration
FROM "lessons"
WHERE level = "intermediate"
SORT duration ASC
```

---

*Note*: Obsidian vault is read-only mirror. Database is canonical source.
