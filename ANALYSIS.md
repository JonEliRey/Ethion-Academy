# Workspace Deep-Dive Analysis

Date: 2025-10-23

This document is a persistent knowledge log created during a comprehensive, content-level review of the entire repository. It summarizes the purpose, key directives, relationships, and status of each file to build a durable understanding of the project as context grows.

Conventions:
- Purpose: primary role of the file
- Key Directives: critical instructions, requirements, rules
- Relationships: dependencies/references to other files
- Status & Recency: draft/final/archived and dates if available

---

## `/CONSTITUTION.md`

- Purpose: Redirects to the authoritative constitution location so agents load rules automatically.
- Key Directives: States that the constitution now lives at `.github/instructions/constitution.instructions.md`.
- Relationships: Points to `.github/instructions/constitution.instructions.md` as source of truth.
- Status & Recency: Redirect stub; Last updated: 2025-10-01.

## `/Plan-information.md`

- Purpose: Provides input context for the plan stage about VS Code Copilot customization features (custom instructions, chat modes, prompt files) and how they’re used in this project.
- Key Directives:
	- Custom instructions live in `.github/instructions/` and use frontmatter with `description` and `applyTo`.
	- Chat modes implement 9 personas under `.github/chatmodes/` with defined tools and behaviors.
	- Prompt files live in `.vscode/prompts/` with frontmatter including `mode` and `description`.
	- Notes links to Copilot docs and Fabric patterns for agent design.
- Relationships: References `.github/instructions/`, `.github/chatmodes/`, and `.vscode/prompts/` directories; cites Fabric patterns and Beastmode gist.
- Status & Recency: Reference guidance; current as of 2025-10-01.

## `/.github/chatmodes/content-strategist.chatmode.md`

- Purpose: Defines the Content Strategist agent to analyze demand and define pillars and learning paths.
- Key Directives:
  - Perform multi-source demand analysis (trends, jobs, community, competitors).
  - Propose pillars/paths with clear scope, audience, outcomes, and evidence.
  - Prepare structured handoff to SME using standard protocol.
- Relationships: Hands off to `@sme`; references standard handoff protocol and tags/audience conventions.
- Status & Recency: Versioned content with examples; last updated 2025-01-15 per file footer.

## `/.github/chatmodes/sme.chatmode.md`

- Purpose: Defines the SME validator agent to ensure technical accuracy, prerequisites, and source freshness.
- Key Directives:
  - Verify all claims against official docs; check versions/deprecations.
  - Produce a structured validation report with APPROVED/REVISION status.
  - Map prerequisites and identify missing critical topics; prepare handoff.
- Relationships: Receives from Content Strategist/Scriptwriter; hands off to Executive Producer, Scriptwriter, or back to Strategist.
- Status & Recency: Includes example validation reports; last updated 2025-01-15.

## `/.github/chatmodes/scriptwriter.chatmode.md`

- Purpose: Defines Scriptwriter agent to create lesson outlines, YouTube and blog briefs, including Leader’s Lens.
- Key Directives:
  - Draft measurable objectives, detailed sections, practice exercises, and citations.
  - Produce platform-specific briefs with visuals and CTAs; cross-reference related lessons.
  - Handoff to Editor with a quality checklist.
- Relationships: Consumes SME-approved scope; hands off to `@editor`; aligns with content standards.
- Status & Recency: Extensive examples and templates; last updated 2025-01-15.

## `/.github/chatmodes/editor.chatmode.md`

- Purpose: Defines Editor agent to enforce standards, clarity, grammar, tags, and cross-references before publication.
- Key Directives:
  - Validate frontmatter and canonical tags; ensure measurable objectives and complete citations.
  - Produce an editorial review report with status and prioritized corrections.
- Relationships: Receives from Scriptwriter; hands off to Scriptwriter or Community Manager; references `.github/instructions/content-standards.instructions.md` and global standards.
- Status & Recency: Includes structured review template; last updated 2025-01-15.

