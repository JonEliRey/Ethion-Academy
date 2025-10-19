# Agent Design Principles

**Status**: active  
**Version**: 1.0.0  
**Last Updated**: 2025-10-06  
**Applies To**: All autonomous research, synthesis, production, and transformation agents  
**Related**: 02-autonomous-execution-behavior.md, 05-tool-usage-patterns.md

---

## 1. Purpose
Establish forward-looking, implementation-ready principles for designing reliable autonomous agents that operate transparently, iteratively, and verifiably using tool-driven execution rather than narrative speculation.

---

## 2. Core Design Tenets
| # | Principle | Description | Anti-Pattern to Avoid |
|---|-----------|-------------|------------------------|
| 1 | Tool-First Execution | All substantive work (research, transformation, file operations) MUST occur via tool calls. | Describing work instead of performing it. |
| 2 | Transparency by Default | User visibility comes from tool streams; no hidden phases. | "Working silently" or invisible processing. |
| 3 | Iterative Externalization | State evolves through durable artifacts (working files, structured outputs). | Holding evolving state only in system memory. |
| 4 | Deterministic Lifecycle | Each workflow has a defined START → EXECUTE → VERIFY → FINALIZE sequence. | Improvised step ordering. |
| 5 | Context Deepening | Always go beyond superficial metadata; extract structural + semantic layers. | One-pass skim + summary. |
| 6 | Continuous Self-Verification | Embed checkpoints + self-check questions before claiming completion. | Declaring done without verification. |
| 7 | Minimal Narration | Only narrate transitions or final summaries. Tool calls are the communication. | Explaining intent instead of executing. |
| 8 | Reproducibility | Another agent can replay the session from artifacts + logs. | Opaque session with no artifacts. |
| 9 | Scalability by Pattern | Design behaviors as composable patterns (batching, dimension expansion). | Hard-coded one-off flows. |
|10 | Failure Visibility | Surface errors early with recovery attempts documented. | Swallowing exceptions silently. |

---

## 3. Standard Agent Workflow Lifecycle
```
PHASE 0  : Input Conditioning (promptBoost, clarification if needed)
PHASE 1  : Planning & Dimension Mapping (sequentialthinking)
PHASE 2  : Context Acquisition (fetch_webpage / semantic_search / grep_search)
PHASE 3  : Iterative Deepening (structured batch + dimension loops)
PHASE 4  : Verification & Contradiction Resolution (sequentialthinking checkpoints)
PHASE 5  : Synthesis & Structuring (working file consolidation)
PHASE 6  : Output Assembly (create_file / replace_string_in_file)
PHASE 7  : Reflection & QA (self-check, quality gates)
PHASE 8  : Finalization & Persistence (memory update, working file cleanup)
```
All research-class agents MUST explicitly map their behavior to this lifecycle (expand or specialize only if justified and documented).

---

## 4. State & Artifact Strategy
| Artifact | Purpose | Creation | Update Pattern | Disposal |
|----------|---------|----------|----------------|----------|
| Working File | Incremental knowledge scaffold | After Phase 0 approval | Every phase; high-frequency in deep phases | Deleted after migration |
| Final Deliverable | Canonical output object | Phase 6 | Single-pass assembly referencing working file | Persistent |
| Index/Registry | Cross-link + discoverability | Phase 8 | Append-only entry | Persistent |
| Memory Entry | Long-term semantic recall | Phase 8 | One per session | Persistent |
| Log (implicit tool stream) | Audit + replay | Continuous | Automatic | Retained (platform) |

---

## 5. Context Depth Model
Agents must progressively expand depth across three layers:
1. Structural Layer: File layout, headings, schema, code blocks, lists.  
2. Semantic Layer: Concepts, relationships, domain-specific taxonomy.  
3. Synthesis Layer: Patterns, contradictions, abstractions, strategic implications.

Reject shallow summarization if only layer 1 is covered—progress is invalid without semantic + synthesis layers triggered.

---

## 6. Decision Heuristics
| Situation | Required Heuristic | Example Action |
|-----------|--------------------|----------------|
| Too many potential sources | Batch & prioritize authoritative domains first | Queue docs.microsoft.com before blogs |
| Conflicting claims | Fork verification path before synthesis | Fetch both sources → sequentialthinking reconciliation |
| Sparse context | Dimension expansion | Derive adjacent concepts via sequentialthinking |
| High uncertainty claim | Elevate verification | Cross-reference 3+ primary sources |
| Long-running phase (>10 min) | Increase working file cadence | Ensure granular updates every batch |

