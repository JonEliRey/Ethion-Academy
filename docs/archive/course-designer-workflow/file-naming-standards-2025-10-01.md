# File Naming Standards (Superseded)

**Date**: October 1, 2025  
**Feature**: Super-Intelligent Course Designer Workflow  
**Branch**: `001-i-need-to`

> **Status**: Archived. Superseded by `docs/001-i-need-to/plan/validation-checklist.md` and `docs/001-i-need-to/plan/agents/` guidance, as well as repository-wide naming conventions.

## Original Guidance

### General Format
- Files followed the pattern: `{stage}-{artifact}-{descriptor}.md`
- Examples: `PILLAR-plan.md`, `MODULE-outline.md`

### Metadata
- Required YAML frontmatter with:
  - `title`
  - `description`
  - `stage`
  - `owner`
  - `status`

### Directory Structure
- `pillars/`
- `learning-paths/`
- `courses/`
- `modules/`
- `lessons/`

## Updated Approach
- Naming is now driven by the general markdown standards captured in `docs/001-i-need-to/governance/` and validated via the defined stage-gate checklist.
- Artifact naming focuses on clarity for agent prompts, handoffs, and archival tracking rather than production content.

## Reference
- Current standards: 
  - `docs/001-i-need-to/plan/validation-checklist.md`
  - `docs/.github/instructions/global-standards.instructions.md`