## `/.github/chatmodes/community-manager.chatmode.md`

- Purpose: Defines Community Manager agent to optimize engagement, CTAs, prompts, and funnel alignment.
- Key Directives:
  - Optimize titles/hooks; craft platform-specific CTAs; design engagement prompts.
  - Map content to funnel stages and define cross-promotion path (YouTube → Blog → Academy).
- Relationships: Receives from Editor; hands off to `@seo-lead` for discoverability; tracks engagement metrics.
- Status & Recency: Strategy checklists and examples; last updated 2025-01-15.

## `/.github/chatmodes/seo-lead.chatmode.md`

- Purpose: Defines SEO Lead agent to perform keyword research, optimize metadata, and validate content structure for discoverability.
- Key Directives:
  - Research primary/secondary/long-tail keywords with volume/difficulty.
  - Optimize titles/descriptions/tags; ensure search intent alignment.
  - Recommend structure for featured snippets and internal linking.
- Relationships: Receives from Community Manager; hands off to QA Reviewer.
- Status & Recency: Includes workflow and quality criteria; last updated 2025-01-15.

## `/.github/chatmodes/qa-reviewer.chatmode.md`

- Purpose: Defines QA Reviewer agent as the final quality gate to ensure zero defects before approval.
- Key Directives:
  - Run comprehensive quality checklist and strict link validation.
  - Produce pass/fail QA report and route to Exec Producer or back for fixes.
- Relationships: Receives from SEO Lead; hands off to Executive Producer or previous agent.
- Status & Recency: Provides report template and criteria; last updated 2025-01-15.

## `/.github/chatmodes/librarian.chatmode.md`

- Purpose: Defines Librarian agent to catalog content in SQLite, manage tags, prerequisites, and cross-references; generate exports/reports.
- Key Directives:
  - Enforce canonical tags and referential integrity; avoid cataloging drafts.
  - Create prerequisite links and related content reports; export to JSON.
- Relationships: Works after Executive Producer approval; reports to requestor/EP; uses `content-inventory/content.db` and scripts/exports.
- Status & Recency: Contains SQL/PowerShell snippets and reports; last updated 2025-01-15.

## `/.github/chatmodes/monitoring-specialist.chatmode.md`

- Purpose: Defines Monitoring Specialist agent to track official source changes, detect deprecations/breaking changes, and raise update alerts.
- Key Directives:
  - Crawl sources, compare versions, detect “deprecated/new/breaking change,” map to content by tags/keywords.
  - Prioritize updates (critical→low) and propose concrete revisions; generate alert handoffs.
- Relationships: Hands off to Content Strategist and Executive Producer for prioritization; aligns with freshness SLAs.
- Status & Recency: Inspired by Beastmode recursive research; last updated 2025-01-15.

## `/.github/instructions/content-standards.instructions.md`

- Purpose: Defines frontmatter schemas, tagging conventions, directory structure, status values, plain-language guidelines, and a quality checklist for all content files.
- Key Directives:
  - Mandatory frontmatter per level (Pillar, Path, Course, Module, Lesson) with required fields and examples.
  - Canonical tag taxonomy across role, level, topic, format, source_type, tech_stack; enforce hierarchy and consistency.
  - Hierarchical directory rules and README requirements at each level.
- Relationships: Referenced by Editor, Scriptwriter, Librarian; complements global standards and handoff protocol.
- Status & Recency: Comprehensive reference; last updated 2025-01-15.

## `/.github/instructions/global-standards.instructions.md`

- Purpose: Project-wide conventions for frontmatter presence, DB safety practices, handoff protocol adherence, naming, version control, code quality for PowerShell, testing/validation, documentation, error handling, logging, and security.
- Key Directives:
  - Enforce parameterized SQL, transactions, UUIDs; never commit secrets; use `.gitignore` for sensitive files.
  - Use standard file naming and Conventional Commits; maintain READMEs and inline comments.
  - Follow testing steps and validation checklists; use handoff protocol template.
