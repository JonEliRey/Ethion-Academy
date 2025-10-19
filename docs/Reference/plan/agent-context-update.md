# Agent Context Update Guide

## Overview
Update project agent context to reflect the implemented Super-Intelligent Course Designer system.

---

## Updates to Make

### 1. GitHub Copilot Instructions (if using)
File: `.github/copilot-instructions.md` (create if doesn't exist)

```markdown
# GitHub Copilot Project Instructions

## Super-Intelligent Course Designer System

This project uses a 9-agent system for curriculum development:

### Agents
1. **Content Strategist** - Demand analysis, pillar/path proposals
2. **SME** - Technical validation
3. **Librarian** - Content cataloging
4. **Scriptwriter** - Lesson outlines, video/blog briefs
5. **Editor** - Quality review
6. **Community Manager** - Engagement optimization
7. **SEO Lead** - Discoverability
8. **QA Reviewer** - Final quality gate
9. **Monitoring Specialist** - Source freshness tracking

### Usage
- Load agents: `@[agent-name]` in VS Code chat
- Follow handoff protocol (9 required components)
- Agents reference custom instructions in `.github/instructions/`

### Database
- **SQLite**: `content-inventory/content.db` (Git-tracked)
- **Exports**: JSON/YAML in `content-inventory/exports/`
- **Scripts**: `scripts/init-database.ps1`, `scripts/export-inventory.ps1`

### Key Decisions
- Chat modes over CLI tools (better context retention)
- SQLite over PostgreSQL (simplicity, Git-trackable)
- Fabric pattern structure for agents
- Handoff protocol for agent transitions
```

---

### 2. README.md Updates
Add section:

```markdown
## AI Agents

This project uses 9 specialized AI agents for curriculum development. See `.github/chatmodes/` for agent definitions.

**Usage**: Load agents in VS Code chat with `@agent-name` syntax.

**Example**: `@content-strategist` to analyze demand and propose pillars.

**Documentation**: See `docs/Reference/plan/workflows/` for handoff protocol, stage gates, and agent flow.
```

---

### 3. Custom Instructions Summary
Document for future reference:

**File**: `docs/Reference/plan/custom-instructions-summary.md`

```markdown
# Custom Instructions Summary

## Global Standards
- Frontmatter requirements
- Database operations (parameterized queries)
- Handoff protocol reference
- File naming (kebab-case)
- Version control (Conventional Commits)

## Content Standards
- Frontmatter schemas (5 levels: Pillar, Path, Course, Module, Lesson)
- Tagging conventions (6 categories: role, level, topic, format, source_type, tech_stack)
- Directory structure rules
- Status values (draft, in-review, approved, published, needs-update, deprecated)

## Handoff Protocol
- 9 required components
- Valid state transitions
- Return-to-human conditions
- Quality gates
```

---

## File Naming Conventions Reference

### Chat Modes
- Format: `{agent-name}.chatmode.md`
- Location: `.github/chatmodes/`
- Example: `content-strategist.chatmode.md`

### Custom Instructions
- Format: `{scope-purpose}.instructions.md`
- Location: `.github/instructions/`
- Example: `global-standards.instructions.md`

### Prompt Files
- Format: `{action-description}.prompt.md`
- Location: `.github/prompts/`
- Example: `define-pillar.prompt.md`

---

*Implementation complete! System ready for curriculum production.*
