---
module_id: "module-1-modern-excel-setup"
name: "Course Orientation & WWI Toolkit"
objectives:
  - "Understand the complete course structure from setup through capstone project"
  - "Download and verify World Wide Importers sample database (SQL backup or CSV extracts)"
  - "Navigate the GitHub repository and locate course materials"
  - "Preview the final capstone deliverable to understand the learning journey"
prerequisites:
  - "None - this is the first lesson"
status: "draft"
tags:
  - "course-orientation"
  - "world-wide-importers"
  - "setup"
estimated_duration: "10 minutes"
---

# Lesson 1.1: Course Orientation & WWI Toolkit

## Lesson Overview

Welcome to Excel Data Analytics! This lesson orients you to the course structure, introduces the World Wide Importers (WWI) sample database you'll use throughout, and helps you download the necessary materials.

**What You'll Accomplish**: Understand the learning journey ahead, download WWI dataset, and familiarize yourself with course materials organization.

**Why This Matters**: Starting with clear orientation prevents confusion later. The WWI database provides realistic, business-relevant data that makes learning practical and engaging.

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand the 5-module progression and how each builds on the previous
2. Download World Wide Importers sample data (choosing the right option for your environment)
3. Navigate the GitHub repository to find lesson materials, scripts, and templates
4. Preview the capstone project to see what you'll build

---

## Course Structure Overview

### The Learning Journey

This course follows a progressive build approach:

**Module 1** (45 min): Modern Excel Setup for Analytics  
→ Get your environment ready, create workspace templates, adopt automation mindset

**Module 2** (55 min): Power Query Data Ingestion  
→ Connect to databases and files, configure parameters, validate data quality

**Module 3** (60 min): Power Query Transformation Patterns  
→ Build transformations, create custom functions, automate refresh

**Module 4** (55 min): Power Pivot Modeling & Analysis  
→ Design star schema, create DAX measures, build executive dashboards

**Module 5** (60 min): Capstone - WWI Analytics Sprint  
→ Deliver complete automated analytics solution for business scenario

### How Lessons Build

