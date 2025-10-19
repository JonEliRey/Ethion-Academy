# Quality Assurance & Self-Checks

**Status**: active  
**Version**: 1.0.0  
**Last Updated**: 2025-10-06  
**Related**: 02-autonomous-execution-behavior.md, 03-working-file-lifecycle-standard.md, 05-tool-usage-patterns.md

---

## 1. Purpose
Define objective, automatable quality gates and structured self-check protocols that agents MUST satisfy before claiming completion.

---

## 2. Quality Gate Overview

| Gate | Name | Phase | Objective | Failure Consequence |
|------|------|-------|-----------|---------------------|
| G1 | Direction Validation | After first batch | Ensure initial plan still valid | Re-plan required |
| G2 | Diversity Assurance | Mid acquisition | Prevent domain bias | Forced diversification batch |
| G3 | Claim Integrity | Pre-synthesis | All critical claims verified | Verification loop |
| G4 | Structural Readiness | Pre-finalization | Output scaffold stable | Delay assembly |
| G5 | Artifact Parity | Finalization | Deliverable matches working file | Rebuild deliverable |

---

## 3. Self-Check Framework

Self-check MUST be written to working file (Reflection / Completion section). Answers are binary unless graded.

| Question | Required Answer | Critical (Y/N) | Remediation if No |
|----------|-----------------|----------------|-------------------|
| Was promptBoost executed once? | Yes | Y | Restart Phase 0 |
| Was user approval recorded? | Yes | Y | Request approval |
| Was working file created before Phase 1? | Yes | Y | Restart session |
| Were all planned batches executed? | Yes | Y | Execute missing batches |
| Were all batches logged with summaries? | Yes | Y | Reconstruct logs from tool calls |
| Were contradictions resolved or marked? | Yes | Y | Add contradiction blocks |
| Did synthesis introduce new abstraction (not paraphrase)? | Yes | Y | Redo synthesis pass |
| Does final deliverable contain ONLY scaffolded content? | Yes | Y | Rebuild from scaffold |
| Was working file deleted after migration? | Yes | Y | Delete + log deletion |
| Are unresolved items explicitly listed? | Yes | N | Add unresolved section |

---

## 4. Metrics Dashboard (Conceptual)

| Metric | Source | Threshold | Interpretation |
|--------|--------|----------:|----------------|
| Source Count | Batch logs | Mode-specific | Depth sufficiency |
| Batch Coverage | Anchor scan | 100% | Process compliance |
| Claim Verification Rate | Verification blocks | 100% | Reliability |
| Contradiction Resolution Rate | Contradiction blocks | >=70% | Domain stability |
| Working File Update Cadence | Diff frequency | Mode pattern | Iterative transparency |
| Tool Idle Time Max | Tool stream | <180s | Execution health |

---

## 5. Verification Block Templates

### 5.1 Gate Log Example

```markdown
## Verification Gate 3
Focus: Claim Integrity
Claims Evaluated: 12
Unverified Critical Claims: 0
Method: Cross-source triangulation (3+ authoritative domains)
Status: PASS
```

### 5.2 Contradiction Block Example

```markdown
### Contradiction: streaming-vs-batch-ingestion
Claim A: Streaming ingestion mandatory for real-time compliance (Source [22])
Claim B: Batch sufficient for regulated audit trails (Source [29])
Resolution: Both context-specific (latency-critical vs audit-dominant workloads)
Status: Resolved
```

---

## 6. Failure Handling Protocol

If a gate FAILS:

1. Append failure annotation to working file
2. Execute targeted remediation (fetch_webpage / sequentialthinking)
3. Re-run gate check
4. If 2 consecutive failures → escalate (log + optional user notification)

---

## 7. Finalization Integrity Checklist

Before deletion of working file:

- [ ] All gates PASS
- [ ] All self-check critical answers = Yes
- [ ] Final deliverable created
- [ ] Index/registry updated
- [ ] Memory entry written (if enabled)
- [ ] Working file deletion logged
- [ ] Completion timestamp recorded

---

## 8. Automation Roadmap

| Automation Target | Benefit |
|-------------------|---------|
| Gate detection parser | Enforce compliance |
| Working file analyzer | Detect stagnation |
| Claim cross-reference engine | Reduce manual verification |
| Citation integrity checker | Prevent orphan references |
| Cadence monitor | Ensure active execution |

---

## 9. Quick Embed Snippet

```text
IF any critical self-check = No → DO NOT FINALIZE.
IF any gate unresolved → re-enter corresponding phase.
```

---

Quality is not assumed—it is evidenced. Gates + self-checks = enforceable reliability.
