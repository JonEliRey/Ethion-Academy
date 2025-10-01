# Input vs Output Clarity

This document clarifies what YOU provide TO the plan stage vs. what the plan stage PRODUCES.

---

## ⬇️ INPUT TO Plan Stage (What You Provide)

### Specification & Context
- ✅ **spec.md** - Complete feature specification
- ✅ **CLARIFICATIONS.md** - All Q&A and decisions
- ✅ **META-DEVELOPMENT-SCOPE.md** - Scope understanding
- ✅ **PLAN-STAGE-INPUT.md** - Comprehensive planning guide
- ✅ **Plan-information.md** - Technical capabilities overview

### Reference Materials
- 📚 Daniel Miessler's Fabric patterns (agent inspiration)
- 📚 Awesome Copilot Prompts (prompt engineering)
- 📚 Beastmode chatmode (complex agent example)
- 📚 VS Code Copilot docs (implementation mechanism)

### Requirements & Constraints
- 9 agent personas to design
- VS Code chat modes as implementation
- Manual handoffs via Executive Producer
- SQLite for content tracking
- Sequential agent interaction (no parallel)

---

## ⬆️ OUTPUT FROM Plan Stage (What It Produces)

### 1. Technical Breakdown
**Document**: `plan/technical-breakdown.md`

Content:
- Architecture overview
- Technology choices and rationale
- Design patterns to use
- Implementation approach
- Risk mitigation strategies

---

### 2. Agent Specifications (9 files)
**Documents**: `plan/agents/01-content-strategist.md` through `09-monitoring-specialist.md`

Each agent spec includes:
- Role definition and purpose
- System prompt/instructions (the actual chat mode content)
- Expertise and knowledge domains
- Input requirements
- Output format and deliverables
- Handoff triggers (when to switch TO this agent)
- Handoff targets (when to switch FROM this agent)
- Decision authority
- Example interactions (2-3 scenarios)
- Quality criteria

**Structure** (based on Fabric patterns):
```markdown
# Agent: [Name]

## Identity
[Who this agent is]

## Purpose
[What this agent does and why]

## Steps
1. [What agent does first]
2. [Next step]
3. [Final step]

## Input
[What context agent needs]

## Output
[What agent delivers]

## Handoff Protocol
- TO this agent when: [conditions]
- FROM this agent to: [target agents and conditions]

## Examples
[Sample conversations]

## Quality Criteria
[How to evaluate outputs]
```

---

### 3. Workflow Documentation
**Documents**: `plan/workflows/`

Content:
- **stage-gates.md**: Criteria for each approval gate
- **handoff-protocol.md**: Exact handoff mechanism
- **agent-flow.md**: Narrative description of agent interactions
- **diagrams/**: Visual workflow diagrams

Example workflow diagram:
```
START: Executive Producer
    ↓
Content Strategist (propose pillars)
    ↓
🔄 HANDOFF → SME (validate pillars)
    ↓
🔄 HANDOFF → Executive Producer (approve)
    ↓ (if approved)
Content Strategist (define learning paths)
    ↓
... [continue flow]
```

---

### 4. Database Design
**Documents**: `plan/data/`

Content:
- **schema.sql**: Complete SQLite schema with tables, relationships, indexes
- **er-diagram.md**: Entity-relationship diagram
- **sample-queries.md**: Common queries for operations

Example tables:
```sql
CREATE TABLE pillars (...);
CREATE TABLE learning_paths (...);
CREATE TABLE agent_actions (...);
CREATE TABLE approvals (...);
-- etc.
```

---

### 5. Example Scenarios
**Documents**: `plan/examples/`

Content:
- **scenario-01-create-pillar.md**: Complete conversation from idea to approved pillar
- **scenario-02-rejection-flow.md**: What happens when content is rejected
- **scenario-03-multi-agent-collaboration.md**: Multiple agents working together
- **scenario-04-content-update-alert.md**: Monitoring agent detects update

Each scenario shows:
- Initial state
- Agent-by-agent conversation
- Handoff messages
- Final state
- Artifacts produced

---

### 6. Implementation Roadmap
**Documents**: `plan/implementation/`

Content:
- **roadmap.md**: Overall phases and timeline
- **phase-1-foundation.md**: Foundation agents detailed plan
- **phase-2-production.md**: Production agents detailed plan
- **phase-3-validation.md**: Excel pilot validation plan
- **vscode-config.md**: How to set up chat modes, custom instructions, prompt files

Roadmap structure:
```markdown
## Phase 1: Foundation Agents (Weeks 1-2)
**Goal**: Build agents for Pillars → Learning Paths

**Deliverables**:
- Content Strategist chat mode
- SME chat mode
- Librarian chat mode
- Basic handoff mechanism
- Minimal SQLite schema

**Validation**: Can propose and approve pillars and learning paths

**Success Criteria**:
- [ ] All 3 agents have working chat modes
- [ ] Handoffs are clear
- [ ] Database tracks pillars and paths
```

---

### 7. Testing & Validation Plan
**Documents**: `plan/testing/`

Content:
- **validation-plan.md**: Overall testing approach
- **test-scenarios.md**: Specific tests per phase
- **success-criteria.md**: How to know system is ready

Testing levels:
- **Unit**: Each agent works correctly
- **Integration**: Agents collaborate effectively
- **System**: Complete Excel pilot validates everything

---

### 8. VS Code Configuration Instructions
**Document**: `plan/implementation/vscode-config.md`

Content:
- How to create chat mode files (`.chatmode.md`)
- Where to place them (`.vscode/` directory)
- How to structure custom instructions
- How to create prompt files
- How to test and validate
- Troubleshooting common issues

Example:
```markdown
## Creating a Chat Mode

1. Create file: `.vscode/content-strategist.chatmode.md`
2. Add frontmatter:
   ```yaml
   ---
   name: Content Strategist
   description: Demand analysis and content planning
   tools: [web-search, file-read]
   model: gpt-4
   ---
   ```
3. Add system prompt: [from agent spec]
4. Test: Switch to chat mode in VS Code
```

---

## 🔄 The Flow

```
INPUT (You provide)
    ↓
[PLAN STAGE]
    ↓
OUTPUT (Plan produces)
    ↓
[BUILD STAGE]
    ↓
Working Agent System
```

**Plan Stage transforms**:
- Requirements → Detailed designs
- Concepts → Specifications
- Ideas → Implementation instructions

---

## ✅ Validation

**You know the plan is complete when:**

Someone (including future-you) can:
1. Read the plan documents
2. Understand the architecture
3. Create all 9 chat mode files
4. Set up the database
5. Know exactly how handoffs work
6. Validate the system step-by-step
7. Successfully pilot with Excel path

**No ambiguity. No guessing. Just execute the plan.**

---

## 🎯 Key Principle

**INPUT** = Context, requirements, references, constraints  
**OUTPUT** = Detailed specifications, designs, instructions

The plan stage bridges the gap between "what to build" and "how to build it."

---

**Ready? Your inputs are complete. Time to plan!**
