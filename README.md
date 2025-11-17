# Ethion Academy

**High-quality technical learning content for data engineering and modern data stack technologies.**

Ethion Academy is a content creation workspace that combines AI agents, structured templates, and validated workflows to produce consistent, learner-focused content at scale.

## Quick Start

📍 **[WORKSPACE_MAP.md](WORKSPACE_MAP.md)** - Navigate the workspace structure and find what you need

🤖 **[AGENTS.md](AGENTS.md)** - Learn about AI agents and how to work with them

📋 **[docs/workflows/](docs/workflows/)** - Step-by-step content creation workflows

## Content Layout

All learning content lives directly at the repository root using type-prefixed folders. Each level owns its markdown file inside its folder, keeping navigation shallow and self-explanatory:

```
pillar-{pillar-name}/
  pillar-{pillar-name}.md
  path-{path-name}/
    path-{path-name}.md
    course-{course-name}/
      course-{course-name}.md
      module-{module-name}/
        module-{module-name}.md
        lesson-{lesson-name}/
          lesson-{lesson-name}.md
```

No extra taxonomy directories (e.g., `pillars/`, `courses/`) are used; the prefix plus nesting capture the full hierarchy.

## Current Status

**Phase:** MVP Setup & Foundation (Phase 1 in progress)  
**Active Agents:** Content Strategist, SME, Librarian  
**Goal:** Running first content pilot to validate workflows

## For AI Agents

See **[AGENTS.md](AGENTS.md)** for:
- Global norms (naming, security, tone)
- Active agent roster and responsibilities
- Instruction precedence and handoff protocol
- Expectations that every major folder maintains a local `Agent.md` describing context-specific guidance that does not belong in the global instructions

## For Contributors

1. Review **[WORKSPACE_MAP.md](WORKSPACE_MAP.md)** to understand directory structure
2. Check **[IMPLEMENTATION-TASKS.md](IMPLEMENTATION-TASKS.md)** for current initiatives
3. Follow workflows in **`docs/workflows/`** for content creation process
4. Use templates in **`templates/`** for consistent content structure

## Technology

- **Agents:** VS Code AI Chat Modes
- **Templates:** Markdown with YAML frontmatter
- **Database:** Optional SQLite artifacts when needed for reporting
- **Scripts:** PowerShell (automation)

---

*Last Updated: November 2025*
