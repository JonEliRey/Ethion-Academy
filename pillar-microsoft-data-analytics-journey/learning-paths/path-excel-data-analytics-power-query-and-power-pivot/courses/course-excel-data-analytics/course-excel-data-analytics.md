---
path_id: "path-excel-data-analytics-power-query-and-power-pivot"
name: "Excel Data Analytics"
description: "Transform manual Excel workflows into automated analytics pipelines using Power Query and Power Pivot. Learn data ingestion, transformation, modeling, and refresh automation through hands-on work with the World Wide Importers sample database."
outcomes:
  - "Build automated data ingestion pipelines connecting to SQL databases, CSV files, and folder sources using Power Query with parameterized configurations"
  - "Create reusable transformation patterns including custom functions, error handling, and data quality checks using M language"
  - "Design and implement Power Pivot data models with star schema relationships, DAX measures, and KPIs for business analytics"
  - "Deliver production-ready Excel dashboards with automated refresh capabilities, reducing reporting cycles from hours to minutes"
assessment_strategy: "Self-directed capstone project requiring multi-source data ingestion, Power Query transformations, Power Pivot modeling, and automated refresh. Evaluated using detailed rubric covering data quality, model design, insights delivery, and refresh reliability."
status: "draft"
tags:
  - "excel"
  - "power-query"
  - "power-pivot"
  - "data-analytics"
  - "dax"
  - "m-language"
estimated_duration: "4-5 hours"
prerequisites:
  - "Confident Excel navigation (workbooks, worksheets, cells, basic operations)"
  - "Experience creating and working with pivot tables"
  - "Power Query and Power Pivot add-ins enabled in Excel"
---

# Excel Data Analytics

## Overview

Excel remains the most widely used analytics tool worldwide, but most analysts still work manually—copying, pasting, cleaning, and rebuilding reports every week. This course teaches you how to leverage Excel's modern analytics capabilities to automate these workflows completely.

**Focus**: This course covers the complete journey from manual Excel habits to automated analytics workflows using Power Query for data pipelines and Power Pivot for analytical modeling.

**Why This Course Matters**: Organizations waste thousands of hours annually on manual data preparation. Analysts who master Power Query and Power Pivot can reduce 4-hour reporting tasks to 15-minute refresh operations. These skills are increasingly required for business intelligence roles and provide a foundation for transitioning to Power BI when needed.

**What You'll Build**: A production-ready Excel analytics workbook that automatically ingests data from the World Wide Importers database (multiple sources), applies cleaning and transformation logic, builds a star schema model with relationships and DAX measures, and delivers refreshed executive dashboards—all configured to refresh in under 5 minutes.

**Progression**: Foundation course establishing modern Excel analytics practices. Serves as prerequisite for Power BI transition courses where Power Query logic and Power Pivot models migrate directly to Power BI Desktop.

---

## Learning Outcomes

By completing this course, you will be able to:

1. **Configure Modern Excel Analytics Environment**: Set up Power Query and Power Pivot add-ins, create reusable workbook templates with named ranges, establish folder structures for data sources, and understand the mindset shift from manual cleanup to automated refresh pipelines
   - *Success Criteria*: Build foundation workbook template ready for data ingestion with proper structure and settings

2. **Ingest Data with Power Query Automation**: Connect to SQL databases and CSV sources using parameterized queries, leverage folder queries to combine multiple files, implement data profiling and quality checks, and manage credentials securely across development and production environments
   - *Success Criteria*: Create parameterized Power Query connections that work across environments and handle credential changes gracefully

3. **Transform Data Using Advanced Power Query Patterns**: Build complex transformation logic including merges, lookups, unpivots, custom functions, conditional columns, and error handling using M language, while maintaining query performance and refresh reliability
   - *Success Criteria*: Develop reusable transformation patterns that handle real-world data quality issues and scale to production datasets

