# Specification Clarifications

**Date**: October 1, 2025  
**Feature**: Super-Intelligent Course Designer Workflow  
**Branch**: `001-i-need-to`

## Questions Answered

### 1. Personas & Collaboration Model

**Q**: How will personas interact? Are they human or AI? Who has approval authority?

**A**: 
- **Personas are AI agents** (Content Strategist, SME, Scriptwriter, Editor, Community Manager, SEO/Distribution Lead, QA Reviewer, Librarian/Archivist, Monitoring Specialist)
- **Executive Producer (Jonathan Reyes) is human** and has **sole approval authority** at all stage gates
- **Manual switching** between agent personas for sequential interaction (no parallel execution initially)
- As the system matures, more sophisticated parallel workflows may be introduced

---

### 2. Content Inventory Storage & Access

**Q**: What's the expected scale? Who needs access? How to handle conflicts?

**A**:
- **Expected scale**: Dozens to 100+ lessons over initial phase
- **Access**: Human Executive Producer and AI agents
- **Conflict resolution**: Sequential processing initially (no concurrent writes), so conflicts won't occur
- More robust process will be developed as expertise grows

---

### 3. Monitoring & Freshness

**Q**: Which specific sources? What constitutes material changes? Who reviews alerts?

**A**:
- **Official sources**: 
  - Microsoft Docs, Microsoft Learn
  - Microsoft Fabric Blog, Excel Blog, Power BI Blog
  - Official Microsoft YouTube channel
  - Authoritative community: SQL.BI, PowerBI.Tips, GuyInACube, etc.
  
- **Material changes**:
  - Major tool improvements changing how something is done
  - Deprecation announcements
  - Updates contradicting prior guidance
  - Brand new capabilities creating alternative options
  
- **Review process**: Monitoring Specialist agent reviews alerts, then agent and Executive Producer discuss and decide on actions

---

### 4. Success Metrics

**Q**: How will success be measured?

**A**:
- **Primary KPIs**: Content accuracy and relevancy (if these are done well, other metrics will follow)
- **Secondary metrics**: 
  - YouTube engagement (views, watch time, comments)
  - Search volume/demand signals (what users are researching)
- **Production targets**:
  - Minimum: 4-6 lessons per month
  - Ideal: 2-3 lessons per week (by recording long sessions that can be split into multiple lessons)

---

### 5. YouTube & Blog Asset Production

**Q**: Who creates final assets? Should production status be tracked? How do CTAs work?

**A**:
- **YouTube videos**: Created/recorded by Executive Producer (human)
- **Blog posts**: AI agents produce from recorded videos (multimedia + text-based content)
- **Publishing**: Blogs published to EthionConsulting.com
- **Production status tracking**: Yes, track as: brief → recorded/drafted → blog draft → published
- **CTAs**: Embedded in content; Executive Producer performs CTA personally for more personal touch

---

### 6. Paid Academy Platform

**Q**: Does platform exist? What format for content exports? How track learner progress?

**A**:
- **Platform status**: Does not exist yet; will be created once there are YouTube subscribers and blog engagement showing interest
- **Platform choice**: Skool or similar platform
- **Content formats**: To be determined once platform is selected
- **Export formats** (SCORM, xAPI, etc.): Not applicable yet; will be addressed during platform implementation

---

### 7. GitHub Projects Integration

**Q**: Single project or multiple? What happens on rejection?

**A**:
- **Project scope**: Single project per pillar (e.g., all DataOps content in one project)
  - Rationale: Related content should stay together rather than disconnected
- **Rejection handling**: Content goes back to **previous stage** for rework and re-review

---

### 8. Initial Scope & MVP

**Q**: What's the MVP? What's the first real content topic?

**A**:
- **MVP Phase 1**: Develop Pillars and Learning Paths across full curriculum
- **MVP Phase 2**: Select most basic path and develop it completely (Pillars → Paths → Courses → Modules → Lessons) to start production
  
- **First content topic**: **Excel** covering:
  - Data Manipulation
  - Data Analysis  
  - Automation (Power Query)
  
- **Building blocks strategy**: Excel lessons serve as foundation for subsequent lessons (e.g., Power BI Desktop)

- **Directory structure**: All content organized hierarchically with README in each directory

- **Frontmatter requirements**: Each file must include metadata about target audience, topics, goals, takeaways (skills learned)

- **Post-lesson review**: After each video recording, review to ensure:
  - All planned topics were covered
  - Any unplanned topics addressed are documented
  - Documentation updated to align with actual content produced
  - Synchronization maintained between plans and recorded content (since videos are recorded organically)

---

## Implementation Impact

### New Requirements Added:
- **FR-023**: Directory structure with README files
- **FR-024**: Frontmatter metadata requirements
- **FR-025**: Post-lesson review process
- **FR-026**: MVP scope definition

### Updated Requirements:
- **FR-002**: Clarified AI agents vs. human Executive Producer
- **FR-004**: Added academy platform details (future state)
- **FR-006**: Clarified video production and blog derivation workflow
- **FR-013**: Added specific success metrics and production cadence
- **FR-015**: Added building blocks strategy
- **FR-016**: Added scale expectations and access patterns
- **FR-017**: Clarified single project per pillar, rejection handling
- **FR-018**: Listed specific sources and defined material changes

### Updated Entities:
- All Key Entities updated to reflect clarified roles, workflows, and structures

### Updated Integration Notes:
- GitHub Projects flow clarified (single project per pillar, Executive Producer as sole reviewer)
- MVP and initial content strategy added
- Directory structure and frontmatter patterns specified
- Post-recording alignment process documented

---

## CRITICAL: Meta-Development Scope

### This Feature Builds the SYSTEM, Not the Content

**What we're building:**
- ✅ Chatmode agent definitions (prompts, instructions, responsibilities)
- ✅ Handoff indicators (signals to switch between agents)
- ✅ Stage-gate approval mechanisms
- ✅ Content tracking infrastructure (SQLite schema, tagging)
- ✅ Agent collaboration workflows

**What we're NOT building (yet):**
- ❌ Actual curriculum content (pillars, paths, courses, lessons)
- ❌ YouTube videos or blog posts
- ❌ The paid academy
- ❌ Published learning materials

**Key Understanding:**
This is **meta-development** - building the factory that will produce content. Content production is a separate feature that begins AFTER the agent system is fully functional and validated.

---

## Next Steps

### Phase 1: Foundation Agents
1. Define agent prompts for: Content Strategist, SME, Librarian/Archivist
2. Create handoff indicators for these three agents
3. Build basic SQLite schema for tracking
4. Test agent collaboration on pillar/path definition

### Phase 2: Production Agents
1. Define remaining agent prompts: Scriptwriter, Editor, SEO Lead, QA Reviewer, Community Manager, Monitoring Specialist
2. Enhance handoff indicators for complete workflow
3. Complete SQLite schema
4. Test full agent system

### Phase 3: System Validation
1. Pilot Excel path (Data Manipulation, Analysis, Power Query)
2. Exercise all agents through all stages
3. Refine handoffs based on real usage
4. Document gaps and iterate

### Phase 4: Content Production (Future Feature)
1. Create new feature: "Develop DataOps Pillar Content"
2. Use validated agent system to produce actual curriculum
3. Record videos, write blogs, build courses

---

## Notes

- All clarifications saved to knowledge graph (group_id: `ethion_academy_default`)
- Specification remains technology-agnostic and focused on WHAT, not HOW
- Ready to proceed to technical planning phase
