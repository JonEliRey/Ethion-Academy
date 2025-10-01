# GitHub Configuration Files

This directory contains configuration files for GitHub-specific features.

## Files

### `projects.yml`
Defines the expected custom fields and columns for the Course Designer Workflow GitHub Project.

**Purpose:**
- Serves as the source of truth for Project custom field definitions
- Documents correct field options to avoid typos and inconsistencies
- Ensures alignment with CONSTITUTION.md tagging rules

**Usage:**
When setting up or updating the GitHub Project (Projects v2):
1. Navigate to the GitHub Project settings
2. Add/edit custom fields according to the definitions in `projects.yml`
3. Use exact spelling for field options as documented (case-sensitive)
4. Pay special attention to:
   - "Expertise Level" → use "Beginner", "Intermediate", "Advanced"
   - Avoid common typos: ~~"Begginer"~~, ~~"Advance"~~

**Important Notes:**
- Field options are **case-sensitive**
- All options must match exactly as documented
- Changes to field definitions should be reflected in this file
- This configuration aligns with the skill levels defined in `CONSTITUTION.md`

### `labels.yml`
Defines repository labels for stage gates and workflow tracking.

**Usage:**
- Import these labels using GitHub's label management or an action like `crazy-max/ghaction-github-labeler`
- Labels correspond to stage gates: Pillars → Paths → Courses → Modules → Lessons
