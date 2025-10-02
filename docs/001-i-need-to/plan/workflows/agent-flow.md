# Agent Flow Guide

## Overview
This document visualizes the complete agent interaction flow for the Super-Intelligent Course Designer system, from idea to published content.

---

## Full Content Development Cycle

```
┌─────────────────────────────────────────────────────────────────┐
│                    CONTENT DEVELOPMENT LIFECYCLE                │
└─────────────────────────────────────────────────────────────────┘

┌──────────────┐
│ PHASE 1:     │
│ STRATEGIC    │──────────────────────────────────────────────┐
│ PLANNING     │                                              │
└──────────────┘                                              │
                                                              ▼
    ┌─────────────────────┐          ┌──────────────────────────┐
    │ Content Strategist  │────────> │ SME (Technical Validator) │
    │ - Demand analysis   │          │ - Verify accuracy        │
    │ - Pillar/path       │          │ - Identify gaps          │
    │   proposals         │          │ - Validate prerequisites │
    └─────────────────────┘          └──────────────────────────┘
              │                                    │
              │                                    ▼
              │                       ┌──────────────────────────┐
              │                       │ Executive Producer       │
              │                       │ (Human Decision Point)   │
              │                       │ - Approve/Reject/Revise  │
              │                       └──────────────────────────┘
              │                                    │
              │                      ┌─────────────┴─────────────┐
              │                      │                           │
              │                   APPROVED                    REJECTED
              │                      │                           │
              │                      ▼                           ▼
              │             ┌──────────────┐          ┌─────────────────┐
              │             │  Librarian   │          │ Return to       │
              │             │  - Catalog   │          │ Content         │
              │             │  - Tag       │          │ Strategist with │
              │             │  - Link      │          │ specific        │
              │             └──────────────┘          │ feedback        │
              │                                       └─────────────────┘
              │
              ▼

┌──────────────┐
│ PHASE 2:     │
│ CONTENT      │
│ CREATION     │
└──────────────┘
              │
              ▼
    ┌─────────────────────┐
    │ Scriptwriter        │
    │ - Lesson outlines   │──────> [ Editor Reviews ]
    │ - Video briefs      │          ↓
    │ - Blog briefs       │        Approve/Revise?
    │ - Leader's Lens     │          │
    └─────────────────────┘          │
              │                      ▼
              │              ┌──────────────────┐
              │              │ Community Manager│
              │              │ - Engagement     │
              │              │ - CTAs           │
              │              │ - Funnel         │
              │              └──────────────────┘
              │                      │
              │                      ▼
              │              ┌──────────────────┐
              │              │ SEO Lead         │
              │              │ - Keywords       │
              │              │ - Metadata       │
              │              │ - Optimization   │
              │              └──────────────────┘
              │                      │
              │                      ▼
              │              ┌──────────────────┐
              │              │ QA Reviewer      │
              │              │ - Final checks   │
              │              │ - Link validation│
              │              │ - Standards      │
              │              └──────────────────┘
              │                      │
              │                      ▼
              │              ┌──────────────────┐
              │              │ Executive Producer│
              │              │ - Final approval │
              │              └──────────────────┘
              │                      │
              │                      ▼
              │              ┌──────────────────┐
              │              │ Librarian        │
              │              │ - Catalog final  │
              │              │ - Export JSON    │
              │              └──────────────────┘
              │
              ▼

┌──────────────┐
│ PHASE 3:     │
│ MAINTENANCE  │
│ & MONITORING │
└──────────────┘
              │
              ▼
    ┌──────────────────────┐
    │ Monitoring Specialist│
    │ - Check sources      │
    │ - Detect changes     │
    │ - Identify affected  │
    │   content            │
    └──────────────────────┘
              │
              │ (If updates needed)
              ▼
    ┌─────────────────────┐
    │ Content Strategist  │
    │ - Re-evaluate scope │
    │ - Propose updates   │
    └─────────────────────┘
              │
              ▼
    [Cycle back to Phase 1 for re-validation]
```

---

## Agent Interaction Summary

### Phase 1: Strategic Planning (Pillars & Learning Paths)
**Agents Involved**: Content Strategist → SME → Executive Producer (approval) → Librarian

