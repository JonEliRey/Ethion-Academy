
# Implementation Plan: Super-Intelligent Course Designer Workflow

**Branch**: `001-i-need-to` | **Date**: 2025-10-01 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/001-i-need-to/spec.md`

## Execution Flow (/plan command scope)
```
1. Load feature spec from Input path
   → If not found: ERROR "No feature spec at {path}"
2. Fill Technical Context (scan for NEEDS CLARIFICATION)
   → Detect Project Type from file system structure or context (web=frontend+backend, mobile=app+api)
   → Set Structure Decision based on project type
3. Fill the Constitution Check section based on the content of the constitution document.
4. Evaluate Constitution Check section below
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
   → Update Progress Tracking: Initial Constitution Check
5. Execute Phase 0 → research.md
   → If NEEDS CLARIFICATION remain: ERROR "Resolve unknowns"
6. Execute Phase 1 → contracts, data-model.md, quickstart.md, agent-specific template file (e.g., `CLAUDE.md` for Claude Code, `.github/copilot-instructions.md` for GitHub Copilot, `GEMINI.md` for Gemini CLI, `QWEN.md` for Qwen Code or `AGENTS.md` for opencode).
7. Re-evaluate Constitution Check section
   → If new violations: Refactor design, return to Phase 1
   → Update Progress Tracking: Post-Design Constitution Check
