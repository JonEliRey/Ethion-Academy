# Tasks: Super-Intelligent Course Designer Workflow

**Input**: Design documents from `D:\OneDrive\Documents\Code-Projects\Ethion Academy\specs\001-i-need-to`
**Prerequisites**: plan.md (complete), research.md (complete)

## Execution Flow (main)
```
1. Load plan.md from feature directory
   → Extract: tech stack (VS Code chat modes, SQLite, PowerShell), structure
2. Load research.md
   → Extract decisions: chat modes, Fabric patterns, handoff protocol, SQLite
3. Generate tasks by category:
   → Setup: Directory structure, database initialization
   → Configuration: 9 agent chat modes, 3 custom instructions, 8 prompt files
   → Documentation: Workflow guides, examples, quickstart
   → Validation: Manual testing, quality checks
4. Apply task rules:
   → Different files = mark [P] for parallel
   → Same file = sequential (no [P])
   → Configuration before documentation
   → Documentation before validation
5. Number tasks sequentially (T001, T002...)
6. Return: SUCCESS (tasks ready for execution)
```

## Format: `[ID] [P?] Description`
- **[P]**: Can run in parallel (different files, no dependencies)
- Include exact file paths in descriptions

## Path Conventions
All paths are absolute from repository root:
- Chat modes: `.github/chatmodes/`
- Custom instructions: `.github/instructions/`
- Prompt files: `.github/prompts/`
- Database: `content-inventory/`
- Documentation: `docs/001-i-need-to/plan/`
- Scripts: `scripts/`
- Templates: `templates/`

---

## Phase 3.1: Setup & Foundation

### Directory Structure
- [ ] **T001** Create `.github/chatmodes/` directory for agent chat mode files
- [ ] **T002** [P] Create `.github/instructions/` directory for custom instructions
- [ ] **T003** [P] Create `.github/prompts/` directory for reusable prompt workflows
- [ ] **T004** [P] Create `content-inventory/` directory with subdirectories: `exports/`, `obsidian/`, `schema/`
- [ ] **T005** [P] Create `docs/001-i-need-to/plan/` directory with subdirectories: `agents/`, `workflows/`, `examples/`
- [ ] **T006** [P] Create `scripts/` directory for PowerShell utilities
- [ ] **T007** [P] Create `templates/` directory for content structure templates

### Database Foundation
- [ ] **T008** Create SQLite database schema in `content-inventory/schema/schema.sql` with all 16 entities: Pillar, LearningPath, Course, Module, Lesson, ContentAsset, AssetProductionStatus, Tag, ContentTag, Source, ContentSource, DemandSignal, UpdateAlert, Approval, Prerequisite, and AgentAction tables. Include foreign key constraints, indexes for common queries (by status, by pillar_id, by tag), and triggers for audit trail (created_at, updated_at timestamps).
- [ ] **T009** Create PowerShell script `scripts/init-database.ps1` that initializes `content-inventory/content.db` by executing schema.sql. Include parameter validation, error handling for file-not-found scenarios, and confirmation message showing tables created.
- [ ] **T010** Create PowerShell script `scripts/export-inventory.ps1` that exports database content to JSON/YAML files in `content-inventory/exports/`. Include parameters for export format (-Json or -Yaml), target entity types (pillars, paths, courses, modules, lessons), and human-readable formatting with proper indentation.

---

## Phase 3.2: Agent Chat Modes (Configuration)
**CRITICAL: Each agent is an independent Markdown file - all tasks below can run in parallel [P]**

### Phase 1 Agents (Foundation - Pillars & Learning Paths)
- [ ] **T011** [P] Create Content Strategist chat mode in `.github/chatmodes/content-strategist.chatmode.md`. Frontmatter: `description: 'Strategic content planner analyzing demand and defining pillars'`, `tools: ['search', 'fetch', 'codebase']`. Content: Identity (demand analyst + strategic planner), Purpose (define pillars and learning paths based on market signals), Workflow (gather trend data → analyze demand → propose structure → validate with SME → handoff to Executive Producer), Input Requirements (topic area, target audience, competitive landscape), Output Format (pillar brief with rationale, demand evidence, scope boundaries), Handoff Protocol (TO: when new pillar/path needed; FROM: to SME for validation, to Executive Producer for approval), Guidelines (cite sources, prioritize relevance, avoid scope creep), Examples (2-3 pillar proposals), Quality Criteria (demand justification present, scope clear, prerequisites identified).
- [ ] **T012** [P] Create SME (Subject Matter Expert) chat mode in `.github/chatmodes/sme.chatmode.md`. Frontmatter: `description: 'Technical validator ensuring accuracy and completeness'`, `tools: ['search', 'fetch', 'codebase']`. Content: Identity (technical expert + accuracy guardian), Purpose (validate content scope, identify prerequisites, ensure technical correctness), Workflow (review proposed content → verify against official docs → identify gaps/errors → suggest corrections → confirm readiness → handoff), Input Requirements (content proposal from Content Strategist or Scriptwriter, official documentation links), Output Format (validation report with approved/rejected status, gap analysis, prerequisite list, corrections), Handoff Protocol (TO: after Content Strategist proposes scope; FROM: to Content Strategist for rework OR to Scriptwriter if approved), Guidelines (prefer official docs over community sources, flag outdated information, validate prerequisites), Examples (2-3 validation scenarios), Quality Criteria (all claims verified, prerequisites complete, sources cited).
- [ ] **T013** [P] Create Librarian chat mode in `.github/chatmodes/librarian.chatmode.md`. Frontmatter: `description: 'Content inventory manager and cross-reference specialist'`, `tools: ['codebase', 'runCommands', 'editFiles']`. Content: Identity (archivist + metadata curator), Purpose (catalog content, manage tags, identify cross-references and reuse opportunities), Workflow (receive content item → assign canonical tags → identify prerequisites → search for related content → record in database → generate cross-reference report → handoff), Input Requirements (content item (pillar/path/course/module/lesson), database access via scripts), Output Format (database entry confirmation, tag assignments, prerequisite links, related content list), Handoff Protocol (TO: after any content creation; FROM: to requesting agent with inventory report, to Executive Producer with status updates), Guidelines (use canonical tag taxonomy, avoid duplicate tags, maintain referential integrity, export to JSON for reports), Examples (2-3 cataloging scenarios), Quality Criteria (all required metadata present, prerequisites linked, no orphaned content).