Each lesson:
- Runs 8-15 minutes (watchable in a coffee break)
- Builds on previous lessons (don't skip ahead)
- Includes hands-on practice with downloadable files
- References GitHub materials for templates and scripts

---

## World Wide Importers Database

### What is WWI?

World Wide Importers is Microsoft's official sample database representing a fictitious wholesale novelty goods importer and distributor. It includes:

- **Sales data**: Invoices, order lines, customers, products
- **Purchasing data**: Purchase orders, suppliers, stock items
- **Warehouse data**: Inventory transactions, stock holdings
- **Application data**: People, cities, countries, exchange rates

**Why WWI?**: Realistic business complexity with recognizable scenarios. You'll build analytics solutions answering real questions like "What are our best-performing product categories?" and "Which suppliers have the highest quality issues?"

### Download Options

Choose the option that fits your environment:

#### Option 1: SQL Server Backup (Full Experience)

**Best For**: Learners with SQL Server, LocalDB, or Azure SQL access  
**Size**: ~2-3 GB  
**Advantage**: Full database experience, can write custom SQL queries

**Steps**:
1. Visit [Microsoft Learn - WWI Sample](https://learn.microsoft.com/sql/samples/wide-world-importers-what-is)
2. Download WideWorldImporters-Full.bak
3. Restore to your SQL Server instance (instructions provided in Lesson 2.1)

#### Option 2: CSV Extracts (No Database Required)

**Best For**: Learners without SQL Server or with disk space constraints  
**Size**: ~500 MB  
**Advantage**: No database setup required, works immediately

**Steps**:
1. Visit course GitHub repository: [Link to be added]
2. Navigate to `/data/wwi-csv/`
3. Download zip file containing pre-extracted CSV files
4. Extract to local folder (document path for later use)

**Recommendation**: If unsure, start with CSV extracts. You can always switch to SQL later.

---

## GitHub Repository Navigation

### Repository Structure

```
ethion-academy/
├── pillar-microsoft-data-analytics-journey/
│   └── learning-paths/
│       └── path-excel-data-analytics-power-query-and-power-pivot/
│           └── courses/
│               └── course-excel-data-analytics/
│                   ├── README.md (course overview)
│                   ├── course-excel-data-analytics.md (complete spec)
│                   ├── modules/
│                   │   ├── module-1-modern-excel-setup/
│                   │   ├── module-2-power-query-ingestion/
│                   │   └── ... (other modules)
│                   └── data/
│                       ├── wwi-csv/ (CSV extracts)
│                       ├── templates/ (workbook templates)
│                       └── scripts/ (M scripts, DAX libraries)
```

### Key Locations

- **Lesson Materials**: Each module folder contains lesson markdown files
- **Templates**: `/data/templates/` has starter workbooks
- **Scripts**: `/data/scripts/` contains reusable M and DAX code
- **WWI Data**: `/data/wwi-csv/` for CSV option

### Bookmark These

- Course GitHub repository: [Link to be added]
- YouTube playlist: [Link to be added]
- Discussion forum: [Link to be added]

---

## Capstone Preview

### What You'll Build

By Module 5, you'll deliver a complete Excel analytics solution:

**Business Scenario**: Operations Director needs weekly analytics snapshot combining Sales, Purchasing, and Exchange Rate data

**Your Solution Will**:
- Ingest data from multiple WWI sources automatically
- Apply cleaning and transformation logic via Power Query
- Build Power Pivot model with star schema relationships
- Create DAX measures for key metrics (Sales, Margin %, Inventory Turns)
- Deliver executive dashboard that refreshes in <5 minutes
- Document business value in Leader's Lens format

**Assessment**: Self-evaluate using detailed rubric (5 criteria, 15 points total)

**Why Preview Now**: Knowing the destination helps you understand why each lesson matters and how concepts connect.

---

## Getting Started Checklist

Before moving to Lesson 1.2, complete these tasks:

- [ ] Watch this lesson video or read this guide
- [ ] Choose WWI download option (SQL or CSV)
- [ ] Download WWI dataset and verify files
- [ ] Bookmark GitHub repository
- [ ] Bookmark YouTube playlist
- [ ] Review Module 1-5 overview to understand progression
- [ ] Create local folder for course work (e.g., `C:\WWI-Analytics\` or `~/wwi-analytics/`)

---

## Leader's Lens

**For Decision Makers**: This orientation lesson represents the "project charter" phase.

**Investment**: 10 minutes per analyst + download time (varies by internet speed)

**Return**: Clear expectations and realistic timeline prevent mid-course drop-off. Analysts who understand the full journey are 3x more likely to complete and apply skills.

**Key Signal**: If analysts can't download WWI dataset, indicates potential network restrictions or download policies that should be addressed.

---

## Resources

### Official Documentation
- **World Wide Importers Overview**: [Microsoft Learn](https://learn.microsoft.com/sql/samples/wide-world-importers-what-is)
- **WWI Database Catalog**: [GitHub - microsoft/sql-server-samples](https://github.com/Microsoft/sql-server-samples/tree/master/samples/databases/wide-world-importers)

### Course Materials
- **Course README**: [course-excel-data-analytics/README.md](../../README.md)
- **Module 1 Overview**: [module-1-modern-excel-setup.md](../module-1-modern-excel-setup.md)

### Next Lesson
**[Lesson 1.2: Enabling Power Query/Power Pivot](lesson-1-2-enabling-power-query-power-pivot.md)**

---

## Common Questions

**Q: Do I need the full SQL backup or are CSVs enough?**  
A: CSV extracts are sufficient for the entire course. SQL backup provides fuller experience but isn't required.

**Q: How much disk space do I need?**  
A: CSV option: ~500 MB. SQL option: ~3 GB. Plus ~500 MB for workbooks you'll create.

**Q: Can I use Azure SQL instead of local SQL Server?**  
A: Yes! Instructions in Lesson 2.1 cover both local and Azure SQL connections.

**Q: What if GitHub is blocked at my organization?**  
A: Contact instructor for alternative download methods. Materials can be provided via other channels if needed.

---

*Lesson 1 of 19 | Module 1 of 5 | Excel Data Analytics Course*
