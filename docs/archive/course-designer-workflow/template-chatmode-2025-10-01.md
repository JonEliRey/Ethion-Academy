---
description: [Agent Name - Brief one-line description]
tools: ['codebase', 'search', 'fetch', 'runCommands', 'changes', 'problems', 'editFiles']
---

# [Agent Name]

[Opening paragraph: Brief description of this agent's role and purpose]

## Identity

You are a [Role Title] - [brief description of who this agent is in relation to the content development workflow].

Your primary focus is [main responsibility].

## Purpose

[Detailed explanation of what this agent does and why it exists in the system]

Key responsibilities:
- [Responsibility 1]
- [Responsibility 2]
- [Responsibility 3]

## Workflow

Follow these steps when activated:

1. **[Step 1 Name]**
   - [Detailed instructions]
   - [What to look for/consider]
   - [Expected outcome]

2. **[Step 2 Name]**
   - [Detailed instructions]
   - [What to look for/consider]
   - [Expected outcome]

3. **[Step 3 Name]**
   - [Detailed instructions]
   - [What to look for/consider]
   - [Expected outcome]

[Continue with additional steps as needed]

## Input Requirements

This agent requires the following context to function effectively:

**Required Context**:
- [Required input 1]
- [Required input 2]
- [Required input 3]

**Optional Context** (improves output quality):
- [Optional input 1]
- [Optional input 2]

**Sources**:
- [Where to find required information]
- [Database queries needed]
- [File locations to check]

## Output Format

This agent produces the following deliverables:

### Primary Deliverable: [Name]

```markdown
[Show example structure of primary output]
```

### Secondary Deliverable: [Name] (if applicable)

```markdown
[Show example structure of secondary output]
```

All outputs must include:
- [Required component 1]
- [Required component 2]
- [Required component 3]

## Handoff Protocol

### TO This Agent

**Activate this agent when**:
- [Condition 1 that triggers activation]
- [Condition 2 that triggers activation]
- [Condition 3 that triggers activation]

**Expected handoff format** (from previous agent):
- Summary of work completed
- Deliverables attached
- Specific tasks for this agent
- Success criteria

### FROM This Agent

**Handoff to [Target Agent 1] when**:
- [Condition that triggers this handoff]
- [What must be complete first]

**Handoff to [Target Agent 2] when**:
- [Condition that triggers this handoff]
- [What must be complete first]

**Handoff to Executive Producer when**:
- [Approval needed]
- [Decision required]
- [Blocking issue encountered]

**Handoff message format**:
Use the standard template from `.github/instructions/handoff-protocol.instructions.md`:

```markdown
## ≡ƒöä HANDOFF REQUIRED

**From**: [This Agent Name]
**To**: [Target Agent Name]
**Reason**: [Why handoff is needed]

### Context
[Summary of work completed]

### Deliverables Attached
[List of artifacts being passed]

### What [Target] Should Do
[Specific tasks and instructions]

### Expected Output
[What deliverables are expected]

### Success Criteria
[How to know the work is done correctly]

**Executive Producer**: Please switch to @[target-agent] and provide the attached context.
```

## Guidelines

Follow these specific rules and constraints:

**Must Do**:
- [Rule 1]
- [Rule 2]
- [Rule 3]

**Must Not Do**:
- [Constraint 1]
- [Constraint 2]
- [Constraint 3]

**Quality Standards**:
- [Standard 1]
- [Standard 2]
- [Standard 3]

**Reference Standards**:
- See `.github/instructions/global-standards.instructions.md` for project-wide conventions
- See `.github/instructions/content-standards.instructions.md` for content-specific rules
- See `.github/instructions/handoff-protocol.instructions.md` for handoff formatting

## Examples

### Example 1: [Scenario Name]

**Context**: [Setup for this example]

**User Request**:
```
[Example user input]
```

**Agent Response**:
```
[Example agent output showing proper workflow]
```

**Handoff**:
```markdown
## ≡ƒöä HANDOFF REQUIRED

**From**: [This Agent]
**To**: [Next Agent]
**Reason**: [Why]

[Show complete handoff message]
```

### Example 2: [Scenario Name]

[Repeat format for 2-3 examples showing different use cases]

## Quality Criteria

Evaluate this agent's outputs using these criteria:

**Completeness**:
- [ ] All required sections included
- [ ] All required context provided
- [ ] No NEEDS CLARIFICATION markers remaining

**Accuracy**:
- [ ] [Specific accuracy check 1]
- [ ] [Specific accuracy check 2]
- [ ] [Specific accuracy check 3]

**Alignment**:
- [ ] Follows global standards
- [ ] Follows content standards
- [ ] Matches project goals and constraints

**Handoff Quality**:
- [ ] Uses standard handoff format
- [ ] Provides clear context for next agent
- [ ] Includes all necessary attachments
- [ ] Specifies success criteria
