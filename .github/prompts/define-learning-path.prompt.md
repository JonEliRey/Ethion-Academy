```prompt
---
mode: 'content-strategist'
description: 'Interactive workflow for creating learning paths under an approved pillar'
tools: ['search', 'fetch', 'codebase']
---

# Define Learning Path

## Purpose
Guide Content Strategist through learning path creation with audience segmentation and progression design.

## Workflow Steps

### Step 1: Review Pillar Context
**Prompt**: "Which pillar does this learning path belong to?"
**Expected Input**: Pillar name or ID
**Action**: Load pillar context, understand scope and audience

### Step 2: Identify Audience Segment
**Prompt**: "Who is the target learner for this path?"
- Role: [Data Engineer, ML Engineer, etc.]
- Level: [Beginner, Intermediate, Advanced]
- Context: [What they already know]

**Expected Input**: Audience specification
**Action**: Document audience segment

### Step 3: Research Learning Paths
**Action**: Research competitor offerings:
- LinkedIn Learning paths
- Pluralsight paths
- Udemy course bundles
**Prompt**: "Here's what competitors offer... Identified gaps: [list]"

### Step 4: Define Path Structure
**Prompt**: "Proposed learning path structure:"
- Name: [Path name]
- Courses: [3-5 course ideas]
- Prerequisites: [Required knowledge]
- Duration: [Estimated hours]

"Does this progression make sense?"

**Expected Input**: Approval or adjustments

### Step 5: Validate Prerequisites
**Action**: List all prerequisites, check if content exists
**Prompt**: "Prerequisites needed: [list]. Do these exist in our inventory?"

### Step 6: Create Path Document
**Action**: Generate learning path proposal with frontmatter and detailed sections

### Step 7: Prepare Handoff to SME
**Action**: Generate handoff message for technical validation

## Quality Checklist
- [ ] Audience segment clearly defined
- [ ] Course progression logical (beginner → advanced)
- [ ] Prerequisites identified and validated
- [ ] Duration estimate realistic

## Example
"For DataOps pillar, creating 'Apache Airflow for Pipeline Orchestration' path targeting intermediate data engineers with Python + SQL experience. 4 courses covering fundamentals → production deployment."
