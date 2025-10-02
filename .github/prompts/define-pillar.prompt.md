```prompt
---
mode: 'content-strategist'
description: 'Interactive workflow to guide Content Strategist through pillar creation'
tools: ['search', 'fetch', 'codebase']
---

# Define Pillar

## Purpose
Guide Content Strategist through systematic pillar definition with demand analysis and scope boundaries.

## Workflow Steps

### Step 1: Gather Context
**Prompt**: "What technology or domain should this pillar cover? (e.g., DataOps, MLOps, Cloud Architecture)"
**Expected Input**: Topic area
**Action**: Document topic, ask follow-up questions about audience and business goals

### Step 2: Demand Analysis
**Prompt**: "Let me analyze market demand for [topic]. I'll search:"
- Google Trends for search volume
- Job postings requiring [topic] skills
- Community discussions (Reddit, Stack Overflow)
- Competitor offerings (LinkedIn Learning, Udemy)

**Action**: Execute searches, compile evidence (3+ sources with quantitative metrics)

### Step 3: Define Scope
**Prompt**: "Based on demand analysis, I propose this pillar structure:"
- Name: [Pillar name]
- Description: [1-2 sentences]
- Included: [3-7 learning paths]
- Excluded: [Out-of-scope topics]

"Does this align with your vision?"

**Expected Input**: Approval or adjustments
**Action**: Refine scope based on feedback

### Step 4: Identify Sources
**Prompt**: "I'll identify authoritative sources:"
- Official documentation
- Community resources
- Competitor content for gap analysis

**Action**: Compile source list with URLs and access timestamps

### Step 5: Create Pillar Document
**Action**: Generate pillar proposal with:
- YAML frontmatter (name, description, status, approved_at, tags)
- Overview, Scope, Target Audience, Key Outcomes
- Demand Evidence (3+ sources)
- Related Content, Sources

### Step 6: Prepare Handoff
**Action**: Generate handoff message to SME for technical validation
- Include all 9 required components
- Attach pillar proposal document
- Specify validation tasks for SME

## Quality Checklist
- [ ] 3+ demand sources with quantitative metrics
- [ ] Scope boundaries explicit (included vs. excluded)
- [ ] Target audience specified (role × level)
- [ ] Sources cited with URLs and timestamps
- [ ] Handoff message complete

## Common Mistakes to Avoid
- Proposing content without demand evidence
- Scope too broad (trying to cover everything)
- Missing target audience specification
- Vague learning outcomes

## Example Interaction
```
Agent: "What technology or domain should this pillar cover?"
User: "DataOps for data engineering teams"

Agent: "Let me analyze demand for DataOps...
- Google Trends: 'DataOps' search volume up 40% YoY
- Job postings: 1,500+ mentioning Airflow, dbt, data quality
- Reddit r/dataengineering: 200+ posts about pipeline monitoring

Proposed pillar:
Name: DataOps Engineering
Description: Modern data pipeline orchestration, quality assurance, and operational excellence
Included:
- Pipeline Orchestration (Airflow, Dagster)
- Data Testing & Quality (Great Expectations, dbt tests)
- Observability & Monitoring
- CI/CD for Data Pipelines
- Incident Management

Does this align with your vision?"
```
