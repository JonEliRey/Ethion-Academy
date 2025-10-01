# Feature Specification: Super-Intelligent Course Designer Workflow

**Feature Branch**: `001-i-need-to`  
**Created**: 2025-09-26  
**Status**: Draft  
**Input**: User description: "I need to create the super intelligent course designer workflow to build content for YouTube and Paid Learning Academy, in a strategic manner. Production shoud be in stages, starting from a high level pillars and discussing wiht the user to ensure alignment, before moving to the next level of detail. This shoudl fuction as a true learning development agency with multiple personas envolve.And the human as the Executive producer.

 The goal is that content woudl be produce for YouTube, blogs and eventually lead to paid subscribers. Youtube and blogs would serve as the start of a sales funnel which woudl eventually drive users to join the subcribtion portal. The structure of the content should be similar to what is done in other learning portals, for exampl:  modules, courses and learning paths, as done in LinkedIn Learning. This content should be highly relevant and up-to-date, about the current state of the tools as well as design the best learning experience for the users.

This course designer workflow should be able to help me build content that is well structure, and highly relevant to users. Also, as we produce subsquent content it shoudl help me keep track of what has been produce and refer to those items when necessary in future lessons. Additionally, it shoudl help me highlight when part of the content needs update due to updated tools or documentation.

Additionally, I would like the workflow to also help me produce content the distills the publication from official sites so I can explain it to the audience in simple terms and give them an idean of how this iterms apply to them. Thus making it simple for them to understand subjects that may be too complex and/or help them visualize (imagine) how this could help them."

## Execution Flow (main)
```
1. Parse user description from Input
   → If empty: ERROR "No feature description provided"
2. Extract key concepts from description
   → Identify: actors, actions, data, constraints
3. For each unclear aspect:
   → Mark with [NEEDS CLARIFICATION: specific question]
4. Fill User Scenarios & Testing section
   → If no clear user flow: ERROR "Cannot determine user scenarios"
5. Generate Functional Requirements
   → Each requirement must be testable
   → Mark ambiguous requirements
6. Identify Key Entities (if data involved)
7. Run Review Checklist
   → If any [NEEDS CLARIFICATION]: WARN "Spec has uncertainties"
   → If implementation details found: ERROR "Remove tech details"
8. Return: SUCCESS (spec ready for planning)
```

---

## ⚡ Quick Guidelines
- ✅ Focus on WHAT users need and WHY
- ❌ Avoid HOW to implement (no tech stack, APIs, code structure)
- 👥 Written for business stakeholders, not developers

### Section Requirements
- **Mandatory sections**: Must be completed for every feature
- **Optional sections**: Include only when relevant to the feature
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation
When creating this spec from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question] for any assumption you'd need to make
2. **Don't guess**: If the prompt doesn't specify something (e.g., "login system" without auth method), mark it
3. **Think like a tester**: Every vague requirement should fail the "testable and unambiguous" checklist item
4. **Common underspecified areas**:
   - User types and permissions
   - Data retention/deletion policies  
   - Performance targets and scale
   - Error handling behaviors
   - Integration requirements
   - Security/compliance needs

---

## User Scenarios & Testing *(mandatory)*

### Primary User Story
As the Executive Producer, I want an agency-style, stage-gated workflow that collaborates with multiple personas to define high-level content pillars, then progressively elaborates into Learning Paths → Courses → Modules → Lessons, producing aligned YouTube and blog assets that drive a funnel toward a paid subscription academy while staying current with tooling and community demand.

### Acceptance Scenarios
1. **Given** a new initiative with broad goals, **When** the workflow proposes 3–7 high-level pillars and requests approval, **Then** the Executive Producer can approve/revise pillars before any deeper planning proceeds.
2. **Given** approved pillars, **When** the workflow drafts Learning Paths with course outlines and module themes, **Then** it pauses for approval and rationalizes each item with demand signals and citations.
3. **Given** approved paths/courses, **When** the workflow generates module lesson outlines plus YouTube video briefs and blog post briefs mapped to the funnel, **Then** each asset includes objectives, audiences, tags, and CTAs to the paid academy.
4. **Given** an official product update, **When** monitored sources indicate changes, **Then** the workflow flags affected lessons/assets, proposes updates, and references impacted sections.
5. **Given** previously produced content, **When** planning new lessons, **Then** the workflow cross-references existing assets and proposes reuse/links to avoid duplication and improve continuity.
6. **Given** any lesson outline, **When** the workflow finalizes lesson details, **Then** it includes a concise “Leader’s Lens” callout covering business outcome, decision criteria, risks/assumptions, and KPIs/measurement, written in plain language.
7. **Given** generated curriculum items (path, course, module, lesson), **When** reviewing their metadata, **Then** each declares its target audience segment (role × level) and prerequisite guidance, and aligns tags accordingly.