- Relationships: Points to content standards and handoff protocol; used by all agents and scripts.
- Status & Recency: Up-to-date foundational standards; last updated 2025-01-15.

## `/.github/instructions/handoff-protocol.instructions.md`

- Purpose: Defines the required 9-component handoff message template, context passing, return-to-human conditions, approval checkpoints, valid sequences, rollback procedure, and examples.
- Key Directives:
  - Handoffs must include From, To, Reason, Context, Deliverables, Target Tasks, Expected Output, Success Criteria, and Exec Producer instruction.
  - Provide explicit templates for approval checkpoints, error handoffs, circular loop detection, and rollback with quality-gate failures.
- Relationships: Consumed by all chatmodes; referenced in global and content standards.
- Status & Recency: Thorough protocol with examples; last updated 2025-01-15.

## `/.github/prompts/validate-technical-scope.prompt.md`

- Purpose: SME-focused reusable prompt to drive technical validation of proposals with steps for verification, gap analysis, prereqs, source freshness, report, and handoff.
- Key Directives: Verify against official docs, identify missing topics, validate prerequisites and freshness, produce report, and prepare handoff.
- Relationships: Used by `@sme`; aligns with SME chatmode workflow and handoff protocol.
- Status & Recency: Active reusable prompt.

## `/.github/prompts/define-pillar.prompt.md`

- Purpose: Content Strategist prompt guiding pillar definition via demand analysis, scope setting, sources, proposal, and handoff to SME.
- Key Directives: Require 3+ demand sources with metrics; explicit included/excluded scope; target audience; citations.
- Relationships: Used by `@content-strategist`; outputs pillar proposal for SME validation.
- Status & Recency: Active prompt with example interaction.

## `/.github/prompts/create-lesson-brief.prompt.md`

- Purpose: Scriptwriter prompt to create lesson outline, video brief, blog brief, Leader’s Lens, and handoff to Editor.
- Key Directives: Measurable objectives, section timings, practice exercises with success criteria, SEO keywords, CTAs, citations.
- Relationships: Used by `@scriptwriter`; relies on SME-approved scope and Editor review.
- Status & Recency: Active with quality checklist and example.

## `/.github/prompts/catalog-content.prompt.md`

- Purpose: Librarian prompt to catalog approved content, assign canonical tags, link prerequisites, find related items, write to DB, export JSON, and handoff.
- Key Directives: Validate approval status; parameterized SQL only; verify insert and export.
- Relationships: Used by `@librarian`; depends on `content-inventory/content.db` and scripts.
- Status & Recency: Active prompt.

## `/.github/prompts/check-for-updates.prompt.md`

- Purpose: Monitoring Specialist prompt to query sources, fetch docs, detect changes, identify affected content, prioritize, alert, and handoff.
- Key Directives: Version/deprecation/breaking change detection; map to tech_stack tags; justify priorities; propose specific updates.
- Relationships: Used by `@monitoring-specialist`; ties into Librarian inventory and Strategist update planning.
- Status & Recency: Active prompt.

## `/.github/prompts/clarify.prompt.md`

- Purpose: Run pre-plan clarifications with up to 5 targeted questions and integrate answers directly into the active feature spec under a dated Clarifications section.
- Key Directives: Enforce question constraints, integrate each answer immediately, validate structure, and report coverage summary and next steps.
- Relationships: Executes `.specify/scripts/powershell/check-prerequisites.ps1` to locate feature spec; updates spec in place.
- Status & Recency: Detailed procedure-oriented prompt.

## `/specs/001-i-need-to/spec.md`

- Purpose: Authoritative feature specification for the Super-Intelligent Course Designer meta-development system; defines stage-gated workflow, personas, functional requirements, entities, and governance.
- Key Directives:
  - Deliver the agent system itself (not content) with stage gates Pillars → Paths → Courses → Modules → Lessons and explicit human approvals.
  - Implement multi-persona chatmodes, handoff protocol, content inventory in SQLite, monitoring cadence, tagging/taxonomy, and funnel mapping.
  - MVP phases, export requirements, governance/licensing, SEO strategy, directory structure, post-recording alignment.
