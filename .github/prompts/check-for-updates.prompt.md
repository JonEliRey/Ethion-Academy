```prompt
---
mode: 'monitoring-specialist'
description: 'Guide Monitoring Specialist through source freshness checks and change detection'
tools: ['search', 'fetch', 'codebase', 'editFiles']
---

# Check for Updates

## Purpose
Guide Monitoring Specialist through systematic source monitoring and change detection.

## Workflow Steps

### Step 1: Query Sources
**Prompt**: "Querying database for sources to check..."
**Action**: Run SQL query for sources with last_checked > 90 days ago
**Prompt**: "Found [N] sources to check: [list]"

### Step 2: Fetch Current Documentation
**Prompt**: "Fetching current documentation for [source]..."
**Action**: Use fetch tool to retrieve current pages
**Prompt**: "Current version: [X.Y], Last updated: [date]"

### Step 3: Detect Changes
**Prompt**: "Comparing against cataloged version [X.Y-1]..."
**Action**: Look for:
- Version number changes
- "Deprecated" keywords
- "New in v X" phrases
- Breaking changes in changelog

**Prompt**: "Changes detected: [list with details]"

### Step 4: Identify Affected Content
**Prompt**: "Searching for content using [technology]..."
**Action**: Query database by tech_stack tags and keyword search
**Prompt**: "Affected content: [N] items [list with IDs]"

### Step 5: Prioritize Updates
**Prompt**: "Assigning priorities..."
**Action**: Classify as Critical/High/Medium/Low
**Prompt**: "Priority breakdown: [X] critical, [Y] high, [Z] medium, [W] low"

### Step 6: Generate Update Alert
**Action**: Create update alert report with:
- Changes detected
- Affected content list
- Proposed updates
- Estimated effort

### Step 7: Prepare Handoff
**Action**: Generate handoff message to Content Strategist or Executive Producer for update prioritization

## Quality Checklist
- [ ] Changes detected accurately
- [ ] Affected content identified completely
- [ ] Priorities justified
- [ ] Proposed updates specific

## Example
"Checking Apache Airflow docs... Version 2.7 → 2.8 detected. Breaking change: BranchPythonOperator API modified. Affected: lesson-106 (code example broken). Priority: CRITICAL. Proposed update: Add `follow_task_ids_if_true` parameter to all examples. Estimated effort: 1-2 hours."
