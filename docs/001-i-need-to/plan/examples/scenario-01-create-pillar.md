# Scenario 1: Create Pillar (Complete Approval Cycle)

## Overview
This scenario demonstrates the complete pillar creation workflow from initial idea to approved and cataloged content.

**Agents Involved**: Content Strategist → SME → Executive Producer → Librarian  
**Duration**: ~4 hours agent time + ~10 minutes human time  
**Outcome**: Approved "DataOps Engineering" pillar in database

---

## Step-by-Step Walkthrough

### Step 1: Executive Producer Initiates
**Actor**: Executive Producer (Human)  
**Action**: Switches to Content Strategist mode  
**Command**: `@content-strategist`

**Prompt**: "I want to create content for DataOps. Can you analyze demand and propose a pillar?"

---

### Step 2: Content Strategist Analyzes Demand
**Actor**: @content-strategist  
**Duration**: ~2 hours

**Response**:
```markdown
Analyzing demand for DataOps content...

## Demand Analysis Summary

### Source 1: Job Market (Indeed, LinkedIn)
- **Data**: 1,500+ job postings requiring "Apache Airflow", "dbt", or "data quality engineering" skills
- **Geographic**: 60% US, 25% Europe, 15% APAC
- **Salary Range**: $110K-$180K USD
- **Top Companies**: Airbnb, Uber, Netflix, Spotify (data-driven orgs)
- **Insight**: High demand for production data pipeline skills, not just building pipelines

### Source 2: Google Trends
- **Keyword**: "DataOps"
- **Trend**: +40% YoY growth (2023 vs 2024)
- **Related Queries**: "Airflow tutorial", "data quality testing", "pipeline monitoring"
- **Geographic**: Strongest in US, UK, India
- **Insight**: Growing industry recognition of DataOps as distinct from traditional ETL

### Source 3: Community Signals (Reddit r/dataengineering)
- **Time Period**: Last 90 days
- **Posts Mentioning DataOps Topics**: 200+ posts
- **Top Pain Points**:
  - "How to monitor data pipeline failures?" (45 posts)
  - "Best practices for Airflow DAG organization" (38 posts)
  - "Automating data quality checks" (32 posts)
- **Insight**: Practitioners struggling with production operations, not just initial builds

## Proposed Pillar: DataOps Engineering

**Name**: DataOps Engineering  
**Description**: Modern data pipeline orchestration, quality assurance, and operational excellence for data engineering teams

**Scope**:

### Included (5 Learning Paths)
1. **Pipeline Orchestration** - Apache Airflow, Dagster, Prefect
2. **Data Testing & Quality** - Great Expectations, dbt tests, data contracts
3. **Observability & Monitoring** - OpenTelemetry, data lineage, alerting
4. **CI/CD for Data Pipelines** - GitHub Actions, GitLab CI, automated testing
5. **Incident Management** - On-call playbooks, root cause analysis, SLA management

### Excluded (Out of Scope)
- **ETL Tool Specifics** (Talend, Informatica) - See "Enterprise Data Integration" pillar
- **Data Warehouse Design** (dimensional modeling) - See "Data Warehousing" pillar
- **General DevOps** (Kubernetes basics) - See "Cloud Native Architecture" pillar

**Target Audience**: Data Engineers (Intermediate level)  
**Prerequisites**: Python + SQL experience, basic pipeline knowledge

**Key Outcomes**:
- Design production-ready data pipelines with Apache Airflow
- Implement automated data quality testing
- Monitor pipeline health and debug failures
- Apply CI/CD practices to data workflows
- Manage incidents and maintain data SLAs

## Next Steps

This pillar has strong demand justification. I'll prepare a handoff to SME for technical validation.
```

---

### Step 3: Content Strategist Prepares Handoff
**Actor**: @content-strategist

