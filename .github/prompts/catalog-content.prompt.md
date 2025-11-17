---
agent: 'librarian'
description: 'Guide Librarian through content cataloging and cross-referencing'
tools: ['search/codebase', 'runCommands', 'edit/editFiles']
---

# Catalog Content

## Purpose
Guide Librarian through systematic content cataloging with tagging and cross-referencing.

## Workflow Steps

### Step 1: Receive Content
**Prompt**: "Which content should I catalog? (Provide content item and approval confirmation)"
**Expected Input**: Content file path, approval status
**Action**: Validate status is "approved"

### Step 2: Assign Canonical Tags
**Prompt**: "Assigning tags per taxonomy..."
**Action**: Apply tags from all 6 categories (role, level, topic, format, source_type, tech_stack)
**Prompt**: "Tags assigned: [list]. All canonical values confirmed."

### Step 3: Identify Prerequisites
**Prompt**: "Scanning for prerequisite references..."
**Action**: Extract prerequisites from frontmatter and content
**Prompt**: "Prerequisites identified: [list]. Searching database for matching content..."

### Step 4: Search for Related Content
**Prompt**: "Searching for related content by tags and keywords..."
**Action**: Query database for overlapping tags and topics
**Prompt**: "Found [N] related items: [list]"

### Step 5: Record in Database
**Prompt**: "Recording in database..."
**Action**: Execute INSERT queries with parameterized values
**Prompt**: "✓ Cataloged successfully. Database ID: [id]"

### Step 6: Verify Database Entry
**Prompt**: "Verifying record..."
**Action**: Run SELECT query to confirm entry exists

### Step 7: Generate Inventory Report
**Prompt**: "Generating inventory report..."
**Action**: Create report with tags, prerequisites, related content, database location

### Step 8: Export to JSON
**Action**: Run export script: `pwsh scripts/export-inventory.ps1 -Format Json`
**Prompt**: "✓ Exported to content-inventory/exports/[entity].json"

### Step 9: Prepare Handoff
**Action**: Generate handoff message confirming cataloging complete

## Quality Checklist
- [ ] All tags canonical (no typos)
- [ ] Prerequisites linked (database IDs)
- [ ] Database entry verified (SELECT query)
- [ ] JSON export generated

## Example
"Cataloging 'Apache Airflow Branching' lesson... Tags assigned: role=[data-engineer], level=intermediate, tech_stack=[airflow, python]. Prerequisites linked: lesson-105, lesson-008. Related content: 7 items found. Database ID: lesson-106. ✓ Complete."
