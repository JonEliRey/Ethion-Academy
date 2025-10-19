# File Naming and Frontmatter Standards - FINAL

**Date**: 2025-10-01  
**Status**: Complete and Verified

---

## Overview

This document defines the correct file naming conventions and frontmatter structures for all VS Code Copilot customization files based on official documentation and working examples (Beastmode).

---

## 1. Chat Modes

### Location
`.github/chatmodes/`

### File Naming Convention
`{agent-name}.chatmode.md`

**Examples**:
- `content-strategist.chatmode.md`
- `sme.chatmode.md`
- `qa-reviewer.chatmode.md`

### Frontmatter Structure
```markdown (this line should not be included)
---
description: 'Brief one-line description of agent role'
tools: ['codebase', 'search', 'fetch', 'runCommands', 'editFiles', 'changes', 'problems']
---

# Agent Name

[Main content: identity, purpose, workflow, guidelines, etc.]
```

**Key Points**:
- Frontmatter at BEGINNING of file
- Required fields: `description`, `tools`
- Tools array lists which VS Code Copilot tools the agent can access

### Invocation
`@agent-name` (e.g., `@content-strategist`)

---

## 2. Custom Instructions

### Location
`.github/instructions/`

### File Naming Convention
`{scope-purpose}.instructions.md`

**Examples**:
- `global-standards.instructions.md`
- `content-standards.instructions.md`
- `handoff-protocol.instructions.md`

### Frontmatter Structure

```markdown (this line should not be included)
---
description: 'What standards/guidelines this file defines'
applyTo: '**/*.md, **/*.json, **/*.sql'
---

# Instruction Title

[Standards, guidelines, conventions]
```

**Key Points**:
- Frontmatter at BEGINNING of file
- Required fields: `description`, `applyTo`
- `applyTo` uses glob patterns to specify which files these instructions apply to
- Can use multiple patterns separated by commas

**applyTo Examples**:
- All markdown: `'**/*.md'`
- Specific directory: `'content-inventory/**/*.md'`
- Multiple extensions: `'**/*.md, **/*.json, **/*.sql'`
- Specific files: `'**/azure-pipelines.yml, **/*.pipeline.yml'`

### Application
Automatically applied to matching files by VS Code Copilot

---

## 3. Prompt Files

### Location
`.vscode/prompts/`

### File Naming Convention
`{action-description}.prompt.md`

**Examples**:
- `define-pillar.prompt.md`
- `validate-technical-scope.prompt.md`
- `create-lesson-brief.prompt.md`

### Frontmatter Structure

```markdown (this line should not be included)
---
mode: 'agent-name'
description: 'What this prompt helps accomplish'
tools: ['search', 'fetch', 'editFiles']
---

# Prompt Title

[Workflow steps, instructions, templates]
```

**Key Points**:
- Frontmatter at BEGINNING of file
- Required fields: `mode`, `description`
- Optional field: `tools` (if specific tools needed)
- `mode` indicates which chat mode typically uses this prompt
  - Can be specific agent: `'content-strategist'`
  - Can be generic: `'agent'`
  - Can reference complex modes: `'beast mode 3.1'`

### Invocation
Direct in chat or via prompt commands

---

## Complete Directory Structure

```
.github/
├── chatmodes/                              # Chat mode agent definitions
│   ├── content-strategist.chatmode.md
│   ├── sme.chatmode.md
│   ├── scriptwriter.chatmode.md
│   ├── editor.chatmode.md
│   ├── community-manager.chatmode.md
│   ├── seo-lead.chatmode.md
│   ├── qa-reviewer.chatmode.md
│   ├── librarian.chatmode.md
│   └── monitoring-specialist.chatmode.md
└── instructions/                           # Custom instructions
    ├── global-standards.instructions.md
    ├── content-standards.instructions.md
    └── handoff-protocol.instructions.md

.vscode/
└── prompts/                                # Reusable prompt workflows
    ├── define-pillar.prompt.md
    ├── define-learning-path.prompt.md
    ├── validate-technical-scope.prompt.md
    ├── create-lesson-brief.prompt.md
    ├── perform-content-review.prompt.md
    ├── handoff-summary.prompt.md
    ├── catalog-content.prompt.md
    └── check-for-updates.prompt.md
```

