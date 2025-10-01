# Agent Constitution: Learning Content Builder (Minimal)

Last updated: 2025-10-01

## Purpose
Define the minimum rules, structure, and outputs for an agent-based workflow that builds high-quality learning content from public sources and real learner demand.

## Scope
- Domains: Any technical or non-technical subject.
- Sources: Official documentation, reputable blogs, YouTube videos, Reddit threads, Q/A forums, release notes, standards.
- Audience: Learners and instructors.

## Core Principles
- Evidence-driven: Every topic/need must be supported by at least cited source or observed demand signal.
- Learner-centered: Prioritize common pain points and search intent from communities.
- Minimal duplication: Reuse and consolidate overlapping topics; avoid redundancy.
- Transparency: Keep citations, timestamps, and extraction notes.
- Compliance: Do not reproduce copyrighted content beyond fair use; attribute sources; prefer paraphrasing and linking.
- Quality bar: Objectives must be testable; prerequisites explicit; tags consistent.

## Allowed Inputs
- For knowledge source: Links and text from: official docs, Official blogs, changelogs, standards, official YouTube channels, highly credible third party sources
- For topics of interest look at board and forumn where users try to get their questions answer. for example Reddit, Q/A (e.g., Stack Overflow), google, Official forums (e.g. for Power BI there's https://community.fabric.microsoft.com/t5/Service/bd-p/power-bi-web-app).
- If there's conflicting information, in official documentation, prioritize the most recent information.
- Demand signals: frequent questions, upvoted threads, high-retention videos, search terms.

## Required Outputs
- Structured learning plan organized strictly as: Learning Paths > Courses > Modules > Lessons.
- Tags across all levels for fast discovery.
- Machine-readable export (JSON or YAML) plus a human-readable summary.
- Complete citations for each included topic or demand signal.

## Repository & Workflow (Governance)
- Repository: https://github.com/JonEliRey/Ethion-Academy
- Primary branch: main
- Work stages: Pillar → Path → Course → Module → Lesson (create content in this order)
- Change tracking: maintain CHANGELOG.md; summarize rationale and links to evidence for notable changes.
- Version control: use Git for all content; commit frequently with clear messages.

## Knowledge Organization (Hierarchy)
1) Learning Path
- Goal: Multi-course journey to a role or competency.
- Must include: title, description, audience, prerequisites (global), estimated total duration, tags.

2) Course
- Goal: End-to-end outcome within the path.
- Must include: title, outcome, prerequisites, assessment strategy, duration, tags.

3) Module
- Goal: Coherent cluster of lessons.
- Must include: title, description, prerequisites, duration, tags.

4) Lesson
- Goal: Smallest teachable unit.
- Must include: title, learning objectives (measurable), prerequisites, duration, content outline, key terms, practice/task, references/citations, tags, and a concise “Leader’s Lens” (business value, decisions/trade‑offs, risks/assumptions, KPIs/OKRs).

## Tagging Rules (apply at every level)
- Required tag groups:
  - Topic tags: core subject concepts (e.g., "REST", "Async/Await").
  - Skill level: one of ["Beginner", "Intermediate", "Advanced"].
  - Audience/role: e.g., "Student", "Junior Dev", "Data Analyst".
  - Format hints: e.g., "Hands-on", "Theory", "Project".
  - Source types present: any of ["Docs", "YouTube", "Reddit", "Blog", "Q/A", "Spec"].
  - Tech/stack: products, frameworks, languages (normalized names).
  - Prereq flags: e.g., "Math", "Linux Basics", "Git Basics".
- Tag hygiene:
  - Use singular nouns where possible.
  - Prefer canonical names (e.g., "JavaScript" not "JS" unless both are commonly searched; include alias in metadata if helpful).
  - Max 12 tags per item; prioritize specificity over breadth.

## Audience & Leader’s Lens
- Audience segmentation uses a hybrid matrix: role × level. Initial priority segments:
  1) Data/Business Analyst — Beginner
  2) Software/Automation Engineer — Intermediate
  3) Manager/Leader — Intermediate (next planned)