### Edge Cases
- Conflicting sources (official vs community) → prefer latest official guidance; note discrepancies and date-stamp evidence.
- Scope creep at pillar/curriculum stages → enforce stage gates; require approvals before proceeding.
- Insufficient demand signals → mark as experimental and seek validation tasks before deep production.
- Rapidly changing tools → warn when freshness window exceeded; schedule periodic review.
- Persona conflict or unclear ownership → require role assignment before advancing.

## Requirements *(mandatory)*

### Functional Requirements
- **FR-001**: The workflow MUST operate in stage gates: Pillars → Learning Paths → Courses → Modules → Lessons; each stage requires explicit Executive Producer approval before proceeding.
- **FR-002**: The workflow MUST support multi-persona collaboration (e.g., Executive Producer, Content Strategist, SME, Scriptwriter, Editor, Community Manager, SEO/Distribution Lead, QA Reviewer, Librarian/Archivist) with role-specific prompts and responsibilities.
- **FR-003**: The workflow MUST gather and cite evidence from official documentation and reputable community sources to justify topic selection and maintain freshness.
- **FR-004**: The workflow MUST align assets to a sales funnel: top-of-funnel YouTube/blog content linking to mid/bottom-funnel academy modules and courses with clear CTAs.
- **FR-005**: The workflow MUST produce structured curricula in the format Learning Paths > Courses > Modules > Lessons, consistent with the Constitution and similar to LinkedIn Learning’s structure.
- **FR-006**: The workflow MUST generate asset briefs/outlines for: YouTube videos (title, hook, outline, key visuals, CTA), blog posts (title, summary, sections, keywords, CTA), and academy lessons (objectives, outline, practice, references), without prescribing implementation details.
- **FR-007**: The workflow MUST maintain a content inventory to track produced assets, canonical tags, and references for reuse in future lessons.
- **FR-008**: The workflow MUST detect when source tools/docs update and flag affected content with proposed revision notes and priority.
- **FR-009**: The workflow MUST apply consistent tagging at all levels (topic, level, audience/role, format, source type, tech/stack) to enable discovery across content.
- **FR-010**: The workflow MUST map each YouTube/blog asset to corresponding lessons/modules in the paid academy and record cross-links.
- **FR-011**: The workflow MUST distill publications from official sites into plain-language summaries with “why it matters” and “how this applies” sections, including simple examples or visual analogies.
- **FR-012**: The workflow MUST provide approval checkpoints and change logs to maintain transparency and traceability.
- **FR-013**: The workflow SHOULD recommend a production cadence and prioritization based on demand signals and prerequisite dependencies.
- **FR-014**: The workflow MUST export planning data in a machine-readable format (JSON or YAML) alongside human-readable summaries.
- **FR-015**: The workflow MUST avoid duplicating content by suggesting consolidation or references to existing assets where appropriate.
- **FR-016**: The workflow MUST store the content inventory in a Git-committed SQLite database at `content-inventory/content.db`, and output machine-readable exports in `content-inventory/exports/` as JSON/YAML; optionally generate read-only Markdown mirrors for Obsidian.
- **FR-017**: The workflow MUST use GitHub Projects for stage-gated reviews and notifications: create a Draft PR per stage (Pillars → Paths → Courses → Modules → Lessons), associate it to the Project, apply stage labels to route cards across columns, request required reviewers (e.g., Executive Producer, SME), and treat PR approval as the gate to advance the card to the next column/stage.
- **FR-018**: The workflow MUST use a hybrid monitoring cadence: (a) weekly light scan of official sources and key community channels for major changes; (b) monthly comprehensive review of active curricula and assets; and (c) near‑real‑time alerts from official product/update feeds to immediately flag material changes. It MUST enforce a freshness SLA: fast‑changing stacks reviewed at least every 90 days and slower‑changing content at least every 180 days; SLA breaches auto-create review tickets.
- **FR-019**: The workflow MUST define target audiences via a hybrid segmentation matrix (role × level). Initial priority segments are: (1) Data/Business Analyst — Beginner; (2) Software/Automation Engineer — Intermediate; with the next planned segment being (3) Manager/Leader — Intermediate. All curriculum items MUST declare their target segment(s) and recommended prerequisites; tags MUST include both role and level.
- **FR-022**: Each lesson MUST include a “Leader’s Lens” section (90–150 words) that articulates: (a) business value and intended outcomes, (b) key decisions and trade-offs, (c) risks/assumptions and change-management notes, and (d) suggested KPIs/OKRs to track impact. This content SHOULD avoid jargon and be understandable by non-technical stakeholders.
 - **FR-021**: Governance (Moderate):
    - Retention: keep drafts and derivative working data for 24 months; keep published exports (academy/public) and code indefinitely; allow optional archives for audits.
    - Access: enforce least-privilege repo roles; protect branches for stage gates; prohibit secrets/PII in repo; require reviewer approval on sensitive changes.
    - Licensing: MIT for code/scripts/schemas/templates; CC BY 4.0 for public blog/YouTube content; CC BY‑NC 4.0 for paid academy content; diagrams/Obsidian mirrors inherit the source content license; always paraphrase and cite third-party sources; brief quotes only under fair use.
 - **FR-020**: The workflow MUST follow a hybrid SEO strategy: define global topic clusters and pillar pages aligned to pillars/learning paths, select keywords via data-driven analysis (difficulty/volume, competitor gaps), refresh clusters quarterly, and add geo-variant targeting (e.g., en-US, en-UK) only for high-impact assets based on analytics. Each public asset brief MUST list 3–10 primary/secondary keywords and the owning cluster.