---

## Comparison Table

| Feature | Chat Modes | Prompt Files | Custom Instructions |
|---------|-----------|--------------|-------------------|
| **Directory** | `.github/chatmodes/` | `.vscode/prompts/` | `.github/instructions/` |
| **File Pattern** | `*.chatmode.md` | `*.prompt.md` | `*.instructions.md` |
| **Frontmatter** | BEGINNING | BEGINNING | BEGINNING |
| **Required Fields** | `description`, `tools` | `mode`, `description` | `description`, `applyTo` |
| **Optional Fields** | None commonly used | `tools` | None commonly used |
| **Purpose** | Define specialist agent personas | Reusable workflows for agents | Project-wide standards |
| **Invocation** | `@agent-name` | Direct in chat | Auto-applied to matching files |
| **Scope** | Single agent behavior | Workflow guidance | Multiple files via glob patterns |

---

## Real Examples from Beastmode

### Chat Mode (Beast Mode 3.1)
```markdown
---
description: Beast Mode 3.1
tools: ['extensions', 'codebase', 'usages', 'vscodeAPI', 'problems', 'changes', 'testFailure', 'terminalSelection', 'terminalLastCommand', 'openSimpleBrowser', 'fetch', 'findTestFiles', 'searchResults', 'githubRepo', 'runCommands', 'runTasks', 'editFiles', 'runNotebooks', 'search', 'new']
---

# Beast Mode 3.1

You are an agent - please keep going until the user's query is completely resolved...
```

### Custom Instruction Example (Azure DevOps)
```markdown
---
description: 'Best practices for Azure DevOps Pipeline YAML files'
applyTo: '**/azure-pipelines.yml, **/azure-pipelines*.yml, **/*.pipeline.yml'
---

# Azure DevOps Pipeline YAML Best Practices

[Standards and guidelines]
```

### Prompt File Example
```markdown
---
mode: 'beast mode 3.1'
description: 'Suggest relevant GitHub Copilot prompt files from awesome-copilot repository'
tools: ['search', 'fetch', 'githubRepo']
---

# Suggest Awesome GitHub Copilot Prompts

Analyze current repository context and suggest relevant prompts...
```

---

## Key Takeaways

1. **ALL frontmatter goes at the BEGINNING** (not the end)
2. **Chat modes** = `.chatmode.md` in `.github/chatmodes/`
3. **Custom instructions** = `.instructions.md` in `.github/instructions/`
4. **Prompt files** = `.prompt.md` in `.vscode/prompts/`
5. **Naming matters**: Use exact patterns for VS Code to recognize files
6. **Frontmatter fields**:
   - Chat modes: `description` + `tools`
   - Instructions: `description` + `applyTo`
   - Prompts: `mode` + `description` (+ optional `tools`)

---

## Templates Available

- **TEMPLATE-chatmode.md**: Full agent chat mode template
- **TEMPLATE-global-standards.instructions.md**: Complete custom instruction example
- **TEMPLATE-define-pillar.prompt.md**: Detailed prompt workflow example

---

## References

1. **VS Code Copilot Customization Docs**: https://code.visualstudio.com/docs/copilot/customization/
2. **Beastmode Chat Mode Example**: https://gist.githubusercontent.com/burkeholland/88af0249c4b6aff3820bf37898c8bacf/raw/e1898331f1755aff3265d50e30106b8c6987c4f7/beastmode3.1.chatmode.md
3. **Plan Stage Input**: `docs/archive/course-designer-workflow/plan-stage-input-2025-10-01.md`
4. **Corrections Summary**: `docs/archive/course-designer-workflow/corrections-2025-10-01.md`

---

**Status**: ✅ All documentation updated and verified  
**Ready for**: `/tasks` command execution to generate implementation tasks
