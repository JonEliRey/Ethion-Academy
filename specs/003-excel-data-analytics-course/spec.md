---
title: "Excel Data Analytics with Power Query and Power Pivot"
epic: "Data Analytics Learning Paths"
feature: "Excel-Based Data Analytics Course"
status: "in-progress"
date: 2025-11-17
---

# SPEC: Excel Data Analytics with Power Query and Power Pivot

## 1. Overview

This document specifies the requirements for a comprehensive learning path focused on data analytics using Microsoft Excel, with emphasis on Power Query and Power Pivot. The course is designed to transform beginners into proficient Excel data analysts through structured, bite-sized lessons optimized for YouTube delivery.

## 2. Goals

- **Enable Self-Service Analytics**: Teach learners to extract, transform, and analyze data without relying on IT or database specialists
- **Build Foundation Skills**: Establish strong fundamentals in Excel data manipulation before advancing to BI tools
- **Practical Application**: Use realistic datasets (World Wide Importers) to demonstrate real-world scenarios
- **Career Advancement**: Provide skills that are immediately applicable in business analyst and data analyst roles
- **Efficient Learning**: Structure content in 8-15 minute lessons for optimal engagement and retention

## 3. Requirements

### 3.1. Learning Path Structure

**Path ID**: `path-excel-data-analytics-power-query-and-power-pivot`

**Target Audience**:
- **Role**: Business Analyst, Data Analyst, Analyst
- **Level**: Beginner to Intermediate
- **Context**: Professionals working with data in Excel who want to level up their analytical capabilities

**Estimated Duration**: 12-15 hours total

### 3.2. Core Capabilities

The learning path must cover:

#### Course 1: Excel Data Foundations
- **Data types and formats** in Excel
- **Table structures** and named ranges
- **Basic formulas and functions** for data manipulation
- **Data validation** and quality checks
- **Sorting, filtering, and basic analysis**

#### Course 2: Power Query Fundamentals
- **Connecting to data sources** (CSV, Excel, databases)
- **Data transformation operations** (filter, sort, remove duplicates)
- **Column operations** (split, merge, change type)
- **Data cleaning** and standardization
- **Query editor interface** and M language basics
- **Refresh and parameter** management

#### Course 3: Advanced Power Query
- **Combining queries** (merge, append)
- **Custom columns** and conditional logic
- **Date and time operations**
- **Text manipulation** and parsing
- **Error handling** and debugging
- **Performance optimization**

#### Course 4: Power Pivot and Data Modeling
- **Data model basics** and relationships
- **Creating relationships** between tables
- **DAX fundamentals** (calculated columns, measures)
- **Common DAX functions** (SUM, AVERAGE, CALCULATE, FILTER)
- **Time intelligence** functions
- **KPIs and hierarchies**

#### Course 5: Analytics and Reporting
- **PivotTables with Power Pivot** data models
- **Dynamic dashboards** and slicers
- **Visualization best practices**
- **Report design** and storytelling with data
- **Automation basics** (light introduction to Power Automate)
- **Best practices** and tips for production use

### 3.3. Lesson Design Requirements

Each lesson MUST:
- **Duration**: Be 8-15 minutes long
- **Structure**: Follow a consistent format:
  - Hook (15-30 seconds): Why this matters
  - Objective (15-30 seconds): What you'll learn
  - Demonstration (6-12 minutes): Step-by-step walkthrough
  - Recap (30-60 seconds): Key takeaways
  - Next Steps (15-30 seconds): What's coming next
- **Practical Focus**: Include hands-on demonstrations with real data
- **Clarity**: Use plain language, avoiding jargon or defining terms on first use
- **Engagement**: Show the "why" before the "how"

### 3.4. Data and Materials

**Primary Dataset**: World Wide Importers sample database
- **Justification**: Production-quality sample data from Microsoft
- **Scope**: Use relevant tables for sales analytics, customer analysis, and inventory management
- **Format**: Provide pre-extracted Excel/CSV files for learners who don't have SQL Server access
- **Complexity**: Start with single tables, progress to multi-table scenarios

**Supplementary Materials**:
- Exercise files for each module
- Solution files for practice exercises
- Quick reference guides for Power Query transformations
- DAX function cheat sheet

### 3.5. Delivery Format

**Primary Platform**: YouTube
- Video lessons with clear screen recordings
- Closed captions for accessibility
- Downloadable resources linked in description
- Playlist organization by course/module

**Content Assets**:
- Video recordings (8-15 minutes each)
- Blog post summaries for key lessons
- GitHub repository with:
  - Sample data files
  - Exercise workbooks
  - Solution files
  - Code snippets (M code, DAX formulas)

**Call to Action**:
- Subscribe to channel for new lessons
- Link to full course in academy (when available)
- Download exercise files from GitHub
- Join community for questions/discussion

### 3.6. Technology Coverage

**Primary Tools**:
- Microsoft Excel (365 or 2019+)
- Power Query (Get & Transform)
- Power Pivot (Data Model)

**Light Mentions** (no deep dive):
- Power Automate: Brief introduction showing how Excel analytics can trigger automated workflows
- Power BI: Positioning as next step after mastering Excel analytics

**Prerequisites**:
- Basic Excel familiarity (cells, formulas, worksheets)
- Access to Microsoft Excel with Power Query and Power Pivot enabled
- No programming experience required

### 3.7. Learning Objectives

By completing this learning path, learners will be able to:

1. **Extract Data**: Connect to various data sources and import data efficiently using Power Query
2. **Transform Data**: Clean, reshape, and prepare data for analysis using Power Query transformations
3. **Model Data**: Create data models with relationships between multiple tables using Power Pivot
4. **Analyze Data**: Write DAX formulas to create meaningful calculations and metrics
5. **Visualize Insights**: Build interactive PivotTables and charts to communicate findings
6. **Automate Workflows**: Understand when and how to use query refresh and basic automation
7. **Apply Best Practices**: Follow industry standards for data modeling and report design

