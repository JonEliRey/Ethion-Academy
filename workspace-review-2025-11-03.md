# Ethion Academy Workspace Review — 2025-11-03

## Quick Snapshot

- Ethion Academy currently optimizes instruction infrastructure (nine chat modes, 51-task execution plan) instead of producing curriculum. Actual learning assets are absent.
- Branch `initial-pillar-identification`; most files live in `specs/001-i-need-to` and `docs/001-i-need-to/plan/`, each restating process rules already covered elsewhere.
- Instruction signal is fragmented across `.github/instructions/*.md`, `CONSTITUTION.md`, dozens of plan/summary files, and no root `AGENTS.md` summarizing hierarchy or precedence.

## Rating

- Overall: ❌ Over-engineered (Grade: D+). Cognitive load is excessive; future contributors cannot explain the setup quickly.

## Complexity & Smell Check

- **Structure & Navigation**: Six top-level strategy docs (`README.md`, `ANALYSIS.md`, `Plan-information.md`, `Redesign-structure.md`, `STATUS-WHEN-YOU-RETURN.md`, `IMPLEMENTATION-SUMMARY.md`) plus deep `docs/001-i-need-to` trees. No single source of truth for “start here”.
- **Instructions & Agents**: `.github/instructions/*`, templates, the constitution, and multiple plan files encode overlapping rules. No scoped `AGENTS.md` to declare precedence or current roster.
- **Cognitive Load**: Repetitive 20–50 page docs (`spec.md`, `plan.md`, `tasks.md`, `EXECUTION-SEQUENCE.md`, `STATUS-WHEN-YOU-RETURN.md`) must be cross-referenced to act. Hard to know which workflow is current.
- **Over-Engineering**: Optional systems (Obsidian mirrors, Neo4j/graph ETL, GitHub Projects automation) are described before the first piece of content exists. A nine-agent orchestration is unjustified for an MVP.
- **Coupling & Dependencies**: Workflow spans `.github/`, `docs/`, `specs/`, `scripts/`, and `content-inventory/` with implicit gates; moving or trimming any folder risks breaking an undocumented dependency.
- **Naming & Discoverability**: Mixed-case filenames (`Plan-information.md`, `IMPLEMENTATION-SUMMARY.md`) and nested plan folders break predictable patterns. No `WORKSPACE_MAP.md` to anchor navigation.

## Simplify & Refine Recommendations

- **Keep**: `.github/chatmodes/` (agent definitions), `content-inventory/schema/schema.sql`, `templates/*.md` once trimmed; they encode reusable structure.
- **Change**: Create terse root `AGENTS.md` and `WORKSPACE_MAP.md`; collapse `CONSTITUTION.md` into those or demote to archive. Replace multiple summary files with a single `CHANGELOG.md` plus `README.md` refs.
- **Remove**: Archive legacy meta-docs (`Plan-information.md`, `STATUS-WHEN-YOU-RETURN.md`, `IMPLEMENTATION-SUMMARY.md`, `ANALYSIS.md`) into `docs/archive/` until needed. Drop optional integration guides until content ships.
- **Defer**: Obsidian mirrors, Neo4j/graph ETL, and the full nine-agent production workflow; focus on three core agents (Strategist, SME, Librarian) and manual validation first.

## Minimal Path Forward

- **Goal**: Make the workspace explorable within three minutes and support a single pillar-to-lesson pilot with minimal governance overhead.
- **Proposed Layout**:

  ```text
  README.md
  WORKSPACE_MAP.md
  AGENTS.md
  docs/
    workflows/
    decisions/
    archive/
  agents/
    chatmodes/
    instructions/
  content/
    inventory/
    exports/
  scripts/
  templates/
  ```

- **Execution Steps**:
  1. Draft one-page `AGENTS.md` (scope, responsibilities, precedence) and `WORKSPACE_MAP.md` (purpose, folder cheat sheet).
  2. Consolidate `.github/instructions` into two files: `global.md` and `content.md`; migrate rules from templates; archive duplicates.
  3. Move legacy planning docs to `docs/archive/` after extracting still-relevant tables into `docs/workflows/`.
  4. Trim the chatmode roster to the minimum viable triad; park additional agents in `agents/archive/` with a note.
  5. Pilot the simplified workflow on one pillar; document findings in `docs/decisions/` and update instructions only when gaps appear.

## Verification Checklist

- [ ] Confirm essential rules migrated into `AGENTS.md` and `global`/`content` instructions without contradiction.
- [ ] Produce `WORKSPACE_MAP.md` listing active folders and stakeholder responsibilities.
- [ ] Prune or move redundant root summaries; ensure `README.md` references the new map.
- [ ] Rename residual mixed-case files to kebab-case for consistency.
- [ ] Test a single pillar workflow start-to-finish using the trimmed documentation set; capture feedback in `docs/decisions/pilot-notes.md`.
- [ ] Reassess optional integrations after the pilot succeeds.

## Notes

- Attempted to invoke the `think` tool; it is disabled in this workspace.
- `manage_todo_list` operation schema rejected multiple attempts (allowed verbs not documented); verification checklist above captures required follow-ups manually.