4. **Model Analytics with Power Pivot and DAX**: Load Power Query outputs into Power Pivot, design star schema relationships with proper cross-filter settings, create base measures and KPIs using DAX, leverage time intelligence, and build executive-ready pivot tables with slicers and conditional formatting
   - *Success Criteria*: Deliver analytical model that answers business questions without manual formulas and refreshes reliably

---

## Module Structure

### Module 1: Modern Excel Setup for Analytics
**Duration**: 45 minutes  
**Focus**: Establish foundation for automated analytics including tool setup, workspace organization, and mindset transformation from manual to automated workflows

**Lessons**:
1. **Course Orientation & WWI Toolkit** (10 min)  
   *Topics*: Course roadmap, World Wide Importers sample database overview, download options (SQL backup vs CSV extracts), repository structure, playlist navigation tips  
   *Deliverable*: Downloaded WWI dataset and course materials from GitHub

2. **Enabling Power Query/Power Pivot** (12 min)  
   *Topics*: Office version compatibility, enabling Power Query (Data tab), activating Power Pivot add-in, verifying installation, troubleshooting common issues  
   *Deliverable*: Fully configured Excel with Power Query and Power Pivot enabled

3. **Building a Reusable Workspace** (13 min)  
   *Topics*: Workbook template design, named ranges for parameters, folder organization for sources/staging/final, connection string management  
   *Deliverable*: Foundation workbook template (wwi-foundation.xlsx)

4. **Data Mindset Shift** (10 min)  
   *Topics*: Manual cleanup vs automated pipelines, refresh workflow vision, before/after comparison, when to stay manual vs automate  
   *Deliverable*: Understanding of automation value proposition and refresh pipeline concepts

**Module Outcomes**:
- Excel environment ready for Power Query and Power Pivot development
- Foundation workbook template created for reuse across projects
- Clear mental model of automated refresh workflows vs manual processes

---

### Module 2: Power Query Data Ingestion
**Duration**: 55 minutes  
**Focus**: Master Power Query data ingestion patterns including database connections, file sources, parameterization, and data quality validation

**Lessons**:
1. **Connecting to WWI SQL Backup** (12 min)  
   *Topics*: Restoring WWI in LocalDB or Azure SQL, Power Query SQL Server connector, writing SQL queries vs table import, credential management, connection testing  
   *Deliverable*: Working SQL connection to WWI database with sample query

2. **Working with CSV & Folder Sources** (13 min)  
   *Topics*: Single CSV import, folder queries for combining multiple files, file metadata columns, handling schema changes, CSV encoding issues  
   *Deliverable*: Folder query combining historical sales CSVs with proper transformations

3. **Query Parameters & Environment Variables** (15 min)  
   *Topics*: Creating query parameters for server names and file paths, parameter binding in queries, dev/prod environment toggles, documenting parameter usage  
   *Deliverable*: Parameterized workbook supporting multiple environments

4. **Column Profiling & Data Quality Checks** (13 min)  
   *Topics*: Enabling Power Query profiling panes, column quality indicators, value distribution analysis, null handling strategies, data acceptance checklists  
   *Deliverable*: Data quality assessment template and profiling checklist

**Module Outcomes**:
- Connect to multiple data source types with proper configuration
- Implement parameterized queries that work across environments
- Validate data quality using Power Query profiling tools

---

### Module 3: Power Query Transformation Patterns
**Duration**: 60 minutes  
**Focus**: Build advanced transformation logic using Power Query including complex merges, custom functions, error handling, and refresh automation

**Lessons**:
1. **Sales Margin Shaping** (15 min)  
   *Topics*: Merging Sales.InvoiceLines with StockItems, lookup transformations, column cleanup, calculating margins, handling missing lookups  
   *Deliverable*: Transformed sales margin query with proper business logic

2. **Purchasing & Inventory Normalization** (12 min)  
   *Topics*: Shaping Purchasing tables, unpivoting seasonal demand data, aligning schemas across sales and purchasing, data type consistency  
   *Deliverable*: Normalized purchasing query aligned with sales schema

