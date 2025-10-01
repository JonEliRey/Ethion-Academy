# Ethion Academy

A stage‑gated, evidence‑driven workflow to design and publish learning content across YouTube, blogs, and a paid Academy, structured as Learning Paths → Courses → Modules → Lessons.

## What’s in here
- CONSTITUTION.md — minimal rules for hierarchy, tagging, evidence, and Definition of Done
- .github/projects.yml — GitHub Projects custom fields configuration (field definitions and valid options)
- specs/ — feature specifications created via the Specify flow
- content-inventory/ — canonical inventory location (SQLite db + exports)
- seo/ — topic clusters and SEO planning
- docs/ — plans, tests, and reviews per feature/epic

## Quick start
- Read CONSTITUTION.md to understand required structure, tags, and DoD
- Review the feature spec at specs/001-i-need-to/spec.md (Super‑Intelligent Course Designer Workflow)
- Use GitHub Projects and Draft PRs for stage gates (Pillars → Paths → Courses → Modules → Lessons)
- Store canonical planning data in content-inventory/content.db and export JSON/YAML to content-inventory/exports/

## Governance (summary)
- Storage: Git + SQLite (tracked); JSON/YAML exports for portability; optional Obsidian mirrors
- Approvals: Draft PR per stage, labels and required reviewers via GitHub Projects
- Monitoring: Weekly light scans, monthly full review, real‑time alerts; freshness SLA 90/180 days
- Licensing: MIT for code; CC BY 4.0 for public content; CC BY‑NC 4.0 for paid academy content

## Links
- Constitution: ./CONSTITUTION.md
- Primary spec: ./specs/001-i-need-to/spec.md

## Contributing
- Follow stage gates; don’t skip approvals
- Cite official sources; paraphrase and attribute; avoid long quotes
- Keep tags consistent; prefer canonical names
- Update CHANGELOG.md for notable changes
