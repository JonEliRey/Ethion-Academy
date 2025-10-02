# GitHub Projects Setup Guide

## Overview
Configure GitHub Projects to track content development through stage gates using custom fields and automation.

---

## Project Board Structure

### Columns
1. **Pillars** - New pillar proposals
2. **Learning Paths** - Approved pillars, developing paths
3. **Courses** - Approved paths, developing courses
4. **Modules** - Approved courses, developing modules
5. **Lessons** - Approved modules, developing lessons
6. **In Production** - Lessons being recorded/published
7. **Published** - Live content

---

## Custom Fields

### Field 1: Content Type
**Type**: Single Select  
**Options**: Pillar, Learning Path, Course, Module, Lesson

### Field 2: Status
**Type**: Single Select  
**Options**: Proposed, In Review, Approved, Published, Needs Update, Deprecated

### Field 3: Target Audience
**Type**: Multi-Select  
**Options**: Data Engineers, ML Engineers, Analysts, Architects, Managers

### Field 4: Experience Level
**Type**: Single Select  
**Options**: Beginner, Intermediate, Advanced, Expert

### Field 5: Priority
**Type**: Single Select  
**Options**: Critical, High, Medium, Low

---

## Linking Issues to Content

### Issue Template for Pillars
```markdown
**Pillar Name**: DataOps Engineering
**Description**: Modern data pipeline orchestration, quality assurance...
**Demand Evidence**: 1,500+ job postings, 40% YoY search growth
**Proposed By**: @content-strategist
**Status**: Proposed

**Learning Paths (Planned)**:
- [ ] Pipeline Orchestration (Airflow)
- [ ] Data Quality Engineering
- [ ] Observability & Monitoring
- [ ] CI/CD for Data Pipelines
- [ ] Incident Management

**Files**:
- `content-inventory/pillars/dataops-engineering/pillar-dataops-engineering.md`

**Approval Checklist**:
- [ ] Content Strategist completed demand analysis
- [ ] SME validated technical scope
- [ ] Executive Producer approved
- [ ] Librarian cataloged in database
```

---

## Automation (Future Enhancement)

### Auto-Move on Label Change
- Label `approved` → Move to next column
- Label `needs-revision` → Move back to previous column

### Notification on Stage Change
- Pillar → Paths: Notify @content-strategist
- Lesson → Production: Notify @scriptwriter, @community-manager

---

*Note*: See `.github/projects.yml` for field definitions (if file exists)
