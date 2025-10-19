---
description: 'Agent constitution for the learning content builder system'
applyTo: '**/*.md, **/*.json, **/*.sql, **/*.ps1, **/*.chatmode.md, **/*.prompt.md'
---

# Agent Constitution: Learning Content Builder

_Last updated: 2025-10-01_

## 1. Purpose
Define the minimum rules, structure, and expected outputs for the agent-based workflow that builds high-quality learning content from public sources and real learner demand.

## 2. Scope
- **Domains**: Any technical or non-technical subject
- **Sources**: Official documentation, reputable blogs, YouTube channels, release notes, standards, high-signal community threads
- **Audience**: Learners and instructors across multiple roles and skill levels

## 3. Core Principles
- **Evidence-driven**: Support every topic with cited sources or clear demand signals
- **Learner-centered**: Prioritize common pain points and search intent from communities
- **Minimal duplication**: Reuse and consolidate overlapping topics; avoid redundancy
- **Transparency**: Maintain citations, timestamps, and extraction notes
- **Compliance**: Respect copyright, paraphrase when possible, attribute sources
- **Quality bar**: Objectives must be testable, prerequisites explicit, tags consistent

## 4. Allowed Inputs
- Official docs, blogs, changelogs, standards, and official YouTube channels
- Credible community sources (e.g., SQL.BI, PowerBI.Tips, GuyInACube)
- Q/A forums and boards with active learner demand (Reddit, Stack Overflow, product forums)
- When sources conflict, prefer the latest official guidance

## 5. Required Outputs
- Hierarchical plan: Learning Paths → Courses → Modules → Lessons
- Complete tagging across all levels for discovery
- Machine-readable export (JSON/YAML) plus human-readable summary
- Complete citations with rationale and freshness timestamps

## 6. Repository & Workflow Governance
- Repository: `https://github.com/JonEliRey/Ethion-Academy`
- Primary branch: `main`
- Stage order: Pillar → Path → Course → Module → Lesson
- Maintain `CHANGELOG.md` with rationale and evidence links for major updates
- Commit frequently with clear messages; adhere to protected branch policies

## 7. Knowledge Hierarchy Requirements
1. **Learning Path**: title, description, audience, prerequisites, estimated duration, tags
2. **Course**: title, outcome, prerequisites, assessment approach, duration, tags
3. **Module**: title, description, prerequisites, duration, tags
4. **Lesson**: title, measurable objectives, prerequisites, duration, outline, practice, key terms, citations, tags, "Leader’s Lens" (business value, decision/trade-offs, risks/assumptions, KPIs)

## 8. Tagging Rules
- Required tag groups: topic, skill level (Beginner/Intermediate/Advanced), audience role, format hints, source types, tech/stack, prerequisite flags
- Hygiene: use singular nouns, canonical names, ≤12 tags per item, include aliases in metadata when helpful

## 9. Audience & Leader’s Lens Guidance
- Segment audience by role × level 
    - initial focus: 
        -Data/Business Analyst
        - Software/Automation Engineer
        - Data Modeler
        - Power BI Developer
        - Manager/Leader
    - Levels: Beginner, Intermediate, Advanced
        - Defined levels based on topics covered and how they are categorized in reference sources
- Every content item declares its target segments and prerequisites
- Each lesson includes a 90–150 word Leader’s Lens for non-technical stakeholders
- Every lesson intertwines practical skills with other relevant skills for example
    - data governance
    - security
    - Data literacy
    - Data Driven culture
    - best practices

## 10. Evidence & Citation Standards
- Track URL, title, creator, platform, published/updated date, access timestamp, and rationale
- Limit direct quotes; rely on paraphrasing with citations
- Resolve conflicting sources with official guidance; note discrepancies

## 11. Minimal Workflow
1. **Discover** high-signal sources
2. **Extract** topics, prerequisites, questions, tasks
3. **Normalize & dedupe** into canonical topics
4. **Prioritize** by demand, relevance, dependencies
5. **Plan** hierarchy in order (Learning Path → Lesson)
6. **Tag** using required schema
7. **Cite** every topic with rationale
8. **Output** machine-readable + narrative summaries

## 12. Metadata Schema (Minimum)
- LearningPath: `{ id, title, description, audience, prerequisites[], duration.totalHours, tags[], courses[] }`
- Course: `{ id, title, outcome, prerequisites[], duration.hours, assessment, tags[], modules[] }`
- Module: `{ id, title, description, prerequisites[], duration.hours, tags[], lessons[] }`
- Lesson: `{ id, title, objectives[], prerequisites[], duration.minutes, outline[], practice, keyTerms[], tags[], citations[], leadersLens { summary, decisions, risks, kpis } }`
- Citation: `{ url, title, sourceType, authorOrChannel, platform, publishedAt?, updatedAt?, accessedAt, rationale }`
- TopicAlias (optional): `{ canonical, aliases[] }`

## 13. Storage & Exports
- Canonical inventory: SQLite database at `content-inventory/content.db`
- Exports: JSON/YAML under `content-inventory/exports/`
- Optional Markdown mirrors for Obsidian under `content-inventory/obsidian/`

## 14. Constraints
- Uphold factual accuracy and non-harmful content
- Write in plain language with accessibility in mind (include alt-text guidance)
- Note region-specific considerations explicitly

## 15. Monitoring & Freshness
- Cadence: weekly light scan, monthly comprehensive review, near real-time alerts from official feeds
- Freshness SLA: fast-changing stacks ≥ every 90 days; slower content ≥ every 180 days; breaches auto-create review tickets

## 16. SEO Strategy
- Maintain `seo/clusters.yaml` linking topic clusters to pillars/paths
- Each public asset brief lists 3–10 keywords, owning cluster, funnel intent; refresh clusters quarterly

## 17. Licensing
- Code/scripts/schemas/templates: MIT
- Public (blog/YouTube) content: CC BY 4.0
- Paid academy content: CC BY-NC 4.0
- Always paraphrase and cite sources; fair-use quotes only

## 18. Definition of Done
- Learning path contains ≥1 course; course contains ≥1 module; module contains ≥1 lesson
- 100% of items complete required fields and tags
- Each lesson provides practice and ≥1 citation
- All claims backed by citations or demand signals
- Exports validate against schema keys above

## 19. Change Management
- Log every revision in `CHANGELOG.md`
- Re-run dedupe/tag hygiene when adding content
- Follow stage progression strictly: Pillar → Path → Course → Module → Lesson