*Ambiguities to clarify:*

### Key Entities *(include if feature involves data)*
- **Persona**: Role template with responsibilities and review rights (e.g., Executive Producer, SME, Scriptwriter).
- **Pillar**: High-level thematic area that frames a set of Learning Paths.
- **LearningPath**: Journey definition aligned to competencies and audiences.
- **Course**: Coherent outcome with scope and assessment strategy.
- **Module**: Cluster of lessons around a specific topic or skill.
- **Lesson**: Smallest teachable unit with objectives, outline, practice, and citations.
- **Lesson**: Smallest teachable unit with objectives, outline, practice, citations, and a concise “Leader’s Lens” callout for strategic framing.
- **ContentAsset**: YouTube video brief, blog brief, or academy lesson artifact mapped to curriculum.
- **Source/Citation**: Evidence with freshness metadata and rationale.
- **DemandSignal**: Observed user interest (search terms, community questions, video engagement).
- **Tag**: Canonical labels for topic, level, audience, format, source type, tech/stack, prereqs.
- **Approval/Review**: Stage-gate decision with comments, owner, and timestamp.
- **UpdateAlert**: Flag indicating content likely impacted by external changes.
- **FunnelMapping**: Links between top-of-funnel assets and academy modules/courses.
- **ContentInventory**: Registry of produced/planned assets and cross-references.
 - **AudienceSegment**: A normalized (role × level) segment; referenced by curriculum items for routing and funnel alignment.

---

## Review & Acceptance Checklist
*GATE: Automated checks run during main() execution*

### Content Quality
- [ ] No implementation details (languages, frameworks, APIs)
- [ ] Focused on user value and business needs
- [ ] Written for non-technical stakeholders
- [ ] All mandatory sections completed

### Requirement Completeness
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Requirements are testable and unambiguous  
- [ ] Success criteria are measurable
- [ ] Scope is clearly bounded
- [ ] Dependencies and assumptions identified

---

## Integration Notes (optional)

- Obsidian: Keep SQLite as the canonical store. Optionally export read-only Markdown notes (with frontmatter tags and wikilinks) under `content-inventory/obsidian/` to enable Obsidian graph view and Dataview tables. If preferred, use a community SQLite query plugin in Obsidian to read `content.db` directly.
- Graph DB (Neo4j): Provide periodic ETL from SQLite to Neo4j (via CSV or JSON). Suggested nodes: Persona, Pillar, LearningPath, Course, Module, Lesson, ContentAsset, Source, DemandSignal, Tag, Approval, UpdateAlert. Suggested relationships: PILLAR_HAS_PATH, PATH_HAS_COURSE, COURSE_HAS_MODULE, MODULE_HAS_LESSON, ASSET_ALIGNS_WITH_LESSON|MODULE, LESSON_REFERENCES_SOURCE, ITEM_HAS_TAG, ITEM_HAS_DEMAND_SIGNAL, ITEM_APPROVED_BY, ITEM_FLAGGED_BY_UPDATEALERT, ASSET_DRIVES_TO_COURSE|PATH.
 - Monitoring details: Weekly scan sources include official docs/changelogs, product blogs, release notes, major community forums, and top YouTube channels. Real-time alerts via RSS/API/webhooks from official products. SLA tiering: mark content as Fast or Standard; auto-create tickets when review due and include an impact map listing potentially affected lessons/modules.
\- GitHub Projects flow: One Project with columns matching stage gates. Each stage creates/updates a Draft PR linked to a card. Required reviewers: Executive Producer + relevant SME. Labels: `stage/pillars`, `stage/paths`, `stage/courses`, `stage/modules`, `stage/lessons`. Approval merges or promotes to next column; rejections add a comment and move card back with required changes.
 - Audience & tags: Curriculum items should set tags: `role:<analyst|engineer|manager>` and `level:<beginner|intermediate|advanced>` in addition to topic/format/source-type per Constitution.
 - Governance notes: Add LICENSE files or headers per asset type (MIT for code; CC BY for public content; CC BY‑NC for academy). Include portal Terms of Use clarifying Noncommercial scope. Provide a takedown path for accidental inclusion of third‑party proprietary content.
 - SEO notes: Maintain `seo/clusters.yaml` mapping pillars/paths to clusters. Asset briefs must include target SERP intent, internal links to pillar pages and related modules, and notes for geo-variant localization when enabled. Re-evaluate clusters quarterly and after major product releases.


## Execution Status
*Updated by main() during processing*

- [ ] User description parsed
- [ ] Key concepts extracted
- [ ] Ambiguities marked
- [ ] User scenarios defined
- [ ] Requirements generated
- [ ] Entities identified
- [ ] Review checklist passed

---