- Relationships: Drives plans in `/specs/001-i-need-to/plan.md`; informs `.github/chatmodes/*`, `.github/instructions/*`, `content-inventory/schema/schema.sql`.
- Status & Recency: Draft but comprehensive and current.

## `/specs/001-i-need-to/plan.md`

- Purpose: Implementation plan for building the agent system: data model, agent specs, workflows, examples, schema, quickstart, and custom instructions.
- Key Directives:
  - Define nine chatmodes, prompts, and instructions; SQLite schema; scripts; documentation layout; validation approach and phases.
  - Constitution checks for simplicity/testability; task generation strategy and parallelization hints.
- Relationships: Executes `spec.md`; references tools/dirs across `.github`, `content-inventory`, `docs/Reference/plan`.
- Status & Recency: Detailed, with phases and progress tracking checklists.

## `/specs/002-data-generation-agent/spec.md`

- Purpose: Specification for a Data Generation Agent to produce sample datasets (Excel/CSV/Parquet/SQL) aligned to lesson/module needs.
- Key Directives:
  - Support multiple formats and complexity levels; generate Python or SQL scripts to create data; store outputs in `content-inventory/sample-data/`.
  - Define chatmode at `.github/chatmodes/data-generation.chatmode.md` and prompts in `.github/prompts/data-generation/`.
- Relationships: Complements Scriptwriter and Librarian flows by supplying realistic datasets for lessons.
- Status & Recency: In-progress as of 2025-10-04; chatmode/prompt files pending.

## `/docs/Reference/plan/workflows/handoff-protocol.md`

- Purpose: Practitioner-oriented guide for composing compliant agent-to-agent handoffs using the 9-component protocol, with valid/forbidden transitions, return-to-human conditions, quality gates, and a full example.
- Key Directives:
  - Every handoff must include From, To, Reason, Context Summary, Deliverables, What Target Should Do, Expected Output, Success Criteria, and Executive Producer instruction.
  - Follow valid state sequences (e.g., Content Strategist → SME → Executive Producer → Librarian) and avoid forbidden transitions (e.g., Librarian → Content Strategist).
  - Apply quality gates before any handoff: attach deliverables, complete context, specific tasks, measurable criteria, and confirm source agent completed their scope.
- Relationships: Points to `.github/instructions/handoff-protocol.instructions.md` as the authoritative specification; referenced by all chatmodes and approval checkpoints.
- Status & Recency: Current guide with explicit templates and examples.

## `/docs/Reference/plan/workflows/stage-gates.md`

- Purpose: Defines the approval checkpoints for each lifecycle level (Pillar → Path → Course → Module → Lesson → Production Ready) with criteria, decision options, and example outcomes.
- Key Directives:
  - Gate-specific checklists (demand justification, scope clarity, audience, SME validation, outcomes, assessment, cohesion, practice, citations, SEO, QA) culminating in production readiness.
  - Decision triad per gate: Approve, Revise, Reject, with templates for presenting to Executive Producer.
  - Includes rejection scenarios with actionable feedback (insufficient demand, technical inaccuracy, quality below standard).
- Relationships: Used by Executive Producer and upstream agents when requesting approval; complements handoff protocol template; reinforces content standards.
- Status & Recency: Clear, actionable criteria aligned with personas and workflow.

## `/docs/Reference/plan/workflows/agent-flow.md`