3. **Advanced M Functions & Custom Columns** (15 min)  
   *Topics*: Creating reusable M functions, conditional column patterns, error handling with try/otherwise, function parameters and documentation  
   *Deliverable*: Custom function library with reusable transformation logic

4. **Refresh Automation & Diagnostics** (12 min)  
   *Topics*: Configuring query refresh order and dependencies, managing credentials for unattended refresh, logging refresh outcomes, handling refresh errors  
   *Deliverable*: Refresh configuration with error logging and diagnostic checklist

**Module Outcomes**:
- Build complex transformations handling real-world business scenarios
- Create reusable functions to standardize transformation patterns
- Configure reliable refresh automation with proper error handling

---

### Module 4: Power Pivot Modeling & Analysis
**Duration**: 55 minutes  
**Focus**: Design analytical data models using Power Pivot including star schema relationships, DAX measures, and executive-ready visualizations

**Lessons**:
1. **Loading PQ Outputs to Data Model** (10 min)  
   *Topics*: Connection-only vs load-to-model queries, table properties and descriptions, managing table relationships, memory optimization tips  
   *Deliverable*: Power Query outputs loaded into Power Pivot data model

2. **Relationship Design** (15 min)  
   *Topics*: Star schema principles, creating relationships between fact and dimension tables, cross-filter direction settings, role-playing dimensions (date tables), relationship troubleshooting  
   *Deliverable*: Star schema model with properly configured relationships

3. **Measures & KPIs in DAX** (15 min)  
   *Topics*: Creating base measures (Total Sales, Margin %), calculated measures, time intelligence introduction, measure organization and naming, formatting measures  
   *Deliverable*: DAX measure library covering key business metrics

4. **Pivot Table & Visualization Patterns** (15 min)  
   *Topics*: Building pivot tables from Power Pivot model, using measures in values area, slicers for filtering, conditional formatting tied to measures, creating executive-friendly layouts  
   *Deliverable*: Executive dashboard with pivot tables, slicers, and formatting

**Module Outcomes**:
- Design and implement star schema data models in Power Pivot
- Create DAX measures enabling dynamic analysis
- Build professional pivot table dashboards using Power Pivot measures

---

### Module 5: Capstone - WWI Analytics Sprint
**Duration**: 60 minutes  
**Focus**: Apply all course concepts in comprehensive capstone project delivering automated analytics solution for business scenario

**Lessons**:
1. **Capstone Brief & Architecture** (9 min)  
   *Topics*: Business scenario overview (Operations Director needs weekly analytics snapshot), requirements specification, data sources needed (Sales, Purchasing, Exchange Rates), success criteria, architecture planning  
   *Deliverable*: Clear understanding of capstone requirements and architecture

2. **Build the PQ Pipeline** (15 min)  
   *Topics*: Ingesting required WWI tables, implementing transformations from modules 2-3, parameterizing connections, documenting query logic, testing refresh  
   *Deliverable*: Working Power Query pipeline meeting capstone requirements

3. **Model & Analyze in Power Pivot** (18 min)  
   *Topics*: Loading queries to Power Pivot, building relationships, creating required measures and KPIs, implementing scenario calculations, testing model accuracy  
   *Deliverable*: Power Pivot model answering business questions from scenario

4. **Storytelling & Self-Assessment** (12 min)  
   *Topics*: Building final dashboard with pivot tables, creating Leader's Lens business narrative, completing self-assessment rubric, documenting solution, next steps guidance  
   *Deliverable*: Complete capstone solution with dashboard and documentation

**Module Outcomes**:
- Deliver end-to-end automated analytics solution
- Demonstrate mastery of Power Query, Power Pivot, and DAX
- Create business-ready deliverables with proper documentation

---

## Assessment Strategy