---

## 7. Completion Preconditions
An agent may claim completion ONLY IF:
- All lifecycle phases executed or explicitly marked N/A (with justification)
- Working file shows chronological evolution (diff-friendly)
- Minimum source depth threshold met (mode-specific)
- Contradictions enumerated + resolved or marked unresolved
- Self-check responses recorded and all critical ones = Yes
- Final deliverable reproducible from working file
- Temporary artifacts cleaned up (unless retention justified)

---

## 8. Anti-Patterns (Immediate Rejection)
| Anti-Pattern | Why Harmful | Required Response |
|--------------|------------|-------------------|
| "I'll work in the background silently" | Removes transparency + auditability | Replace with tool execution stream |
| Single working file write then final output | Prevents traceability + iteration proof | Enforce per-phase updates |
| Over-explaining plan instead of executing | Wastes time; reduces throughput | Convert explanation → structured execution |
| Massive monolithic fetch without batching | Increases failure + overwhelms context | Enforce batch size & checkpointing |
| Final summary with no verification step | Unvalidated output risk | Insert Phase 7 QA checkpoint |

---

## 9. Tool Alignment Matrix
| Principle Supported | Required Tools | Key Pattern |
|---------------------|---------------|-------------|
| Input Conditioning | promptBoost | Improve & lock query early |
| Structured Planning | sequentialthinking | Multi-thought dimension map |
| Acquisition | fetch_webpage, semantic_search, grep_search | Batches + dimension loops |
| Iteration Externalization | replace_string_in_file, create_file | Incremental scaffold updates |
| Verification | sequentialthinking | Contradiction + claim audit |
| Synthesis | sequentialthinking + working file | Layered consolidation |
| Finalization | create_file, memory add (future) | Promote + persist |

---

## 10. Extension Framework
Agents extending this blueprint MUST:
1. Declare additional phases (if any) and justify them.  
2. Register new artifact types in Section 4 table.  
3. Add heuristics for novel domain constraints.  
4. Update tool alignment matrix if new tools introduced.  
5. Provide regression risk notes if modifying core lifecycle.

---

## 11. Versioning & Governance
- Use semantic versioning for blueprint updates (MAJOR.MINOR.PATCH)
- Changes requiring MAJOR increment:
  - Lifecycle phase changes
  - New mandatory artifact class
  - Tool alignment shifts
- All changes must include: rationale + migration guidance

---

## 12. Fast Adoption Checklist
- [ ] Mapped use-case to lifecycle phases
- [ ] Defined working file naming + path pattern
- [ ] Selected batch sizes and verification cadence
- [ ] Added required self-check questions
- [ ] Identified authoritative domain set
- [ ] Established success metrics (depth, batch count, contradictions handled)
- [ ] Ran dry-run with placeholder fetches

---

## 13. Roadmap (Planned Enhancements)
| Version | Planned Addition | Rationale |
|---------|------------------|-----------|
| 1.1.0 | Memory embedding strategy | Improve retrieval fidelity |
| 1.2.0 | Cross-agent handoff protocol | Multi-agent collaboration |
| 1.3.0 | Confidence scoring rubric | Output trust calibration |

---

## 14. Quick Start (Minimal Skeleton)
```text
1. promptBoost → capture final improved query
2. create_file (working file) → header + session metadata
3. sequentialthinking (dimensions + plan) → append to working file
4. Loop: fetch_webpage (batched) → update working file each batch
5. sequentialthinking (verify contradictions) mid-way
6. sequentialthinking (synthesis) → structured knowledge blocks
7. create_file (final deliverable) from scaffold
8. Cleanup: delete working file + persist index + memory
```

---

## 15. Related Blueprints
- 02-autonomous-execution-behavior.md (execution state machine)
- 03-working-file-lifecycle-standard.md (artifact contract)
- 05-tool-usage-patterns.md (operational detail)

---

Design agents to be observable, iterative, verifiable, and extensible. Anything less regresses into opaque black-box behavior. Build forward.
