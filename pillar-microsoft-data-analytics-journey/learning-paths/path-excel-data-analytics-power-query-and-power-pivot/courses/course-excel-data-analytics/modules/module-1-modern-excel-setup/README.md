# Module 1: Modern Excel Setup for Analytics

**Foundation for Automated Excel Analytics**

## Module Overview

Establish the proper foundation for Excel analytics automation including Power Query/Power Pivot setup, workspace organization, and the mindset transformation from manual to automated workflows.

**Duration**: 45 minutes (4 lessons)  
**Status**: Draft

---

## What You'll Accomplish

By the end of this module, you will have:

✅ Excel environment ready for Power Query and Power Pivot development  
✅ World Wide Importers dataset downloaded and accessible  
✅ Foundation workbook template created with named ranges and folder structure  
✅ Clear understanding of automated refresh workflows vs manual processes

---

## Module Lessons

### Lesson 1.1: Course Orientation & WWI Toolkit (10 min)
Understand course structure, download World Wide Importers sample database, and navigate course materials.

**[Start Lesson 1.1](lessons/lesson-1-1-course-orientation-wwi-toolkit.md)**

---

### Lesson 1.2: Enabling Power Query/Power Pivot (12 min)
Verify Excel version, enable Power Query and Power Pivot add-ins, troubleshoot common issues.

**[Start Lesson 1.2](lessons/lesson-1-2-enabling-power-query-power-pivot.md)**

---

### Lesson 1.3: Building a Reusable Workspace (13 min)
Create foundation workbook template with named ranges, organized sheets, and documented folder structure.

**[Start Lesson 1.3](lessons/lesson-1-3-building-reusable-workspace.md)**

---

### Lesson 1.4: Data Mindset Shift (10 min)
Transform your thinking from manual cleanup to automated refresh pipelines. Understand when to automate vs stay manual.

**[Start Lesson 1.4](lessons/lesson-1-4-data-mindset-shift.md)**

---

## Module Outcomes

After completing Module 1, you will:

- Have a fully configured Excel environment (Power Query + Power Pivot enabled)
- Understand the course progression and final capstone deliverable
- Have created a reusable workbook template (wwi-foundation.xlsx)
- Think in terms of automated refresh workflows instead of manual processes
- Be ready to start building Power Query connections in Module 2

---

## Prerequisites

Before starting this module:

- [ ] Microsoft Excel 2016 or later installed
- [ ] Administrator privileges or permission to enable Excel add-ins
- [ ] 2-3 GB free disk space for World Wide Importers dataset
- [ ] Internet connection for downloading materials
- [ ] Comfortable with Excel basics (navigation, pivot tables, basic operations)

---

## Key Deliverables

By the end of Module 1, you should have:

1. **WWI Dataset Downloaded**: Either SQL backup or CSV extracts in local folder
2. **Excel Configured**: Power Query and Power Pivot enabled and verified
3. **Foundation Workbook**: `wwi-foundation.xlsx` template with:
   - Organized sheets (Parameters, Data, Dashboard, Documentation)
   - Named ranges for 5 parameters
   - Local folder structure created
   - Documentation completed
4. **Mindset Shift**: Understanding of when to automate vs stay manual

---

## Completion Checklist

Mark complete when you've:

- [ ] Downloaded and verified World Wide Importers dataset
- [ ] Enabled and tested Power Query (Get Data options visible)
- [ ] Enabled and tested Power Pivot (Power Pivot tab and window working)
- [ ] Created wwi-foundation.xlsx template with all sheets
- [ ] Defined 5 named ranges for parameters
- [ ] Created local folder structure (C:\WWI-Analytics\ or ~/wwi-analytics/)
- [ ] Completed Documentation sheet with parameter guide
- [ ] Understand the four-stage refresh pipeline (Ingest → Transform → Model → Present)

---

## Common Issues

### Power Pivot Won't Enable
**Issue**: Checkbox grayed out or missing  
**Solution**: Verify Excel edition includes Power Pivot (Professional Plus, Microsoft 365 Business). May need license upgrade.

### WWI Download Too Large
**Issue**: Don't have disk space or SQL Server  
**Solution**: Use CSV extract option instead (smaller, no database required)

### Folder Paths Not Working
**Issue**: Power Query can't find files  
**Solution**: Check for trailing slashes, avoid spaces in paths, use full absolute paths

---

## Next Module

**[Module 2: Power Query Data Ingestion](../module-2-power-query-ingestion/)**

Learn to connect to SQL databases, combine CSV files, configure parameters, and validate data quality using Power Query.

---

## Resources

- **Module Specification**: [module-1-modern-excel-setup.md](module-1-modern-excel-setup.md)
- **Course Overview**: [../../README.md](../../README.md)
- **WWI Documentation**: [Microsoft Learn](https://learn.microsoft.com/sql/samples/wide-world-importers-what-is)

---

*Module 1 of 5 | Excel Data Analytics Course*
