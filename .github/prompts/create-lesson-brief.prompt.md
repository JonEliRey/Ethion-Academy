---
agent: 'content-strategist'
description: 'Guide Scriptwriter through creating comprehensive lesson outlines and briefs'
tools: ['search', 'fetch', 'codebase', 'editFiles']
---

# Create Lesson Brief

## Purpose
Guide Scriptwriter through lesson outline, video brief, and blog brief creation.

## Workflow Steps

### Step 1: Review Approved Scope
**Prompt**: "Which lesson should I create? (Provide module context and lesson topic)"
**Expected Input**: Module ID, lesson topic, target audience
**Action**: Document context, extract key technical concepts

### Step 2: Research Topic
**Prompt**: "Researching [topic]... Checking:"
- Official documentation
- GitHub code examples
- Stack Overflow common questions

**Action**: Compile research notes

### Step 3: Draft Learning Objectives
**Prompt**: "Proposed learning objectives (3-5 measurable outcomes):"
- [Objective 1 with action verb]
- [Objective 2 with action verb]

"Do these align with expected outcomes?"

### Step 4: Create Lesson Outline
**Action**: Generate detailed lesson outline:
- Section breakdown with timing
- Key points per section
- Practice exercises with scenarios

### Step 5: Create Video Brief
**Action**: Generate YouTube video plan:
- Optimized title
- Compelling hook (first 30s)
- Timestamped outline
- Key visuals needed
- Platform-specific CTAs

### Step 6: Create Blog Brief
**Action**: Generate blog post structure:
- SEO-optimized title
- 150-word summary
- H2/H3 outline
- Keywords
- CTAs aligned to funnel

### Step 7: Add Leader's Lens
**Prompt**: "Adding business context..."
**Action**: Frame technical content in business outcomes, KPIs, decision criteria

### Step 8: Prepare Handoff to Editor
**Action**: Generate handoff message with all briefs attached

## Quality Checklist
- [ ] 3-5 measurable learning objectives
- [ ] Practice exercises include scenarios and success criteria
- [ ] Video timing realistic (25-30 min typical)
- [ ] Leader's Lens connects to business value
- [ ] All citations complete

## Example
"Creating lesson 'Airflow Branching with BranchPythonOperator'...
Objectives: 1) Configure BranchPythonOperator for conditional routing, 2) Implement error handling patterns
Practice: Build self-healing pipeline with 3 branching scenarios
Leader's Lens: Reduces on-call burden by 40%"
