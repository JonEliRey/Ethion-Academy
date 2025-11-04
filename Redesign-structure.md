# Workspace Redesign Strategy and Plan

Date: 2025-10-25
Owner: GitHub Copilot

Purpose

- Capture deep analysis and a practical redesign for a simpler, more local, and context-efficient workspace.
- Preserve primitives (.chatmode.md, .instructions.md, .prompt.md) while introducing localized Agents.md to minimize irrelevant context loading.

Scope and Constraints

- Keep global primitives under .github.
- Reduce centralization of working docs (e.g., Research) by colocating research, ideas, and docs with the specific Pillar/Path/Module/Lesson they support.
- Prefer a structure humans can navigate quickly and agents can load selectively via Agents.md with applyTo filters.

Decisions captured (user inputs)

- Naming: use kebab-case for all directory and file slugs (e.g., pillar-ops, path-orchestration, lesson-branching-logic).
- Taxonomy: Pillar, Path, and Lesson are required; Module is optional (use only when it adds clarity).
- Compliance placement: keep compliance rules only in global *.instructions.md or local Agents.md. Avoid any other compliance file types to reduce confusion.
- Session folders: defined below for clarity; recommended for complex efforts but optional if a lesson is simple.

Depth limit policy (max 4 levels)

- Enforce at most four folder levels within the content tree.
- Allowed content path depth: pillars/{pillar-slug}/{path-slug}/{lesson-slug}/files (no further subfolders under lesson).
- Modules must not introduce an extra folder level; if needed, encode module in lesson slug and in frontmatter (module: ...).
- Global directories like .github and research are exempt from this depth count but should remain shallow.

Thinking log (#think)

- The current layout is standards-rich but spreads information across many top-level folders.
- Execution agents often over-load context from global docs that aren’t relevant to a specific Pillar/Path/Lesson.
- Localizing context reduces cognitive load and token footprint, but risks fragmentation without strong indexing and conventions.
- Agents.md can carry local instructions, defaults, and links to nearby artifacts; applyTo can constrain scope to relevant agents.
- We should define a consistent search order for context discovery: local → parent → grandparent → global.

Sequential reasoning (#sequentialthinking)

1) Identify goals: simplicity, locality, selective context loading, minimal global overhead.
2) Evaluate structural options for file placement.
3) Choose a hybrid that maximizes locality while retaining global primitives and indexes.
4) Specify Agents.md schema and loading order.
5) Define a migration plan that is incremental, reversible, and low-risk.
6) Define success criteria and open questions requiring user input.

Observed pain points (from ANALYSIS.md + user feedback)

- Over-engineered, many files in disparate places; hard to trace a single lesson’s related materials.
- Central Research obscures which entity the work supports; navigation costs are high.
- Global instructions too heavy for most tasks; agents over-load context.
- Lack of localized defaults (e.g., research mode, recursion) causes extra prompting and chatter.

Design options

Option 1 — Fully localized, entity-centric

- Description: Move nearly all working docs (research, ideas, prompts, session notes) into the nearest entity (Pillar/Path/Module/Lesson). Global primitives remain.
- Pros:
  - Strongest locality and clarity; everything relevant lives together.
  - Minimal context loading when working in-scope.
- Cons:
  - Harder to obtain global views (indexes, metrics) without automation.
  - Risk of divergent practices unless Agents.md enforces conventions.

Option 2 — Hybrid localized + global indexing (Recommended)

- Description: Store all working docs locally per entity. Maintain light global primitives and auto-generated global indexes (e.g., Research/_index.md) that crawl distributed locations.
- Pros:
  - Practical navigation and minimal context bloat during work.
  - Retains discoverability via global indexes and reports.
  - Easiest to scale with consistent Agents.md contracts.
- Cons:
  - Requires simple indexing scripts to aggregate distributed artifacts.
  - Slightly more complexity than Option 1 but pays off in discoverability.

Option 3 — Centralized working docs with localized mirrors

- Description: Keep Research central but add thin per-entity mirrors (links or stubs) pointing back.
- Pros:
  - Global discoverability without new automation.
- Cons:
  - Users still jump across folders; locality is faux.
  - Mirrors drift; higher maintenance burden.

