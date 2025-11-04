---
description: Run the parametric research agent (quick | learning | deep) with optional recursive link expansion
mode: research
---

# Run Parametric Research

Fill the variables below, then begin. The agent will operate autonomously and write real files (WORKING + final deliverable) per blueprint standards. Do not pause for intermediate confirmations.

## Variables
- query: <your research question>
- mode: <quick | learning | deep>
- recursiveDepth: <integer ≥ 0>
- sourcesTarget: <int, e.g., 15 | 40 | 80>
- durationMinutes: <int, e.g., 20 | 60 | 150>
- seedUrls: [optional, list]
- domainsAllowlist: [optional, list]

## Constraints
- Use a working file at `Research/.temp/{YYYYMMDD-HHMMSS}-{topic-slug}-{mode}-WORKING.md`
- Update the working file after each batch and (for deep) per dimension; include required anchors
- Enforce verification gates per mode before synthesis
- Produce a final deliverable in `Research/{Pillar or General}/YYYYMMDD-topic-mode.md` with numbered citations (full URLs, access dates)
- Update `Research/_index.md` after saving the deliverable

## Execution
1) Record variables in the working file header (include improved query if applicable)
2) Plan dimensions (5–8 typical) and batches based on `mode`, `sourcesTarget`, and `durationMinutes`
3) Acquisition:
   - Fetch authoritative sources first; summarize each batch
   - If `recursiveDepth` > 0, expand links BFS up to N levels (respect allowlist; de-duplicate)
4) Deepening (deep mode; optional in learning): per-dimension targeted fetch + extraction
5) Verification gates: log Gate 1..N with PASS/FAIL and remediation if needed
6) Synthesis: structure the deliverable (executive summary, method, dimensions, findings, contradictions, recommendations, sources)
7) Finalize: write the final file; update `Research/_index.md`; close the working file with Reflection + Completion

## Output
- WORKING file path
- Final deliverable path
- Gate status summary (PASS/FAIL) and any unresolved contradictions
- Next recommended handoff (`@content-strategist` or `@scriptwriter`) using the 9-component protocol
