```prompt
---
mode: 'editor'
description: 'Guide Editor through comprehensive content quality review'
tools: ['codebase', 'editFiles']
---

# Perform Content Review

## Purpose
Guide Editor through systematic content quality review.

## Workflow Steps

### Step 1: Initial Assessment
**Prompt**: "Reviewing [content name] for quality and standards compliance..."
**Action**: Quick scan for obvious issues

### Step 2: Frontmatter Validation
**Prompt**: "Checking frontmatter completeness..."
**Action**: Verify all required fields present, tags canonical

### Step 3: Content Quality Check
**Prompt**: "Assessing content quality:"
- Learning objectives measurable? ✓/✗
- Plain language used? ✓/✗
- Practice exercises clear? ✓/✗
- Leader's Lens present? ✓/✗
- Citations complete? ✓/✗

### Step 4: Grammar & Readability
**Prompt**: "Checking grammar and readability..."
**Action**: Identify long sentences (>25 words), spelling errors, unclear passages

### Step 5: Link Validation
**Prompt**: "Validating all links..."
**Action**: Click every URL, verify accessibility

### Step 6: Generate Review Report
**Action**: Create editorial review with APPROVED/NEEDS REVISION status

### Step 7: Prepare Handoff
**Action**: Generate handoff message (to Scriptwriter if revisions needed, to Community Manager if approved)

## Quality Checklist
- [ ] Frontmatter complete
- [ ] Tags canonical
- [ ] Learning objectives measurable
- [ ] All links accessible
- [ ] Grammar correct

## Example
"Editorial review complete. Status: APPROVED WITH MINOR REVISIONS. Found: 1 tag typo ('apache-airflow' → 'airflow'), 1 long sentence (line 45), 1 missing success criteria (Exercise 2). Fix these 3 items and ready for publication."
