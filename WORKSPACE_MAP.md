# Workspace Map

**Purpose:** Ethion Academy is a content creation workspace for building high-quality technical learning content. This workspace provides AI agents, templates, and workflows to produce structured, validated content at scale.

## Active Directories

### Core Operations
- **`pillar-*/`** - Root-level pillar folders containing every learning artifact. Each pillar nests paths, courses, modules, and lessons using type prefixes:

```
pillar-sample/
  pillar-sample.md
  path-dataops-foundations/
    path-dataops-foundations.md
    course-airflow-fundamentals/
      course-airflow-fundamentals.md
      module-dag-design/
        module-dag-design.md
        lesson-branching-logic/
          lesson-branching-logic.md
```

- **`.github/chatmodes/`** - AI agent definitions (Content Strategist, SME, Librarian)
- **`.github/instructions/`** - Global standards and content guidelines for agents
- **`templates/`** - Reusable templates for all content levels (pillar, path, course, module, lesson)

### Documentation & Scripts
- **`docs/`** - Project documentation, workflows, and governance
  - `docs/Reference/` - Technical reference materials
  - `docs/workflows/` - Content creation workflows
  - `docs/governance/` - Project governance and policies
  - `docs/archive/` - Historical planning documents
- **`scripts/`** - PowerShell automation tools for optional reporting or database work

### Specifications & Research
- **`specs/`** - Feature specifications and technical designs
- **`research/`** - Market research and demand analysis data

## Archived Directories
- **`docs/archive/2025-implementation/`** - Historical planning documents from meta-development phase
- **`.github/chatmodes/archive/`** - Deactivated agents (available for reactivation as needed)

## Quick Links
- **[AGENTS.md](AGENTS.md)** - AI agent roster, global norms, and instruction precedence
- **[IMPLEMENTATION-TASKS.md](IMPLEMENTATION-TASKS.md)** - Current workspace simplification task list
- **[docs/workflows/](docs/workflows/)** - Step-by-step content creation workflows

## Navigation Tips
1. **To create content:** Start with [AGENTS.md](AGENTS.md) to understand available agents
2. **To understand structure:** Inspect root-level `pillar-*` folders and review templates in `templates/`
3. **To capture localized rules:** Maintain an `Agent.md` inside any folder that needs instructions beyond the global standards
4. **To track progress:** See `IMPLEMENTATION-TASKS.md` for current initiatives