**Output**:
```markdown
## 🔄 HANDOFF REQUIRED

**From**: Content Strategist  
**To**: @sme  
**Reason**: Technical validation needed for "DataOps Engineering" pillar scope

### Context
Completed demand analysis showing 1,500+ job postings, 40% YoY search growth, and 200+ community discussions about DataOps pain points. Market signals indicate strong demand for production data pipeline skills.

Proposed pillar covers 5 learning paths:
1. Pipeline Orchestration (Airflow, Dagster, Prefect)
2. Data Testing & Quality (Great Expectations, dbt tests)
3. Observability & Monitoring (OpenTelemetry, lineage)
4. CI/CD for Data Pipelines
5. Incident Management

Target audience: Intermediate data engineers with Python + SQL experience.

Key scope decision: Focused on *operational* aspects (how to run pipelines in production), excluding ETL tool specifics and data warehouse design (covered by other pillars).

### Deliverables Attached
- `pillar-dataops-engineering-draft.md` - Full proposal with frontmatter
- `demand-analysis-dataops.xlsx` - 1,500 job posting samples
- `competitor-analysis.md` - LinkedIn Learning and Udemy course reviews

### What SME Should Do
1. Validate technical accuracy of 5 learning path topics
2. Verify tool selections are current industry standards (Airflow vs Prefect vs Dagster?)
3. Identify prerequisites for each learning path
4. Suggest 2-3 authoritative sources per learning path
5. Flag any missing critical topics

### Expected Output
- **Approved scope** with prerequisites identified and sources listed OR
- **Feedback for revision** with specific technical concerns

### Success Criteria
- [ ] All 5 learning path topics technically accurate
- [ ] Tool selections align with current industry adoption
- [ ] Prerequisites correctly sequenced
- [ ] Sources current (updated within 12 months)
- [ ] Critical missing topics identified (if any)

**Executive Producer**: Please switch to `@sme` and provide the attached `pillar-dataops-engineering-draft.md` for technical review.
```

---

### Step 4: Executive Producer Switches to SME
**Actor**: Executive Producer (Human)  
**Action**: Switches chat mode  
**Command**: `@sme`

**Prompt**: "Please review the attached DataOps pillar proposal for technical accuracy."

---

### Step 5: SME Validates Technical Scope
**Actor**: @sme  
**Duration**: ~1 hour

**Response**:
```markdown
## Validation Report: DataOps Engineering Pillar

**Status**: APPROVED  
**Reviewed By**: SME  
**Date**: 2025-01-15

### Technical Accuracy
- [✓] Apache Airflow as primary orchestration tool: Verified against https://airflow.apache.org/docs/ (v2.8, updated Jan 2025)
- [✓] dbt for data testing: Verified against https://docs.getdbt.com/ (v1.7, updated Dec 2024)
- [✓] Great Expectations for quality: Verified against https://docs.greatexpectations.io/ (v0.18, updated Jan 2025)
- [✓] OpenTelemetry for observability: Verified against https://opentelemetry.io/docs/ (current standard)
- [✓] CI/CD for data pipelines: Verified best practices align with GitHub Actions docs

### Gap Analysis
**Missing Critical Topics**: None identified. Scope is comprehensive for intermediate audience.

**Prerequisite Additions**:
- Add "Python functions and decorators" (required for Airflow TaskFlow API)
- Add "SQL JOIN operations" (required for data quality checks)
- Add "Basic Git workflows" (required for CI/CD understanding)

**Sequencing Recommendations**:
- Current sequence is logical: Orchestration → Testing → Monitoring → CI/CD → Incident Management
- Suggest starting with "Pipeline Orchestration" path (foundational skill)

### Source Validation
- [✓] Apache Airflow Official Docs: https://airflow.apache.org/docs/ (updated Jan 2025)
- [✓] dbt Documentation: https://docs.getdbt.com/ (updated Dec 2024)
- [✓] DataOps Manifesto: https://dataopsmanifesto.org/ (industry standard)
- [✓] OpenTelemetry Docs: https://opentelemetry.io/docs/ (current)

All sources are primary, authoritative, and current.

### Recommendations
**APPROVED**: Pillar is technically accurate and complete. Proceed with learning path development.

**Priority**: Start with "Apache Airflow for Data Pipeline Orchestration" path (highest demand + foundational).

### Additional Notes
- Consider adding "data contracts" as emerging topic in future iteration (not critical for v1)
- Excellent balance between theory and practical tools
- Scope boundaries clear (excludes ETL tools, data warehousing design appropriately)
```

---

### Step 6: SME Prepares Handoff
**Actor**: @sme

**Output**:
```markdown
## 🔄 HANDOFF REQUIRED

**From**: SME  
**To**: Executive Producer  
**Reason**: Technical validation complete - pillar approved for development

### Context
Completed technical validation of "DataOps Engineering" pillar. All technical concepts validated against official documentation. Prerequisites correctly identified. Sources are current and authoritative.

**Key Findings**:
- All 5 learning path topics technically accurate
- Tool selections (Airflow, dbt, Great Expectations, OpenTelemetry) are current industry standards
- Added 3 prerequisites: Python functions/decorators, SQL JOINs, Git basics
- All sources primary and updated within past 3 months

**Status**: APPROVED

### Deliverables Attached
- `validation-report-dataops-pillar.md` - Complete technical review

### What Executive Producer Should Do
1. Review validation report and approval recommendation
2. Decide: Proceed with pillar or request changes
3. If approved: Initiate cataloging with Librarian

### Expected Output
- **Approved**: Proceed to Librarian for cataloging OR
- **Additional review needed**: Specific concerns to address

### Success Criteria
- [ ] Executive Producer reviews validation report
- [ ] Decision made (approve/reject/revise)
- [ ] Next steps initiated (cataloging or clarification)

**Executive Producer**: Pillar validation complete with APPROVED status. Ready to proceed with cataloging.
```