### Phase 2 Agents (Production - Courses, Modules, Lessons)
- [ ] **T014** [P] Create Scriptwriter chat mode in `.github/chatmodes/scriptwriter.chatmode.md`. Frontmatter: `description: 'Lesson outline and video brief creator'`, `tools: ['search', 'fetch', 'codebase', 'editFiles']`. Content: Identity (instructional designer + content creator), Purpose (create lesson outlines, YouTube video briefs, blog post briefs), Workflow (receive approved scope from SME → research topic → draft lesson outline with objectives, sections, practice → create video brief (hook, visuals, CTA) → create blog brief → handoff to Editor), Input Requirements (approved technical scope, target audience, learning objectives, prerequisite content), Output Format (lesson outline with objectives/outline/practice/citations, video brief with title/hook/outline/CTA, blog brief with title/summary/sections/keywords), Handoff Protocol (TO: after SME approval; FROM: to Editor for review, to Librarian for cataloging), Guidelines (follow content-standards.instructions.md for frontmatter, cite sources, include Leader's Lens section, map to sales funnel stage), Examples (2-3 lesson briefs), Quality Criteria (objectives measurable, outline detailed, practice exercises included, citations complete).
- [ ] **T015** [P] Create Editor chat mode in `.github/chatmodes/editor.chatmode.md`. Frontmatter: `description: 'Quality reviewer ensuring consistency and clarity'`, `tools: ['codebase', 'editFiles']`. Content: Identity (quality guardian + consistency enforcer), Purpose (review content for clarity, consistency, grammar, and adherence to standards), Workflow (receive draft from Scriptwriter → check against content-standards.instructions.md → verify frontmatter completeness → assess readability → suggest improvements → approve or return → handoff), Input Requirements (draft content, project standards from custom instructions), Output Format (review report with approved/rejected status, specific corrections, quality score), Handoff Protocol (TO: after Scriptwriter completes draft; FROM: to Scriptwriter for revisions OR to Community Manager if approved), Guidelines (enforce frontmatter schema, check tag consistency, verify prerequisite links, assess plain-language clarity), Examples (2-3 review scenarios), Quality Criteria (all standards met, readability high, no broken references).
- [ ] **T016** [P] Create Community Manager chat mode in `.github/chatmodes/community-manager.chatmode.md`. Frontmatter: `description: 'Engagement strategist and CTA optimizer'`, `tools: ['search', 'fetch', 'codebase', 'editFiles']`. Content: Identity (audience advocate + engagement specialist), Purpose (optimize content for engagement, craft CTAs, align to sales funnel), Workflow (receive approved content → analyze audience fit → optimize titles/hooks → craft CTAs (YouTube → blog → academy) → identify engagement opportunities (polls, questions, community posts) → handoff), Input Requirements (approved content, audience segment, funnel stage), Output Format (engagement strategy with optimized titles, CTA placement recommendations, community engagement plan), Handoff Protocol (TO: after Editor approval; FROM: to SEO Lead for discoverability optimization), Guidelines (align CTAs to funnel stage, use plain language, encourage interaction, respect audience segment), Examples (2-3 engagement strategies), Quality Criteria (CTAs clear and compelling, engagement plan actionable, audience-appropriate tone).
- [ ] **T017** [P] Create SEO Lead chat mode in `.github/chatmodes/seo-lead.chatmode.md`. Frontmatter: `description: 'Discoverability optimizer and keyword strategist'`, `tools: ['search', 'fetch', 'codebase', 'editFiles']`. Content: Identity (discoverability specialist + keyword strategist), Purpose (optimize content for search and discovery), Workflow (receive content from Community Manager → research keywords → optimize titles/descriptions → add tags → validate discoverability → handoff), Input Requirements (approved content with engagement strategy, target keywords, competitive landscape), Output Format (SEO report with keyword recommendations, optimized metadata, tag assignments, competitor analysis), Handoff Protocol (TO: after Community Manager completes engagement strategy; FROM: to QA Reviewer for final check), Guidelines (prioritize relevance over keyword stuffing, align tags with taxonomy, validate search volume, check SERP competition), Examples (2-3 optimization scenarios), Quality Criteria (keywords researched, metadata complete, tags consistent, discoverability high).
- [ ] **T018** [P] Create QA Reviewer chat mode in `.github/chatmodes/qa-reviewer.chatmode.md`. Frontmatter: `description: 'Final quality gate before content approval'`, `tools: ['codebase', 'editFiles', 'problems']`. Content: Identity (quality assurance specialist + final checkpoint), Purpose (perform comprehensive final review before Executive Producer approval), Workflow (receive content from SEO Lead → run quality checklist (accuracy, completeness, standards compliance, links valid, metadata complete) → validate all handoff criteria met → approve or reject with detailed feedback → handoff), Input Requirements (near-final content, all previous agent reports, quality standards), Output Format (QA report with pass/fail status, checklist results, critical issues list, approval recommendation), Handoff Protocol (TO: after SEO Lead optimization; FROM: to previous agent for fixes OR to Executive Producer for final approval), Guidelines (zero tolerance for broken links, verify all citations accessible, check frontmatter completeness, validate prerequisite chains), Examples (2-3 QA scenarios), Quality Criteria (all checklist items pass, no critical issues, approval recommendation justified).
- [ ] **T019** [P] Create Monitoring Specialist chat mode in `.github/chatmodes/monitoring-specialist.chatmode.md`. Frontmatter: `description: 'Freshness tracker detecting source updates'`, `tools: ['search', 'fetch', 'codebase', 'editFiles']`. Content: Identity (vigilance agent + change detector), Purpose (monitor official sources for updates, flag affected content, propose revisions), Workflow (receive source URL list from database → recursively explore documentation → detect changes (version updates, deprecated features, new capabilities) → identify affected lessons → generate update alerts with priority → handoff), Input Requirements (source URL list, last-checked timestamps, affected content map), Output Format (update alert report with change description, affected content list, revision priority, proposed updates), Handoff Protocol (TO: scheduled checks or on-demand; FROM: to Content Strategist for scope review, to Executive Producer for update prioritization), Guidelines (prefer official changelogs, recursively explore linked docs (inspired by Beastmode), track freshness SLAs, prioritize breaking changes), Examples (2-3 change detection scenarios), Quality Criteria (changes detected accurately, affected content identified completely, priorities justified).

---

## Phase 3.3: Custom Instructions (Global Standards)
**CRITICAL: Each instruction file is independent - all tasks below can run in parallel [P]**

- [ ] **T020** [P] Create global standards custom instruction in `.github/instructions/global-standards.instructions.md`. Frontmatter: `description: 'Project-wide conventions and standards for all agents'`, `applyTo: '**/*.md, **/*.json, **/*.sql, **/*.ps1, **/*.chatmode.md, **/*.prompt.md'`. Content sections: Frontmatter Requirements (all content files must include target_audience, topics, goals, prerequisites, tags, status), Database Operations (use parameterized queries, never hard-code IDs, export to JSON for reports), Handoff Protocol (use standard template from handoff-protocol.instructions.md, include all 9 required components), File Naming (kebab-case for all files, descriptive names, no spaces), Version Control (commit after each task, meaningful commit messages, branch naming), Code Quality (PowerShell scripts require parameter validation, error handling, help documentation), Testing (manual validation via quickstart.md, scenario walkthroughs), Documentation (inline comments for complex logic, README files in all directories), Error Handling (graceful degradation, user-friendly messages, log to console), Security (no credentials in Git, use environment variables, validate all inputs). Include 3-5 concrete examples per section.
- [ ] **T021** [P] Create content standards custom instruction in `.github/instructions/content-standards.instructions.md`. Frontmatter: `description: 'Content file frontmatter and formatting standards'`, `applyTo: 'content-inventory/**/*.md, templates/**/*.md, docs/**/*.md'`. Content sections: Frontmatter Schema (Pillar: name, description, status, approved_at; LearningPath: pillar_id, name, description, target_audience, prerequisites; Course: path_id, name, outcomes, assessment_strategy; Module: course_id, name, topics; Lesson: module_id, name, objectives, outline, practice, citations, leader_lens), Tagging Conventions (Categories: role {developer, analyst, architect, manager}, level {beginner, intermediate, advanced}, topic {subject area}, format {video, blog, lesson}, source_type {official, community}, tech_stack {tool/platform}; use canonical values only), Directory Structure Rules (hierarchical: `/pillars/{pillar-name}/learning-paths/{path-name}/courses/{course-name}/modules/{module-name}/lessons/{lesson-name}/`; each level has README.md), Status Values (draft, in-review, approved, published, deprecated), Plain Language Guidelines (avoid jargon, define acronyms, use analogies, include "why it matters" sections). Include complete frontmatter examples for each content level.
- [ ] **T022** [P] Create handoff protocol custom instruction in `.github/instructions/handoff-protocol.instructions.md`. Frontmatter: `description: 'Agent handoff message format and transition rules'`, `applyTo: '**/*.md'`. Content sections: Handoff Message Template (9 required components: from_agent, to_agent, reason, context summary, deliverables attached, what target should do, expected output, success criteria, executive producer instruction to switch chat mode), Context Passing Requirements (include all relevant work artifacts, summarize decisions made, highlight open questions, attach supporting files/links), Return-to-Human Conditions (ambiguity requiring judgment call, approval checkpoint reached, error condition requiring intervention, explicit request for feedback), Approval Checkpoint Format (content item ready for decision, pros/cons analysis, recommendation with rationale, explicit approve/reject/revise options), State Transitions (valid agent sequences, forbidden transitions, circular handoff detection), Quality Gates (checklist per handoff type, validation before handoff allowed, rollback procedure if quality insufficient). Include 3-5 complete handoff examples covering common scenarios (pillar approval, scope validation, content review, update prioritization).

---

## Phase 3.4: Prompt Files (Reusable Workflows)
**CRITICAL: Each prompt file is independent - all tasks below can run in parallel [P]**

- [ ] **T023** [P] Create define pillar prompt in `.github/prompts/define-pillar.prompt.md`. Frontmatter: `mode: 'content-strategist'`, `description: 'Interactive workflow to guide Content Strategist through pillar creation'`, `tools: ['search', 'fetch', 'codebase']`. Content: Step-by-step workflow (1. Gather context: topic area, target audience, business goals; 2. Demand analysis: search trends, competitor analysis, community questions; 3. Define scope: 3-7 pillars with names, descriptions, rationale; 4. Source identification: official docs, community resources, freshness tracking; 5. Create pillar document: frontmatter + description + scope boundaries + demand evidence; 6. Prepare handoff to SME: context summary, validation checklist, success criteria). Include prompts for each step, expected inputs/outputs, quality checklist, common mistakes to avoid, tips for strong pillar definitions.
- [ ] **T024** [P] Create define learning path prompt in `.github/prompts/define-learning-path.prompt.md`. Frontmatter: `mode: 'content-strategist'`, `description: 'Interactive workflow for creating learning paths under an approved pillar'`, `tools: ['search', 'fetch', 'codebase']`. Content: Step-by-step workflow (1. Review pillar context; 2. Identify audience segments and skill progressions; 3. Research existing learning paths (competitors, LinkedIn Learning, Pluralsight); 4. Define path structure: courses → modules outline; 5. Validate prerequisites and dependencies; 6. Create path document with frontmatter; 7. Prepare handoff to SME). Include quality criteria (progression makes sense, prerequisites clear, outcomes measurable), examples of strong vs weak paths.
- [ ] **T025** [P] Create validate technical scope prompt in `.github/prompts/validate-technical-scope.prompt.md`. Frontmatter: `mode: 'sme'`, `description: 'Guide SME through technical validation of content proposals'`, `tools: ['search', 'fetch', 'codebase']`. Content: Step-by-step validation workflow (1. Review proposal from Content Strategist or Scriptwriter; 2. Verify against official documentation (check links, validate claims); 3. Identify technical gaps or inaccuracies; 4. Assess prerequisite completeness; 5. Check for outdated information; 6. Generate validation report: approved/rejected, corrections needed, additional sources; 7. Prepare handoff). Include validation checklist (claims verified, sources authoritative, prerequisites identified, technical depth appropriate), examples of common validation issues (outdated APIs, incorrect assumptions, missing context).
- [ ] **T026** [P] Create lesson brief prompt in `.github/prompts/create-lesson-brief.prompt.md`. Frontmatter: `mode: 'scriptwriter'`, `description: 'Guide Scriptwriter through creating comprehensive lesson outlines and briefs'`, `tools: ['search', 'fetch', 'codebase', 'editFiles']`. Content: Step-by-step workflow (1. Review approved scope from SME; 2. Research topic depth (official docs, community examples); 3. Draft lesson outline: objectives (measurable), sections (detailed), practice exercises (hands-on); 4. Create YouTube video brief: title (compelling), hook (first 30s), outline (sections with timing), key visuals (screenshots/diagrams), CTA (drive to blog/academy); 5. Create blog post brief: title (SEO-friendly), summary (150 words), sections (H2/H3 structure), keywords, CTA; 6. Add Leader's Lens section: business outcome, decision criteria, risks, KPIs; 7. Cite all sources; 8. Prepare handoff to Editor). Include quality checklist, lesson brief template, video brief template, blog brief template, examples of strong hooks and CTAs.
- [ ] **T027** [P] Create content review prompt in `.github/prompts/perform-content-review.prompt.md`. Frontmatter: `mode: 'editor'`, `description: 'Guide Editor through comprehensive content quality review'`, `tools: ['codebase', 'editFiles']`. Content: Step-by-step review workflow (1. Check frontmatter completeness per content-standards.instructions.md; 2. Verify tag consistency with canonical taxonomy; 3. Validate prerequisite links; 4. Assess readability: plain language, jargon defined, clarity; 5. Check grammar and formatting; 6. Verify citations accessible; 7. Generate review report: approved/needs-revision, specific corrections, quality score; 8. Prepare handoff). Include review checklist (frontmatter complete, tags canonical, prerequisites linked, readability high, grammar correct, citations valid), examples of common issues (inconsistent tags, broken links, unclear explanations).
- [ ] **T028** [P] Create handoff summary prompt in `.github/prompts/handoff-summary.prompt.md`. Frontmatter: `mode: 'agent'`, `description: 'Generate standardized handoff messages following handoff-protocol.instructions.md'`, `tools: ['codebase']`. Content: Handoff message generator (prompts for: from_agent, to_agent, reason, context summary, deliverables list, task instructions, expected output, success criteria, executive producer instruction); validation (ensure all 9 required components present); formatting (use standard template with emoji header, clear sections); examples (3-5 handoff scenarios: pillar approval, scope validation, content review, update alert, final QA). Include tips for effective handoffs (be specific, include context, define success clearly, provide actionable instructions).
- [ ] **T029** [P] Create catalog content prompt in `.github/prompts/catalog-content.prompt.md`. Frontmatter: `mode: 'librarian'`, `description: 'Guide Librarian through content cataloging and cross-referencing'`, `tools: ['codebase', 'runCommands', 'editFiles']`. Content: Step-by-step cataloging workflow (1. Receive content item (pillar/path/course/module/lesson); 2. Assign canonical tags per taxonomy (role, level, topic, format, source_type, tech_stack); 3. Identify prerequisites by scanning content for "requires knowledge of X" or "builds on Y"; 4. Search database for related content (query by tags, topics, keywords); 5. Record in database via scripts/init-database.ps1 or direct SQL; 6. Generate inventory report: database ID, tags assigned, prerequisites linked, related content; 7. Export to JSON for handoff; 8. Prepare handoff with report). Include SQL query examples, tag assignment guidelines, prerequisite identification patterns, cross-reference strategies.
- [ ] **T030** [P] Create check for updates prompt in `.github/prompts/check-for-updates.prompt.md`. Frontmatter: `mode: 'monitoring-specialist'`, `description: 'Guide Monitoring Specialist through source freshness checks and change detection'`, `tools: ['search', 'fetch', 'codebase', 'editFiles']`. Content: Step-by-step monitoring workflow (1. Query database for source URLs and last-checked timestamps; 2. Fetch current documentation (use fetch tool); 3. Recursively explore linked pages (inspired by Beastmode, max depth 3 to avoid infinite loops); 4. Detect changes: version updates, deprecated features, new capabilities, breaking changes; 5. Identify affected lessons by matching topics/keywords; 6. Prioritize updates: critical (breaking changes) > high (deprecated features) > medium (new features) > low (docs improvements); 7. Generate update alert report: change description, affected content list with IDs, revision priority, proposed update text; 8. Prepare handoff to Content Strategist or Executive Producer). Include change detection heuristics (version number changes, "deprecated" keyword, "new in v X" phrases), affected content identification strategies (tag matching, keyword search), priority assignment rules, examples of update alerts.

---

## Phase 3.5: Documentation (Workflows, Examples, Quickstart)
**Dependencies: All agent specs, custom instructions, and prompt files must be complete**

### Workflow Documentation
- [ ] **T031** Create handoff protocol guide in `docs/001-i-need-to/plan/workflows/handoff-protocol.md`. Content: Handoff message format specification (9 required components detailed), context passing requirements, return-to-human conditions, approval checkpoint format, state transitions (valid agent sequences), quality gates per handoff type. Include 3-5 complete handoff message examples (pillar approval, scope validation, content rejection, update alert, final QA). Reference `.github/instructions/handoff-protocol.instructions.md` as authoritative source.
- [ ] **T032** Create stage gates guide in `docs/001-i-need-to/plan/workflows/stage-gates.md`. Content: Approval criteria per stage (Pillar: demand justified, scope clear, sources identified; Learning Path: progression logical, prerequisites complete, outcomes measurable; Course: outcomes clear, assessment strategy defined, modules outlined; Module: topics cohesive, lessons scoped, practice included; Lesson: objectives measurable, outline detailed, citations complete). Include checklist templates for Executive Producer, rejection scenarios with feedback examples, revision workflows.
- [ ] **T033** Create agent flow diagram and narrative in `docs/001-i-need-to/plan/workflows/agent-flow.md`. Content: Narrative description of full content development cycle (Pillar → Path → Course → Module → Lesson → Asset Production), ASCII diagram showing agent interactions and handoff points, decision trees for common scenarios (approval, rejection, rework), role of Executive Producer at each stage. Include visual representation of sequential flow, common paths vs edge cases.

### Example Scenarios
- [ ] **T034** [P] Create scenario: pillar creation in `docs/001-i-need-to/plan/examples/scenario-01-create-pillar.md`. Content: Complete conversation transcript showing Content Strategist analyzing demand → proposing pillar (DataOps) → handoff to SME → SME validation → handoff to Executive Producer → approval. Include all handoff messages using standard format, context passing, decision points, Executive Producer switching between chat modes (`@content-strategist`, `@sme`). Demonstrate successful flow from idea to approved pillar in database.
- [ ] **T035** [P] Create scenario: rejection flow in `docs/001-i-need-to/plan/examples/scenario-02-rejection-flow.md`. Content: Conversation showing Content Strategist proposing pillar → SME rejection due to insufficient demand evidence → handoff back to Content Strategist with specific feedback → revised proposal → SME approval → Executive Producer approval. Demonstrate rework loop, feedback integration, quality improvement, successful resolution.
- [ ] **T036** [P] Create scenario: multi-agent collaboration in `docs/001-i-need-to/plan/examples/scenario-03-multi-agent-collaboration.md`. Content: Conversation showing Scriptwriter creating lesson outline → Editor review suggesting improvements → Scriptwriter revision → Community Manager adding engagement strategy → SEO Lead optimizing metadata → QA Reviewer final check → Executive Producer approval. Include Librarian cataloging content and Monitoring Specialist flagging related outdated lesson. Demonstrate full production pipeline with multiple handoffs, parallel work where appropriate, comprehensive quality checks.

### Quickstart Guide
- [ ] **T037** Create quickstart validation guide in `specs/001-i-need-to/quickstart.md`. Content: Step-by-step instructions for validating agent system with minimal scenario (pillar approval cycle). Steps: 1. Initialize database: `pwsh scripts/init-database.ps1` (verify tables created); 2. Load Content Strategist: type `@content-strategist` in VS Code chat; 3. Propose one pillar: "Create a pillar for DataOps focusing on data pipeline orchestration" (verify demand analysis, scope definition); 4. Receive handoff message targeting SME; 5. Switch to SME: `@sme`; 6. Validate pillar (verify technical accuracy check, source validation); 7. Receive handoff message targeting Executive Producer (approval request); 8. As Executive Producer, approve pillar; 9. Switch to Librarian: `@librarian`; 10. Catalog pillar in database (verify database entry created); 11. Export to JSON: `pwsh scripts/export-inventory.ps1 -Json` (verify JSON file generated); 12. Verify pillar appears in `content-inventory/exports/pillars.json`. Success criteria: Complete pillar approval cycle with 3 agents (Content Strategist, SME, Librarian) and database tracking operational. Include expected outputs at each step, troubleshooting tips, validation queries to confirm database state.

---

## Phase 3.6: Database Scripts & Templates
**Dependencies: Database schema (T008) must be complete**

### PowerShell Utility Scripts
- [ ] **T038** Create database initialization script `scripts/init-database.ps1`. Parameters: `-DatabasePath` (default: `content-inventory/content.db`), `-SchemaPath` (default: `content-inventory/schema/schema.sql`), `-Force` (recreate if exists). Logic: Check if database exists (warn if -Force not set); execute schema.sql to create tables; verify tables created via `.tables` query; output confirmation message listing tables created. Include parameter validation, error handling (file not found, SQL execution errors), help documentation with examples.
- [ ] **T039** Create inventory export script `scripts/export-inventory.ps1`. Parameters: `-Format` (Json or Yaml), `-Entity` (Pillars, Paths, Courses, Modules, Lessons, All), `-OutputDir` (default: `content-inventory/exports/`). Logic: Query database for specified entities; format as JSON or YAML with proper indentation; write to files named `{entity}.{format}` (e.g., `pillars.json`); output confirmation showing files created and record counts. Include parameter validation, error handling (database not found, query failures), help documentation.
- [ ] **T040** Create Obsidian mirror generation script `scripts/generate-obsidian-mirror.ps1`. Parameters: `-DatabasePath`, `-OutputDir` (default: `content-inventory/obsidian/`). Logic: Query database for all content entities; generate Markdown file per entity with frontmatter (id, name, status, tags); create wiki-style links for prerequisites and related content; organize in hierarchical directory structure (pillars/paths/courses/modules/lessons); output confirmation showing files created. Include parameter validation, error handling, help documentation. Note: Optional feature for Obsidian users; not required for core workflow.

### Content Templates
- [ ] **T041** [P] Create pillar template in `templates/pillar-template.md`. Content: Frontmatter (name, description, status, approved_at, tags [topic, level, role]), sections (Overview, Scope, Target Audience, Key Outcomes, Related Pillars, Sources). Include inline instructions and placeholder text. Reference content-standards.instructions.md for frontmatter schema.
- [ ] **T042** [P] Create learning path template in `templates/learning-path-template.md`. Content: Frontmatter (pillar_id, name, description, target_audience [role × level], prerequisites, status, tags), sections (Overview, Learning Objectives, Course Outline, Prerequisites, Estimated Duration, Sources). Include inline instructions.
- [ ] **T043** [P] Create course template in `templates/course-template.md`. Content: Frontmatter (path_id, name, description, outcomes, assessment_strategy, status, tags), sections (Overview, Learning Outcomes, Module Structure, Assessment Strategy, Prerequisites, Duration, Sources).
- [ ] **T044** [P] Create module template in `templates/module-template.md`. Content: Frontmatter (course_id, name, description, topics, status, tags), sections (Overview, Topics Covered, Lesson Outline, Practice Activities, Duration, Sources).
- [ ] **T045** [P] Create lesson template in `templates/lesson-template.md`. Content: Frontmatter (module_id, name, objectives, prerequisites, status, tags), sections (Overview, Learning Objectives, Lesson Outline, Practice Exercises, Leader's Lens [business outcome, decision criteria, risks, KPIs], Citations, Related Lessons). Include video brief template (title, hook, outline, visuals, CTA) and blog brief template (title, summary, sections, keywords, CTA) as subsections.

---

## Phase 3.7: Validation & Testing
**Dependencies: All configuration, documentation, and scripts must be complete**

- [ ] **T046** Execute manual test plan following `specs/001-i-need-to/quickstart.md`. Validate: database initialization works, Content Strategist generates pillar proposals with demand evidence, handoff messages follow standard format, SME validates technical accuracy, Librarian catalogs content in database, database queries return correct data, JSON export generates valid files. Document any issues in `specs/001-i-need-to/test-results.md`.
- [ ] **T047** Validate agent response quality. For each of 9 agents: invoke agent chat mode, provide sample input per agent spec examples, verify output matches expected format and quality criteria, check handoff messages include all 9 required components. Create validation checklist in `docs/001-i-need-to/plan/validation-checklist.md` tracking pass/fail per agent.
- [ ] **T048** Validate database schema and operations. Execute sample queries: retrieve all pillars, query lessons by tag, trace prerequisite chain, generate cross-reference report. Verify foreign key constraints enforced, indexes improve query performance, triggers update timestamps correctly. Document schema validation results in `content-inventory/schema/validation-report.md`.

---

## Phase 3.8: Integration & Finalization

- [ ] **T049** Create GitHub Projects setup guide in `docs/001-i-need-to/plan/integration/github-projects-setup.md`. Content: Instructions for creating project board with columns (Pillars, Paths, Courses, Modules, Lessons, In Production, Published), linking issues to content items, using stage gates as project milestones, tracking agent handoffs as issue comments. Include screenshots, best practices, automation ideas (future scope).
- [ ] **T050** Create Obsidian integration guide in `docs/001-i-need-to/plan/integration/obsidian-vault-setup.md`. Content: Instructions for configuring Obsidian vault in `content-inventory/obsidian/`, using Dataview plugin for queries, creating graph view of content relationships, setting up daily notes for content planning. Include vault structure, recommended plugins, sample queries, workflow tips. Note: Optional feature; core workflow does not depend on Obsidian.
- [ ] **T051** Update project agent context file (GitHub Copilot instructions or similar). Add: VS Code chat mode customization features, SQLite content tracking database, agent personas and handoff protocol, Fabric pattern structure, meta-development approach. Include key decisions from research.md, file naming conventions from FILE-NAMING-STANDARDS-FINAL.md, custom instructions summary. If using GitHub Copilot, update `.github/copilot-instructions.md`. Run `.specify/scripts/powershell/update-agent-context.ps1 -AgentType copilot` if available.

---

## Dependencies & Critical Sequencing

### ⚠️ CRITICAL: Custom Instructions MUST Come Before Agents
**Issue**: Tasks T011-T019 (agents) reference custom instructions from T020-T022. If agents are created first, they'll reference non-existent files.

**Solution**: Execute T020-T022 BEFORE T011-T019, even though both are marked [P].

### Hard Dependencies (Must Be Sequential)
1. **T001** → All other tasks (directories must exist first)
2. **T002-T007** → Tasks creating files in those directories
3. **T008** → T009-T010, T038-T040, T048 (database schema before scripts/validation)
4. **T020-T022** → T011-T019 ⚠️ **CRITICAL** (custom instructions before agents)
5. **T011-T019** → T031-T037, T047 (agents before documentation/validation)
6. **T031** → T034-T036 (handoff protocol doc before example scenarios)
7. **T031-T037** → T046-T048 (documentation before validation)
8. **T046-T048** → T049-T051 (validation before integration)

### Recommended Soft Dependencies
- **T041-T045** (templates) before T020-T021 (inform content standards)
- **T011-T013** (Phase 1 agents) validated before T014-T019 (Phase 2 agents)
- **T023-T030** (prompts) after T011-T019 (agents) for context

## 🎯 RECOMMENDED EXECUTION SEQUENCE

### Wave 0: Foundation (REQUIRED FIRST)
**Duration**: 5 minutes  
**Sequential**: Must complete before any other work

- [ ] **T001** Create `.github/chatmodes/` directory

**GATE**: Directory structure exists → Proceed to Wave 1

---

### Wave 1: Complete Directory Structure (PARALLEL)
**Duration**: 10-15 minutes  
**Parallel**: All 6 tasks can run simultaneously

- [ ] **T002** [P] Create `.github/instructions/` directory
- [ ] **T003** [P] Create `.github/prompts/` directory
- [ ] **T004** [P] Create `content-inventory/` directory with subdirectories
- [ ] **T005** [P] Create `docs/001-i-need-to/plan/` directory with subdirectories
- [ ] **T006** [P] Create `scripts/` directory
- [ ] **T007** [P] Create `templates/` directory

**GATE**: All directories exist → Proceed to Wave 2

---

### Wave 2: Database Foundation (SEQUENTIAL)
**Duration**: 2-3 hours  
**Sequential**: Schema must come first, then scripts

- [ ] **T008** Create SQLite database schema in `content-inventory/schema/schema.sql`
  - 16 entities with relationships
  - Foreign key constraints
  - Indexes for performance
  - Audit triggers
  - ⚠️ **RECOMMENDED**: Test schema with sample INSERT/SELECT queries before proceeding

**MINI-GATE**: Schema validated → Proceed to scripts

- [ ] **T009** Create PowerShell script `scripts/init-database.ps1`
- [ ] **T010** Create PowerShell script `scripts/export-inventory.ps1`

**GATE**: Database initialization works → Proceed to Wave 3

---

### Wave 3: Templates (PARALLEL - RECOMMENDED EARLY)
**Duration**: 1-2 hours  
**Parallel**: All 5 templates can run simultaneously  
**Rationale**: Templates inform content standards (T021) and agent design

- [ ] **T041** [P] Create pillar template in `templates/pillar-template.md`
- [ ] **T042** [P] Create learning path template in `templates/learning-path-template.md`
- [ ] **T043** [P] Create course template in `templates/course-template.md`
- [ ] **T044** [P] Create module template in `templates/module-template.md`
- [ ] **T045** [P] Create lesson template in `templates/lesson-template.md`

**GATE**: Templates complete → Proceed to Wave 4

---

### Wave 4: Custom Instructions (PARALLEL - MUST COME BEFORE AGENTS)
**Duration**: 2-3 hours  
**Parallel**: All 3 instructions can run simultaneously  
**⚠️ CRITICAL**: These MUST be complete before T011-T019 (agents reference them)

- [ ] **T020** [P] Create global standards custom instruction in `.github/instructions/global-standards.instructions.md`
  - Use templates from Wave 3 as examples
  - Define frontmatter requirements
  - Database operation standards
  - Handoff protocol reference

- [ ] **T021** [P] Create content standards custom instruction in `.github/instructions/content-standards.instructions.md`
  - Use templates from Wave 3 for frontmatter schemas
  - Define tagging conventions
  - Directory structure rules
  - Status values

- [ ] **T022** [P] Create handoff protocol custom instruction in `.github/instructions/handoff-protocol.instructions.md`
  - 9 required components
  - Context passing requirements
  - Approval checkpoint format
  - State transitions

**GATE**: All 3 custom instructions complete → Proceed to Wave 5

---

### Wave 5: Phase 1 Agents (PARALLEL)
**Duration**: 3-4 hours  
**Parallel**: All 3 agents can run simultaneously  
**Dependencies**: Requires Wave 4 (custom instructions) complete

- [ ] **T011** [P] Create Content Strategist chat mode in `.github/chatmodes/content-strategist.chatmode.md`
- [ ] **T012** [P] Create SME chat mode in `.github/chatmodes/sme.chatmode.md`
- [ ] **T013** [P] Create Librarian chat mode in `.github/chatmodes/librarian.chatmode.md`

**⚠️ MINI-VALIDATION CHECKPOINT** (Recommended):
- Load `@content-strategist` in VS Code chat
- Ask it to propose a pillar for "Excel Data Analysis"
- Verify: demand analysis, scope definition, handoff message format
- If quality issues: fix before proceeding to Wave 6

**GATE**: Phase 1 agents validated → Proceed to Wave 6

---

### Wave 6: Phase 2 Agents (PARALLEL)
**Duration**: 5-6 hours  
**Parallel**: All 6 agents can run simultaneously  
**Dependencies**: Requires Wave 4 (custom instructions) complete

- [ ] **T014** [P] Create Scriptwriter chat mode in `.github/chatmodes/scriptwriter.chatmode.md`
- [ ] **T015** [P] Create Editor chat mode in `.github/chatmodes/editor.chatmode.md`
- [ ] **T016** [P] Create Community Manager chat mode in `.github/chatmodes/community-manager.chatmode.md`
- [ ] **T017** [P] Create SEO Lead chat mode in `.github/chatmodes/seo-lead.chatmode.md`
- [ ] **T018** [P] Create QA Reviewer chat mode in `.github/chatmodes/qa-reviewer.chatmode.md`
- [ ] **T019** [P] Create Monitoring Specialist chat mode in `.github/chatmodes/monitoring-specialist.chatmode.md`

**GATE**: All 9 agents complete → Proceed to Wave 7

---

### Wave 7: Prompt Files (PARALLEL)
**Duration**: 4-6 hours  
**Parallel**: All 8 prompts can run simultaneously  
**Dependencies**: Agents (Wave 5-6) exist for context, but not strictly required

- [ ] **T023** [P] Create define pillar prompt in `.github/prompts/define-pillar.prompt.md`
- [ ] **T024** [P] Create define learning path prompt in `.github/prompts/define-learning-path.prompt.md`
- [ ] **T025** [P] Create validate technical scope prompt in `.github/prompts/validate-technical-scope.prompt.md`
- [ ] **T026** [P] Create lesson brief prompt in `.github/prompts/create-lesson-brief.prompt.md`
- [ ] **T027** [P] Create content review prompt in `.github/prompts/perform-content-review.prompt.md`
- [ ] **T028** [P] Create handoff summary prompt in `.github/prompts/handoff-summary.prompt.md`
- [ ] **T029** [P] Create catalog content prompt in `.github/prompts/catalog-content.prompt.md`
- [ ] **T030** [P] Create check for updates prompt in `.github/prompts/check-for-updates.prompt.md`

**GATE**: All configuration complete → Proceed to Wave 8

---

### Wave 8: Workflow Documentation (SEQUENTIAL)
**Duration**: 3-4 hours  
**Sequential**: Handoff protocol must come first, then stage gates and flow

- [ ] **T031** Create handoff protocol guide in `docs/001-i-need-to/plan/workflows/handoff-protocol.md`
  - Reference T022 (handoff protocol instruction) as source
  - Include 3-5 complete examples

**MINI-GATE**: Handoff protocol documented → Proceed to other workflows

- [ ] **T032** Create stage gates guide in `docs/001-i-need-to/plan/workflows/stage-gates.md`
- [ ] **T033** Create agent flow diagram and narrative in `docs/001-i-need-to/plan/workflows/agent-flow.md`

**GATE**: Workflow documentation complete → Proceed to Wave 9

---

### Wave 9: Example Scenarios (PARALLEL)
**Duration**: 2-3 hours  
**Parallel**: All 3 scenarios can run simultaneously  
**Dependencies**: Requires T031 (handoff protocol) for message format

- [ ] **T034** [P] Create scenario: pillar creation in `docs/001-i-need-to/plan/examples/scenario-01-create-pillar.md`
- [ ] **T035** [P] Create scenario: rejection flow in `docs/001-i-need-to/plan/examples/scenario-02-rejection-flow.md`
- [ ] **T036** [P] Create scenario: multi-agent collaboration in `docs/001-i-need-to/plan/examples/scenario-03-multi-agent-collaboration.md`

**GATE**: Example scenarios complete → Proceed to Wave 10

---

### Wave 10: Quickstart Guide (SEQUENTIAL)
**Duration**: 1-2 hours  
**Dependencies**: Requires all configuration and documentation complete

- [ ] **T037** Create quickstart validation guide in `specs/001-i-need-to/quickstart.md`
  - 12-step pillar approval cycle
  - Expected outputs at each step
  - Troubleshooting tips

**GATE**: Quickstart ready → Proceed to Wave 11

---

### Wave 11: Remaining PowerShell Scripts (SEQUENTIAL)
**Duration**: 2-3 hours  
**Dependencies**: Requires T008 (database schema)

- [ ] **T038** Create database initialization script `scripts/init-database.ps1`
- [ ] **T039** Create inventory export script `scripts/export-inventory.ps1`
- [ ] **T040** Create Obsidian mirror generation script `scripts/generate-obsidian-mirror.ps1` (optional)

**GATE**: All scripts complete → Proceed to Wave 12 (VALIDATION)

---

### Wave 12: VALIDATION (SEQUENTIAL - HUMAN TIME REQUIRED)
**Duration**: 3-4 hours (manual testing)  
**Sequential**: Each validation builds on previous  
**⚠️ CRITICAL GATE**: Failures here require rework of earlier waves

- [ ] **T046** Execute manual test plan following `specs/001-i-need-to/quickstart.md`
  - Test database initialization
  - Test Content Strategist pillar proposal
  - Test SME validation
  - Test Librarian cataloging
  - Test database queries
  - Test JSON export
  - **Document issues** in `specs/001-i-need-to/test-results.md`

**MINI-GATE**: Manual test passes → Proceed to agent quality validation

- [ ] **T047** Validate agent response quality
  - Test each of 9 agents with sample inputs
  - Verify output format matches specs
  - Check handoff messages have all 9 components
  - **Create checklist** in `docs/001-i-need-to/plan/validation-checklist.md`

**MINI-GATE**: Agent quality acceptable → Proceed to database validation

- [ ] **T048** Validate database schema and operations
  - Execute sample queries (retrieve pillars, query by tag, trace prerequisites)
  - Verify foreign key constraints work
  - Verify indexes improve performance
  - Verify triggers update timestamps
  - **Document results** in `content-inventory/schema/validation-report.md`

**CRITICAL GATE**: All validation passes → Proceed to Wave 13 (FINAL)

**IF VALIDATION FAILS**: Return to relevant wave to fix issues, then re-validate

---

### Wave 13: Integration & Finalization (SEQUENTIAL)
**Duration**: 2-3 hours  
**Sequential**: Final documentation and context updates

- [ ] **T049** Create GitHub Projects setup guide in `docs/001-i-need-to/plan/integration/github-projects-setup.md`
- [ ] **T050** Create Obsidian integration guide in `docs/001-i-need-to/plan/integration/obsidian-vault-setup.md`
- [ ] **T051** Update project agent context file
  - Add VS Code chat mode features
  - Add agent personas and handoff protocol
  - Add key decisions from research.md
  - Add file naming conventions
  - Update `.github/copilot-instructions.md` or similar

**FINAL GATE**: All tasks complete, system validated and documented

---

## Summary of Wave Structure

| Wave | Duration | Type | Tasks | Key Focus |
|------|----------|------|-------|-----------|
| 0 | 5 min | Sequential | 1 | Foundation directory |
| 1 | 15 min | Parallel | 6 | Complete directory structure |
| 2 | 2-3 hrs | Sequential | 3 | Database foundation |
| 3 | 1-2 hrs | Parallel | 5 | Content templates |
| 4 | 2-3 hrs | Parallel | 3 | **Custom instructions (CRITICAL)** |
| 5 | 3-4 hrs | Parallel | 3 | Phase 1 agents + validation |
| 6 | 5-6 hrs | Parallel | 6 | Phase 2 agents |
| 7 | 4-6 hrs | Parallel | 8 | Prompt files |
| 8 | 3-4 hrs | Sequential | 3 | Workflow documentation |
| 9 | 2-3 hrs | Parallel | 3 | Example scenarios |
| 10 | 1-2 hrs | Sequential | 1 | Quickstart guide |
| 11 | 2-3 hrs | Sequential | 3 | Remaining scripts |
| 12 | 3-4 hrs | Sequential | 3 | **VALIDATION (GATE)** |
| 13 | 2-3 hrs | Sequential | 3 | Integration & finalization |

**Total Duration**: ~32-44 hours sequential | ~18-22 hours with optimal parallelization

**Critical Path**: Wave 0 → Wave 1 → Wave 2 → Wave 4 → Wave 5 → Wave 8 → Wave 10 → Wave 12 → Wave 13 (~15-18 hours minimum)

---

## Parallel Execution Examples

### Setup Phase (can run together after T001):
```
Task: "Create .github/instructions/ directory"
Task: "Create .github/prompts/ directory"
Task: "Create content-inventory/ directory with subdirectories"
Task: "Create docs/001-i-need-to/plan/ directory with subdirectories"
Task: "Create scripts/ directory"
Task: "Create templates/ directory"
```

### Phase 1 Agents (can run together after T001):
```
Task: "Create Content Strategist chat mode in .github/chatmodes/content-strategist.chatmode.md"
Task: "Create SME chat mode in .github/chatmodes/sme.chatmode.md"
Task: "Create Librarian chat mode in .github/chatmodes/librarian.chatmode.md"
```

### Phase 2 Agents (can run together after T001):
```
Task: "Create Scriptwriter chat mode in .github/chatmodes/scriptwriter.chatmode.md"
Task: "Create Editor chat mode in .github/chatmodes/editor.chatmode.md"
Task: "Create Community Manager chat mode in .github/chatmodes/community-manager.chatmode.md"
Task: "Create SEO Lead chat mode in .github/chatmodes/seo-lead.chatmode.md"
Task: "Create QA Reviewer chat mode in .github/chatmodes/qa-reviewer.chatmode.md"
Task: "Create Monitoring Specialist chat mode in .github/chatmodes/monitoring-specialist.chatmode.md"
```

### Custom Instructions (can run together after T001):
```
Task: "Create global standards custom instruction in .github/instructions/global-standards.instructions.md"
Task: "Create content standards custom instruction in .github/instructions/content-standards.instructions.md"
Task: "Create handoff protocol custom instruction in .github/instructions/handoff-protocol.instructions.md"
```

### Prompt Files (can run together after T003):
```
Task: "Create define pillar prompt in .github/prompts/define-pillar.prompt.md"
Task: "Create define learning path prompt in .github/prompts/define-learning-path.prompt.md"
Task: "Create validate technical scope prompt in .github/prompts/validate-technical-scope.prompt.md"
Task: "Create lesson brief prompt in .github/prompts/create-lesson-brief.prompt.md"
Task: "Create content review prompt in .github/prompts/perform-content-review.prompt.md"
Task: "Create handoff summary prompt in .github/prompts/handoff-summary.prompt.md"
Task: "Create catalog content prompt in .github/prompts/catalog-content.prompt.md"
Task: "Create check for updates prompt in .github/prompts/check-for-updates.prompt.md"
```

### Example Scenarios (can run together after T031-T033):
```
Task: "Create scenario: pillar creation in docs/001-i-need-to/plan/examples/scenario-01-create-pillar.md"
Task: "Create scenario: rejection flow in docs/001-i-need-to/plan/examples/scenario-02-rejection-flow.md"
Task: "Create scenario: multi-agent collaboration in docs/001-i-need-to/plan/examples/scenario-03-multi-agent-collaboration.md"
```

### Content Templates (can run together after T007):
```
Task: "Create pillar template in templates/pillar-template.md"
Task: "Create learning path template in templates/learning-path-template.md"
Task: "Create course template in templates/course-template.md"
Task: "Create module template in templates/module-template.md"
Task: "Create lesson template in templates/lesson-template.md"
```

---

## Notes
- **[P] tasks** = different files, no dependencies, safe to run in parallel
- **Meta-development focus**: This feature builds agent infrastructure (chat modes, prompts, handoff mechanisms), not curriculum content
- **Configuration-based**: Most tasks are authoring Markdown files, not writing code
- **Validation approach**: Manual testing via quickstart scenario (pillar approval cycle)
- **Commit after each task**: Maintain atomic changes for easy rollback
- **Template files available**: Use TEMPLATE-chatmode.md, TEMPLATE-global-standards.instructions.md, TEMPLATE-define-pillar.prompt.md as references

## Task Generation Rules
*Applied during main() execution*

1. **From Plan Design**:
   - Each agent specification → chat mode creation task [P]
   - Each custom instruction type → instruction file task [P]
   - Each workflow type → prompt file task [P]
   
2. **From Data Model**:
   - All entities → single database schema task (T008)
   - Database → initialization script (T009), export script (T010)
   
3. **From Quickstart**:
   - Quickstart scenario → validation task (T037)
   - Agent interactions → quality validation task (T047)

4. **Ordering**:
   - Setup → Configuration → Documentation → Validation → Integration
   - Dependencies block parallel execution (see Dependencies section)

## Validation Checklist
*GATE: Checked before marking implementation complete*

- [ ] All 9 agent chat modes created with correct frontmatter and structure
- [ ] All 3 custom instructions created with applyTo patterns
- [ ] All 8 prompt files created with mode associations
- [ ] Database schema includes all 16 entities with constraints
- [ ] PowerShell scripts have parameter validation and error handling
- [ ] All 5 content templates created with frontmatter schemas
- [ ] Workflow documentation complete (handoff protocol, stage gates, agent flow)
- [ ] 3 example scenarios demonstrate agent interactions
- [ ] Quickstart guide enables pillar approval cycle validation
- [ ] Manual test plan executed successfully (T046)
- [ ] Agent response quality validated per checklist (T047)
- [ ] Database schema validated with sample queries (T048)
- [ ] Integration guides created (GitHub Projects, Obsidian)
- [ ] Project agent context updated with meta-development decisions

---

**Total Tasks**: 51
**Estimated Duration**: 
- Critical Path (sequential): ~25-30 hours
- With Parallel Execution: ~15-20 hours
**Key Milestones**:
- M1: Directory structure complete (T001-T007)
- M2: Database foundation ready (T008-T010)
- M3: All agent chat modes complete (T011-T019)
- M4: Configuration complete (T020-T030)
- M5: Documentation complete (T031-T037)
- M6: Templates ready (T038-T045)
- M7: Validation passed (T046-T048)
- M8: Integration complete (T049-T051)

**Next Command**: Follow the 13-wave execution sequence above. Begin with Wave 0 (T001), then proceed through each wave's gate before advancing.

**CRITICAL REMINDERS**:
1. ⚠️ **Wave 4 (Custom Instructions) MUST complete before Wave 5-6 (Agents)**
2. ⚠️ **Mini-validation after Wave 5 (Phase 1 Agents) is strongly recommended**
3. ⚠️ **Wave 12 (Validation) is a HARD GATE - failures require rework**
4. Templates (Wave 3) inform standards (Wave 4) - do them early
5. Test database schema (Wave 2) before proceeding to scripts
