# Handoff Protocol Guide

## Overview
This document specifies the standard format for agent-to-agent handoffs in the Super-Intelligent Course Designer system. All handoffs must follow this protocol to ensure clear context passing and smooth workflow transitions.

## 9 Required Components

Every handoff message MUST include ALL of these components:

### 1. From Agent
Source agent name initiating the handoff.
**Example**: `**From**: Content Strategist`

### 2. To Agent  
Target agent name with `@mention` syntax for VS Code chat.
**Example**: `**To**: @sme`

### 3. Reason
One-sentence explanation of why handoff is needed.
**Example**: `**Reason**: Technical validation needed for proposed DataOps pillar scope`

### 4. Context Summary
2-4 paragraphs explaining:
- Work completed so far
- Key decisions made
- Current state of deliverables
- Open questions or concerns

### 5. Deliverables Attached
List of files, links, or content being passed to target agent.
**Example**:
- `pillar-dataops-engineering-draft.md` - Pillar proposal
- Demand analysis spreadsheet
- Market research notes

### 6. What Target Should Do
Specific, actionable tasks for receiving agent (numbered list).
**Example**:
1. Validate technical accuracy of proposed scope
2. Identify prerequisites
3. Suggest authoritative sources
4. Flag missing critical topics

### 7. Expected Output
Clear description of what target agent should produce.
**Example**: **Approved scope** with prerequisites identified OR **Feedback for revision** with specific concerns

### 8. Success Criteria
Measurable indicators of successful completion (use checkboxes).
**Example**:
- [ ] All technical concepts accurately described
- [ ] Prerequisites correctly sequenced
- [ ] Sources current and authoritative

### 9. Executive Producer Instruction
Explicit instruction for human to switch chat modes.
**Example**: `**Executive Producer**: Please switch to @sme and provide attached proposal for technical review.`

---

## Handoff Message Template

```markdown
## 🔄 HANDOFF REQUIRED

**From**: [Source Agent Name]
**To**: @[target-agent-name]
**Reason**: [Why this handoff is needed - 1 sentence]

### Context
[2-4 paragraphs summarizing work completed, decisions made, current state, open questions]

### Deliverables Attached
- [File 1] - [Description]
- [File 2] - [Description]

### What [Target] Should Do
1. [Specific task 1]
2. [Specific task 2]
3. [Specific task 3]

### Expected Output
- [Deliverable 1] OR [Alternative outcome]
- [Deliverable 2] if [condition]

### Success Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

**Executive Producer**: Please switch to @[target] and provide [deliverables] for [action].
```

---

## Valid State Transitions

### Common Sequences
1. **Content Strategist → SME → Executive Producer → Librarian**
   (Pillar proposal → Validation → Approval → Cataloging)

2. **Scriptwriter → Editor → Community Manager → SEO Lead → QA Reviewer → Executive Producer**
   (Lesson creation → Quality → Engagement → Discovery → Final gate → Approval)

3. **Monitoring Specialist → Content Strategist → SME → Scriptwriter**
   (Update detected → Scope revised → Validated → Content updated)

### Forbidden Transitions
- ❌ Librarian → Content Strategist (Librarian doesn't propose content)
- ❌ Community Manager → SME (Skip validation step)
- ❌ Circular loops without resolution (detect and escalate to human)

---

## Return-to-Human Conditions

Agents should hand back to Executive Producer when:

1. **Ambiguity Requiring Judgment**: Decision needs human context
2. **Approval Checkpoint**: Deliverable requires executive decision
3. **Error Condition**: Technical blocker requiring intervention
4. **Explicit Feedback Request**: Agent needs human review before proceeding

---

## Quality Gates

Before ANY handoff, source agent must verify:
- [ ] All deliverables mentioned are attached/accessible
- [ ] Context summary is complete (no ambiguous references)
- [ ] Tasks for target agent are specific and actionable
- [ ] Success criteria are measurable
- [ ] Source agent completed ALL tasks within their domain

---

## Example Handoff: Pillar Approval

```markdown
## 🔄 HANDOFF REQUIRED

**From**: Content Strategist
**To**: @sme
**Reason**: Technical validation needed for "Machine Learning Operations" pillar

### Context
Completed demand analysis for MLOps pillar targeting ML Engineers and Data Scientists. Market signals show strong demand:
- 1,800+ job postings requiring MLOps skills
- 65% YoY growth in "MLOps" search volume
- 2 industry reports rank MLOps as critical 2025 skill

Proposed scope includes 5 learning paths:
1. Model Lifecycle Management (MLflow, Weights & Biases)
2. Model Deployment Patterns
3. Model Monitoring & Observability
4. ML Pipelines
5. Feature Stores

Target audience: ML Engineers (Intermediate to Advanced)

### Deliverables Attached
- `pillar-mlops-draft.md` - Full pillar proposal
- Demand analysis spreadsheet (1,800 job postings)
- Competitive analysis (Coursera/Udemy courses reviewed)

### What SME Should Do
1. Validate technical accuracy of 5 learning path topics
2. Verify tool selections are current standards (MLflow vs alternatives?)
3. Identify prerequisites for each path
4. Suggest 2-3 authoritative sources per path
5. Flag missing critical topics

### Expected Output
- **Approved scope** with prerequisites mapped and sources listed OR
- **Feedback for revision** with specific technical concerns

If approved: Recommend which learning path to prioritize first

### Success Criteria
- [ ] All 5 learning path topics technically accurate
- [ ] Tool selections align with 2024-2025 trends
- [ ] Prerequisites correctly sequenced
- [ ] Sources current (updated within 12 months)
- [ ] Critical missing topics identified (if any)

**Executive Producer**: Please switch to `@sme` and provide attached `pillar-mlops-draft.md` for technical review.
```

---

*Reference*: See `.github/instructions/handoff-protocol.instructions.md` for authoritative specification
