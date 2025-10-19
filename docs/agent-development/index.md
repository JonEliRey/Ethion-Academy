# Agent Development Blueprint Index

**Focus**: Forward-looking design standards for autonomous, transparent, verifiable agents.  
**Secondary**: Historical fix logs (archived) for context—not primary guidance.  
**Last Updated**: 2025-10-06

---

## 📁 Directory Structure

```text
docs/agent-development/
├── index.md (this file)
├── blueprint/
│   ├── 01-agent-design-principles.md
│   ├── 02-autonomous-execution-behavior.md
│   ├── 03-working-file-lifecycle-standard.md
│   ├── 04-deep-context-acquisition.md
│   ├── 05-tool-usage-patterns.md
│   ├── 06-research-mode-structure-blueprint.md
│   ├── 07-quality-assurance-and-self-checks.md
│   ├── 08-contribution-and-evolution-process.md
│   └── 09-agentic-interaction-and-orchestration.md
└── archive/
    └── chatmode-enhancements/ (legacy fix cycles)
```

---

## 🚀 Start Here

If designing or updating an agent:

1. Read: `blueprint/01-agent-design-principles.md`
2. Map execution flow using: `02-autonomous-execution-behavior.md`
3. Implement working file pattern via: `03-working-file-lifecycle-standard.md`
4. Plan depth strategy using: `04-deep-context-acquisition.md`
5. Align tool usage with: `05-tool-usage-patterns.md`
6. Select mode profile via: `06-research-mode-structure-blueprint.md`
7. Apply verification gates from: `07-quality-assurance-and-self-checks.md`
8. Contribute changes using: `08-contribution-and-evolution-process.md`
9. Implement multi-agent delegation via: `09-agentic-interaction-and-orchestration.md`

---

## 📚 Blueprint Modules Overview

| # | File | Core Theme | Key Outputs | Critical Dependencies |
|---|------|-----------|-------------|-----------------------|
| 01 | Agent Design Principles | Foundational tenets | Lifecycle mapping, tenets checklist | All others |
| 02 | Autonomous Execution Behavior | State machine | State transitions, gating points | 01, 05, 07 |
| 03 | Working File Lifecycle Standard | Externalized memory | Naming, anchors, validation schema | 01, 02 |
| 04 | Deep Context Acquisition | Layered extraction | Dimension planning, saturation criteria | 01, 02, 05 |
| 05 | Tool Usage Patterns | Operational layer | Sequencing matrix, guardrails | 01, 02 |
| 06 | Research Mode Structure Blueprint | Mode architecture | Mode matrix, output blueprint | 01, 02, 03, 04 |
| 07 | Quality Assurance & Self-Checks | Verification | Gates, metrics, self-check framework | 02, 03, 05 |
| 08 | Contribution & Evolution Process | Governance | RFC workflow, versioning | All |
| 09 | Agentic Interaction & Orchestration | Multi-agent delegation & gap evolution | Delegation protocol, gap detection, capability registry | 01,02,03,05,07,08 |

---

## 🔐 Core Guarantees (Blueprint Compliance)

An agent conforming to this blueprint MUST demonstrate:

- Tool-first execution (no narrative stand-ins)
- Working file iteration aligned to mode depth
- Explicit batch + dimension demarcation
- Verification gates logged with PASS/FAIL
- Saturation justification (deep mode)
- Self-check critical criteria = all Yes
- Final artifact derivable from working file

---

## 🧪 Quick Compliance Checklist

| Area | Pass Condition | Source |
|------|---------------|--------|
| Lifecycle Mapping | All 8 phases traceable | 01, 02 |
| Working File Integrity | Anchors + progression present | 03 |
| Depth Coverage | Dimensions + saturation logged | 04 |
| Tool Pattern Adherence | No misuse patterns logged | 05 |
| Mode Fidelity | Mode matrix expectations met | 06 |
| Quality Gates | G1–G5 executed + recorded | 07 |
| Governance Alignment | Version + RFC rules followed | 08 |

---

## 🗂️ Archive (Historical Context)

Legacy fix-cycle docs preserved for root-cause traceability:  
`archive/chatmode-enhancements/`

| Cycle | Focus | Outcome |
|-------|-------|---------|
| 01 | Autonomous execution misuse | Replaced "silent mode" semantics |
| 02 | Residual language regression | Complete eradication pass |
| 03 | Working file stagnation | Iterative update enforcement |
| 04 | Pattern scaling | Applied to learning + deep modes |

Do NOT base new design directly on archive—use active blueprint.

---

## 🔗 Related Implementation Files

- `.github/chatmodes/quick-research.chatmode.md`
- `.github/chatmodes/learning-research.chatmode.md`
- `.github/chatmodes/deep-research.chatmode.md`

---

## 🧩 Adding a New Blueprint Module

Provide in RFC:

1. Problem definition
2. Proposed module scope
3. Interaction map with existing modules
4. Added heuristics / metrics
5. Backward compatibility notes

---

## ♻ Evolution Workflow (Summary)

```text
Need Identified → RFC Drafted → Review Cycle → Approval → Version Bump → Index Update → Archive Superseded
```

---

## 🆘 Help & Orientation

New contributors:

1. Read modules 01 → 05 sequentially first time
2. Use compliance checklist before final delivery
3. Treat archive ONLY as historical rationale
4. Submit RFC for any non-trivial deviation

---

Build forward. Archive the past. Enforce the present. Evolve deliberately.