- Purpose: Visual and textual map of the end-to-end agent lifecycle across Strategic Planning, Content Creation, and Maintenance & Monitoring, including decision trees and typical/edge paths.
- Key Directives:
  - Phase 1 (Strategic): Content Strategist → SME → Executive Producer; on approval, Librarian catalogs; on rejection, return with specific feedback.
  - Phase 2 (Creation): Scriptwriter → Editor → Community Manager → SEO Lead → QA → Executive Producer → Librarian (final catalog/export).
  - Phase 3 (Maintenance): Monitoring Specialist detects updates and loops back to Strategist/SME, then through standard creation pipeline.
  - Decision trees for pillar and lesson approvals; time estimates for common paths and rework cycles.
- Relationships: Cross-references `handoff-protocol.md` and `stage-gates.md`; aligns with chatmode definitions and approval checkpoints.
- Status & Recency: Complete flow reference with ASCII diagrams and estimates; consistent with current standards.

## `/content-inventory/schema/schema.sql`

- Purpose: SQLite schema defining the complete content inventory data model for pillars → paths → courses → modules → lessons, assets, tags, sources, demand signals, update alerts, prerequisites, approvals, and agent action audit.
- Key Directives:
  - Enforces statuses via CHECK constraints; cascades for hierarchy; JSON fields for arrays (objectives, outcomes, topics, etc.).
  - Comprehensive indexing for hierarchy, status, tags, sources, alerts, prerequisites, agent actions, and approvals.
  - Triggers keep updated_at timestamps fresh across core tables; SchemaVersion table pinned to 1.0.0.
- Relationships: Consumed by `scripts/init-database.ps1` and librarian flows; referenced by prompts and chatmodes that catalog/export content.
- Status & Recency: Version 1.0.0, created 2025-10-01; aligns with spec and stage gates.

## `/scripts/init-database.ps1`

- Purpose: Initialize or recreate the SQLite DB by executing `schema.sql`, with optional -Force destructive rebuild; verifies tables post-run.
- Key Directives:
  - Supports sqlite3 CLI primary path; falls back to System.Data.SQLite if CLI missing.
  - Safe path resolution relative to repo root; interactive confirmation when DB exists unless `-Force`.
  - Prints created tables and next steps; creates database directory if absent.
- Relationships: Depends on `content-inventory/schema/schema.sql`; precedes export script and librarian usage.
- Status & Recency: Version 1.0.0; robust error handling and user messaging; Windows/PowerShell friendly.

## `/scripts/export-inventory.ps1`

- Purpose: Export selected entities (or all) from SQLite to JSON or simple YAML in `content-inventory/exports` for diffs/integration.
- Key Directives:
  - Entity set includes Pillars, Paths, Courses, Modules, Lessons, Assets, Tags, Sources; pretty JSON by default; basic YAML via JSON serialization.
  - Uses sqlite3 with -json when available, else falls back to System.Data.SQLite; creates output directory as needed.
  - Reports counts and file list; skips empty exports gracefully.
- Relationships: Reads from `content-inventory/content.db` created via init script; outputs feed docs/obsidian integration and librarian workflows.
- Status & Recency: Version 1.0.0; operational and aligned with schema entities.

## `/docs/agent-development/blueprint/01-agent-design-principles.md`

- Purpose: Core design principles for observable, iterative, verifiable, tool-first autonomous agents with a standard lifecycle.
- Key Directives: Tool-first execution, transparency, iterative externalization, deterministic lifecycle, deep context, continuous verification, reproducibility, failure visibility; lifecycle Phases 0–8 and artifacts table.
- Relationships: Foundation for all blueprint modules; informs personas, prompts, and execution patterns.
- Status & Recency: Active v1.0.0 (2025-10-06).

## `/docs/agent-development/blueprint/02-autonomous-execution-behavior.md`

- Purpose: Defines the execution state machine, transition rules, batch management, verification gates, failure/recovery, and observability signals.
- Key Directives: Enforce state evidence via tool calls + working file updates; mandatory verification checkpoints and batch boundaries.
- Relationships: Implements principles (01) and ties into working file (03) and QA gates (07).
- Status & Recency: Active v1.0.0 (2025-10-06).

## `/docs/agent-development/blueprint/03-working-file-lifecycle-standard.md`

