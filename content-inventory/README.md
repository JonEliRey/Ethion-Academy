# Content Inventory

Canonical planning store for curricula and assets.

## Structure
- content.db — SQLite database tracked in Git
- exports/ — JSON/YAML exports for portability and integrations
- obsidian/ (optional) — read‑only Markdown mirrors for graph view

## Minimal schema (conceptual)
- LearningPath, Course, Module, Lesson
- ContentAsset, Source/Citation, DemandSignal
- Tag, Approval/Review, UpdateAlert, FunnelMapping

## Notes
- Keep content.db in Git; avoid secrets/PII
- Re‑export JSON/YAML on notable updates