---

### Step 7: Executive Producer Approves
**Actor**: Executive Producer (Human)  
**Decision**: APPROVED  
**Time**: ~5 minutes

**Action**: Reviews validation report, confirms:
- Demand is strong (1,500+ job postings)
- Technical scope validated by SME
- Prerequisites identified
- Aligns with business goals (YouTube reach + Academy conversions)

**Command**: `@librarian`  
**Prompt**: "Please catalog the approved DataOps Engineering pillar in the database."

---

### Step 8: Librarian Catalogs Pillar
**Actor**: @librarian  
**Duration**: ~30 minutes

**Response**:
```markdown
Cataloging "DataOps Engineering" pillar...

## Step 1: Assign Canonical Tags
Tags assigned per taxonomy:
- **Topic**: data-engineering, dataops
- **Level**: intermediate
- **Role**: data-engineer

## Step 2: Identify Prerequisites
None (pillar is foundational entry point).

## Step 3: Search for Related Content
Related content identified:
- **Complementary**: "Data Engineering Fundamentals" (pillar-data-eng-fundamentals)
- **Future Paths**: "Apache Airflow for Data Pipeline Orchestration" (to be created)

## Step 4: Record in Database
```sql
INSERT INTO Pillar (id, name, description, status, approved_at, created_at)
VALUES (
    'pillar-dataops-engineering',
    'DataOps Engineering',
    'Modern data pipeline orchestration, quality assurance, and operational excellence for data engineering teams',
    'approved',
    '2025-01-15 14:30:00',
    datetime('now')
);
```

✓ Record created successfully.

## Step 5: Verify Database Entry
```sql
SELECT * FROM Pillar WHERE id = 'pillar-dataops-engineering';
```
✓ Verified: 1 row returned.

## Step 6: Export to JSON
```bash
pwsh scripts/export-inventory.ps1 -Format Json -Entity Pillars
```
✓ Exported to `content-inventory/exports/pillars.json`

## Inventory Report

**Content ID**: pillar-dataops-engineering  
**Type**: Pillar  
**Status**: Approved  
**Cataloged**: 2025-01-15 14:35:00

**Tags Assigned**:
- Topic: data-engineering, dataops
- Level: intermediate
- Role: data-engineer

**Prerequisites**: None (foundational pillar)

**Related Content**:
- Complementary: "Data Engineering Fundamentals" (pillar-data-eng-fundamentals)

**Database Location**: `content-inventory/content.db` → Pillar table  
**Exported**: `content-inventory/exports/pillars.json`

✓ Cataloging complete.
```

---

### Step 9: Librarian Confirms Completion
**Actor**: @librarian

**Output**:
```markdown
## 🔄 HANDOFF COMPLETE

**From**: Librarian  
**To**: Executive Producer  
**Reason**: Pillar successfully cataloged

### Context
"DataOps Engineering" pillar has been cataloged in the content inventory database with complete metadata, tags, and cross-references.

**Database ID**: pillar-dataops-engineering  
**Status**: Approved  
**Tags**: 3 tags (topic, level, role)  
**Related Content**: 1 complementary pillar identified

All data committed to `content-inventory/content.db` and exported to `content-inventory/exports/pillars.json`.

### Next Steps
- Pillar is now discoverable in inventory
- Ready for learning path development
- Suggest starting with "Apache Airflow for Data Pipeline Orchestration" path (SME recommendation)

**Executive Producer**: Pillar cataloging complete. No further action required.
```

---

## Outcome

✅ **Pillar Successfully Created**:
- **ID**: pillar-dataops-engineering
- **Status**: Approved
- **Database**: Cataloged with tags and cross-references
- **Exported**: Available in JSON format
- **Next Steps**: Learning path development can begin

**Total Time**:
- Agent work: ~3.5 hours (Content Strategist: 2h, SME: 1h, Librarian: 0.5h)
- Human work: ~10 minutes (2 approvals + 2 chat mode switches)

**Quality Gates Passed**:
- [x] Demand justified (3 sources, 1,500+ job postings)
- [x] Technical accuracy validated (SME approved)
- [x] Prerequisites identified
- [x] Scope clearly defined
- [x] Sources current and authoritative
- [x] Cataloged in database
