# Deep Context Acquisition

**Status**: active  
**Version**: 1.0.0  
**Last Updated**: 2025-10-06  
**Related**: 01-agent-design-principles.md, 02-autonomous-execution-behavior.md, 05-tool-usage-patterns.md

---

## 1. Purpose
Define how agents move beyond surface-level scanning into layered, systematic extraction of structural, semantic, and synthesis-grade context across heterogeneous sources.

---

## 2. Core Principles
| Principle | Description | Failure Case |
|-----------|-------------|--------------|
| Layered Depth | Always extract structure → entities → relationships → implications | Only copying headings |
| Progressive Enrichment | Each pass increases resolution, reducing uncertainty | One-pass summary |
| Breadth Before Depth | Establish dimension coverage baseline before deep drilling | Premature tunneling |
| Contradiction Surfacing | Actively seek divergence early | Ignoring conflicting claims |
| Traceable Extraction | Every deep insight linked to explicit source markers | Ungrounded synthesis |

---

## 3. Depth Layers Framework
| Layer | Focus | Extraction Targets | Tools |
|-------|-------|--------------------|-------|
| Structural | Layout & segmentation | Headings, sections, code blocks, tables | fetch_webpage + parsing |
| Entity | Core domain elements | Concepts, APIs, parameters, actors | sequentialthinking entity listing |
| Relational | Interconnections | Dependencies, flows, pre/post conditions | sequentialthinking mapping |
| Behavioral | Dynamics | Lifecycle, state transitions, failure modes | dimension drilling |
| Strategic | Implications | Risks, trade-offs, adoption constraints | synthesis pass |

---

## 4. Dimension Planning Pattern
Use sequentialthinking to generate 5–8 primary dimensions:
Examples (for "Enterprise Data Governance"):
- Data Ownership Model
- Stewardship Roles
- Metadata Management Architecture
- Policy Enforcement Mechanisms
- Lineage & Traceability Framework
- Access Control Zones
- Change Management & Escalation

Each dimension becomes a deepening lane (Phase 3).

---

## 5. Acquisition Loop Pattern
```text
FOR each dimension D:
  Plan sub-aspects (sequentialthinking)
  Fetch authoritative sources (docs, standards, whitepapers)
  Extract structure + entities + contradictions
  Append granular update to working file
  IF unresolved conflicts > threshold → fork verification
```

---

## 6. Source Selection Heuristics
| Priority Level | Source Type | Rationale | Examples |
|----------------|------------|-----------|----------|
| 1 | Official Standards / Docs | Authoritative, canonical | ISO/IEC, Microsoft Learn |
| 2 | High-quality Practitioner Guides | Applied patterns, failure modes | Cloud Architecture Blogs |
| 3 | Academic / Whitepapers | Conceptual rigor | IEEE, ACM |
| 4 | Community Knowledge | Edge cases, emergent issues | Q&A forums, Issue trackers |
| 5 | Aggregators / Summaries | Secondary validation | Curated newsletters |

Avoid deep reliance (>40%) on any single domain. Log domain diversity score in working file.

---

## 7. Contradiction Handling Workflow
```
Detect → Isolate → Fetch confirming/disconfirming sources → Map claims → Reconcile or Mark Unresolved
```
Contradiction Block Template:
```markdown
### Contradiction: lineage-vs-metadata-priority
- Claim A: Metadata must be established before lineage systems (Source [12])
- Claim B: Lineage-first accelerates adoption (Source [19])
Resolution: Both valid in different maturity stages (startup vs governed enterprise)
Status: Resolved
```

---

## 8. Saturation Criteria
Declare saturation ONLY IF ALL TRUE:
- No new entities appear across last 2 dimension loops
- Relational graph stable (no new dependencies)
- Contradiction queue empty or explicitly unresolved
- Remaining gaps are out-of-scope (logged)
- Domain diversity maintained (>= 3 primary domains)

Add `### Saturation Evidence` section with bullet justification.

---

## 9. Extraction Quality Metrics
| Metric | Definition | Target |
|--------|------------|--------|
| Entity Density | Entities per 1K words of source | Mode-relative: Deep > Learning > Quick |
| Source Diversity | Unique root domains / total sources | >= 0.35 |
| Verification Coverage | Critical claims verified / total critical claims | 100% |
| Contradiction Resolution Rate | Resolved / total contradictions | >= 0.7 (some may remain validly unresolved) |
| Update Cadence | Actual updates / required updates | 100% |

---

## 10. Failure Modes & Mitigations
| Failure Mode | Detection Signal | Mitigation |
|--------------|------------------|-----------|
| Shallow Pass | Only headings extracted | Force entity extraction pass |
| Overfetching | Redundant similar sources | Domain diversity heuristic adjustment |
| Early Depth | Dimension loop before baseline breadth | Enforce breadth checkpoint (Batch 1) |
| Lost Traceability | Missing citation markers | Regenerate source mapping section |
| Unbounded Expansion | Dimension creep w/o convergence | Apply saturation criteria evaluation |

---

## 11. Structured Extraction Snippet
```text
1. sequentialthinking (dimensions)
2. fetch_webpage (baseline authoritative set)
3. Append: ### Batch 1 Summary (breadth status)
4. LOOP dimensions:
   - sequentialthinking (sub-aspects)
   - fetch_webpage (targeted)
   - Append: ### Dimension: <name>
   - If contradiction → start Contradiction block
5. Evaluate saturation
6. Proceed to synthesis when criteria met
```

---

## 12. Integration Points
| Blueprint Section | Dependency |
|-------------------|------------|
| 02-autonomous-execution-behavior.md | Batch → deepening transitions |
| 03-working-file-lifecycle-standard.md | Anchor templates |
| 05-tool-usage-patterns.md | Tool orchestration |
| 07-quality-assurance-and-self-checks.md | Metrics + gating |

---

## 13. Future Enhancements
| Feature | Benefit |
|---------|---------|
| Automated entity extraction | Faster semantic layering |
| Domain diversity scorer | Real-time bias detection |
| Citation integrity validator | Prevents drift |

---

Depth is engineered—not incidental. Build layered understanding, prove it with artifacts, and stop only when saturation is justified.