### Formative Assessment (During Course)
- **Module Recap Checklists**: Each module ends with checklist verifying key concepts understood and skills practiced (5-7 items per module)
- **Hands-On Checkpoints**: After each lesson, learners verify their workbook matches expected state before proceeding (screenshot comparisons or file downloads available)
- **Progressive Builds**: Each lesson builds on prior work, ensuring cumulative skill development and identifying gaps early

### Summative Assessment (End of Course)
- **Capstone Project**: Complete WWI Analytics Sprint (Module 5) delivering automated solution meeting all requirements
  - *Requirements*: 
    - Ingest data from at least 2 WWI sources (Sales + Purchasing minimum)
    - Apply Power Query transformations including merges and custom logic
    - Build Power Pivot model with relationships and minimum 5 DAX measures
    - Create executive dashboard with pivot tables and slicers
    - Configure solution to refresh in under 5 minutes
    - Document business value in Leader's Lens format (90-150 words)
  - *Success Criteria*: Evaluated using detailed rubric (see below)
  - *Submission*: Share GitHub gist with solution workbook or post screenshot + description in course discussions for peer feedback (optional but encouraged)

- **Self-Assessment Rubric**:

| Criteria | Description | Score (0-3) |
|----------|-------------|-------------|
| **Data Ingestion** | All required tables ingested with parameterized connections; documented refresh steps; handles credentials properly | 0-3 |
| **Transformations** | Applied cleaning/merging logic from modules; handles nulls, data types, and lookups correctly; includes error handling | 0-3 |
| **Data Model** | Relationships enable requested metrics without manual formulas; star schema properly implemented; model optimized | 0-3 |
| **Insights & Narrative** | Dashboard answers scenario questions clearly; Leader's Lens frames business impact effectively; visualizations well-formatted | 0-3 |
| **Refresh Reliability** | Workbook refreshes without errors using provided credentials; refresh completes in <5 minutes; diagnostics documented | 0-3 |

**Passing Score**: 12+ out of 15 (80%)  
**Excellence**: 14-15 (93%+)

### Mastery Indicators
- [ ] All module recap checklists completed with confidence
- [ ] Capstone project meets all requirements (score ≥12/15)
- [ ] Can explain design decisions and trade-offs for chosen approach
- [ ] Solution demonstrates production-ready quality (performance, error handling, documentation)

---

## Prerequisites

### Required Skills
- **Excel Fundamentals**: Confident navigation of workbooks, worksheets, cells, and basic Excel operations. Should be comfortable working in Excel and understand how data is organized in rows and columns.
- **Pivot Table Experience**: Ability to create pivot tables, add fields to rows/columns/values areas, apply basic filtering. This is critical foundation for Power Pivot concepts.
- **Data Concepts**: Understanding of tables, columns, data types (text, numbers, dates), and how data is organized. Some exposure to databases helpful but not required.

### Recommended Background
- Familiarity with SQL queries helpful for Module 2 but not required (SQL basics explained)
- Basic understanding of business metrics (revenue, margin, inventory) enhances context
- Exposure to data quality issues (duplicates, nulls, inconsistent formatting) from real-world work

### Tool Requirements
- **Microsoft Excel**: Version 2016 or later; Microsoft 365 recommended for best experience. Power Query built-in; Power Pivot may require enablement.
- **Power Query**: Verify enabled via Data tab > Get Data options. Installation instructions in Module 1 if needed.
- **Power Pivot**: Enable via File > Options > Add-ins > COM Add-ins > Power Pivot. Detailed activation steps in Module 1 Lesson 2.
- **World Wide Importers Database**: Option 1 - SQL Server/LocalDB with restored WWI backup (full experience). Option 2 - Pre-extracted CSV files from GitHub (no database required). Setup guidance provided in Module 1 Lesson 1.

---

## Duration