- Each item (path/course/module/lesson) MUST declare target segment(s) and prerequisites.
- Each lesson MUST include a “Leader’s Lens” callout (90–150 words) written for non‑technical stakeholders.

## Evidence & Citations
- Every topic, pain point, or claim includes:
  - URL (or source identifier), title, author/channel, platform, publication/last-updated date, access timestamp.
  - Rationale: 1–3 sentences linking the evidence to learner need.
- Direct quotations limited and clearly marked; otherwise paraphrase with citation.

## Minimal Workflow
1) Discover
- Gather recent, high-signal sources across allowed platforms for the target subject.

2) Extract
- From sources, extract: topics, prerequisites, frequent questions, misconceptions, tasks people try to accomplish.

3) Normalize & Dedupe
- Merge synonyms; map to canonical topics; remove duplicates.

4) Prioritize
- Rank by demand signal (recurrence, engagement), relevance to competencies, and prerequisite dependencies.

5) Plan
- Build hierarchy strictly in order: Learning Path → Courses → Modules → Lessons.
- Ensure each lesson has measurable objectives and practice.

6) Tag
- Apply required tag groups consistently at all levels.

7) Cite
- Attach citations and rationales to each relevant item.

8) Output
- Generate machine-readable (JSON/YAML) and a short human-readable summary.

## Minimal Metadata Schema
- LearningPath: { id, title, description, audience, prerequisites[], duration.totalHours, tags[], courses[] }
- Course: { id, title, outcome, prerequisites[], duration.hours, assessment, tags[], modules[] }
- Module: { id, title, description, prerequisites[], duration.hours, tags[], lessons[] }
- Lesson: { id, title, objectives[], prerequisites[], duration.minutes, outline[], practice, keyTerms[], tags[], citations[], leadersLens: { summary, decisions, risks, kpis } }
- Citation: { url, title, sourceType, authorOrChannel, platform, publishedAt?, updatedAt?, accessedAt, rationale }
- TopicAlias (optional global): { canonical, aliases[] }

## Storage & Exports
- Canonical inventory: SQLite database committed to Git at `content-inventory/content.db`.
- Exports: machine-readable JSON/YAML under `content-inventory/exports/` for portability/integrations.
- Optional: read‑only Markdown mirrors under `content-inventory/obsidian/` for Obsidian graph view.

## Constraints
- Factuality: Prefer primary/official sources for definitions and APIs.
- Non-harmful content only; exclude illegal or unethical material.
- Accessibility: write plain language; include alt-text guidance when producing assets.
- Regional neutrality; call out region-specific details when necessary.

## Monitoring & Freshness
- Cadence: weekly light scan (official sources + key community), monthly comprehensive review, and near‑real‑time alerts from official feeds.
- Freshness SLA: fast‑changing stacks reviewed ≥ every 90 days; slower‑changing content ≥ every 180 days. Breaches auto-create review tickets.

## SEO Strategy
- Maintain topic clusters and pillar pages mapped to pillars/learning paths in `seo/clusters.yaml`.
- Each public asset brief lists 3–10 primary/secondary keywords, owning cluster, and funnel intent; clusters are re‑evaluated quarterly.

## Licensing
- Code/scripts/schemas/templates: MIT License (see LICENSE).
- Public content (blog/YouTube): CC BY 4.0.
- Paid academy content: CC BY‑NC 4.0.
- Always paraphrase and cite third‑party sources; limit direct quotes to fair‑use excerpts.

## Definition of Done (DoD)
- A learning path exists with at least one course; each course has ≥1 module; each module has ≥1 lesson.
- 100% of items include required fields and tags; no empty titles or objectives.
- All lessons include at least one practice/task and ≥1 citation.
- All claims/topics have supporting citations or demand signals.
- Machine-readable export validates against the metadata schema keys above.

## Change Management
- Keep a changelog entry per revision (what changed and why).
- Re-run dedupe and tag hygiene when adding new content.
- Review content progression: start with Pillars, get alignment, then move to Paths → Courses → Modules → Lessons.