- Purpose: Contract for ephemeral working files including naming, required sections/anchors, update cadence by phase, validation checklist, and completion protocol.
- Key Directives: Mandatory anchors (Batch N, Dimension, Verification Gate, etc.); strict creation before Phase 1; delete after migration with safeguards.
- Relationships: Used by research modes and any long-running agent tasks; complements execution behavior.
- Status & Recency: Active v1.0.0 (2025-10-06).

## `/docs/agent-development/blueprint/04-deep-context-acquisition.md`

- Purpose: Layered approach to move from structure to entities, relationships, behavior, and strategy with dimension planning and contradiction handling.
- Key Directives: Breadth-before-depth, domain diversity, saturation criteria, contradiction templates, extraction quality metrics.
- Relationships: Integrates with verification gates and working file anchors; informs research agents.
- Status & Recency: Active v1.0.0 (2025-10-06).

## `/docs/agent-development/blueprint/05-tool-usage-patterns.md`

- Purpose: Canonical patterns for tool invocation, sequencing, guards against misuse, and recipes by phase.
- Key Directives: Phase-by-phase allowed/forbidden tools; guardrails for cadence, redundancy, and escalation protocol.
- Relationships: Operationalizes principles (01) and execution (02); reinforces working file updates (03).
- Status & Recency: Active v1.0.0 (2025-10-06).

## `/docs/agent-development/blueprint/06-research-mode-structure-blueprint.md`

- Purpose: Defines quick/learning/deep research modes with phase expectations, artifacts, gates, and output structure.
- Key Directives: Mode selection decision tree; phase success criteria; risk mitigations; deep-mode dimension loops.
- Relationships: Drives Research directory conventions and research chatmodes; pairs with QA (07).
- Status & Recency: Active v1.0.0 (2025-10-06).

## `/docs/agent-development/blueprint/07-quality-assurance-and-self-checks.md`

- Purpose: Objective quality gates (G1–G5) and mandatory self-check framework with metrics dashboard and failure handling.
- Key Directives: Enforce claim integrity, diversity, structural readiness, artifact parity; finalize only when all critical checks pass.
- Relationships: Consumed across all modes; referenced in execution and working file standards.
- Status & Recency: Active v1.0.0 (2025-10-06).

## `/docs/agent-development/blueprint/08-contribution-and-evolution-process.md`

- Purpose: Governance for evolving the blueprint via RFCs, change categories, deprecation policy, archival procedure, and version ledger.
- Key Directives: MAJOR/MINOR/PATCH categories, RFC template, quarterly audits, integrity safeguards.
- Relationships: Ties to orchestration (09) for gap-driven agent evolution; maintains index hygiene.
- Status & Recency: Active v1.0.0 (2025-10-06).

## `/docs/agent-development/blueprint/09-agentic-interaction-and-orchestration.md`

- Purpose: Multi-agent coordination framework with capability manifests, delegation envelopes, response payloads, gap detection, and compliance checks.
- Key Directives: Deterministic delegation protocol, provenance preservation, non-mutation rules, metrics for orchestration health.
- Relationships: Extends handoff protocol and leverages QA and working file standards; feeds governance (08).
- Status & Recency: Active v1.0.0 (2025-10-06).

## `/Research/README.md`

- Purpose: Explains research directory conventions, taxonomy, file naming, frontmatter schema, workflows, and quality standards.
- Key Directives: 3-level taxonomy (Pillar → Path → Subtopic); research types and durations; autonomous save/update behaviors (index and topics list); citation and synthesis standards.
- Relationships: Uses blueprint research modes (06) and integrates with content development via `informed-content` linking.
- Status & Recency: Last updated 2025-10-03; active guidance.

## `/Research/topics-list.md`

- Purpose: Authoritative taxonomy for Pillars, Learning Paths, and Subtopics with naming conventions, approval flow, and change log.
- Key Directives: PascalCase topics; user approval for new Pillars/Paths; deprecation rules; quarterly review.
- Relationships: Referenced by research agents when classifying topics and by content creators for alignment.
- Status & Recency: Last updated 2025-10-04; includes DataGeneration pillar addition.

