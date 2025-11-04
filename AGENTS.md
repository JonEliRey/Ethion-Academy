# AI Agents Guide

## Project Purpose

Ethion Academy creates high-quality technical learning content focused on data engineering, ML operations, and modern data stack technologies. This workspace uses AI agents to streamline content planning, validation, and organization while maintaining quality and consistency.

## Global Norms

### Naming Conventions
- **Files:** Use kebab-case (e.g., `pillar-template.md`, `content-strategist.chatmode.md`)
- **Directories:** Use kebab-case (e.g., `content-inventory/`, `.github/chatmodes/`)
- **IDs:** Use kebab-case prefixed by type (e.g., `pillar-dataops-engineering`, `path-airflow-orchestration`)

### Security Boundaries
- **No PII:** Never include personally identifiable information in content or commit history
- **No Secrets:** No API keys, credentials, or tokens in repository
- **Public Content:** All content should be suitable for public distribution

### Tone & Style
- **Plain Language:** Avoid jargon; define technical terms on first use
- **Learner-Focused:** Explain "why it matters" alongside "how to do it"
- **Leader's Lens:** Include business context and strategic value in lessons
- **Practical Examples:** Use real-world scenarios and tested code samples

### Version Control
- **Commit Messages:** Use conventional commits format: `type(scope): description`
  - Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`
  - Example: `feat(agent): add monitoring specialist chat mode`
- **Branching:** Use descriptive names with task numbers when applicable
  - Example: `feature/011-content-strategist-agent`

## Active Agent Roster

### 1. Content Strategist
**File:** `.github/chatmodes/content-strategist.chatmode.md`

**Purpose:** Analyzes market demand and proposes content pillars and learning paths based on data-driven insights.

**Key Responsibilities:**
- Conduct demand analysis (job postings, search trends, community signals)
- Propose new pillars with clear scope and target audience
- Define learning path structures within approved pillars
- Hand off proposals to SME for technical validation

**When to Use:** Starting new pillar/path planning or analyzing content gaps

---

### 2. Subject Matter Expert (SME)
**File:** `.github/chatmodes/sme.chatmode.md`

**Purpose:** Validates technical accuracy, identifies prerequisites, and ensures content aligns with industry best practices.

**Key Responsibilities:**
- Review proposed pillar and path scopes for technical accuracy
- Identify prerequisites and correct learning sequence
- Suggest authoritative sources (official docs, standards)
- Flag missing critical topics or incorrect assumptions

**When to Use:** Validating technical content before approval

---

### 3. Librarian
**File:** `.github/chatmodes/librarian.chatmode.md`

**Purpose:** Catalogs approved content in the database and maintains content inventory organization.

**Key Responsibilities:**
- Add approved pillars, paths, courses, modules, and lessons to database
- Maintain content relationships and prerequisites
- Generate reports on content inventory status
- Ensure frontmatter and metadata consistency

**When to Use:** After content approval, to catalog and organize

---

## Archived Agents

The following agents are preserved in `.github/chatmodes/archive/` and can be reactivated when needed:

- **Scriptwriter** - Creates detailed lesson scripts with code examples
- **Editor** - Reviews content for clarity, grammar, and style
- **Community Manager** - Plans engagement strategies for published content
- **SEO Lead** - Optimizes content for search and discoverability
- **QA Reviewer** - Tests code examples and validates learning exercises
- **Monitoring Specialist** - Tracks content freshness and flags updates needed

**Reactivation:** Move desired agent file from `.github/chatmodes/archive/` back to `.github/chatmodes/`

---

## Instruction Precedence

Agents follow instructions in this priority order:

1. **This file (AGENTS.md)** - Global norms and agent behavior standards
2. **`.github/instructions/global.md`** - Project-wide conventions (naming, security, version control, handoffs)
3. **`.github/instructions/content.md`** - Content-specific rules (frontmatter, tagging, directory structure)
4. **Local Scope** - Task-specific guidance from user or workflow documents

When instructions conflict, higher precedence wins. When in doubt, ask for clarification.

---

## Agent Handoff Protocol

When passing work between agents, use the standard handoff format:

### Required Components:
1. **From Agent** - Source agent name
2. **To Agent** - Target agent name (with `@mention` syntax)
3. **Reason** - Why handoff is needed (1 sentence)
4. **Context Summary** - Brief overview of work completed
5. **Deliverables Attached** - Files, links, or content passed
6. **What Target Should Do** - Specific tasks for receiving agent
7. **Expected Output** - What target agent should produce
8. **Success Criteria** - How to verify completion
9. **Executive Producer Instruction** - Explicit instruction to switch chat mode

**Example:**
```markdown
## 🔄 HANDOFF REQUIRED

**From**: Content Strategist  
**To**: @sme  
**Reason**: Technical validation needed for proposed DataOps pillar

### Context
Completed demand analysis showing 1,500+ job postings requiring Airflow and dbt skills...

### Deliverables Attached
- `pillar-dataops-engineering-draft.md`

### What SME Should Do
1. Validate technical accuracy of scope
2. Identify prerequisites
3. Suggest authoritative sources

### Expected Output
- Approved scope OR feedback for revision

### Success Criteria
- [ ] All concepts technically accurate
- [ ] Prerequisites correctly sequenced

**Executive Producer**: Please switch to `@sme` and provide the attached draft.
```

---

## Getting Started

1. **Creating New Content:** Load `@content-strategist` to analyze demand and propose pillar
2. **Validating Proposals:** Load `@sme` to review technical accuracy
3. **Organizing Content:** Load `@librarian` to catalog approved work

For detailed workflows, see `docs/workflows/` directory.