### 3.8. Success Criteria

The learning path is successful if learners can:
- [ ] Import and clean a messy dataset using Power Query
- [ ] Create a multi-table data model with proper relationships
- [ ] Write DAX measures for common business metrics (YTD, MTD, growth %)
- [ ] Build an interactive dashboard with slicers and PivotTables
- [ ] Explain when to use Excel vs. Power BI for analytics

### 3.9. Content Organization

Directory structure follows repository standards:

```
content-inventory/
└── pillars/
    └── data-analytics-excel/
        ├── README.md
        ├── pillar-data-analytics-excel.md
        └── learning-paths/
            └── excel-power-query-power-pivot/
                ├── README.md
                ├── path-excel-data-analytics-power-query-and-power-pivot.md
                └── courses/
                    ├── 01-excel-data-foundations/
                    ├── 02-power-query-fundamentals/
                    ├── 03-advanced-power-query/
                    ├── 04-power-pivot-data-modeling/
                    └── 05-analytics-and-reporting/
```

Each course contains:
- Course overview (course-{name}.md)
- Module directories with:
  - Module overview (module-{name}.md)
  - Lesson files (lesson-{name}.md)

## 4. Technical Details

### 4.1. Frontmatter Schema

All content files follow the repository's frontmatter standards (see `.github/instructions/content.instructions.md`):

**Pillar**:
```yaml
---
name: "Data Analytics with Excel"
description: "Master data analytics using Excel's powerful features including Power Query and Power Pivot"
status: "approved"
approved_at: "2025-11-17"
tags:
  topic: "data-analytics"
  level: "beginner-intermediate"
  role: "analyst"
---
```

**Learning Path**:
```yaml
---
pillar_id: "pillar-data-analytics-excel"
name: "Excel Data Analytics: Power Query and Power Pivot"
description: "Transform from Excel user to Excel data analyst. Master Power Query for data transformation and Power Pivot for advanced analytics and modeling."
target_audience:
  role: "analyst"
  level: "beginner"
  context: "Familiar with basic Excel, ready to learn advanced data analytics features"
prerequisites:
  - "Basic Excel knowledge (formulas, worksheets, basic functions)"
  - "Understanding of business data and reporting needs"
status: "in-review"
tags:
  - "excel"
  - "power-query"
  - "power-pivot"
  - "data-analytics"
  - "data-transformation"
estimated_duration: "12-15 hours"
---
```

### 4.2. Sample Data Management

World Wide Importers data preparation:
1. Extract relevant tables from SQL Server database
2. Export to Excel/CSV format
3. Store in `content-inventory/sample-data/world-wide-importers/`
4. Version control small sample files (<5MB)
5. Provide download links for larger datasets

### 4.3. Source References

**Official Documentation**:
- Microsoft Excel Power Query documentation
- Microsoft Power Pivot documentation
- DAX function reference
- World Wide Importers database documentation

**Community Resources**:
- Excel forums (r/excel, MrExcel)
- Power Query community blogs
- DAX.guide for function reference

## 5. Workflow Integration

### 5.1. Agent Handoffs

Following the repository's agent workflow:

1. **Content Strategist**: Validate demand and propose path structure
2. **SME**: Review technical accuracy and prerequisites
3. **Librarian**: Catalog approved structure in database
4. **Scriptwriter**: Create detailed lesson scripts (when reactivated)
5. **QA Reviewer**: Test exercise files and code examples (when reactivated)

### 5.2. Production Workflow

1. **Planning Phase** (Current):
   - Create spec document
   - Define learning path structure
   - Identify data requirements

2. **Content Development Phase**:
   - Create course and module outlines
   - Develop lesson scripts
   - Prepare exercise files
   - Record video lessons

3. **Review Phase**:
   - Technical accuracy review
   - Practice exercises testing
   - Duration verification (8-15 min target)

4. **Publication Phase**:
   - Upload to YouTube
   - Create blog posts
   - Link resources in descriptions
   - Update content inventory

## 6. Quality Checklist

Before marking as "approved":
- [ ] All courses and modules defined
- [ ] Learning objectives specific and measurable
- [ ] Lesson durations estimated (8-15 min each)
- [ ] Prerequisites clearly stated
- [ ] Sample data prepared and accessible
- [ ] Frontmatter schemas validated
- [ ] Directory structure follows standards
- [ ] Sources current and authoritative
- [ ] Leader's Lens business context included
- [ ] YouTube delivery format optimized

## 7. Future Enhancements

Potential expansions (not in MVP scope):
- Advanced DAX patterns course
- Power Query M language deep dive
- Excel with Power Automate integration
- Migration path to Power BI
- Practice projects with industry-specific data

## 8. Notes

### Development Status
- **Phase**: Specification and planning
- **Next Actions**: 
  1. Validate spec with stakeholders
  2. Create pillar and path structure in content inventory
  3. Begin course outline development
  4. Prepare World Wide Importers sample data

### Dependencies
- Access to World Wide Importers database for data extraction
- Excel 365/2019+ for feature demonstrations
- Screen recording setup for YouTube videos

### Risk Mitigation
- **Risk**: Lessons exceed 15-minute target
  - **Mitigation**: Break complex topics into multi-part lessons
- **Risk**: Sample data too complex for beginners
  - **Mitigation**: Create simplified versions for early lessons, introduce complexity gradually
- **Risk**: Excel version inconsistencies
  - **Mitigation**: Document version requirements, focus on features in Excel 2019+

---

*Spec Version: 1.0.0*  
*Created: 2025-11-17*  
*Owner: Content Strategist → SME → Scriptwriter*
