---
course_id: "course-excel-data-analytics"
name: "Modern Excel Setup for Analytics"
description: "Establish the foundation for automated Excel analytics including Power Query/Power Pivot setup, workspace organization, and mindset transformation from manual to automated workflows."
topics:
  - "Excel environment setup"
  - "Power Query installation"
  - "Power Pivot configuration"
  - "Workspace templates"
  - "Automation mindset"
status: "draft"
tags:
  - "excel-setup"
  - "power-query"
  - "power-pivot"
  - "workspace-design"
estimated_duration: "45 minutes"
---

# Module 1: Modern Excel Setup for Analytics

## Module Overview

Before diving into Power Query and Power Pivot, you need the right foundation. This module ensures your Excel environment is properly configured, introduces the World Wide Importers sample database you'll use throughout the course, and most importantly, helps you shift from a manual cleanup mindset to an automated refresh mindset.

**What You'll Accomplish**: By the end of this module, you'll have Power Query and Power Pivot enabled, the WWI dataset downloaded, a reusable workspace template created, and a clear understanding of why automation transforms analytical work.

**Why This Matters**: Many analysts skip proper setup and jump straight into transformations, leading to frustration and rework. Investing 45 minutes now in proper configuration saves hours of troubleshooting later.

---

## Learning Objectives

By completing this module, you will be able to:

1. **Navigate the course structure and access course materials**
   - Understand the progression from setup through capstone
   - Download and verify World Wide Importers sample data (SQL backup + CSV options)
   - Locate GitHub repository materials and YouTube playlist

2. **Enable and verify Power Query and Power Pivot in Excel**
   - Check Excel version compatibility (2016+ required)
   - Enable Power Query via Data tab (verify Get Data options)
   - Activate Power Pivot add-in via Excel Options
   - Troubleshoot common enablement issues

3. **Build a reusable Excel analytics workspace**
   - Create workbook templates with proper structure
   - Configure named ranges for parameters (server names, file paths)
   - Establish folder organization for sources, staging, and final outputs
   - Set up connection string management patterns

4. **Adopt automated analytics mindset**
   - Contrast manual data cleanup with automated pipelines
   - Understand refresh workflow vision (ingest → transform → model → present)
   - Recognize when to automate vs stay manual
   - Plan for reliability and maintenance

---

## Module Structure

### Lesson 1.1: Course Orientation & WWI Toolkit (10 minutes)
**Topics**: Course roadmap, World Wide Importers overview, download options, repository navigation

**What You'll Do**: Understand the complete learning journey, download WWI sample data (choosing between SQL backup or CSV extracts), explore the GitHub repository structure, and preview the final capstone deliverable.

**Deliverable**: Downloaded WWI dataset, bookmarked repository and playlist

---

### Lesson 1.2: Enabling Power Query/Power Pivot (12 minutes)
**Topics**: Excel version requirements, Power Query verification, Power Pivot activation, troubleshooting

**What You'll Do**: Check your Excel version compatibility, verify Power Query is accessible (Data tab > Get Data), enable Power Pivot add-in through Excel Options > Add-ins, confirm both tools are working properly.

**Deliverable**: Fully configured Excel with Power Query and Power Pivot enabled and verified

---

### Lesson 1.3: Building a Reusable Workspace (13 minutes)
**Topics**: Workbook template design, named ranges for parameters, folder structure, connection patterns

**What You'll Do**: Create a foundation workbook template (wwi-foundation.xlsx) with organized sheets, define named ranges for server names and file paths, set up local folder structure for data sources/staging/final outputs, document connection patterns for reuse.

**Deliverable**: wwi-foundation.xlsx template ready for data ingestion

---

### Lesson 1.4: Data Mindset Shift (10 minutes)
**Topics**: Manual cleanup vs automation, refresh pipeline vision, before/after comparison, decision criteria

