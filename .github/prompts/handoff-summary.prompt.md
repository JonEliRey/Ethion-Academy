---
mode: 'agent'
description: 'Generate standardized handoff messages following handoff-protocol.instructions.md'
tools: ['codebase']
---

# Handoff Summary

## Purpose
Generate complete handoff messages with all 9 required components.

## Workflow Steps

### Step 1: Gather Handoff Details
**Prompts**:
- "From agent: [Current agent name]"
- "To agent: [Target agent name - use @mention]"
- "Reason: [Why handoff needed]"

### Step 2: Summarize Context
**Prompt**: "Summarize work completed (2-3 paragraphs):"
**Action**: Document decisions made, current state, open questions

### Step 3: List Deliverables
**Prompt**: "What files/documents are being handed off?"
**Action**: List all attachments with brief descriptions

### Step 4: Define Target Tasks
**Prompt**: "What should [target agent] do? (Specific, numbered tasks)"
**Action**: List actionable steps

### Step 5: Specify Expected Output
**Prompt**: "What should [target agent] produce?"
**Action**: Define deliverables or approval status

### Step 6: Define Success Criteria
**Prompt**: "How to verify completion?"
**Action**: List measurable checkboxes

### Step 7: Add Executive Producer Instruction
**Action**: Generate explicit chat mode switch instruction

### Step 8: Generate Complete Message
**Action**: Format handoff message with all 9 components using standard template

## Quality Checklist
- [ ] All 9 components present
- [ ] Context summary comprehensive (2-3 paragraphs)
- [ ] Tasks specific and actionable
- [ ] Success criteria measurable
- [ ] Executive Producer instruction explicit

## Example
"## 🔄 HANDOFF REQUIRED
**From**: Content Strategist
**To**: @sme
**Reason**: Technical validation needed for DataOps pillar

[Context, Deliverables, What SME Should Do, Expected Output, Success Criteria sections follow standard template]

**Executive Producer**: Please switch to `@sme` and provide attached pillar proposal for technical review."
