# Ethion Academy – Super‑Intelligent Course Designer

A multi‑agent, stage‑gated content development system that plans Pillars → Paths → Courses → Modules → Lessons, produces briefs for YouTube/Blog/Academy, catalogs a SQLite inventory, and monitors official sources for updates.

## Quickstart (Windows + PowerShell)

Prerequisites:

- Windows 10/11, PowerShell 7+
- Optional: `sqlite3` CLI (script will fallback to System.Data.SQLite if missing)

### 1) Initialize the content inventory database

```powershell
# From the repository root
./scripts/init-database.ps1 -Force
```

What it does:

- Creates `content-inventory/content.db`
- Executes schema at `content-inventory/schema/schema.sql`
- Verifies tables and prints a summary

### 2) Export the inventory (for diffs/integration)

```powershell
# Export all entities to JSON (pretty) under content-inventory/exports
./scripts/export-inventory.ps1 -Entity All -Format Json

# Example: export only Lessons to YAML (basic YAML via JSON serialization)
./scripts/export-inventory.ps1 -Entity Lessons -Format Yaml
```

Notes:

- YAML export is a simple JSON-in-YAML wrapper. For rich YAML, consider adding the `powershell-yaml` module and updating the script.

## Research agent (parametric)

Use the research agent to perform Quick, Learning, or Deep investigations with optional recursive link expansion (Nth level). It creates a working file and a final deliverable in `Research/`, following blueprint standards.

Options:

- Chat Mode: `@research` (see `.github/chatmodes/research.chatmode.md`)
- Prompt Template: `.github/prompts/run-research.prompt.md`

Variables (set in the prompt):

- `query` (string): What to research
- `mode` (quick | learning | deep): Depth profile and gate counts
- `recursiveDepth` (int ≥ 0): Follow links up to N levels (deep defaults higher)
- `sourcesTarget` (int): Target number of sources to consult
- `durationMinutes` (int): Soft time budget; agent will checkpoint accordingly
- Optional: `seedUrls` (array), `domainsAllowlist` (array)

Behavior summary:

- Tool‑first, observable execution (no silent steps)
- Creates a WORKING file in `Research/.temp/` and updates it per batch/dimension
- Fetches sources in batches; recursively expands links up to `recursiveDepth`
- Runs verification gates; produces a final deliverable with citations

## Stage gates and handoffs

- Handoffs follow the 9‑component protocol (`docs/Reference/plan/workflows/handoff-protocol.md`)
- Approvals at each level (Pillar → Path → Course → Module → Lesson → Production) (`docs/Reference/plan/workflows/stage-gates.md`)
- Agent flow reference: `docs/Reference/plan/workflows/agent-flow.md`

## Troubleshooting

- “SQLite not found”: The init script will try System.Data.SQLite automatically.
- “No exports generated”: Ensure the database has data; run `init-database.ps1` first.
- “Markdown lint warnings”: Ensure lists are surrounded by blank lines and indentation is 0/2 spaces as appropriate.

## Repository map (selected)

- `content-inventory/schema/schema.sql` – SQLite schema (hierarchy, tags, sources, approvals, alerts)
- `scripts/init-database.ps1` – Initialize or recreate the database
- `scripts/export-inventory.ps1` – Export entities to JSON/YAML
- `docs/agent-development/blueprint/` – Principles, execution, working files, tools, QA, orchestration
- `docs/Reference/plan/workflows/` – Handoff protocol, stage gates, agent flow
- `Research/` – Research guides, taxonomy, index, and generated outputs