Recommendation

- Adopt Option 2: Hybrid localized + global indexing.
- Rationale: Maximizes locality and selective context while preserving discoverability through automated indexes. Aligns with Agents.md as a local contract for scope-specific context and defaults.

Proposed directory layout (illustrative)

- .github/
  - chatmodes/            (global primitives)
  - instructions/         (global minimal standards only)
  - prompts/              (reusable global prompts)
- pillars/
  - {pillar-slug}/
    - Agent.md            (scope: Pillar)
    - README.md           (high-level map and decisions)
    - {path-slug}/
      - Agent.md          (scope: Path)
      - {lesson-slug}/    (no subfolders below this level)
        - Agent.md        (scope: Lesson)
        - README.md       (lesson overview; links to session files)
        - 2025-10-25-{topic-slug}-working.md
        - 2025-10-25-{topic-slug}-research.md
        - 2025-10-25-{topic-slug}-doc.md
        - 2025-10-25-{topic-slug}-deliverable.md
        - prompt-{action}.prompt.md      (local one-offs)
- research/
  - _index.md            (auto-generated global index scanning pillars/**/{lesson-slug}/*.md)

Agents.md contract (minimal schema)

- Frontmatter (YAML):
  - description: human-readable purpose
  - scope: Pillar | Path | Module | Lesson
  - applyTo: list of agents or tags (e.g., ["@research", "@scriptwriter", "@sme"]) to limit loading
  - defaults:
    - research.mode: quick | learning | deep
    - research.recursiveDepth: number (e.g., 0–3)
    - research.domainsAllowlist: [domain1, domain2]
    - writing.tone | audience.level | prerequisites: ...
  - links: references to nearby artifacts (docs, datasets, prior sessions)
  - compliance: optional localized rules that refine global standards for this scope (keep global rules in .github/instructions/*.instructions.md)
- Body sections:
  - Local Standards: quality bars, style preferences, platform nuances
  - Context: local objectives, constraints, accepted sources, banned sources
  - Known Gaps/Pitfalls: common failure patterns for this scope
  - Defaults & Overrides: parameters agents should assume unless overridden
  - Handoffs & Gates: scope-specific interpretations of global gates
  - Session Index: list of recent sessions with summaries

Context-loading policy

- Search order: nearest Agents.md in working directory, then ascend: Lesson → Module (if present) → Path → Pillar → global instructions.
- Loading rules:
  - Only load Agents.md whose applyTo includes the active agent/chatmode or matching tag.
  - Merge defaults shallowly from nearest to farthest ancestor, with nearest taking precedence.
  - Global instructions kept minimal: constitution, handoff protocol, essential content standards; any additional compliance must live in *.instructions.md or local Agents.md.

How primitives fit

- .chatmode.md: stay global; refer to “Agents.md discovery” step early in execution.
- .instructions.md: reduced to essentials and references to Agents.md usage.
- .prompt.md: remain global templates; allow local prompt variants in sessions/prompts for one-off tasks.

Research locality and sessions

- Definition: A "session" is a time-boxed or goal-bounded work packet for a specific lesson (e.g., deep-dive research, revision round, content update).
- Representation: Sessions are encoded as files at the lesson level using a date-prefixed naming scheme (no session subfolders).
- Recommended file naming: {yyyy-mm-dd}-{topic-slug}-{type}.md where type ∈ working | research | doc | deliverable | prompt.
- When to use: For complex or multi-step efforts, create multiple session files; for simple tasks, one deliverable + one working note may suffice.
- Agents default to autonomous execution using Agents.md defaults (e.g., deep mode at Pillar; quick at Lesson) unless explicitly overridden.
- Research/_index.md becomes an auto-generated catalog: it scans lesson-level session files and consolidates summaries and links.

Session frontmatter standard (for quick agent comprehension)

- Apply frontmatter to all session-derived files (working notes, research, prompts, docs, deliverables) stored in the lesson directory.
- Required keys (all session artifacts):
  - id: session ID (e.g., yyyy-mm-dd-topic-slug)
  - date: ISO 8601 datetime for the artifact (e.g., 2025-10-25T14:32:00Z)
  - scope:
    - pillar: pillar-slug
    - path: path-slug
    - lesson: lesson-slug
    - module: module-slug (optional)
  - type: working | research | prompt | doc | deliverable
  - agent: @research | @scriptwriter | @sme | @editor | etc.
  - status: draft | in-progress | final
  - summary: 1–2 sentence purpose of the file
- Recommended keys (helpful for research automation):
  - mode: quick | learning | deep
  - depth: recursionDepth integer (0–N)
  - query: core query or task statement
  - seed_urls: list of starting URLs
  - allow_domains: list of allowed domains
  - sources_count: number of sources processed
  - outputs: list of produced files/paths
  - handoff_to: next agent (e.g., @sme)
  - success_criteria: brief measurable checks
  - tags: labels useful for filtering

Session naming and indexing policy

- File naming: always prefix with date (yyyy-mm-dd) to aid recency sorting; follow with concise topic-slug and type suffix.
- Indexing: the indexer should read only frontmatter to build summaries and link maps (no full-file scan needed). Sort by date desc; surface deliverables above working artifacts.
- Visibility: each Lesson README should link the latest session files and key deliverables. The global Research/_index.md aggregates across all lessons.

Migration plan (phased)

- Phase 0 — Freeze and map
  - Freeze central Research writes; export a manifest of existing research files and targets (Pillar/Path/Module/Lesson).
- Phase 1 — Skeleton and templates
  - Create pillars/{pillar}/{path}/{lesson} directory skeletons for existing entities (max 4 levels).
  - Add Agents.md templates at Pillar, Path, and Lesson with minimal frontmatter and empty sections.
  - Add a session-frontmatter template snippet to reuse across working/research/doc/deliverable files.
- Phase 2 — Relocate artifacts
  - Move research/ideas/docs into lesson-level session files using the date-prefixed naming scheme; remove session subfolders to enforce depth.
  - Add required frontmatter to migrated files (populate id, scope, type, agent, summary; add mode/depth when applicable).
  - Leave stubs/redirect entries in Research/_index.md until the indexer is implemented.
- Phase 3 — Update primitives to respect locality
  - Update research prompts/chatmodes to resolve nearest Agents.md and apply applyTo filters before loading global context.
  - Clarify global instruction docs to emphasize minimal load and local-first resolution.
- Phase 4 — Indexing & automation
  - Add a simple indexer script to rebuild Research/_index.md by scanning lesson directories for date-prefixed files and reading only frontmatter.
  - Optionally, add a lightweight session generator command to scaffold session files with pre-filled frontmatter.
- Phase 5 — Deprecate obsolete central docs
  - Remove or archive any redundant central references superseded by localized Agents.md.

Risks and mitigations

- Fragmentation risk: Mitigate with a strict Agents.md schema and templates; enforce via lint/check script later.
- Discoverability risk: Mitigate with the indexer that produces Research/_index.md and entity-level READMEs.
- Inconsistent defaults: Mitigate with context-loading order and clear override rules.

Acceptance criteria

- No subtree under pillars/ exceeds four folder levels: pillars/{pillar}/{path}/{lesson}/files only.
- For any Lesson, all related research, ideas, prompts, and deliverables live in the lesson folder as date-prefixed files.
- All session artifacts include required frontmatter so agents can understand intent/scope without full reads.
- Agents load only relevant context for the current scope (Agents.md applyTo respected); global instructions are minimal.
- A global index of distributed research exists and is regenerated automatically based on frontmatter.
- Migration leaves no orphaned research; redirects exist until the indexer is in place.

Next actions (upon approval)

- Confirm slugs and naming conventions for Pillars/Paths/Modules/Lessons.
- Approve Agents.md schema and default applyTo mappings per agent.
- Generate initial skeletons and Agents.md templates; relocate a small pilot set of research to validate flow.
- Implement the simple indexer; update global instructions to document local-first context policy.

Inputs requested

- Confirm preferred session usage policy: always for complex tasks, optional for simple tasks (as drafted)?
- Any additional global compliance beyond constitution, handoff protocol, and essential content standards that truly must apply repo-wide?
