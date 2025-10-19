# Working File Lifecycle Standard

**Status**: active  
**Version**: 1.0.0  
**Last Updated**: 2025-10-06  
**Related**: 01-agent-design-principles.md, 02-autonomous-execution-behavior.md, 05-tool-usage-patterns.md

---

## 1. Purpose
Define the required structure, naming, content evolution, and disposal rules for ephemeral working files used as the primary externalized memory during autonomous execution phases.

---

## 2. Naming Convention (Mandatory)
```
Research/.temp/{YYYYMMDD-HHMMSS}-{topic-slug}-{mode}-WORKING.md
```
| Segment | Description | Rules |
|---------|-------------|-------|
| YYYYMMDD-HHMMSS | UTC timestamp at creation | 24h time, zero-padded |
| topic-slug | Lowercase kebab-case from improved query | Strip stopwords > 3 chars |
| mode | quick | learning | deep | reflect actual mode |
| SUFFIX | Literal `-WORKING.md` | Constant |

If naming validation fails → REJECT creation and retry.

---

## 3. Directory Requirements
| Path | Requirement | Rationale |
|------|-------------|-----------|
| `Research/.temp/` | MUST exist; create if missing | Isolation + cleanup safe |
| `Research/` | MUST contain pillar/category subfolders | Future classification |
| `.temp/` | SHOULD be git-ignored | Prevents polluting version control |

---

## 4. Initialization Template
Upon creation, file MUST contain:
```markdown
# WORKING FILE (DO NOT TREAT AS FINAL)

- Session Start (UTC): 2025-10-06T12:34:56Z
- Mode: deep
- Topic (Improved): enterprise data governance operating model
- Original Query: "Data governance framework enterprise"
- Agent: deep-research
- Status: initializing

## Phase Log
(Chronological entries appended below)
```
Missing any required header field → INVALID working file → MUST patch before continuing.

---

## 5. Update Patterns by Phase
| Phase | Update Frequency | Minimum Content Required |
|-------|------------------|---------------------------|
| 1 Planning | Once | Dimensions, objectives, success criteria |
| 2 Acquisition | Per batch (3–5 total) | Sources list + batch summary + gap analysis |
| 3 Deepening (deep mode) | Per dimension + per batch | Dimension focus, extracted entities, unresolved questions |
| 4 Verification | Each contradiction cluster | Claim, sources compared, resolution status |
| 5 Synthesis | 2–3 passes | Thematic groups, cross-links, insight candidates |
| 6 Output Assembly | Once | Final structure outline (headings + section intent) |
| 7 Reflection | Once | Limitations, confidence ratings, open issues |
| 8 Finalization | Once | Completion timestamp, migration confirmation |

---

## 6. Required Section Patterns
Agents MUST use consistent anchors for machine parsing:
```
### Batch N Summary
### Dimension: <name>
### Verification Gate N
### Contradiction: <short-handle>
### Thematic Cluster: <label>
### Saturation Evidence
### Final Structure Draft
### Reflection
### Completion
```
Missing anchors = structural deficiency → MUST backfill before finalization.

---

## 7. Content Quality Rules
| Aspect | Rule | Violation Example | Correction |
|--------|------|-------------------|-----------|
| Citations | Use numeric inline markers [1], [2] matching source list | "According to doc" | Add numbered markers |
| Source List | Include URL + domain + title | Raw URL only | Enrich with metadata |
| Batch Summary | MUST include next-focus statement | "Batch 2 done" | Add: "Next: authentication edge cases" |
| Saturation | MUST provide evidence (no new entities/patterns) | "Seems saturated" | Add explicit comparison |
| Contradictions | MUST classify (resolved/unresolved) | Just list conflicting claims | Add status + resolution note |

---

## 8. Completion Protocol
Before deleting working file, ensure:
- [ ] Final deliverable created & validated
- [ ] All required sections present
- [ ] All contradictions annotated
- [ ] All verification gates logged
- [ ] Completion timestamp added (UTC)
- [ ] Migration flag recorded
- [ ] Memory entry prepared (if subsystem available)

Only THEN delete working file. If retention required (e.g., auditing), move to `Research/.retained/` with justification log.

---

## 9. Validation Checklist (Automatable)
| Check | Method | Pass Condition |
|-------|--------|----------------|
| Naming pattern | Regex | Matches ^Research/.temp/\d{8}-\d{6}-[a-z0-9\-]+-(quick|learning|deep)-WORKING.md$ |
| Header completeness | Key scan | All 7 required keys present |
| Batch anchors | Count | >= planned batch count |
| Dimension anchors (deep) | Count | >= planned dimension count |
| Verification gates | Count | All required gates present |
| Final structure | Anchor present | "### Final Structure Draft" exists |
| Reflection | Anchor present | "### Reflection" exists |
| Completion | Anchor present | "### Completion" exists |

---

## 10. Anti-Patterns (Reject Session)
| Pattern | Reason | Response |
|---------|--------|----------|
| Single write only | No iterative evidence | Force reconstruct missing phases |
| Overwritten instead of appended | History loss | Switch to append model |
| Missing batch summaries | No progression trace | Rebuild from tool logs |
| Late creation (after Phase 2 start) | Planning opacity | Abort + restart session |

---

## 11. Future Enhancements
| Feature | Benefit |
|---------|---------|
| Structured JSON mirror | Machine ingestion | Faster analytics |
| Automated anchor injection | Reduce agent drift | Consistency |
| Semantic diff summarizer | Faster reviews | Governance tooling |

---

## 12. Quick Reference Snippet
```text
IF working file missing -> create
ELSE append phase block
NEVER finalize without: structure + reflection + completion anchor
ALWAYS delete after migration (unless retained with justification)
```

---

A working file is not optional—it is the living audit trail. Its absence or stagnation invalidates autonomy claims.
