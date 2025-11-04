---
description: "Authoritative constitution for Ethion Academy – principles, architecture, workflow, and governance"
applyTo: "**"
---

# Ethion Academy Constitution

## Core Principles

### I. Local-first, scoped context
Agents load context closest to the work first (localized `Agents.md`, content directory, adjacent specs), with minimal global instructions. This reduces ambiguity, improves performance, and keeps decisions near their domain. Global docs exist to unify standards, not to override domain-specific rules without cause.

### II. Autonomous execution with visibility
Agents execute end-to-end without pausing for user input once started, providing concise status updates and producing observable artifacts (working files, deliverables, logs). Human reviews happen at explicit stage gates or handoffs—not during the middle of execution.

### III. Handoff protocol and AgentGraph
All cross-agent transitions use the standard, 9-component handoff message. Allowed adjacencies and invariants are defined in the AgentGraph. Avoid circular loops beyond two cycles; escalate to the Executive Producer when necessary.

### IV. Stage gates and quality gates
Work proceeds through clear stages (plan → research → script → review → publish) with measurable quality checks at each gate. No stage advances without passing its quality gate.

### V. Simplicity and DRY
Prefer simple, direct solutions. Avoid duplication. Use kebab-case naming, small focused files, and clear contracts. Centralize only what’s broadly shared; keep everything else local to its scope.

### VI. Observability and traceability
Follow the working-file lifecycle. Persist intermediate work, decisions, and sources in repo-visible artifacts. Ensure deliverables and their provenance (inputs, sources, tests) are auditable.

### VII. Versioning and change management
Document breaking changes. Use approval checkpoints for major shifts to governance or structure. Maintain changelogs where impact is non-trivial. Prefer additive evolution over disruptive rewrites.

## Architecture and Structure

### Localized governance
- Use localized `Agents.md` files per scope with `applyTo` filters to limit context load.
- Keep global instructions minimal; reference them from local docs when needed.

### Content layout constraints
- Content depth limit: four levels under `content/`.
- Paths and Modules remain directories; Lessons are directories that contain session files—no deeper subfolders under a lesson.
- Sessions are files stored within a lesson directory; they must include required session frontmatter.
- Use kebab-case for all file and folder names.

### Sessions and frontmatter
- Sessions are date-prefixed files under a lesson (e.g., `2025-10-01-session-name.md`).
- Required session frontmatter captures: session id/slug, created/updated timestamps, mode (quick/learning/deep), sources, and deliverables.
- Sessions contribute to a local index; optional global indexers may aggregate frontmatter for discovery.

### Research agent modes
- Quick: breadth-first reconnaissance with tight time/recursion caps.
- Learning: curated synthesis with stronger source hygiene and examples.
- Deep: comprehensive analysis with full citations and cross-validation.
- All modes are autonomous end-to-end and write both working and deliverable files.

## Development Workflow

### Stage gates and QA
- Plan → Research → Script → Review → Publish, with explicit quality gates.
- Use the handoff protocol for transitions and approvals.
- Follow the “working file lifecycle” for drafts, notes, and final deliverables.

### Contracts and safety
- Databases and scripts must use parameterized inputs—never string-concatenated SQL.
- Never commit secrets; use environment variables or `.env` files ignored by Git.
- Prefer tiny, verifiable tests or runnable examples for new behaviors.

### Handoffs and AgentGraph
- Use `.github/instructions/handoff-protocol.instructions.md` for the 9-component format.
- Follow `.github/instructions/agent-graph.instructions.md` for allowed adjacencies and invariants.
- Return to the Executive Producer for ambiguity requiring judgment, approvals, or blockers.

### Documentation and indexing
- Keep `README.md` up to date for quickstart and troubleshooting.
- Research sessions must write a working log and a deliverable; indexers may aggregate session frontmatter to catalogs.

## Governance

- This constitution supersedes conflicting practices unless a localized `Agents.md` explicitly overrides with Executive Producer approval.
- Amendments require: documented rationale, impact analysis, migration/compat plan, and approval checkpoint.
- PR reviews verify compliance with this constitution and related instruction files:
  - `.github/instructions/global-standards.instructions.md`
  - `.github/instructions/handoff-protocol.instructions.md`
  - `.github/instructions/agent-graph.instructions.md`
  - `.github/instructions/content-standards.instructions.md`

**Version**: 2.0.0 | **Ratified**: 2025-10-01 | **Last Amended**: 2025-10-31