**What You'll Do**: Compare a manual Excel workflow (copy, paste, clean, rebuild) with an automated Power Query pipeline (refresh button), understand the four-stage refresh vision (ingest → transform → model → present), see before/after examples, learn when automation is worth the investment.

**Deliverable**: Clear mental model of automated analytics workflows and when to apply them

---

## Module Outcomes

After completing Module 1, you will have:

- ✅ Excel environment ready for Power Query and Power Pivot development
- ✅ World Wide Importers dataset downloaded and accessible (SQL or CSV)
- ✅ Foundation workbook template created and customized for your environment
- ✅ Clear understanding of automated refresh workflows vs manual processes
- ✅ Readiness to begin data ingestion in Module 2

---

## Prerequisites Checkpoint

Before starting this module, ensure you have:

- [ ] Microsoft Excel 2016 or later (Microsoft 365 recommended)
- [ ] Administrator or permission to enable Excel add-ins
- [ ] 2-3 GB free disk space for WWI dataset (SQL backup option)
- [ ] Internet connection for downloading materials

**If Using SQL Option**: SQL Server 2016+ or LocalDB instance for restoring WWI backup  
**If Using CSV Option**: No database required, CSV extracts sufficient for course

---

## Lesson Files

1. **[Lesson 1.1: Course Orientation & WWI Toolkit](lessons/lesson-1-1-course-orientation-wwi-toolkit.md)**
2. **[Lesson 1.2: Enabling Power Query/Power Pivot](lessons/lesson-1-2-enabling-power-query-power-pivot.md)**
3. **[Lesson 1.3: Building a Reusable Workspace](lessons/lesson-1-3-building-reusable-workspace.md)**
4. **[Lesson 1.4: Data Mindset Shift](lessons/lesson-1-4-data-mindset-shift.md)**

---

## Downloadable Resources

- **WWI SQL Backup**: [Microsoft Docs - WWI Sample](https://learn.microsoft.com/sql/samples/wide-world-importers-what-is) (full database experience)
- **WWI CSV Extracts**: Available in course repository `/data/wwi-csv/` (no database required)
- **Foundation Workbook Template**: `wwi-foundation.xlsx` (created in Lesson 1.3)
- **Setup Checklist**: `module-1-setup-checklist.pdf` (verification checklist)
- **Troubleshooting Guide**: Common issues and solutions for Power Query/Pivot enablement

---

## Common Issues & Solutions

### Power Query Not Appearing
**Issue**: Data tab doesn't show "Get Data" options  
**Solution**: Verify Excel version (must be 2016+), update to latest version if needed, restart Excel

### Power Pivot Won't Enable
**Issue**: Power Pivot checkbox is grayed out or missing  
**Solution**: Requires Excel Professional Plus, Microsoft 365, or standalone Power Pivot add-in. Verify license, consult IT if enterprise installation.

### WWI Database Too Large
**Issue**: Don't have SQL Server or disk space for full backup  
**Solution**: Use CSV extract option provided in repository (sufficient for course)

### Template Workbook Errors
**Issue**: Named ranges not saving or causing errors  
**Solution**: Ensure workbook saved as .xlsx (not .xls), avoid special characters in range names

---

## Leader's Lens: Module 1

**For Decision Makers**: This module represents the planning phase for analyst transformation projects.

**Investment**: 45 minutes per analyst for setup + 30 minutes for IT support if Power Pivot enablement needed

**Return**: Proper setup prevents hours of troubleshooting and enables reliable, repeatable analytics workflows. The workspace template patterns established here scale across teams and projects.

**Key Signal**: If analysts struggle with add-in enablement, indicates potential enterprise policy restrictions that should be addressed early in rollout plan.

---

## Next Steps

After completing Module 1, proceed to:

**[Module 2: Power Query Data Ingestion](../module-2-power-query-ingestion/)** where you'll connect to the WWI database and begin building automated data pipelines.

---

*Module 1 of 5 | Excel Data Analytics Course*  
*Part of the Microsoft Data Analytics Journey*
