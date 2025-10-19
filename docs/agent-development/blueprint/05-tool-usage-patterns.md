# Tool Usage Patterns

**Status**: active  
**Version**: 1.0.0  
**Last Updated**: 2025-10-06  
**Related**: 01-agent-design-principles.md, 02-autonomous-execution-behavior.md, 03-working-file-lifecycle-standard.md

---

## 1. Purpose
Define canonical invocation patterns, sequencing rules, and misuse guards for core tools supporting autonomous agent operation.

---

## 2. Tool Inventory & Roles
| Tool | Primary Role | Secondary Role | Misuse to Avoid |
|------|--------------|----------------|-----------------|
| promptBoost | Input refinement | Scope normalization | Repeated invocation mid-session |
| manage_todo_list | Execution scaffolding | Progress auditing | Using as narrative log |
| think | Focused reasoning micro-step | Hypothesis refinement | Replacing multi-step planning |
| sequentialthinking | Structured multi-thought planning | Verification + synthesis | Overuse for trivial transitions |
| fetch_webpage | Source acquisition | Targeted verification fetches | Bulk non-strategic crawling |
| semantic_search | Concept discovery | Coverage validation | Substituting for direct fetches |
| grep_search | Targeted pattern extraction | Sanity checks | Using where semantic expansion needed |
| read_file | Local content ingestion | Anchor validation | Large redundant reads |
| replace_string_in_file | Incremental working file updates | Structured artifact patching | Whole-file rewrites |
| create_file | Artifact creation | Final deliverable assembly | Premature finalization |
| run_in_terminal | System-level operations | Cleanup/deletion | Creating/editing content directly |

---

## 3. Sequencing Matrix by Phase
| Phase | Must Use | Conditional | Must Not Use |
|-------|----------|------------|--------------|
| 0 Input Conditioning | promptBoost | think | sequentialthinking (until approval) |
| 1 Planning | sequentialthinking | think | fetch_webpage (before plan ready) |
| 2 Acquisition | fetch_webpage | semantic_search, grep_search | create_file (final) |
| 3 Deepening | fetch_webpage, replace_string_in_file | sequentialthinking (sub-aspects) | promptBoost |
| 4 Verification | sequentialthinking, fetch_webpage | grep_search | promptBoost |
| 5 Synthesis | sequentialthinking, replace_string_in_file | think | promptBoost, fetch_webpage (unless gap) |
| 6 Output Assembly | create_file, replace_string_in_file | read_file | promptBoost, fetch_webpage |
| 7 Reflection | sequentialthinking | think | fetch_webpage |
| 8 Finalization | replace_string_in_file, create_file | run_in_terminal | promptBoost, fetch_webpage |

---

## 4. Invocation Patterns
### 4.1 promptBoost
```
IF user query ambiguous OR broad
  CALL promptBoost(original_query)
  Present improved query once
  AWAIT user approval
LOCK improved query → persist in working file header
```
NEVER re-run mid-session unless user scope pivot.

### 4.2 sequentialthinking
Use for: dimension mapping, contradiction analysis, synthesis structuring, reflection scoring.
Pattern:
```
CALL sequentialthinking(thought_count = context-driven)
Append structured result under relevant anchor
```

### 4.3 fetch_webpage (Batch Mode)
```
FOR each planned batch:
  FOR each prioritized source target:
    CALL fetch_webpage(url or query)
  Summarize batch (domains, new entities, gaps)
  Append ### Batch N Summary
```

### 4.4 replace_string_in_file (Append Mode)
ALWAYS target specific anchor—never wholesale replace unless template correction.

### 4.5 manage_todo_list
Minimal actionable tasks only:
```
[ ] Phase 2 Batch 3 Acquisition
[ ] Verification Gate 2
[ ] Synthesis Pass 1
```
Auto-complete immediately after execution.

---

## 5. Failure Prevention Guards
| Risk | Guard Pattern | Abort Condition |
|------|---------------|-----------------|
| Tool dormancy | Enforce max 3 min w/o tool call | If violated twice → session invalid |
| Working file stagnation | Detect no replace_string_in_file over 2 batches | Force update or restart |
| Over-narration | Detect >2 consecutive narrative-only messages | Switch to execution-only mode |
| Redundant fetches | Track identical URLs in same batch | Skip + log de-duplication |
| Unbounded search | Track escalating semantic_search w/o harvest | Insert planning checkpoint |

---

## 6. Tool Combination Recipes
| Recipe | Use Case | Sequence |
|--------|----------|----------|
| Dimension Planning | Start of research | promptBoost → sequentialthinking → replace_string_in_file |
| Batch Acquisition Loop | Phase 2 | fetch_webpage × N → replace_string_in_file → (optional sequentialthinking checkpoint) |
| Contradiction Resolution | Verification | fetch_webpage (targeted) → sequentialthinking (analysis) → replace_string_in_file |
| Synthesis Pass | Phase 5 | sequentialthinking (cluster) → replace_string_in_file (thematic block) |
| Final Assembly | Phase 6 | read_file (scaffold) → create_file (deliverable) → replace_string_in_file (index update) |

---

## 7. Structured Examples
### 7.1 Correct Acquisition Batch
```
fetch_webpage: https://learn.microsoft.com/.../governance-overview
fetch_webpage: https://iso.org/.../38505
fetch_webpage: https://azure.microsoft.com/.../catalog
replace_string_in_file: (### Batch 2 Summary)
```

### 7.2 Incorrect (Narration Without Execution)
```
Agent: "Researching governance models now and will update shortly..."
```
Correction: Replace narration with immediate fetch sequence.

### 7.3 Working File Update
```
replace_string_in_file target: ### Batch 2 Summary anchor span
Content:
- Sources: [14]-[19]
- New Entities: data domain steward, catalog lineage bridge
- Gaps: enforcement escalation, exception workflows
- Next: Focus lineage traceability
```

---

## 8. Escalation Protocol
Trigger escalation if:
- 2 consecutive verification gates fail
- Domain diversity score < 0.25 after mid-phase
- Saturation claim disputed by user
Respond by:
1. Logging escalation block in working file
2. Running targeted semantic_search
3. Offering scoped pivot recommendation

---

## 9. Metrics & Monitoring (Future Automation)
| Metric | Capture | Threshold |
|--------|---------|-----------|
| Tool cadence | Time delta between calls | < 180s active phase |
| Batch completeness | Anchor coverage | 100% planned batches |
| Fetch redundancy | Duplicate URL count | < 3 per session |
| Plan drift | Dimensions missing in updates | 0 |

---

## 10. Quick Reference
```
promptBoost ONCE → Plan → Fetch in batches → Update working file every batch → Verify → Synthesize → Assemble → Finalize → Cleanup
```

---

Tools are not accessories—they ARE the execution substrate. Master their patterns to build trustworthy autonomy.