### Total Time
**4-5 hours** including:
- **Video Content**: 4 hours 15 minutes (19 lessons, 8-15 min each)
- **Hands-On Practice**: 30-45 minutes (following along, experimenting)
- **Capstone Project**: 60-90 minutes (building solution, self-assessment)

### Recommended Pacing
- **2-3 Days**: 2 hours/day - Complete 2 modules per session; intensive focus with immediate practice
- **1-2 Weeks**: 30-45 min/day - One module every 2-3 days; balanced pace for working professionals
- **Self-Paced**: Flexible - Take breaks between modules to practice concepts before advancing

**Tip**: Complete modules sequentially as each builds on previous work. Don't skip ahead as workbook artifacts are reused throughout.

---

## Sources

### Official Documentation
1. **Power Query M Function Reference** - [learn.microsoft.com/powerquery-m](https://learn.microsoft.com/powerquery-m/power-query-m-function-reference)  
   *Version*: Current (updated regularly)  
   *Relevance*: Module 2 & 3 transformations, custom functions, error handling patterns

2. **Power Pivot and DAX** - [learn.microsoft.com/dax](https://learn.microsoft.com/dax/)  
   *Version*: DAX language for Power Pivot  
   *Relevance*: Module 4 measures, relationships, time intelligence foundations

3. **World Wide Importers Documentation** - [learn.microsoft.com/sql/samples](https://learn.microsoft.com/sql/samples/wide-world-importers-what-is)  
   *Version*: Latest WWI sample (v1.0)  
   *Relevance*: All modules - database schema, business scenarios, sample data understanding

### Learning Resources
1. **Power Query Quickstart** - [support.microsoft.com/power-query](https://support.microsoft.com/office/power-query-101-008b3f46-5b14-4f8b-9a07-d3da689091b5)  
   *Type*: Official Microsoft tutorial  
   *Quality Assessment*: Excellent for beginners, regularly updated, free

2. **SQLBI DAX Guide** - [dax.guide](https://dax.guide/)  
   *Type*: Community reference site  
   *Quality Assessment*: Comprehensive DAX function reference, examples, maintained by experts

3. **Power Query M Primer** - [bengribaudo.com/m-primer](https://bengribaudo.com/blog/2017/05/08/4107/power-query-m-primer-introduction)  
   *Type*: Deep-dive blog series  
   *Quality Assessment*: Advanced M language concepts, well-explained, technical depth

### Community & Support
- **Forums**: Microsoft Tech Community (Excel forum), Reddit r/excel, r/PowerBI
- **GitHub Repos**: Course materials and WWI extracts in Ethion Academy repository
- **Expert Voices**: Rob Collie (PowerPivotPro), Ken Puls (Excelguru.ca), Miguel Escobar (PowerQuery.how)

---

## Leader's Lens

> **For Engineering Managers & Technical Leaders**: Strategic context for this course

### Business Impact
**Capability Unlocked**: Analysts can deliver automated, refreshable analytics in Excel without requiring enterprise BI platforms or developer support. Transforms reactive report builders into proactive analytics engineers.

**Productivity Gains**: Typical 4-hour weekly reporting cycles reduce to 15-minute refresh operations. Analysts reclaim 3.5 hours per week per report for higher-value analysis, forecasting, and stakeholder collaboration. For teams of 5 analysts maintaining 3 reports each, this represents 50+ hours saved weekly.

**Risk Reduction**: Eliminates manual copy-paste errors that corrupt analyses and damage decision-making credibility. Standardized Power Query logic ensures consistent business rules across reports. Audit trails via refresh logs improve compliance posture.

### Decision Criteria
When evaluating the technology/approach taught in this course:
- **Excel Ubiquity**: Leverages existing investments; no new software purchases or IT deployment projects required. Works within current security/governance frameworks.
- **Migration Path**: Power Query logic and Power Pivot models import directly into Power BI Desktop without rework. Protects skill investment when scaling to enterprise BI. Can start small in Excel, graduate to Power BI as needs grow.
- **Self-Service Limits**: Excel-based solutions scale to ~100MB models and departmental use cases. For enterprise-wide deployment, centralized refresh, or >1M row datasets, Power BI Service becomes necessary.

### Team Adoption Strategy
- **Pilot Phase**: Select 2-3 high-pain reports (manual weekly updates, complex cleanup). Have trained analysts rebuild using Power Query/Pivot. Measure time savings and error reduction over 4-6 weeks.
- **Rollout Plan**: After successful pilots, train remaining analysts in cohorts. Establish "office hours" where newly trained analysts help peers. Create internal template library of reusable Power Query patterns.
- **Success Metrics**: Track (1) hours saved per week per analyst, (2) data error incidents before/after, (3) % of weekly reports converted to automated refresh, (4) analyst satisfaction with new approach.

### Common Pitfalls
- **Insufficient Planning**: Jumping into Power Query without understanding data sources leads to rework. Emphasize Module 1 workspace setup and parameter planning.
- **Credential Management**: Unattended refresh requires proper credential storage. Test refresh scenarios early; involve IT for credential vault solutions if needed.
- **Model Bloat**: Power Pivot models can grow unmaintainably if not optimized. Enforce column removal, relationship design, and performance best practices from Module 4.

---

## Content Assets

### YouTube Videos
**Series**: "Excel Data Analytics: Power Query & Power Pivot Mastery"

| Module | Lesson | Video Title | Duration | Status |
|--------|--------|-------------|----------|--------|
| 1 | 1.1 | WWI Toolkit Setup & Course Roadmap | 10 min | Draft |
| 1 | 1.2 | Enable Power Query & Power Pivot in Excel | 12 min | Draft |
| 1 | 1.3 | Build Your Excel Analytics Workspace Template | 13 min | Draft |
| 1 | 1.4 | Data Mindset: Manual Cleanup to Automated Pipelines | 10 min | Draft |
| 2 | 2.1 | Connect Power Query to SQL (WWI Database) | 12 min | Draft |
| 2 | 2.2 | Combine CSV Files with Folder Queries | 13 min | Draft |
| 2 | 2.3 | Power Query Parameters for Dev/Prod Environments | 15 min | Draft |
| 2 | 2.4 | Data Quality Checks with Power Query Profiling | 13 min | Draft |
| 3 | 3.1 | Transform Sales Margins with Power Query Merges | 15 min | Draft |
| 3 | 3.2 | Normalize Purchasing Data: Unpivot & Schema Alignment | 12 min | Draft |
| 3 | 3.3 | Custom M Functions for Reusable Transformations | 15 min | Draft |
| 3 | 3.4 | Automate Refresh with Error Handling & Logging | 12 min | Draft |
| 4 | 4.1 | Load Power Query to Power Pivot Data Model | 10 min | Draft |
| 4 | 4.2 | Design Star Schema Relationships in Power Pivot | 15 min | Draft |
| 4 | 4.3 | Create DAX Measures & KPIs for Analytics | 15 min | Draft |
| 4 | 4.4 | Build Executive Dashboards with Pivot Tables | 15 min | Draft |
| 5 | 5.1 | Capstone: WWI Analytics Requirements & Architecture | 9 min | Draft |
| 5 | 5.2 | Capstone: Build Multi-Source Power Query Pipeline | 15 min | Draft |
| 5 | 5.3 | Capstone: Model & Analyze with Power Pivot | 18 min | Draft |
| 5 | 5.4 | Capstone: Dashboard Delivery & Self-Assessment | 12 min | Draft |

**Hooks**: Common pain points (manual Excel cleanup, repetitive weekly reports, copy-paste errors)  
**CTAs**: Subscribe for next module, download GitHub materials, share capstone for peer review, enroll in Power BI course

### Blog Posts
**Series**: "Excel Analytics Automation with Power Query & Power Pivot"

| Post | Title | Keywords | Status |
|------|-------|----------|--------|
| 1 | Why Power Query Beats Manual Data Cleanup | power-query, excel-automation, data-cleaning | Draft |
| 2 | Building Reusable M Functions: WWI Case Study | m-language, excel-functions, power-query-functions | Draft |
| 3 | Star Schema in Excel: Power Pivot Modeling 101 | data-modeling, power-pivot, star-schema | Draft |
| 4 | DAX for Analysts: Essential Measures & KPIs | dax, excel-analytics, business-intelligence | Draft |
| 5 | Automate Excel Refresh: Parameters & Credentials | excel-automation, power-query, productivity | Draft |
| 6 | Excel to Power BI Migration: Protect Your Investment | power-bi, migration, excel-integration | Draft |

**Internal Links**: Link to Microsoft Data Analytics Journey pillar, Power BI transition path (future), data literacy foundations

### Academy Materials
- **Slide Decks**: Module intro slides (business context, objectives) - 5 decks total
- **Code Samples**: GitHub repository with starter workbooks, M scripts, DAX measure library
- **Datasets**: WWI SQL backup (.bacpac), CSV extracts (historical sales, purchasing), schema diagrams
- **Quiz Banks**: N/A (self-assessment rubric used instead)
- **Templates**: Foundation workbook template, parameter configuration template, capstone starter workbook

---

## Related Courses

### Within Same Path
- **Previous Course**: None - this is the foundation course for the Excel Data Analytics path
- **Next Course**: Power BI for Excel Analysts (Future) - migrate Power Query/Pivot models to Power BI Desktop

### Alternative Paths
- **Power BI Desktop Fundamentals** (Different pillar): For learners wanting to skip Excel and start directly in Power BI
- **SQL for Analysts**: For learners needing stronger database query skills before Power Query

### Advanced Follow-Ups
- **Advanced DAX Patterns**: Deep-dive into time intelligence, calculated tables, filter context
- **M Language Mastery**: Advanced Power Query development, custom connectors, performance optimization
- **Power BI Service & Governance**: Enterprise sharing, scheduled refresh, row-level security

---

## Notes

### Development Status
- Course structure finalized, based on SME recommendations and spec document
- All module and lesson outlines drafted
- WWI dataset packaging in progress (SQL backup + CSV extracts)
- GitHub repository structure defined
- Pending: SME validation of technical accuracy (Power Query + Power Pivot specialists)
- Pending: Scriptwriter to develop detailed lesson scripts
- Pending: Executive Producer approval before recording

### Quality Checklist
- [x] Learning outcomes specific and measurable
- [x] Module structure logical and well-paced (45-60 min modules)
- [x] Assessment strategy aligns with outcomes (capstone + self-assessment)
- [x] Prerequisites accurate and justified
- [x] Duration estimates realistic (8-15 min lessons, 4-5 hour total)
- [x] Sources current (verified November 2025)
- [ ] Code examples tested and functional (pending development)
- [x] Leader's Lens provides strategic context
- [x] All content assets planned/created

### Review History
- **2025-11-16**: Content Strategist - Initial course draft created from learning path and SME plan
- Pending: SME (Power Query) review of Modules 2-3
- Pending: SME (Power Pivot/DAX) review of Modules 4-5
- Pending: Executive Producer approval

### Instructor Notes
- Emphasize "follow along" approach - learners should pause videos and replicate steps
- Common confusion point: difference between connection-only queries vs load-to-model (Module 4)
- Students often struggle with M syntax initially - reassure this is normal, focus on patterns over memorization
- Encourage experimentation between lessons - breaking things is part of learning
- Capstone can feel overwhelming - emphasize building incrementally using skills from each module
- Power Pivot relationship errors are common - troubleshooting checklist essential

---

*Template Version: 1.0.0*  
*Last Updated: 2025-11*  
*Owner: Content Strategist → SME → Scriptwriter*
