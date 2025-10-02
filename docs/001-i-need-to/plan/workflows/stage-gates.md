# Stage Gates Guide

## Overview
Stage gates are approval checkpoints in the content development lifecycle. Each stage has specific criteria that must be met before proceeding to the next phase.

---

## Stage 1: Pillar Approval

### Approval Criteria
- [ ] **Demand Justified**: 3+ sources with quantitative metrics (job postings, search volume, community signals)
- [ ] **Scope Clear**: Explicit included/excluded topics, 3-7 learning paths proposed
- [ ] **Audience Defined**: Role × Level specified (e.g., "Data Engineers, Intermediate")
- [ ] **Sources Identified**: Official docs + community resources listed with URLs
- [ ] **SME Validated**: Technical accuracy confirmed
- [ ] **Business Aligned**: Supports company goals (reach, conversion, authority)

### Decision Options
- **Approve**: Proceed to learning path development
- **Revise**: Return to Content Strategist with specific feedback
- **Reject**: Insufficient demand or misalignment with strategy

### Example Rejection
"**Status**: REJECTED  
**Reason**: Demand insufficient - only 200 job postings (threshold: 1,000+). Competitive market saturated (50+ Udemy courses). **Recommendation**: Defer 6 months, revisit if demand increases."

---

## Stage 2: Learning Path Approval

### Approval Criteria
- [ ] **Progression Logical**: Beginner → Intermediate → Advanced sequence makes sense
- [ ] **Prerequisites Complete**: All required knowledge identified and existing/planned
- [ ] **Outcomes Measurable**: Clear skills learners achieve after completion
- [ ] **Course Outline**: 3-5 courses with tentative names and topics
- [ ] **SME Validated**: Technical scope confirmed accurate
- [ ] **Duration Realistic**: Estimated hours align with depth (typically 8-20 hours per path)

### Decision Options
- **Approve**: Proceed to course development
- **Revise**: Adjust course sequence or prerequisites
- **Reject**: Progression unclear or prerequisites unmet

---

## Stage 3: Course Approval

### Approval Criteria
- [ ] **Outcomes Clear**: End-to-end skill mastery defined
- [ ] **Assessment Strategy**: How learners demonstrate mastery (project, quiz, hands-on)
- [ ] **Modules Outlined**: 3-5 modules with cohesive topics
- [ ] **Prerequisites Met**: Learners can access required knowledge
- [ ] **SME Validated**: Technical content accurate
- [ ] **Duration Appropriate**: Matches depth and breadth (typically 2-6 hours per course)

### Decision Options
- **Approve**: Proceed to module development
- **Revise**: Clarify outcomes or assessment
- **Reject**: Scope misaligned with learning path

---

## Stage 4: Module Approval

### Approval Criteria
- [ ] **Topics Cohesive**: All lessons relate to module theme
- [ ] **Lessons Scoped**: 3-7 lessons with clear objectives
- [ ] **Practice Included**: Hands-on exercises or labs
- [ ] **Duration Balanced**: Module fits within course timeline (typically 30 min - 2 hours)
- [ ] **SME Validated**: Technical concepts accurate

### Decision Options
- **Approve**: Proceed to lesson development
- **Revise**: Adjust lesson scope or practice exercises
- **Reject**: Module doesn't fit course structure

---

## Stage 5: Lesson Approval (MOST DETAILED)

### Approval Criteria
- [ ] **Objectives Measurable**: Use action verbs (Configure, Implement, Build, Debug)
- [ ] **Outline Detailed**: Section-by-section breakdown with timing
- [ ] **Practice Exercises**: Scenarios with tasks and success criteria
- [ ] **Leader's Lens**: Business context (outcomes, KPIs, decision criteria)
- [ ] **Citations Complete**: All sources with URLs and access dates
- [ ] **Editor Approved**: Quality and standards met
- [ ] **Engagement Optimized**: Titles, hooks, CTAs crafted
- [ ] **SEO Optimized**: Keywords researched, metadata complete
- [ ] **QA Passed**: All links work, no critical issues
- [ ] **Duration Realistic**: 15-45 minutes typical

### Decision Options
- **Approve**: Ready for production (video recording, blog publishing, academy upload)
- **Revise**: Address specific quality/engagement/SEO issues
- **Reject**: Fundamental issues requiring rework

### Example Approval
"**Status**: APPROVED  
**Quality Score**: 9/10  
**Strengths**: Clear objectives, excellent practice scenarios, strong business context  
**Minor Notes**: Consider adding diagram for branching workflow (visual aid)  
**Next Steps**: Proceed to video production, publish blog post, add to academy course"

---

## Stage 6: Production Ready

### Approval Criteria (Final Gate Before Learners)
- [ ] **All Previous Gates Passed**: Lesson → Module → Course → Path → Pillar
- [ ] **Cataloged in Database**: Librarian recorded with tags, prerequisites, cross-references
- [ ] **Assets Ready**: Video recorded, blog published, academy content uploaded
- [ ] **QA Final Check**: Re-validate all links, test code examples
- [ ] **Marketing Aligned**: Social posts scheduled, email drafted
- [ ] **Metrics Tracked**: Analytics setup complete

### Decision Options
- **Publish**: Make live to learners
- **Hold**: Wait for marketing alignment
- **Revise**: Last-minute corrections

---

## Approval Checkpoint Template

```markdown
## 🔄 APPROVAL CHECKPOINT

**From**: [Agent]
**To**: Executive Producer
**Reason**: [Content item] ready for decision

### Content Summary
[Brief description of what was created/validated]

### Analysis
**Pros**:
- [Strength 1]
- [Strength 2]

**Cons** (if any):
- [Concern 1 with mitigation]

### Recommendation
[APPROVE | REVISE | REJECT] - [Clear rationale]

### Decision Options
- **Approve**: [What happens next]
- **Revise**: [What needs changes]
- **Reject**: [Alternative direction]

**Executive Producer**: Please review and decide on [item] approval.
```

---

## Rejection Scenarios with Feedback

### Scenario 1: Insufficient Demand
"Demand analysis shows only 200 job postings (threshold: 1,000+). Recommend deferring until demand increases or finding niche angle."

### Scenario 2: Technical Inaccuracy
"SME validation found 3 critical errors: API syntax outdated, deprecated feature referenced, missing prerequisite (Docker required). Return to Content Strategist for revision."

### Scenario 3: Quality Below Standard
"Editor review identified: vague learning objectives, no practice exercises, broken citation links. Return to Scriptwriter for rework."

---

*Reference*: See handoff-protocol.md for handoff message formats
