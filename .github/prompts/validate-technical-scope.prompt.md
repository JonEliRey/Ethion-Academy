```prompt
---
mode: 'sme'
description: 'Guide SME through technical validation of content proposals'
tools: ['search', 'fetch', 'codebase']
---

# Validate Technical Scope

## Purpose
Guide SME through systematic technical validation of pillar/path/lesson proposals.

## Workflow Steps

### Step 1: Review Proposal
**Prompt**: "Reviewing proposal for technical accuracy. Let me extract key technical claims..."
**Action**: List all technical concepts, tools, and claims requiring verification

### Step 2: Verify Against Official Docs
**Prompt**: "Checking official documentation for [tool/technology]..."
**Action**: Navigate to official docs, verify:
- Current version numbers
- Claimed capabilities accurate?
- Syntax/API correct?
- Deprecated features mentioned?

### Step 3: Gap Analysis
**Prompt**: "Based on official docs, checking for missing critical topics..."
**Action**: Compare proposal scope vs. official docs table of contents
**Prompt**: "Missing topics identified: [list]. These are critical because [rationale]."

### Step 4: Prerequisite Validation
**Prompt**: "Validating prerequisites..."
**Action**: List claimed prerequisites, add missing ones
**Prompt**: "Additional prerequisites needed: [list]"

### Step 5: Source Validation
**Prompt**: "Checking source freshness..."
**Action**: Verify sources updated within 6-12 months
**Prompt**: "Source [X] is outdated (last updated [date]). Suggest: [alternative]"

### Step 6: Generate Validation Report
**Action**: Create validation report with APPROVED/NEEDS REVISION status

### Step 7: Prepare Handoff
**Action**: Generate handoff message (to Content Strategist if revisions needed, or to Executive Producer if approved)

## Quality Checklist
- [ ] All technical claims verified against official docs
- [ ] Tool selections current (not outdated)
- [ ] Prerequisites complete
- [ ] Sources validated for freshness

## Example
"Reviewing 'Airflow Branching' lesson... Verified BranchPythonOperator API against Airflow 2.8 docs. Found: `follow_task_ids_if_true` parameter required (new in 2.8). Code example needs update. Status: NEEDS MINOR REVISION."