8. Plan Phase 2 → Describe task generation approach (DO NOT create tasks.md)
9. STOP - Ready for /tasks command
```

**IMPORTANT**: The /plan command STOPS at step 7. Phases 2-4 are executed by other commands:
- Phase 2: /tasks command creates tasks.md
- Phase 3-4: Implementation execution (manual or via tools)

## Summary
**Primary Requirement**: Build a meta-development system consisting of 9 AI agent personas implemented as VS Code chat modes that collaborate through manual handoffs to design educational content in stages (Pillars → Learning Paths → Courses → Modules → Lessons). The system enables an Executive Producer to orchestrate agent collaboration for creating structured, relevant, and up-to-date learning content for YouTube, blogs, and a future paid academy.

**Key Distinction**: This feature builds the **agent infrastructure** (chat modes, prompts, handoff mechanisms, content tracking database), NOT the actual curriculum content. Content production begins only after the agent system is fully functional and validated.

**Technical Approach**: VS Code Copilot customization features (chat modes, custom instructions, prompt files) + SQLite for content inventory + Git-based workflow + GitHub Projects for stage gates.

## Technical Context
**Language/Version**: Markdown (chat modes, prompts, custom instructions), PowerShell 7+ (scripts), SQLite 3.x (content tracking)
**Primary Dependencies**: 
- VS Code Copilot with customization features (chat modes, custom instructions, prompt files)
- SQLite for content inventory database
- Git for version control and collaboration
- GitHub Projects for stage-gate workflow
- Daniel Miessler's Fabric patterns (reference for agent design)

**Storage**: SQLite database at `content-inventory/content.db` (Git-committed), JSON/YAML exports in `content-inventory/exports/`, optional Markdown mirrors for Obsidian

**Testing**: Agent validation via pilot (Excel learning path end-to-end), handoff mechanism testing, database schema validation

**Target Platform**: VS Code (Windows/Mac/Linux) with GitHub Copilot, local Git repository

**Project Type**: Meta-development tooling (agent infrastructure, not application code)

**Performance Goals**: 
- Agent switching: < 5 seconds (manual handoff)
- Database queries: < 100ms for inventory lookups
- Content scale: Support 100+ lessons with full prerequisite tracking

**Constraints**:
- Sequential agent interaction only (no parallel execution in v1)
- Manual handoffs via Executive Producer (no automation initially)
- All agents must be VS Code chat modes (no external tools)
- Git-committed database (no external services)
- Must work offline (except for monitoring agent web searches)

**Scale/Scope**:
- 9 agent personas (chat modes)
- 5 stage gates (Pillars, Paths, Courses, Modules, Lessons)
- Initial pilot: 1 learning path (Excel) with ~10-15 lessons
- Full scale: Dozens to 100+ lessons across multiple paths
- Expected handoffs per content cycle: 15-20 agent switches

## Constitution Check
*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

**Note**: Constitution file is a template placeholder. Applying reasonable governance principles for this meta-development project:

**Simplicity**: ✅ PASS
- Using native VS Code features (chat modes) - no external frameworks
- SQLite for storage - simple, Git-committable, no server required
- Markdown-based configuration - human-readable, version-controllable
- Manual handoffs - simple state machine, easy to debug

**Testability**: ✅ PASS  
- Agent specs include example interactions for validation
- Pilot (Excel path) provides end-to-end system test
- Database schema testable via sample queries
- Handoff protocol testable via scenario walkthroughs

**Maintainability**: ✅ PASS
- Each agent as separate chat mode file - independent, modular
- Prompt files separate concerns (define-pillar, validate-scope, etc.)
- Custom instructions provide global standards
- Clear documentation structure (agent specs, workflows, schemas)

**No Technical Debt**: ✅ PASS
- Building infrastructure first, content second (proper sequencing)
- Using proven patterns (Fabric) as foundation
- Documentation-driven (all specs before implementation)
- Validation phase (Excel pilot) before scale

**Potential Concerns**: ⚠️ MONITOR
- 9 agents may feel complex initially, but phased approach mitigates (3 agents Phase 1, 6 more Phase 2)
- Manual handoffs could be tedious at scale, but intentional for v1 to learn patterns before automation
- SQLite scalability at 1000+ lessons, but sufficient for initial scope (100 lessons)

## Project Structure

### Documentation (this feature)
```
specs/[###-feature]/
├── plan.md              # This file (/plan command output)
├── research.md          # Phase 0 output (/plan command)
├── data-model.md        # Phase 1 output (/plan command)
├── quickstart.md        # Phase 1 output (/plan command)
├── contracts/           # Phase 1 output (/plan command)
└── tasks.md             # Phase 2 output (/tasks command - NOT created by /plan)
```

### Source Code (repository root)
```
.github/
└── chatmodes/                        # Agent chat mode definitions
    ├── content-strategist.chatmode.md
    ├── sme.chatmode.md
    ├── scriptwriter.chatmode.md
    ├── editor.chatmode.md
    ├── community-manager.chatmode.md
    ├── seo-lead.chatmode.md
    ├── qa-reviewer.chatmode.md
    ├── librarian.chatmode.md
    └── monitoring-specialist.chatmode.md

.github/
├── chatmodes/                        # Agent chat mode definitions
│   ├── content-strategist.chatmode.md
│   ├── sme.chatmode.md
│   ├── scriptwriter.chatmode.md
│   ├── editor.chatmode.md
│   ├── community-manager.chatmode.md
│   ├── seo-lead.chatmode.md
│   ├── qa-reviewer.chatmode.md
│   ├── librarian.chatmode.md
│   └── monitoring-specialist.chatmode.md
└── instructions/                     # Custom instructions
    ├── global-standards.instructions.md           # Project-wide conventions
    ├── content-standards.instructions.md          # Frontmatter, formatting rules
    └── handoff-protocol.instructions.md           # Agent transition rules

.vscode/                              # VS Code configuration
└── prompts/                          # Reusable prompt files
    ├── define-pillar.prompt.md
    ├── define-learning-path.prompt.md
    ├── validate-technical-scope.prompt.md
    ├── create-lesson-brief.prompt.md
    ├── perform-content-review.prompt.md
    ├── handoff-summary.prompt.md
    ├── catalog-content.prompt.md
    └── check-for-updates.prompt.md

content-inventory/                    # Content tracking database
├── content.db                        # SQLite database (Git-committed)
├── exports/                          # Machine-readable exports
│   ├── pillars.json
│   ├── learning-paths.yaml
│   └── lessons-index.json
├── obsidian/                         # Optional Markdown mirrors
│   └── [auto-generated from DB]
└── schema/                           # Database schema documentation
    ├── schema.sql
    └── migrations/

scripts/                              # Utility scripts
├── init-database.ps1                 # Initialize content.db schema
├── export-inventory.ps1              # Export DB to JSON/YAML
├── validate-agent.ps1                # Test agent chat mode
└── generate-obsidian-mirror.ps1      # Create Markdown from DB

docs/                                 # Agent system documentation
└── 001-i-need-to/
    └── plan/                         # This plan's artifacts
        ├── agents/                   # Detailed agent specifications
        ├── workflows/                # Diagrams and protocols
        ├── data/                     # Schema details
        ├── examples/                 # Conversation scenarios
        └── implementation/           # Roadmap and guides

templates/                            # Content templates
├── pillar-template.md
├── learning-path-template.md
├── course-template.md
├── module-template.md
└── lesson-template.md

.github/
└── workflows/                        # CI/CD for validation
    ├── validate-chat-modes.yml       # Lint chat mode syntax
    └── backup-database.yml           # Backup content.db

LICENSE                               # MIT for code/scripts
```

**Structure Decision**: Meta-development tooling structure

This is NOT a traditional application with src/ and tests/. Instead:
- **`.github/chatmodes/`**: 9 chat mode files (the core agent personas)
- **`.github/instructions/`**: Global standards for all agents
- **`.vscode/prompts/`**: Reusable workflow prompts
- **`content-inventory/`**: SQLite database for content tracking
- **`docs/001-i-need-to/plan/`**: Design artifacts from this planning phase
- **`templates/`**: Content structure templates for actual curriculum (used later)

The "source code" is Markdown-based agent definitions and database schema, not traditional programming language code.

## Phase 0: Outline & Research

**Status**: ✅ All technical context is clarified via PLAN-STAGE-INPUT.md, CLARIFICATIONS.md, and reference materials

### Research Tasks Completed (Pre-Planning)

1. **VS Code Chat Mode Capabilities**
   - **Decision**: Use VS Code Copilot chat modes as primary agent implementation
   - **Rationale**: Native integration, no external dependencies, supports role-specific prompts and tool access control
   - **Reference**: https://code.visualstudio.com/docs/copilot/customization/custom-chat-modes
   
2. **Agent Design Patterns**
   - **Decision**: Base agent structure on Daniel Miessler's Fabric patterns
   - **Rationale**: Proven, well-structured AI persona patterns with clear identity/purpose/steps/output format
   - **Reference**: https://github.com/danielmiessler/Fabric/tree/main/data/patterns
   - **Key patterns to adapt**: analyze_tech_impact, create_summary, write_essay, create_video_script, rate_content, improve_writing

3. **Handoff Mechanism**
   - **Decision**: Manual handoffs with structured handoff indicators
   - **Rationale**: v1 focuses on learning optimal patterns; automation can come later after understanding friction points
   - **Format**: Source agent → Target agent with context summary, deliverables, expected output, success criteria

4. **Content Tracking**
   - **Decision**: SQLite database (Git-committed) with JSON/YAML exports
   - **Rationale**: Simple, version-controlled, no server, sufficient for 100+ lessons, enables offline work
   - **Alternatives considered**: PostgreSQL (too complex), JSON files (no relational queries), MongoDB (external dependency)

5. **Complex Research Agent Pattern**
   - **Decision**: Use Beastmode chatmode as inspiration for Monitoring Specialist
   - **Rationale**: Demonstrates recursive documentation exploration, multi-layer link traversal
   - **Reference**: Beastmode 3.1 gist (https://gist.githubusercontent.com/burkeholland/88af0249c4b6aff3820bf37898c8bacf/raw/...)

### Research Findings: research.md

Create `research.md` with consolidated findings:
- Chat mode syntax and configuration
- Fabric pattern structure analysis
- Handoff protocol design principles
- SQLite schema best practices for hierarchical content
- GitHub Projects API for stage gates

**Output**: research.md documenting all technology choices and patterns

## Phase 1: Design & Contracts
*Prerequisites: research.md complete*

### 1. Data Model Design → `data-model.md`

**Entities from feature spec** (FR-016, Key Entities section):

**Core Content Hierarchy**:
- Pillar (id, name, description, status, created_at, approved_at)
- LearningPath (id, pillar_id, name, description, target_audience, prerequisites, status)
- Course (id, path_id, name, description, outcomes, assessment_strategy, status)
- Module (id, course_id, name, description, topics, status)
- Lesson (id, module_id, name, objectives, outline, practice, citations, leader_lens, status)

**Agent System**:
- Persona/Agent (id, name, role, system_prompt, tools, handoff_triggers)
- HandoffIndicator (id, from_agent, to_agent, context, deliverables, expected_output, success_criteria)
- AgentAction (id, agent_name, action_type, content_id, timestamp, input_context, output_deliverable)

**Content Assets**:
- ContentAsset (id, lesson_id, asset_type, title, status, youtube_url, blog_url, cta_text)
- AssetProductionStatus (asset_id, stage, timestamp) # brief, recorded, drafted, published

**Metadata & Tracking**:
- Tag (id, category, value) # topic, level, role, format, source_type, tech_stack
- ContentTag (content_id, content_type, tag_id)
- Source/Citation (id, url, title, source_type, accessed_date, freshness_sla)
- ContentSource (content_id, source_id)
- DemandSignal (id, signal_type, value, timestamp, source) # search volume, engagement, questions
- UpdateAlert (id, source_id, change_type, description, severity, affected_content_ids, status)
- Approval (id, content_id, content_type, approver, decision, comments, timestamp)
- Prerequisite (content_id, prerequisite_id, relationship_type)

**Relationships**:
- Hierarchical: Pillar → LearningPath → Course → Module → Lesson
- Cross-references: Lesson → Prerequisites (other lessons)
- Mappings: ContentAsset → Lesson, ContentAsset → DemandSignals
- Tracking: Content → Tags, Content → Sources, Content → Approvals
- Agent tracking: AgentAction → Content, HandoffIndicator → Personas

### 2. Agent Specifications → `.github/chatmodes/`

**Generate 9 agent chat mode files** using Fabric pattern structure:

**Phase 1 Agents** (Foundation - Pillars & Learning Paths):
1. **`content-strategist.chatmode.md`**: Demand analysis, pillar/path definition
   - System prompt based on `analyze_tech_impact` + `extract_insights` patterns
   - Tools: web search, trend analysis
   - Handoffs: → SME (validation), → Executive Producer (approval)

2. **`sme.chatmode.md`**: Technical validation, prerequisite identification
   - System prompt based on `explain_code` + `analyze_tech_impact` patterns
   - Tools: documentation access
   - Handoffs: → Content Strategist (feedback), → Scriptwriter (approved scope)

3. **`librarian.chatmode.md`**: Content inventory, tagging, cross-referencing
   - System prompt based on `extract_insights` + `label_and_rate` patterns
   - Tools: database access (read/write)
   - Handoffs: → Any agent (context provision), → Executive Producer (reports)

**Phase 2 Agents** (Production - Courses, Modules, Lessons):
4. **`scriptwriter.chatmode.md`**: Lesson outlines, video briefs
5. **`editor.chatmode.md`**: Quality review, consistency
6. **`community-manager.chatmode.md`**: Engagement strategy, CTAs
7. **`seo-lead.chatmode.md`**: Keywords, discoverability
8. **`qa-reviewer.chatmode.md`**: Final quality check
9. **`monitoring-specialist.chatmode.md`**: Freshness tracking, change detection

**Each agent chat mode file structure** (based on Beastmode and VS Code docs):
```markdown
---
description: Agent Name
tools: ['codebase', 'search', 'fetch', 'runCommands', 'editFiles']
---

# Agent Name

## Identity
[Role definition - who this agent is]

## Purpose  
[What this agent does and why it exists]

## Workflow
1. [Step-by-step instructions]
2. [Detailed process]
3. [...]

## Input Requirements
[What context/data this agent needs to function]

## Output Format
[Deliverables structure and format]

## Handoff Protocol
- **TO this agent when**: [conditions that trigger receiving handoff]
- **FROM this agent to**: [targets and conditions for handing off]
- **Handoff format**: Use standard template from `.github/instructions/handoff-protocol.instructions.md`

## Guidelines
[Specific rules and constraints for this agent]

## Examples
[2-3 sample interactions showing agent in action]

## Quality Criteria
[How to evaluate if agent's outputs are good]
```

**CRITICAL**: 
- YAML frontmatter with `---` delimiters must be at the BEGINNING of file
- Files stored in `.github/chatmodes/`
- Naming: `agent-name.chatmode.md`

### 3. Workflow Documentation → `docs/001-i-need-to/plan/workflows/`

**`handoff-protocol.md`**: Handoff message format specification
```markdown
## 🔄 HANDOFF REQUIRED

**From**: [Source Agent]
**To**: [Target Agent]
**Reason**: [Why handoff needed]

### Context
[Work completed summary]

### Deliverables Attached
[Artifacts being passed]

### What [Target] Should Do
[Specific tasks]

### Expected Output
[What to deliver]

### Success Criteria
[How to know it's done right]

**Executive Producer**: [Instruction to switch chat modes]
```

**`stage-gates.md`**: Approval criteria per stage
- Pillar gate checklist
- Learning Path gate checklist
- Course/Module/Lesson gate checklists

**`agent-flow.md`**: Narrative description + ASCII diagram of agent interactions

### 4. Example Scenarios → `docs/001-i-need-to/plan/examples/`

**`scenario-01-create-pillar.md`**: Complete conversation from idea → approved pillar
- Shows: Content Strategist → SME → Executive Producer handoffs
- Demonstrates: Handoff format, context passing, approval decision

**`scenario-02-rejection-flow.md`**: What happens when content rejected
- Shows: Rejection feedback, return to previous stage, rework

**`scenario-03-multi-agent-collaboration.md`**: Multiple agents working together
- Shows: Content Strategist + SME + Librarian collaboration

### 5. Database Schema → `content-inventory/schema/schema.sql`

Complete SQLite schema with:
- All tables from data model
- Indexes for common queries
- Foreign key constraints
- Triggers for audit trail

### 6. Quickstart Guide → `quickstart.md`

**Quickstart**: Validate agent system with minimal scenario
1. Initialize database: `scripts/init-database.ps1`
2. Load Content Strategist chat mode
3. Propose one pillar (DataOps)
4. Handoff to SME for validation
5. Handoff to Executive Producer for approval
6. Verify pillar recorded in database
7. Export to JSON: `scripts/export-inventory.ps1`

**Success**: Can execute complete pillar approval cycle with 3 agents and database tracking

### 7. Custom Instructions → `.github/instructions/`

**`global-standards.instructions.md`**:
```markdown
---
description: 'Project-wide conventions for all agents'
applyTo: '**/*.md, **/*.json, **/*.sql, **/*.ps1'
---

# Global Standards

- All content files require frontmatter (target audience, topics, goals, prerequisites, tags, status)
- Database operations use parameterized queries
- Agent handoffs use standard format from handoff-protocol.instructions.md
```

**`content-standards.instructions.md`**:
```markdown
---
description: 'Content file frontmatter and formatting standards'
applyTo: 'content-inventory/**/*.md, templates/**/*.md'
---

# Content Standards

- Frontmatter schema for pillars/paths/courses/modules/lessons
- Tagging conventions (role, level, topic, format, source_type, tech_stack)
- Directory structure rules
```

**`handoff-protocol.instructions.md`**:
```markdown
---
description: 'Agent handoff message format and transition rules'
applyTo: '**/*.md'
---

# Handoff Protocol

- Handoff message template
- Context passing requirements
- Return-to-human conditions
```

### 8. Update GitHub Copilot Instructions

Run: `.specify/scripts/powershell/update-agent-context.ps1 -AgentType copilot`
- Add: VS Code chat modes, SQLite, Markdown configuration
- Add: Fabric patterns, agent design principles
- Update: Recent changes (meta-development system design)

**Output**: data-model.md, 9 agent specs, workflow docs, example scenarios, schema.sql, quickstart.md, custom instructions, updated copilot instructions

## Phase 2: Task Planning Approach
*This section describes what the /tasks command will do - DO NOT execute during /plan*

### Task Generation Strategy

**This feature delivers CONFIGURATION, not code**. Tasks focus on authoring Markdown files with agent specifications, not implementing runtime systems.

**Generation approach**:
- Load `.specify/templates/tasks-template.md` as base
- Generate tasks from Phase 1 design docs (agent specs, data model, workflows, quickstart)
- Each agent spec → chat mode configuration task [P]
- Each instruction type → custom instruction task [P]
- Each workflow → prompt file task [P]
- Database schema → initialization script task
- Quickstart scenario → validation task

### Ordering Strategy

**1. Bootstrapping Tasks** (Foundation):
- Create directory structure (.github/chatmodes/, .github/instructions/, .vscode/prompts/, content-inventory/, docs/)
- Initialize SQLite database with schema.sql
- Generate database scripts (init-database.ps1, export-inventory.ps1)

**2. Configuration Tasks** (Agent definitions - mark [P] for parallel):
- Create 9 agent chat mode files (.github/chatmodes/*.chatmode.md) [P]
- Create 3 custom instruction files (.github/instructions/) [P]
- Create 3 prompt workflow files (.vscode/prompts/) [P]

**3. Documentation Tasks** (Depends on all agent specs):
- Workflow documentation (handoff-protocol.md, stage-gates.md, agent-flow.md)
- Example scenarios (3 files)
- Quickstart guide

**4. Validation Tasks** (Testing approach):
- Manual test plan for quickstart
- Agent response validation checklist
- Database schema validation queries

**5. Integration Tasks**:
- GitHub Projects setup guide
- Obsidian vault integration guide
- Update project agent context file

### Task Granularity

**Configuration tasks**: 1-2 hours each (authoring Markdown)
**Documentation tasks**: 2-3 hours each (writing guides + examples)
**Validation tasks**: 1-2 hours each (manual testing steps)
**Integration tasks**: 2-4 hours each (cross-tool setup)

### Dependencies & Parallelization

**Linear dependencies**:
- Database schema → Scripts
- All agent specs → Workflow docs
- All configuration → Quickstart
- Quickstart → Test plan

**Parallel opportunities** [P]:
- All 9 agent chat mode files (independent)
- All 3 instruction files (independent)
- All 3 prompt files (independent)

### Estimated Output

**Total**: ~30 tasks
**Breakdown**:
- Bootstrapping: 4 tasks
- Configuration: 12 tasks (9 agents + 3 instructions)
- Prompts: 3 tasks
- Documentation: 5 tasks
- Validation: 3 tasks
- Integration: 3 tasks

**Critical Path**: Directory setup → Database → Agent specs [P] → Workflow docs → Quickstart → Validation (16-20 hours sequential)

**IMPORTANT**: This phase is executed by the /tasks command, NOT by /plan

## Phase 3+: Future Implementation
*These phases are beyond the scope of the /plan command*

**Phase 3**: Task execution (/tasks command creates tasks.md)  
**Phase 4**: Implementation (execute tasks.md following constitutional principles)  
**Phase 5**: Validation (run tests, execute quickstart.md, performance validation)

## Complexity Tracking
*Fill ONLY if Constitution Check has violations that must be justified*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |


## Progress Tracking
*This checklist is updated during execution flow*

**Phase Status**:
- [x] Phase 0: Research complete (/plan command) - See research.md
- [x] Phase 1: Design complete (/plan command) - Agent specs, data model, workflows designed
- [x] Phase 2: Task planning complete (/plan command - approach described above)
- [ ] Phase 3: Tasks generated (/tasks command - execute next)
- [ ] Phase 4: Implementation complete
- [ ] Phase 5: Validation passed

**Gate Status**:
- [x] Initial Constitution Check: PASS (simplicity principles applied)
- [x] Post-Design Constitution Check: PASS (Markdown configuration approach maintains simplicity)
- [x] All NEEDS CLARIFICATION resolved (CLARIFICATIONS.md complete)
- [x] Complexity deviations documented (None - SQLite and Markdown are simple choices)

---
*Based on Constitution v2.1.1 - See `/memory/constitution.md`*
