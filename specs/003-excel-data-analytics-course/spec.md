# Feature Specification: Excel Data Analytics Course

**Feature Branch**: `feature/003-excel-data-analytics-course`  
**Created**: 2025-11-16  
**Status**: Draft  
**Input**: Executive Producer request to accelerate production of a YouTube-first "Excel Data Analytics" course that upgrades Excel users through Power Query and Power Pivot. The course must: (1) deliver tightly sequenced lessons (8–15 minutes each), (2) emphasize reusable automation workflows over manual Excel habits, (3) rely on the World Wide Importers (WWI) sample database packaged via GitHub, and (4) culminate in a capstone where learners ingest multi-source data, model it, and publish refreshed insights without repetitive work. Learners self-assess (no graded quizzes) but receive a guided capstone to validate mastery.

## Execution Flow (course planning scope)

```text
1. Validate scope against pillar "Microsoft Data Analytics Journey"
2. Define learning path outcomes and success metrics
3. Break course into modules that map to incremental Excel -> PQ -> PP skill gains
4. Design lessons per module (8–15 min) with scripts, datasets, and reuse of prior artifacts
5. Specify WWI dataset packaging + GitHub handoff + YouTube publishing readiness
6. Document capstone brief and self-assessment rubric
7. Prepare SME handoff bundle + Executive Producer review package
```

---

## ⚡ Quick Guidelines

- Focus on how Excel analysts progress from spreadsheet cleanup to semi-automated analytics without leaving Excel.
- Every lesson must re-use a prior workbook or dataflow to reinforce cumulative learning.
- Keep instructions tooling-agnostic except for Microsoft Excel, Power Query, Power Pivot, and WWI sample data.
- Treat YouTube as primary delivery; GitHub houses datasets, practice files, and capstone rubric.

---

## User Scenarios & Testing *(mandatory)*

### Primary User Story

As an Excel-centric analyst, I need a structured path that teaches me how to modernize my workflows with Power Query and Power Pivot so that I can ingest external data, automate cleanup, build reusable data models, and deliver refreshed insights quickly—all while staying in Excel. The path must be broken into short, bingeable lessons I can follow in order, each with linked materials and a final capstone to validate mastery.

### Acceptance Scenarios

1. **Given** the learner opens the course overview, **When** they scan outcomes, prerequisites, and run time, **Then** they can confirm it aligns with their Power Query/Power Pivot goals and time constraints.
2. **Given** a learner completes Module 1 assets, **When** they progress to Module 2, **Then** prior workbooks/dataflows are referenced so they can continue without rework.
3. **Given** a lesson video (8–15 min) is published, **When** the learner checks GitHub, **Then** the referenced WWI dataset extracts, scripts, and practice instructions are downloadable in matching directories.
4. **Given** the learner reaches the capstone, **When** they follow the rubric, **Then** they can ingest multiple WWI sources, transform them with Power Query, model them in Power Pivot, and refresh insights without manual rebuild.
5. **Given** future SME review, **When** the curriculum is inspected, **Then** each module clearly states objectives, lesson runtimes, dataset dependencies, and cumulative artifacts.

### Edge Cases

- Learner skips modules: ensure recap/links highlight prerequisites and guard against confusion.
- WWI dataset updates: provide checksum/versioning so instructions still match.
- YouTube runtime variance: if a lesson recording exceeds 15 minutes, note any split or bonus segment to preserve pacing.
- Learners without Power Pivot enabled: document activation steps or alternatives at the start of the course.

---

## Requirements *(mandatory)*

### Functional Requirements

- **FR-101**: Provide a single course file (frontmatter-compliant) under the existing pillar that states outcomes, prerequisites, and YouTube/GitHub delivery notes for the Excel Data Analytics journey.
- **FR-102**: Break the course into 5 modules that progressively cover Excel readiness, Power Query ingestion, Power Query transformations/automation, Power Pivot modeling, and an end-to-end capstone/readiness sprint.
- **FR-103**: Each module must define 3–4 lessons with runtime targets (8–15 min), objectives, leader-facing value statements, and explicit re-use of prior workbook artifacts.
- **FR-104**: All lessons must rely on World Wide Importers sample data (CSV extracts, SQL backup, or API) hosted in GitHub with instructions for downloading and refreshing locally.
- **FR-105**: Deliver a capstone blueprint that references at least two data sources (e.g., Sales + Purchasing) from WWI, requires Power Query transformations, Power Pivot relationships/measures, and ends with a refreshed Excel report.
- **FR-106**: Document a self-assessment rubric for the capstone since there is no automated grading. Include criteria for data ingestion accuracy, transformation completeness, model quality, and refresh automation.
- **FR-107**: Provide a release plan describing how YouTube videos, GitHub assets, and README files stay in sync (e.g., version tags, playlist order, asset directories).
- **FR-108**: Capture dataset licensing and redistribution notes to ensure WWI assets are safely provided to learners via GitHub.
- **FR-109**: Outline SME validation checkpoints (Power Query specialist, Power Pivot specialist) and Executive Producer approval gates prior to recording.
- **FR-110**: Ensure the course plan is expandable so a future Power BI path can reference the same Excel artifacts without rework (document cross-path hooks).

### Non-Functional Requirements

- **NFR-101**: Maintain lesson pacing (8–15 min) with notes if content pressure risks longer runtime; propose splits when needed.
- **NFR-102**: All documentation must follow `.github/instructions/global.instructions.md` (kebab-case naming, README hierarchy) and `.github/instructions/content.instructions.md` frontmatter requirements.
- **NFR-103**: Provide clear guidance for YouTube production quality (audio baseline, screen capture resolution) so recordings feel professional yet approachable.
- **NFR-104**: Reference official Microsoft Learn/Docs links for Power Query, Power Pivot, and WWI to ensure content credibility.

---

## Key Entities

- **Course**: "Excel Data Analytics" course definition inside the Microsoft Data Analytics pillar.
- **Module**: Content clusters (e.g., Excel Foundations for Modern Analytics, Power Query Automation).
- **Lesson**: Short-format videos with supporting GitHub assets.
- **Dataset Package**: WWI extracts, SQL backups, and workbook templates used throughout.
- **Capstone Rubric**: Self-directed assessment instructions with criteria and submission guidance (if learners share results).
- **Release Plan**: Mapping between GitHub directories, lesson numbers, and YouTube playlist order.

---

## Review & Acceptance Checklist

- [ ] Course objectives align with pillar goals and user persona needs.
- [ ] Modules build sequentially with explicit dependency notes.
- [ ] WWI dataset packaging and licensing guidance documented.
- [ ] Capstone blueprint and rubric drafted and peer-reviewed.
- [ ] Release/approval workflow defined (SME + Executive Producer).
- [ ] Cross-path hooks to future Power BI content captured.

---
