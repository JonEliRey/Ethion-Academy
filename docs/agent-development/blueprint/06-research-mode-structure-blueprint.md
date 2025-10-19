# Research Mode Structure Blueprint

**Status**: active  
**Version**: 1.0.0  
**Last Updated**: 2025-10-06  
**Related**: 01-agent-design-principles.md, 02-autonomous-execution-behavior.md, 03-working-file-lifecycle-standard.md

---

## 1. Purpose
Define a modular, extensible structural template for research-focused agent modes (quick, learning, deep) with consistent phase logic, artifacts, and verification while allowing capability scaling by depth.

---

## 2. Mode Comparison Matrix
| Attribute | Quick | Learning | Deep |
|-----------|-------|----------|------|
| Duration Target | 10–20 min | 45–90 min | 1–3+ hrs |
| Source Count | 10–20 | 30–50 | 50–100+ |
| Batch Count | 2–4 | 3–5 | 3–5 (plus dimension loops) |
| Dimension Depth | Shallow breadth | Moderate breadth + some depth | Full breadth + deep per-dimension |
| Working File Updates | Per batch | Per batch | Per batch + per dimension |
| Verification Gates | 1 (pre-synthesis) | 2 | 3–4 |
| Synthesis Complexity | Single pass | Layered (clusters) | Multi-layer (clusters + cross-perspective) |
| Reflection Granularity | Basic | Intermediate | Advanced (confidence scoring) |

---

## 3. Canonical Phase Definitions
| Phase # | Name | Purpose | Mode Variations |
|---------|------|---------|-----------------|
| 0 | Input Conditioning | Clarify + improve query (promptBoost) | Same across all modes |
| 1 | Planning | Define dimensions + success metrics | Depth increases with mode |
| 2 | Acquisition | Batched source harvesting | Batch size scales with mode |
| 3 | Deepening | Structured dimension drilling | Quick: N/A; Learning: optional; Deep: required |
| 4 | Verification | Resolve contradictions + validate claims | Gates scale count |
| 5 | Synthesis | Transform collected data into knowledge layers | Complexity scales |
| 6 | Output Assembly | Promote structured content to deliverable | Same pattern |
| 7 | Reflection | Self-assess coverage, quality, risk | Depth scales |
| 8 | Finalization | Persist + cleanup | Same pattern |

---

## 4. Phase Success Criteria
| Phase | Must Contain (Minimal Acceptable Evidence) |
|-------|--------------------------------------------|
| 0 | Improved query + user approval recorded |
| 1 | Dimension list + plan rationale in working file |
| 2 | At least required batch anchors + gap analysis entries |
| 3 | Dimension anchors (deep mode) + entity extraction |
| 4 | Contradiction blocks + verification pass logs |
| 5 | Thematic clusters + insight candidates + synthesis narrative |
| 6 | Deliverable scaffold + inline citations |
| 7 | Limitations + confidence matrix + unresolved items |
| 8 | Final timestamp + index entry + working file deletion record |

---

## 5. Dimension Handling Strategy (Deep Mode)
```
FOR each dimension D in planned_dimensions:
  Sub-aspect planning (sequentialthinking)
  Targeted acquisition (fetch_webpage)
  Extraction + working file update
  Check: contradictions? unresolved? escalate?
END
Saturation evaluation → proceed to synthesis
```

---

## 6. Verification Gate Templates
| Gate | Placement | Required Log Block | Triggered If |
|------|-----------|--------------------|--------------|
| Gate 1 | After Batch 1 | `## Verification Gate 1` | Dimension mismatch risk |
| Gate 2 | Mid Acquisition | `## Verification Gate 2` | Source diversity < threshold |
| Gate 3 | Pre-Synthesis | `## Verification Gate 3` | Unverified critical claims exist |
| Gate 4 | Pre-Finalization (deep only) | `## Verification Gate 4` | Structural instability |

---

## 7. Output Structure Blueprint
Minimum deliverable layout for all modes:
```
# Title
## Executive Summary
## Research Scope & Method
## Key Dimensions Overview
## Detailed Findings
### Dimension A
### Dimension B
...
## Cross-Cutting Patterns
## Contradictions & Resolutions
## Limitations & Risks
## Recommendations / Next Steps
## Sources
```
Deep Mode Additions:
```
## Maturity Model Alignment
## Operational Trade-offs
## Architecture / Flow Diagram Narrative (if applicable)
```

---

## 8. Mode-Specific Risk Mitigations
| Mode | Primary Risk | Mitigation Pattern |
|------|--------------|--------------------|
| Quick | Superficiality | Enforce Gate 1 + minimum source threshold |
| Learning | Mid-phase drift | Force plan revalidation mid acquisition |
| Deep | Over-expansion | Saturation evidence requirement |

---

## 9. Extension Guidelines
Adding a new mode (e.g., "regulatory-compliance-research") MUST define:
1. Mode metadata (duration, batch size, depth expectations)
2. Additional phases or modified phase semantics
3. New verification gates (if any)
4. Changes to output blueprint
5. Added self-check questions

---

## 10. Mode Selection Decision Tree
```
IF user requires broad scan quickly → quick
ELSE IF user needs structured learning artifact → learning
ELSE IF exhaustive strategic depth required → deep
```
If ambiguity persists → ask clarifying question ONCE then select.

---

## 11. Self-Check Before Finalization
- [ ] Correct mode selected & justified
- [ ] All mode-specific phase artifacts present
- [ ] Batch + dimension anchors match expectations
- [ ] Verification gate count met
- [ ] Output structure complete (including deep-only sections, if applicable)
- [ ] Working file deleted after migration

---

## 12. Future Enhancements
| Feature | Benefit |
|---------|---------|
| Mode auto-detection heuristic | Reduce user friction |
| Adaptive batch size tuning | Optimize efficiency |
| Dynamic risk scoring | Proactive mitigation |

---

Research modes are variations on a single spine—optimize for consistency first, specialization second.
