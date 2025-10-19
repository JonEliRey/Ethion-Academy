# Agentic Interaction & Orchestration

**Status**: active  
**Version**: 1.0.0  
**Last Updated**: 2025-10-06  
**Applies To**: Multi-agent autonomous workflows (delegation, specialization, capability evolution)  
**Related**: 01-agent-design-principles.md, 02-autonomous-execution-behavior.md, 03-working-file-lifecycle-standard.md, 05-tool-usage-patterns.md, 07-quality-assurance-and-self-checks.md, 08-contribution-and-evolution-process.md

---

## 1. Purpose

Define a deterministic, auditable framework for agents to:  

1. Discover and leverage other specialized agents (delegation).  
2. Exchange context + artifacts safely (handoff contract).  
3. Detect capability gaps and propose new agents (evolution feedback loop).  
4. Maintain verifiable provenance of multi-agent contributions.  

This module extends single-agent lifecycle guarantees (Modules 01–08) into a cooperative mesh while preserving transparency and reproducibility.

---

## 2. Scope & Non-Scope

| Category | In Scope | Out of Scope |
|----------|----------|--------------|
| Delegation | One-to-one task delegation | Unbounded broadcast fan-out (future) |
| Chaining | Sequential dependency chains | Parallel race orchestration (future) |
| Gap Detection | Heuristic capability deficit analysis | Autonomous self-creation of agents |
| Artifacts | Markdown working files + structured envelopes | Binary large object streaming |
| Security | Capability-scoped invocation | Full RBAC / external auth integration |

---

## 3. Core Concepts

| Term | Definition | Notes |
|------|------------|-------|
| Capability | Atomic functional unit an agent can reliably perform (e.g., deep context acquisition) | Declared in registry |
| Capability Manifest | Structured list of an agent's capabilities + confidence + constraints | JSON/YAML form |
| Delegator | Agent initiating a request to another agent | Must persist request envelope |
| Specialist | Target agent accepting a delegated task | Must write its own working file |
| Delegation Envelope | Structured request + context slice + output contract | Immutable after send |
| Return Payload | Specialist's structured response with artifact references | Logged + archived |
| Gap Hypothesis | Proposed missing capability cluster | Triggers RFC suggestion (Module 08) |
| Suggestion Record | Logged structured proposal to create/extend agent | Enters governance pipeline |

---

## 4. Capability Model

Capabilities are hierarchical:

```text
Root
 ├─ research.context.acquire
 ├─ research.context.deepen
 ├─ synthesis.structuring.compose
 ├─ content.script.drafting
 ├─ clarification.input.disambiguation
 └─ qa.verification.multi-claim
```

### 4.1 Capability Manifest (Example)

```json
{
  "agent": "research-agent",
  "version": "1.2.0",
  "capabilities": [
    {"name": "research.context.acquire", "confidence": 0.95, "constraints": ["Requires network fetch tools"], "latency_weight": 1.0},
    {"name": "research.context.deepen", "confidence": 0.92, "constraints": ["Needs multi-source saturation"], "latency_weight": 1.2},
    {"name": "qa.verification.multi-claim", "confidence": 0.88, "constraints": ["Must access source artifacts"], "latency_weight": 1.4}
  ],
  "exclusions": ["content.script.drafting"],
  "notes": "Optimized for depth-first domain extraction."
}
```

---

## 5. Agent Registry (Minimal Contract)

| Field | Description | Required |
|-------|-------------|----------|
| id | Unique agent identifier | Yes |
| version | Semantic version | Yes |
| role | Human-readable specialization | Yes |
| capabilities | Array of capability descriptors | Yes |
| interface | Accepted delegation types (enum) | Yes |
| artifactsProduced | Standard artifact kinds (e.g., working-file, summary-block) | Yes |
| maxDepth | Depth tier supported ("quick", "learning", "deep") | Yes |
| notes | Operational caveats | Optional |

---

## 6. Delegation Protocol

### 6.1 Trigger Heuristics

Delegate when ALL are true:

- Target capability NOT in delegator's high-confidence set OR cost (latency_weight) significantly higher than specialist.
- Task complexity exceeds threshold (e.g., requires deep dimension expansion).
- Downstream task blocked on missing structured artifact.

### 6.2 Request Envelope

