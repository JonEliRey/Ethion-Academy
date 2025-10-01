# Stage-Gated Workflow Diagram

## Process Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    STAGE GATE WORKFLOW                       │
│           (Super-Intelligent Course Designer)                │
└─────────────────────────────────────────────────────────────┘

                            START
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  STAGE 1: PILLARS                                            │
│  Label: stage/pillars                                        │
│  ┌────────────────────────────────────────────────────┐    │
│  │ 1. Create issue (Stage Gate Review template)       │    │
│  │ 2. Apply stage/pillars label                       │    │
│  │ 3. Auto-linked to Project → Pillars column         │    │
│  │ 4. Executive Producer reviews                      │    │
│  │ 5. Create Draft PR with pillar definitions         │    │
│  │ 6. CODEOWNERS requests review                      │    │
│  │ 7. Approval = Advance to next stage                │    │
│  └────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  STAGE 2: LEARNING PATHS                                     │
│  Label: stage/paths                                          │
│  ┌────────────────────────────────────────────────────┐    │
│  │ 1. Create issue for Learning Paths                 │    │
│  │ 2. Apply stage/paths label                         │    │
│  │ 3. Auto-linked to Project → Paths column           │    │
│  │ 4. Provide evidence & demand signals               │    │
│  │ 5. Create Draft PR with path outlines              │    │
│  │ 6. Review and approval                             │    │
│  └────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  STAGE 3: COURSES                                            │
│  Label: stage/courses                                        │
│  ┌────────────────────────────────────────────────────┐    │
│  │ 1. Create issue for Course outlines                │    │
│  │ 2. Apply stage/courses label                       │    │
│  │ 3. Auto-linked to Project → Courses column         │    │
│  │ 4. Define course structure & modules               │    │
│  │ 5. Create Draft PR                                 │    │
│  │ 6. Review and approval                             │    │
│  └────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  STAGE 4: MODULES                                            │
│  Label: stage/modules                                        │
│  ┌────────────────────────────────────────────────────┐    │
│  │ 1. Create issue for Module breakdowns              │    │
│  │ 2. Apply stage/modules label                       │    │
│  │ 3. Auto-linked to Project → Modules column         │    │
│  │ 4. Define module lessons & objectives              │    │
│  │ 5. Create Draft PR                                 │    │
│  │ 6. Review and approval                             │    │
│  └────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  STAGE 5: LESSONS                                            │
│  Label: stage/lessons                                        │
│  ┌────────────────────────────────────────────────────┐    │
│  │ 1. Create issue for Lesson details                 │    │
│  │ 2. Apply stage/lessons label                       │    │
│  │ 3. Auto-linked to Project → Lessons column         │    │
│  │ 4. Create briefs for YouTube/Blog/Academy          │    │
│  │ 5. Include Leader's Lens section                   │    │
│  │ 6. Create Draft PR                                 │    │
│  │ 7. Final review and approval                       │    │
│  └────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
                        PRODUCTION
                 (YouTube, Blog, Academy)
