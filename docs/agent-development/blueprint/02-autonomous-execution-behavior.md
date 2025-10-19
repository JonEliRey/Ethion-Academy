# Autonomous Execution Behavior

**Status**: active  
**Version**: 1.0.0  
**Last Updated**: 2025-10-06  
**Related**: 01-agent-design-principles.md, 05-tool-usage-patterns.md, 07-quality-assurance-and-self-checks.md

---

## 1. Purpose
Define the canonical autonomous execution model: how an agent transitions from user-validated initialization into continuous, tool-driven, observable execution without narrative filler while maintaining strict verification and safety gates.

---

## 2. Execution State Machine
```
┌────────────┐   approve    ┌──────────────┐   plan-ready   ┌──────────────┐   sources-batched   ┌──────────────┐
│ INIT_INPUT │────────────►│ PLAN_STRATEGY│───────────────►│ ACQUIRE_BATCH│────────────────────►│ DEEPEN_DIM   │
└────┬───────┘               │              │                │              │                     │              │
     │ reject                │ replan       │ gap-detected   │ saturation   │ synth-ready         │ verify-ready │
     ▼                       ▼              ▼                ▼              ▼                     ▼              │
┌────────────┐         ┌──────────────┐   ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐ │
│ CLARIFYING │◄─────── │ REVISE_PLAN  │   │ EXPAND_SCOPE │  │ SATURATED    │  │ SYNTHESIZING  │  │ VERIFYING    │◄┘
└────────────┘         └──────────────┘   └──────────────┘  └──────────────┘  └──────────────┘  └──────┬───────┘
                                                                                                        │ pass
                                                                                                        ▼
                                                                                                 ┌──────────────┐
                                                                                                 │ FINALIZING   │
                                                                                                 └──────────────┘
```
States MUST be implicit via tool calls + working file updates. No explicit narration of state transitions unless user confusion risk is detected.

---

## 3. State Transition Rules
| From | To | Trigger | Required Action |
|------|----|---------|-----------------|
| INIT_INPUT | PLAN_STRATEGY | User approves improved query | create working file + log metadata |
| PLAN_STRATEGY | ACQUIRE_BATCH | Plan written to working file | Begin batched fetch sequence |
| ACQUIRE_BATCH | DEEPEN_DIM | Batch size threshold reached | Append batch summary to working file |
| DEEPEN_DIM | VERIFYING | Verification checkpoint triggered | sequentialthinking contradiction audit |
| VERIFYING | SYNTHESIZING | All critical claims validated | Begin thematic consolidation |
| SYNTHESIZING | FINALIZING | Deliverable structure scaffolded | Promote content to final artifact |
| Any | REVISE_PLAN | User scope change or mismatch detected | Re-build plan + preserve prior context |
| ACQUIRE_BATCH | EXPAND_SCOPE | Gaps persist across 2 batches | Add new dimension(s) + record rationale |
| DEEPEN_DIM | SATURATED | No new concepts emerging | Mark saturation with evidence log |

---

## 4. Autonomous Execution Contract
| Clause | Requirement | Violation Example | Enforcement |
|--------|-------------|-------------------|-------------|
| 1 | Tool calls drive ALL progress | "Researching..." (no fetch calls) | Self-check + halt |
| 2 | Working file updated per state transition | Batch processed but no file change | Force update before next batch |
| 3 | Batches are bounded (mode-specific) | Single massive 100-source fetch | Split into 5 logical batches |
| 4 | Verification cannot be skipped | Direct synthesis after acquisition | Insert mandatory checkpoint |
| 5 | Finalization requires artifact parity | Final deliverable includes unseen content | Rollback + align with working file |

---

## 5. Batch Management Standard
| Mode | Target Sources | Batch Size | Expected Batch Count | Deepening Cadence |
|------|----------------|-----------:|---------------------:|------------------|
| Quick | 10–20 | 5–10 | 2–4 | None |
| Learning | 30–50 | 10–15 | 3–5 | Moderate |
| Deep | 50–100+ | 15–20 | 3–5 | Granular (6–10 updates Phase 3) |

Rules:
1. Never start batch N+1 until working file reflects completion of batch N.
2. Each batch update MUST include: sources fetched, domains represented, gaps remaining, next focus.
3. Deep mode requires two update types: per-dimension + per-batch.