```json
{
  "request_id": "dlg-2025-10-06-001",
  "from_agent": "script-agent",
  "to_agent": "research-agent",
  "timestamp": "2025-10-06T15:40:00Z",
  "capability": "research.context.deepen",
  "objective": "Expand depth on emerging API changes for Feature X",
  "context_slice": {
    "prior_outline_path": "working/script/outline-v2.md",
    "known_gaps": ["recent deprecations", "performance benchmarks"],
    "constraints": ["Prefer official docs", "Highlight contradictions"]
  },
  "output_contract": {
    "artifact_type": "working-file",
    "expected_sections": ["Sources","Contradictions","Depth Expansion"],
    "quality_gates": ["G1","G2","G3"]
  },
  "timeout_minutes": 15
}
```

### 6.3 Specialist Responsibilities

1. Create its own working file (Module 03 standards).  
2. Execute lifecycle phases relevant to capability.  
3. Populate required sections in output contract.  
4. Return payload referencing persisted artifact path.  
5. Mark unresolved contradictions explicitly.

### 6.4 Response Envelope

```json
{
  "request_id": "dlg-2025-10-06-001",
  "status": "COMPLETED",
  "from_agent": "research-agent",
  "artifact_path": "working/research/depth-expansion-feature-x.md",
  "summary": "Depth expansion complete: 7 sources, 2 contradictions resolved, 1 pending.",
  "metrics": {"sources": 7, "contradictions_resolved": 2, "contradictions_pending": 1, "elapsed_sec": 536},
  "follow_up_recommended": ["qa.verification.multi-claim"],
  "unresolved": ["Benchmark variance between v1.3 and v1.4"]
}
```

### 6.5 Status Codes

| Code | Meaning | Delegator Action |
|------|---------|------------------|
| ACCEPTED | Specialist started | Await completion / set timer |
| COMPLETED | Artifact ready | Ingest + continue workflow |
| REJECTED_CAPABILITY | Capability mismatch | Re-route or propose gap |
| REJECTED_CONTEXT | Missing critical context | Augment & reissue |
| TIMEOUT | Deadline passed | Retry or escalate |
| FAILED_EXECUTION | Internal error | Review log; decide retry |

---

## 7. Orchestration Patterns

| Pattern | Use Case | Sequence |
|---------|----------|----------|
| Single Delegation | Isolated deepening need | Delegator → Specialist → Return |
| Chained Delegation | Multi-stage enrichment | A → B (research) → C (verification) → A |
| Dual Phase Support | Script drafting w/ research injection | Script Agent pauses → Research → Resume |
| Gap Suggestion Loop | Missing capability detected | Delegator logs gap → Suggestion record → Governance (08) |

---

## 8. Gap Detection & Suggestion Workflow

### 8.1 Heuristic Triggers

- Delegations repeatedly REJECTED_CAPABILITY for same capability cluster.  
- Latency penalty > 2× baseline due to missing specialization.  
- High frequency clarifications required early in lifecycle (signals need for clarifier agent).  

### 8.2 Gap Scoring (0–1)

```text
score = (rejection_rate * 0.4) + (latency_penalty_ratio * 0.3) + (clarification_cycles_ratio * 0.3)
```

Threshold: >= 0.55 → Suggest new agent.

### 8.3 Suggestion Record Template

```json
{
  "suggestion_id": "gap-clarifier-2025-10-06-01",
  "proposed_agent": "clarifier-agent",
  "capabilities": [
    "clarification.input.disambiguation",
    "clarification.intent.contract-derivation"
  ],
  "justification": {
    "rejection_rate": 0.33,
    "latency_penalty_ratio": 1.9,
    "clarification_cycles_ratio": 0.62,
    "score": 0.61
  },
  "impact_expectation": "Reduce ambiguity-driven rework in Phase 0 by 40%",
  "rfc_reference": null,
  "submitted_by": "script-agent"
}
```

---

## 9. Working File Handoff Contract

| Field | Requirement | Notes |
|-------|-------------|-------|
| context_slice | Minimal but sufficient subset | Avoid dumping full file |
| dependency_vector | Explicit list of sections relied on | Prevent hidden coupling |
| output_contract | Sections + quality gates expected | Must map to verification gates |
| provenance | Request + agent ids + timestamps | Enables audit trail |
| artifact_path | Final specialist working file path | Must be markdown |
| unresolved | Array of open issues | Delegator must address or defer |