**Typical Duration**: 1-3 days per pillar, 1 day per learning path

**Key Decisions**:
- Does demand justify this content?
- Is scope technically accurate?
- Do we have resources to create this?

---

### Phase 2: Content Creation (Courses, Modules, Lessons)
**Agents Involved**: Scriptwriter → Editor → Community Manager → SEO Lead → QA Reviewer → Executive Producer (approval) → Librarian

**Typical Duration**: 1-2 weeks per lesson (including production)

**Key Decisions**:
- Is content quality sufficient?
- Will it engage target audience?
- Is it discoverable?
- Ready for learners?

---

### Phase 3: Maintenance & Monitoring
**Agents Involved**: Monitoring Specialist → Content Strategist → (back to Phase 1 for re-validation)

**Typical Duration**: Continuous (weekly scans, monthly reviews)

**Key Decisions**:
- Has source material changed?
- Is content still accurate?
- What's the update priority?

---

## Decision Trees

### Pillar Approval Decision Tree
```
Pillar Proposed
    │
    ├─> Demand < 1,000 job postings?
    │       └─> REJECT (Insufficient demand)
    │
    ├─> SME finds technical errors?
    │       └─> REVISE (Return to Content Strategist)
    │
    ├─> Scope unclear or too broad?
    │       └─> REVISE (Clarify boundaries)
    │
    └─> All criteria met?
            └─> APPROVE (Proceed to learning path development)
```

### Lesson Approval Decision Tree
```
Lesson Complete
    │
    ├─> Editor finds quality issues?
    │       └─> REVISE (Return to Scriptwriter)
    │
    ├─> QA finds broken links?
    │       └─> REVISE (Fix critical issues)
    │
    ├─> SEO keywords not researched?
    │       └─> REVISE (Return to SEO Lead)
    │
    └─> All gates passed?
            └─> APPROVE (Ready for production)
```

---

## Common Paths vs Edge Cases

### Common Path: Successful Pillar to Published Lesson
```
1. Content Strategist proposes pillar (2 hours)
2. SME validates scope (1 hour)
3. Executive Producer approves (5 minutes)
4. Librarian catalogs (30 minutes)
5. Scriptwriter creates lesson outline (4 hours)
6. Editor reviews (1 hour)
7. Community Manager optimizes (1 hour)
8. SEO Lead adds keywords (30 minutes)
9. QA Reviewer final check (30 minutes)
10. Executive Producer approves (5 minutes)
11. Librarian catalogs final (30 minutes)

Total: ~11 hours agent time + ~10 minutes human approval time
```

### Edge Case: Rejection and Rework
```
1. Content Strategist proposes pillar
2. SME finds 3 technical errors
3. Handoff back to Content Strategist (with specific feedback)
4. Content Strategist revises (2 hours)
5. SME re-validates (30 minutes)
6. Executive Producer approves

Total: +2.5 hours for rework cycle
```

### Edge Case: Source Update Detected
```
1. Monitoring Specialist detects Airflow 2.8 release (breaking changes)
2. Identifies 3 affected lessons
3. Handoff to Content Strategist with impact analysis
4. Content Strategist re-evaluates scope (1 hour)
5. SME validates updated scope (30 minutes)
6. Scriptwriter updates lesson code examples (2 hours)
7. [Standard review cycle: Editor → Community Manager → SEO Lead → QA → Approval]
8. Librarian updates database records

Total: ~5-6 hours per affected lesson
```

---

## Role of Executive Producer (Human)

The Executive Producer (human) makes decisions at these critical points:

1. **Pillar Approval**: After Content Strategist + SME validation
2. **Learning Path Approval**: After SME validation
3. **Lesson Final Approval**: After full agent pipeline (Scriptwriter → QA)
4. **Update Prioritization**: After Monitoring Specialist detects changes
5. **Conflict Resolution**: When agents disagree or encounter ambiguity

**Decision Time**: Typically 5-10 minutes per checkpoint (review handoff message, approve/reject/request revisions)

---

*See Also*:
- handoff-protocol.md - Message format specifications
- stage-gates.md - Approval criteria details
- ../examples/ - Complete scenario walkthroughs