---

## 6. Verification Gating Framework
| Gate | Trigger | Verification Scope | Tools | Pass Criteria |
|------|---------|--------------------|-------|--------------|
| Gate 1 | After 1st batch | Direction validity | sequentialthinking | Dimensions still relevant |
| Gate 2 | Mid acquisition | Source diversity | sequentialthinking + grep_search | No over-reliance on single domain |
| Gate 3 | Pre-synthesis | Claim integrity | fetch_webpage (targeted) | All critical claims cross-sourced |
| Gate 4 | Pre-finalization | Structural readiness | sequentialthinking | Deliverable scaffold stable |

Agents MUST log gate status in working file with explicit PASS/FAIL. FAIL requires recorded remediation steps.

---

## 7. Failure & Recovery Patterns
| Failure Type | Detection Signal | Recovery Action | Escalation Condition |
|--------------|------------------|----------------|----------------------|
| Tool rate limiting | Repeated transient errors | Exponential backoff (3 attempts) | Persist failure entry + continue segmented plan |
| Source saturation early | No new entities across 2 batches | Expand dimensions (EXPAND_SCOPE) | If still stagnant, prompt user for scope expansion |
| Contradiction unresolved | Unable to reconcile after 2 verification passes | Mark as open issue in working file | User escalation if critical |
| Working file drift | Final artifact diverges from scaffold | Rebuild final from scaffold | If mismatch persists → abort finalization |
| Stalled execution | >5 min with no tool calls | Force checkpoint sequentialthinking | Abort session if repeated twice |

---

## 8. Minimal Autonomous Loop Skeleton (Pseudo-Trace)
```text
promptBoost -> create_file (working file)
sequentialthinking (dimensions) -> update working file
FOR batch in planned_batches:
  fetch_webpage (sources...)
  replace_string_in_file (append batch summary)
  IF batch_index == mid AND mode != quick:
    sequentialthinking (verification gate)
IF deep_mode:
  LOOP dimensions:
    fetch_webpage (dimension set)
    replace_string_in_file (granular update)
sequentialthinking (synthesis)
create_file (final deliverable)
replace_string_in_file (index + registry updates)
(delete working file)
```

---

## 9. Self-Check (Mandatory Before Finalization)
- [ ] Have all planned states been observed through tool calls?
- [ ] Does working file show every batch transition?
- [ ] Were all verification gates executed & logged?
- [ ] Are unresolved contradictions explicitly listed?
- [ ] Did synthesis derive patterns (not just collate summaries)?
- [ ] Does final deliverable strictly derive from scaffolded content?
- [ ] Was working file cleaned up post-migration?

If ANY answer = No → return to corresponding state.

---

## 10. Observability Signals (For Future Automation)
| Signal | Capture Method | Purpose |
|--------|----------------|---------|
| Batch boundary | Working file diff tag `### Batch N Summary` | Progress tracking |
| Gate execution | `## Verification Gate N` section | QA auditing |
| Dimension loop start | `## Dimension: <name>` marker | Coverage analysis |
| Saturation declaration | `## Saturation Evidence` block | Justify stopping acquisition |
| Finalization event | Working file termination w/ timestamp | Lifecycle closure |

---

## 11. Roadmap Extensions
| Feature | Planned Benefit |
|---------|-----------------|
| Execution telemetry aggregator | Real-time dashboard integration |
| Automated contradiction detector | Faster verification gates |
| Batch anomaly profiler | Detect redundancy or overfetching |

---

## 12. Integration with Other Blueprint Sections
| Related Section | Dependency Type | Notes |
|-----------------|-----------------|-------|
| 01-agent-design-principles.md | Conceptual foundation | Principles 1–4 map directly |
| 03-working-file-lifecycle-standard.md | Artifact lifecycle | State-machine persistence |
| 05-tool-usage-patterns.md | Operational layer | Defines concrete tool invocation sequences |
| 07-quality-assurance-and-self-checks.md | Verification logic | Provides gate criteria |

---

Design execution flow as a visible, stateful progression—not a black box. Predictable, inspectable autonomy builds trust and scalability.