---

## 10. Concurrency & Ownership

Rules:

1. Only ONE agent writes to a specific working file path at a time.  
2. Delegator MUST NOT mutate specialist artifact—ingest via copy/merge.  
3. If two delegations depend on same upstream context, snapshot context_slice with hash to ensure consistency.  
4. Conflicts resolved by revalidating upstream sections (Phase 4 verification).  

---

## 11. Failure Handling Matrix

| Failure | Detection | Specialist Action | Delegator Response |
|---------|-----------|-------------------|--------------------|
| Missing context | REJECTED_CONTEXT | Provide required fields list | Reissue with augmentation |
| Capability mismatch | REJECTED_CAPABILITY | Suggest alternative agent id | Route or log gap |
| Timeout | TIMEOUT status | Optionally send partial payload | Decide: retry / abort |
| Internal error | FAILED_EXECUTION | Return diagnostic notes | Evaluate retry threshold |
| Contradiction unresolved | Response.unresolved non-empty | Mark unresolved explicitly | Insert verification step |

---

## 12. Metrics & Observability

| Metric | Definition | Target |
|--------|------------|--------|
| delegation_success_rate | COMPLETED / total delegations | > 0.85 |
| avg_round_trip_sec | Mean elapsed_sec per COMPLETED | < 600 (deep tasks) |
| gap_suggestion_frequency | Suggestions / 30 days | Context-dependent |
| clarification_rework_ratio | Clarification cycles / tasks | Downward trend |
| unresolved_carryover | Unresolved items passed upstream | < 10% |

All metrics feed governance review (Module 08).

---

## 13. Security & Permission Boundaries

Principles:

- Least capability exposure in registry.  
- Delegator MUST NOT escalate specialist beyond declared capabilities.  
- Specialist MUST ignore out-of-scope instructions even if included in objective.  
- Gap suggestions MUST NOT include speculative external data sources without validation.

---

## 14. Example Scenarios

### 14.1 Script Agent Delegates Research

1. Script agent stalls on outdated API details.  
2. Issues delegation (research.context.deepen).  
3. Research agent produces depth expansion working file + contradictions section.  
4. Script agent ingests, updates outline, resumes drafting.  

### 14.2 Gap: Clarifier Agent

Observed repeated early-phase ambiguity → high clarification cycles ratio. Gap scoring exceeds 0.55 → Suggest `clarifier-agent` specialized in structured prompt disambiguation + requirement contract generation.  

### 14.3 Chained Delegation

Research → Verification (multi-claim) → Synthesis agent aggregates findings into standardized pattern library.

---

## 15. Extension Guidelines

To extend orchestration (e.g., parallel delegation):

1. Define new status codes.  
2. Introduce coordination artifact (e.g., aggregation manifest).  
3. Update Failure Handling Matrix (Section 11).  
4. Add metrics (e.g., parallel_efficiency_ratio).  
5. Submit RFC (Module 08) referencing sections modified.  

---

## 16. Anti-Patterns

| Anti-Pattern | Risk | Corrective Action |
|--------------|------|-------------------|
| Hidden delegation (no envelope persisted) | Breaks audit trail | Enforce structured envelope |
| Over-delegation (micro tasks) | Coordination overhead | Apply trigger heuristics strictly |
| Artifact mutation by delegator | Loss of provenance | Use merge with attribution footer |
| Gap spam (low-score suggestions) | Governance noise | Enforce threshold ≥ 0.55 |
| Capability inflation | Misrouted tasks | Periodic capability review |

---

## 17. Compliance Checklist

- [ ] Capability manifest registered
- [ ] Delegation envelopes persisted
- [ ] Working file per specialist created
- [ ] Response envelopes archived
- [ ] Gap detection scoring implemented
- [ ] Suggestions logged with threshold rule
- [ ] No mutation of specialist artifacts
- [ ] Metrics captured (Section 12)

---

## 18. Completion Criteria

This module considered satisfied in an implementation when:

1. At least one successful end-to-end delegation logged.  
2. Gap detection algorithm executed (even if no suggestion triggered).  
3. Specialist artifact ingested without direct mutation.  
4. Metrics export includes required fields.  

---

Build cooperation deliberately: delegate for depth, specialize for quality, suggest for evolution.