```

## Automation Components

### GitHub Workflows

```
┌──────────────────────────────────────────────────────────┐
│  sync-labels.yml                                          │
│  ────────────────                                         │
│  Trigger: Push to main (labels.yml changes)              │
│           or Manual workflow_dispatch                     │
│                                                            │
│  Action: Syncs 5 stage labels to repository               │
│          - stage/pillars                                  │
│          - stage/paths                                    │
│          - stage/courses                                  │
│          - stage/modules                                  │
│          - stage/lessons                                  │
└──────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────┐
│  auto-project-linker.yml                                  │
│  ────────────────────────                                 │
│  Trigger: PR/Issue opened, labeled, or reopened          │
│                                                            │
│  Action: Automatically adds items with stage labels       │
│          to GitHub Project board                          │
│                                                            │
│  Labels monitored:                                        │
│    - stage/pillars   → Pillars column                    │
│    - stage/paths     → Paths column                      │
│    - stage/courses   → Courses column                    │
│    - stage/modules   → Modules column                    │
│    - stage/lessons   → Lessons column                    │
└──────────────────────────────────────────────────────────┘
```

### Templates

```
┌──────────────────────────────────────────────────────────┐
│  ISSUE TEMPLATES                                          │
├──────────────────────────────────────────────────────────┤
│                                                            │
│  📋 Stage Gate Review (stage-gate.yml)                   │
│     - Request approval for stage deliverable             │
│     - Include evidence & citations                        │
│     - Apply stage tags                                    │
│     - Definition of Done checklist                        │
│                                                            │
│  🔄 Content Update Alert (content-update.yml)            │
│     - Flag content needing updates                        │
│     - Track freshness SLA breaches                        │
│     - Priority and impact mapping                         │
│                                                            │
│  🐛 Bug Report (bug-report.yml)                          │
│     - Report issues with workflows/content                │
│                                                            │
│  ✨ Feature Request (feature-request.yml)                │
│     - Suggest enhancements                                │
│                                                            │
└──────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────┐
│  PULL REQUEST TEMPLATE                                    │
├──────────────────────────────────────────────────────────┤
│                                                            │
│  📝 PULL_REQUEST_TEMPLATE.md                             │
│     - Stage gate identification                           │
│     - Evidence & rationale section                        │
│     - Content inventory impact                            │
│     - Definition of Done checklist                        │
│     - Executive Producer notes                            │
│                                                            │
└──────────────────────────────────────────────────────────┘
```

### Code Review

```
┌──────────────────────────────────────────────────────────┐
│  CODEOWNERS                                               │
├──────────────────────────────────────────────────────────┤
│                                                            │
│  👥 Automatic Review Requests                            │
│                                                            │
│  /*                      → @JonEliRey                     │
│  /specs/                 → @JonEliRey (Executive Producer)│
│  /docs/                  → @JonEliRey                     │
│  /content-inventory/     → @JonEliRey                     │
│  /seo/                   → @JonEliRey                     │
│  CONSTITUTION.md         → @JonEliRey                     │
│                                                            │
└──────────────────────────────────────────────────────────┘
```

## Continuous Monitoring (Future Enhancement)

```
┌──────────────────────────────────────────────────────────┐
│  CONTENT FRESHNESS MONITORING                             │
│  (Not yet implemented - FR-018)                           │
├──────────────────────────────────────────────────────────┤
│                                                            │
│  Weekly Scans:                                            │
│    - Official docs/changelogs                             │
│    - Product blogs                                        │
│    - Major community forums                               │
│                                                            │
│  Monthly Reviews:                                         │
│    - Comprehensive curriculum review                      │
│    - Asset freshness check                                │
│                                                            │
│  Real-time Alerts:                                        │
│    - RSS/API/webhook from official products               │
│                                                            │
│  SLA Enforcement:                                         │
│    - Fast-changing: 90-day review window                  │
│    - Standard: 180-day review window                      │
│    - Auto-create Content Update Alert on breach           │
│                                                            │
└──────────────────────────────────────────────────────────┘
```

## Integration Flow

```
Developer/Content Creator
         │
         ├─> Creates Issue (Stage Gate Review)
         │         │
         │         ├─> Apply stage label
         │         │
         │         ▼
         │   Auto-linker workflow
         │         │
         │         ├─> Add to GitHub Project
         │         │
         │         ▼
         │   Project Board (appropriate column)
         │
         ├─> Creates Draft PR
         │         │
         │         ├─> PR template auto-fills
         │         │
         │         ▼
         │   CODEOWNERS trigger
         │         │
         │         ├─> Request Executive Producer review
         │         │
         │         ▼
         │   Review & Approval
         │         │
         │         ├─> Approved? Merge
         │         │
         │         ├─> Rejected? Request changes
         │         │
         │         ▼
         │   Next stage or iteration
         │
         └─> Content Update Alert (as needed)
                   │
                   ├─> Flag outdated content
                   │
                   ▼
             Review and update cycle
```

## Key Benefits

1. **Automated Tracking**: Items automatically added to project board
2. **Consistent Process**: Templates ensure all required info is captured
3. **Required Reviews**: CODEOWNERS ensures proper oversight
4. **Clear Stage Gates**: Visual progress through development stages
5. **Evidence-Based**: Templates enforce citation and rationale requirements
6. **Freshness Management**: Content update alerts track SLA breaches

## References

- [Setup Guide](SETUP.md) - How to configure and use the system
- [Usage Guide](README.md) - Detailed instructions for each component
- [Implementation Summary](../IMPLEMENTATION_SUMMARY.md) - Technical details
- [Constitution](../CONSTITUTION.md) - Core principles and DoD
- [Feature Spec](../specs/001-i-need-to/spec.md) - Full workflow specification
