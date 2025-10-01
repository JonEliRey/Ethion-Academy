# Plan Stage Input Document

**Purpose**: This document provides all necessary context, constraints, and resources for the Plan stage to develop a comprehensive technical breakdown and implementation plan for the Super-Intelligent Course Designer meta-development system.

---

## 📋 What to Read First

### Core Specification Documents
1. **spec.md** - Complete feature specification (WHAT we're building)
2. **CLARIFICATIONS.md** - Detailed Q&A and decisions made
3. **META-DEVELOPMENT-SCOPE.md** - Critical understanding that we're building the agent system, not content

### Key Understanding
**We are building a meta-development system** - the agent infrastructure (chatmodes, prompts, handoffs) that will enable content production. This is NOT about producing curriculum content; it's about building the factory that will produce content later.

---

## 🎯 What the Plan Stage Should Produce

Your deliverables should include:

1. **Technical Breakdown** - Architecture and design decisions
2. **Agent Specifications** - Detailed specs for all 9 agent personas
3. **Workflow Diagrams** - Visual representation of agent interactions and handoffs
4. **Database Schema** - SQLite structure for content tracking
5. **Implementation Roadmap** - Phased approach with validation criteria
6. **Handoff Protocol** - Exact mechanism for agent transitions
7. **Example Scenarios** - Sample conversations showing agents in action
8. **Testing & Validation Plan** - How to verify system works

---

## 🛠️ Technical Context: VS Code Copilot Customization

The implementation will use VS Code's Copilot customization features to create the agent system.

### Custom Instructions
**What they are**: Markdown files defining guidelines/rules for tasks like code generation, reviews, or commit messages.

**How we'll use them**: 
- Define global coding standards for the project
- Set review criteria for agent-generated content
- Establish commit message and PR conventions
- Provide project-specific context that all agents should know

**Documentation**: https://code.visualstudio.com/docs/copilot/customization/custom-instructions

**Example use cases for our project**:
- "All content files must include frontmatter with target audience, topics, goals, prerequisites"
- "Database operations must use parameterized queries"
- "All agent handoffs must include context summary and expected output"

---

### Chat Modes
**What they are**: Specialist assistants for specific roles/tasks, defined in Markdown files with scope, capabilities, tool access, and preferred language model.

**How we'll use them**:
- **Each of our 9 agent personas will be a chat mode**
- Content Strategist chat mode with research capabilities
- SME chat mode with technical validation focus
- Scriptwriter chat mode with creative writing emphasis
- Librarian chat mode with database access
- etc.

**Documentation**: https://code.visualstudio.com/docs/copilot/customization/custom-chat-modes

**Key capabilities**:
- Define scope and boundaries per agent
- Specify which tools each agent can access (read-only, database, web search, etc.)
- Set preferred language model per agent (some may need more powerful models)
- Include role-specific instructions and examples

**Chat mode file structure** (based on Beastmode example):
```markdown
---
description: Content Strategist
tools: ['fetch', 'search', 'codebase']
---

# Content Strategist

[Main content with detailed instructions]

## Role
Demand analysis and strategic content planning

## Workflow
1. [Step-by-step instructions]
2. [...]

## Guidelines
[Specific guidelines for this agent]

## Handoff Protocol
[When to handoff to other agents]
```

**Important**: 
- YAML frontmatter with `---` delimiters goes at the BEGINNING of the file
- Files stored in `.github/chatmodes/` directory
- File naming: `agent-name.chatmode.md` (e.g., `content-strategist.chatmode.md`)

---

### Prompt Files
**What they are**: Reusable prompts for common/repeatable tasks, defined in Markdown files and runnable directly in chat.

**How we'll use them**:
- Create repeatable workflows for each stage (define pillars, define paths, etc.)
- Standard templates for asset briefs (YouTube video, blog post, lesson)
- Content review checklists
- Handoff templates

**Documentation**: https://code.visualstudio.com/docs/copilot/customization/prompt-files

**Prompt file structure** (with frontmatter at beginning):
```markdown
---
mode: 'content-strategist'
description: 'Guide Content Strategist through pillar creation'
tools: ['search', 'fetch', 'codebase']
---

# Define Pillar Workflow

[Detailed instructions and steps]
```

**Example prompt files for our project** (stored in `.vscode/prompts/`):
- `define-pillar.prompt.md` - Walks Content Strategist through pillar creation (mode: 'content-strategist')
- `define-learning-path.prompt.md` - Learning Path creation workflow (mode: 'content-strategist')
- `validate-technical-scope.prompt.md` - SME validation checklist (mode: 'sme')
- `create-lesson-brief.prompt.md` - Scriptwriter template for lessons (mode: 'scriptwriter')
- `perform-content-review.prompt.md` - QA Reviewer checklist (mode: 'qa-reviewer')
- `handoff-summary.prompt.md` - Template for agent handoffs (mode: 'agent')

**Custom instructions structure** (stored in `.github/instructions/`):
```markdown
---
description: 'Project-wide conventions for all agents'
applyTo: '**/*.md, **/*.json, **/*.sql'
---

# Global Standards

[Standards and guidelines]
```

**Example custom instruction files**:
- `global-standards.instructions.md` - Project-wide conventions
- `content-standards.instructions.md` - Content-specific rules (applyTo: '**/*.md')
- `handoff-protocol.instructions.md` - Agent transition rules

---

## 🎨 Reference Materials for Agent Persona Design

### Primary Source: Daniel Miessler's Fabric Patterns
**Repository**: https://github.com/danielmiessler/Fabric/tree/main/data/patterns

**Why this is valuable**: 
- Extensive collection of well-crafted AI personas
- Each pattern has clear purpose, instructions, and output format
- Proven effective in real-world usage
- Covers diverse roles (analyst, writer, researcher, reviewer, etc.)

**Relevant patterns to study** (examples):
- `analyze_tech_impact` - For understanding tool changes
- `create_summary` - For distilling complex documentation
- `explain_code` - For breaking down technical concepts
- `extract_insights` - For demand signal analysis
- `write_essay` - For blog content creation
- `create_video_script` - For YouTube video planning
- `rate_content` - For QA review processes

**How to use**: 
- Study the pattern structure (identity, steps, output format)
- Adapt patterns to our specific agent needs
- Maintain consistent format across all our agents
- Use clear, directive language like Fabric patterns do

---

### Secondary Source: Awesome Copilot Prompts
**Repository**: https://github.com/github/awesome-copilot

**Why this is valuable**:
- Curated collection of effective Copilot prompts
- Community-tested approaches
- Covers various domains and tasks

**Relevant sections**:
- Prompt engineering best practices
- Role-based prompts
- Task-specific examples

---

### Example: Beastmode Agentic Researcher
**Gist**: https://gist.githubusercontent.com/burkeholland/88af0249c4b6aff3820bf37898c8bacf/raw/e1898331f1755aff3265d50e30106b8c6987c4f7/beastmode3.1.chatmode.md

**Why this is valuable**:
- Excellent example of a sophisticated chat mode
- Demonstrates recursive research capabilities
- Shows how to handle multi-layer documentation exploration
- Good model for our Monitoring Specialist agent

**Key learnings**:
- How to structure complex agent behavior
- Tool usage patterns (when to search, when to analyze)
- Clear output formatting
- Boundary setting (what agent can/can't do)

---

## 🎭 The 9 Agent Personas to Design

For each agent, you'll need to create a complete specification using the patterns from Fabric as inspiration:

### 1. Content Strategist
- **Primary Role**: Demand analysis, pillar/path definition, strategic alignment
- **Key Activities**: Research trends, analyze search volume, propose content structure
- **Fabric Patterns to Study**: `analyze_tech_impact`, `extract_insights`, `rate_ai_response`
- **Tools Needed**: Web search, trend analysis, research access
- **Handoffs**: → SME (for validation), → Executive Producer (for approval)

### 2. Subject Matter Expert (SME)
- **Primary Role**: Technical validation, scope verification, prerequisite identification
- **Key Activities**: Validate technical accuracy, assess complexity, recommend sequencing
- **Fabric Patterns to Study**: `explain_code`, `analyze_tech_impact`, `create_quiz`
- **Tools Needed**: Documentation access, technical references
- **Handoffs**: → Content Strategist (with feedback), → Scriptwriter (approved scope)

### 3. Scriptwriter
- **Primary Role**: Lesson outlines, video briefs, content structuring
- **Key Activities**: Create engaging narratives, structure learning flow, write hooks/CTAs
- **Fabric Patterns to Study**: `create_video_script`, `write_essay`, `improve_writing`
- **Tools Needed**: Content templates, style guides
- **Handoffs**: → Editor (for review), → Executive Producer (for approval)

### 4. Editor
- **Primary Role**: Quality review, consistency check, clarity improvement
- **Key Activities**: Review content for clarity, check alignment with goals, ensure consistency
- **Fabric Patterns to Study**: `improve_writing`, `rate_content`, `check_agreement`
- **Tools Needed**: Style guide, previous content for consistency
- **Handoffs**: → Scriptwriter (with edits), → QA Reviewer (approved drafts)

### 5. Community Manager
- **Primary Role**: Engagement strategy, CTA optimization, funnel alignment
- **Key Activities**: Design engagement hooks, optimize CTAs, plan community interaction
- **Fabric Patterns to Study**: `write_essay`, `create_summary`, `improve_writing`
- **Tools Needed**: Engagement metrics, audience insights
- **Handoffs**: → SEO Lead (for distribution), → Executive Producer (for strategy approval)

### 6. SEO/Distribution Lead
- **Primary Role**: Keyword research, topic clustering, discoverability optimization
- **Key Activities**: Select keywords, map content to clusters, optimize for search
- **Fabric Patterns to Study**: `extract_insights`, `create_summary`, `analyze_tech_impact`
- **Tools Needed**: SEO tools, search data, competitor analysis
- **Handoffs**: → Scriptwriter (with SEO guidance), → Executive Producer (for strategy)

### 7. QA Reviewer
- **Primary Role**: Final quality check, accuracy verification, completeness assessment
- **Key Activities**: Verify all topics covered, check accuracy, validate prerequisites
- **Fabric Patterns to Study**: `rate_content`, `check_agreement`, `create_quiz`
- **Tools Needed**: Review checklists, validation criteria
- **Handoffs**: → Editor (issues found), → Librarian (approved content)

### 8. Librarian/Archivist
- **Primary Role**: Content inventory management, tagging, cross-referencing
- **Key Activities**: Catalog content, maintain tags, track prerequisites, identify reuse opportunities
- **Fabric Patterns to Study**: `extract_insights`, `create_summary`, `label_and_rate`
- **Tools Needed**: Database access, tagging system, inventory queries
- **Handoffs**: → Any agent (providing context), → Executive Producer (inventory reports)

### 9. Monitoring Specialist
- **Primary Role**: Freshness tracking, change detection, update alerts
- **Key Activities**: Monitor official sources, detect material changes, flag outdated content
- **Fabric Patterns to Study**: `analyze_tech_impact`, `extract_insights`, `summarize`
- **Tools Needed**: Web monitoring, RSS feeds, documentation access (like Beastmode)
- **Handoffs**: → SME (for impact assessment), → Executive Producer (for update decisions)

---

## 🔄 Critical: Handoff Mechanism Design

The plan stage MUST design a clear, unambiguous handoff mechanism. This is the most critical component of the meta-development system.

### Handoff Requirements
Each agent handoff must include:

1. **Clear Signal**: Unmistakable indicator that handoff is occurring
2. **Source Agent**: Which agent is handing off
3. **Target Agent**: Which agent should take over
4. **Context Summary**: What work was completed
5. **Deliverables**: What artifacts are being passed
6. **Input Needed**: What the next agent needs to begin
7. **Expected Output**: What the next agent should produce
8. **Success Criteria**: How to know the next agent succeeded
9. **Return Condition**: When to come back to Executive Producer

### Example Handoff Format to Define
```markdown
## 🔄 HANDOFF REQUIRED

**From**: Content Strategist
**To**: Subject Matter Expert (SME)
**Reason**: Pillar definition needs technical validation

### Context
I've analyzed demand signals and proposed 3 pillars for the DataOps domain:
1. Data Fundamentals (Excel, Power Query)
2. Business Intelligence (Power BI Desktop)
3. Advanced Analytics (DAX, Data Modeling)

### Deliverables Attached
- Pillar definitions with rationale
- Demand signal evidence
- Proposed audience segments

### What SME Should Do
- Validate technical scope of each pillar
- Assess complexity and sequencing
- Identify prerequisites between pillars
- Recommend any adjustments

### Expected Output
- Technical validation report
- Recommended pillar order
- Prerequisite map
- Approval or revision suggestions

### Success Criteria
- All pillars have technical assessment
- Sequencing is logical based on prerequisites
- Scope is achievable within constraints

**Executive Producer**: Please switch to SME chat mode and provide the attached context.
```

---

## 📊 Database Design Requirements

The plan stage should design the SQLite schema for content tracking. Consider:

### Core Entities
- Pillars, Learning Paths, Courses, Modules, Lessons
- Content Assets (YouTube, Blog, Academy)
- Tags (topic, level, audience, format, tech/stack, prerequisites)
- Sources/Citations
- Demand Signals
- Agent Actions (audit trail)
- Approval Records
- Update Alerts

### Key Relationships
- Hierarchical: Pillar → Path → Course → Module → Lesson
- Cross-references: Lesson → Prerequisites (other lessons)
- Mappings: Asset → Lesson (YouTube video maps to lesson)
- Tracking: Content → Tags, Content → Sources, Content → Approvals

### Query Patterns
- Find all content needing review (freshness SLA)
- Get prerequisites for a lesson
- List content by tag/audience
- Track agent activity
- Audit approval history

---

## 🎯 Implementation Constraints & Preferences

### Must-Haves
- ✅ All agents must be VS Code chat modes (not external tools)
- ✅ Handoffs must be manual (Executive Producer switches chat modes)
- ✅ Clear, unambiguous handoff indicators
- ✅ Sequential agent interaction (no parallel at first)
- ✅ Executive Producer is sole approval authority
- ✅ SQLite for content tracking (Git-committed)
- ✅ Markdown files for all content and documentation

### Nice-to-Haves
- 🎁 Visual workflow diagrams
- 🎁 Auto-generated handoff summaries
- 🎁 Template-based content generation
- 🎁 Obsidian integration for knowledge graph view
- 🎁 GitHub Projects automation for stage gates

### Avoid
- ❌ Complex setup or dependencies
- ❌ External services (keep it local/Git-based)
- ❌ Parallel agent execution (too complex for v1)
- ❌ Automated approvals (human must approve)

---

## ✅ Success Criteria for the Plan Stage

Your plan is complete when:

1. **Agent Specifications**: All 9 agents have detailed specs (using Fabric pattern structure)
2. **Handoff Protocol**: Clear, documented mechanism for agent transitions
3. **Workflow Documentation**: Diagrams showing agent flow and stage gates
4. **Database Design**: Complete SQLite schema with ER diagram
5. **Implementation Roadmap**: Phased approach with validation criteria
6. **Example Scenarios**: 3-5 complete conversation flows showing agents in action
7. **Testing Plan**: How to validate each phase and the complete system
8. **VS Code Configuration**: Specific instructions for implementing chat modes, custom instructions, and prompt files

### Validation Questions
After completing the plan, answer these:

- ✅ Can someone implement the agent system from this plan?
- ✅ Is it clear how the Executive Producer uses the system?
- ✅ Are handoffs unambiguous?
- ✅ Does the database capture everything needed?
- ✅ Is the phased approach realistic?
- ✅ Are the agents inspired by proven patterns (Fabric)?
- ✅ Does this align with VS Code Copilot capabilities?

---

## 📚 Additional Context

### Project Background
- **Repository**: Ethion-Academy (GitHub: JonEliRey/Ethion-Academy)
- **Branch**: `001-i-need-to`
- **Main Branch**: `main`
- **Executive Producer**: Jonathan Reyes (jonathan@ethionconsulting.com)

### Content Focus (for context, not for production yet)
- Primary domain: DataOps (Excel, Power BI, Power Query, DAX)
- Target audiences: Data Analysts (Beginner), Engineers (Intermediate)
- Platforms: YouTube, EthionConsulting.com blog, future academy (Skool or similar)
- First pilot content: Excel (Data Manipulation, Analysis, Power Query)

### Quality Standards
- **Accuracy**: Content must be technically correct
- **Relevancy**: Based on current tools and documentation
- **Clarity**: Accessible to target audience level
- **Freshness**: Updated when tools change

---

## 🚀 Getting Started with the Plan Stage

### Recommended Approach

1. **Study Reference Materials** (Day 1)
   - Review Daniel Miessler's Fabric patterns structure
   - Analyze Beastmode chat mode as complex example
   - Understand VS Code Copilot customization docs

2. **Design Agent Specifications** (Days 2-3)
   - Start with Content Strategist, SME, Librarian (Phase 1 agents)
   - Use Fabric pattern structure as template
   - Define clear boundaries and handoff conditions

3. **Design Handoff Protocol** (Day 4)
   - Create standard handoff format
   - Define handoff indicators and signals
   - Document context passing mechanism

4. **Design Database Schema** (Day 5)
   - Map entities and relationships
   - Define queries for common operations
   - Plan for audit trail and tracking

5. **Create Workflow Documentation** (Day 6)
   - Visual diagrams of agent flow
   - Stage-gate definitions
   - Example scenarios

6. **Implementation Roadmap** (Day 7)
   - Phase 1: Foundation agents
   - Phase 2: Production agents
   - Phase 3: System validation (Excel pilot)
   - Phase 4: Content production (future)

7. **Testing & Validation Plan** (Day 8)
   - Unit tests (per agent)
   - Integration tests (agent collaboration)
   - System test (Excel pilot)
   - Success criteria

---

## 📝 Document Structure Recommendation

Create these documents in `/docs/001-i-need-to/plan/`:

```
plan/
├── README.md (overview and index)
├── technical-breakdown.md (architecture decisions)
├── agents/
│   ├── 01-content-strategist.md
│   ├── 02-sme.md
│   ├── 03-scriptwriter.md
│   ├── 04-editor.md
│   ├── 05-community-manager.md
│   ├── 06-seo-lead.md
│   ├── 07-qa-reviewer.md
│   ├── 08-librarian.md
│   └── 09-monitoring-specialist.md
├── workflows/
│   ├── stage-gates.md
│   ├── handoff-protocol.md
│   ├── agent-flow.md
│   └── diagrams/ (visual workflows)
├── data/
│   ├── schema.sql
│   ├── er-diagram.md
│   └── sample-queries.md
├── examples/
│   ├── scenario-01-create-pillar.md
│   ├── scenario-02-rejection-flow.md
│   ├── scenario-03-multi-agent-collaboration.md
│   └── scenario-04-content-update-alert.md
├── implementation/
│   ├── roadmap.md
│   ├── phase-1-foundation.md
│   ├── phase-2-production.md
│   ├── phase-3-validation.md
│   └── vscode-config.md (chat modes, custom instructions setup)
└── testing/
    ├── validation-plan.md
    ├── test-scenarios.md
    └── success-criteria.md
```

---

## 🎓 Key Takeaway

**You are designing the meta-development system** - the agent infrastructure that will enable efficient, high-quality content production. Think of it as architecting a learning development agency where AI agents are the specialists and the Executive Producer orchestrates their collaboration.

Focus on:
- **Clarity**: Every handoff must be unambiguous
- **Structure**: Use proven patterns (Fabric) as foundation
- **Practicality**: VS Code chat modes are the implementation vehicle
- **Validation**: Excel pilot proves the system works

The better your plan, the smoother the implementation and the more effective the resulting content production system.

---

**Ready to begin planning? Start by studying the Fabric patterns and drafting the first agent specification (Content Strategist).**