## `/Research/_index.md`

- Purpose: Auto-updated research catalog by Pillar, Learning Path, Type, and Recent; provides quick stats and file listing.
- Key Directives: Standardized entry format; sections for multiple views; maintained automatically by research agents.
- Relationships: Links into specific research files; complements topics taxonomy.
- Status & Recency: Last updated 2025-10-05; 6 files indexed.

## `/Research/FIXES-APPLIED-2025-10-04.md`

- Purpose: Patch notes documenting fixes to research chatmodes to ensure fully autonomous execution, proper file creation, and citation rigor.
- Key Directives: Enforce use of `create_file`; remove narration pauses; include full URLs in citations; autonomous classification without blocking approvals.
- Relationships: References `.github/chatmodes/*research*.chatmode.md` (not included in this repo view) and aligns with blueprint modules (03, 05, 06, 07).
- Status & Recency: Applied 2025-10-04; ready for testing across research modes.

---

## Final synthesis (cross-file summary)

### Mission

- Deliver a multi-agent, stage-gated Course Designer that plans pillars→paths→courses→modules→lessons, produces briefs for YouTube/blog/academy, catalogs to SQLite with exports, and monitors sources for updates.

### Architecture

- Personas: 9 chatmodes mapped to phases; handoffs standardized (9-component protocol) with stage gates at each level. Research modes extend the system with deep context acquisition and autonomous file creation.
- Data: SQLite schema v1.0.0 covers hierarchy, tagging, sources, demand signals, update alerts, approvals, and agent audit trail; scripts to init and export JSON/YAML.
- Governance: Global/content standards, handoff protocol, blueprint suite (principles, execution, working files, tools, QA, orchestration, evolution) ensure reproducibility and quality.

### Workflow coherence

- Strategic planning: Content Strategist → SME → Executive Producer → Librarian aligns with stage-gates and handoff protocol.
- Creation pipeline: Scriptwriter → Editor → Community → SEO → QA → Executive Producer → Librarian mirrors agent-flow and approval templates.
- Maintenance: Monitoring Specialist triggers update loop; Librarian maintains catalog; exports support downstream uses.

### Discrepancies or gaps

- Research chatmodes referenced in FIXES doc are not visible in repo; confirm presence or add under `.github/chatmodes/` for deep/quick/learning research.
- Data Generation Agent spec exists; chatmode/prompts not yet implemented; create `.github/chatmodes/data-generation.chatmode.md` and prompts under `.github/prompts/data-generation/` per spec.
- YAML export is a JSON-in-YAML wrapper; consider adding powershell-yaml for proper YAML or documenting current limitation in README.
- Seed data and smoke tests for DB not present; add minimal seed script and verification task to validate schema and export flows.
- GitHub Project templates for stage gates/approvals could be added to streamline EP reviews.

### Recommendations (next steps)

- Implement missing agents/prompts:
  - Research chatmodes (deep/quick/learning) per FIXES doc
  - Data Generation Agent chatmode + prompts folder
- Add tooling/docs:
  - `README.md` quickstart for DB init, exports, and persona usage
  - Seed data script and a tiny test that inserts a sample pillar/path/lesson and runs export
  - Clarify YAML export behavior or add powershell-yaml dependency
- Wire governance:
  - Project board templates for stage gates; PR checklist with handoff/QA gates
  - Add CHANGELOG.md and SPEC.md per global standards (if missing in this repo)
- Monitoring enablement:
  - Create initial Sources records and a basic update-check script stub for Monitoring Specialist

### Overall assessment

The repository is coherent and standards-driven; personas, workflows, and blueprint docs align tightly with schema and scripts. Execution appears ready for implementation of the remaining agents (research, data-generation) and for adding operational polish (seed data, tests, README).
