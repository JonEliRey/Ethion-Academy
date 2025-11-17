# Course 2: Power Query Fundamentals

## Overview

**Duration**: 3-4 hours  
**Level**: Beginner  
**Prerequisites**: Course 1 (Excel Data Foundations) or equivalent knowledge

Master the Power Query interface and core transformation operations to automate data preparation workflows.

## Purpose

Power Query (Get & Transform) revolutionizes how you work with data in Excel. Instead of manual copy-paste-clean cycles that waste hours and introduce errors, you'll build automated, repeatable transformations that refresh with a single click. This course teaches the fundamentals that will save you hours every week.

## Learning Outcomes

By completing this course, you will:
- Navigate Power Query editor confidently
- Import data from files, databases, and web sources
- Apply common transformations (filter, sort, clean, reshape)
- Create reusable, documented transformation steps
- Understand query refresh and change management
- Build maintainable data preparation workflows

## Module Structure

### Module 2.1: Introduction to Power Query
**Topics**: What is Power Query, interface overview, first query, query vs. table

**Lessons**:
1. What Is Power Query and Why It Matters (10 min)
2. Power Query Editor Tour (9 min)
3. Creating Your First Query (12 min)
4. Understanding Applied Steps (11 min)

### Module 2.2: Connecting to Data Sources
**Topics**: Import from CSV, Excel, folders, databases, web; connection properties

**Lessons**:
1. Importing from CSV and Text Files (9 min)
2. Connecting to Excel Workbooks (10 min)
3. Combining Files from a Folder (14 min)
4. Database Connections (SQL Server, Access) (12 min)
5. Web Data and APIs (11 min)
6. Connection Settings and Refresh (8 min)

### Module 2.3: Basic Transformations
**Topics**: Filter rows, sort, remove duplicates, change types, rename

**Lessons**:
1. Filtering Rows (9 min)
2. Sorting Data (7 min)
3. Removing Duplicates and Blanks (10 min)
4. Changing Data Types (11 min)
5. Renaming Columns (8 min)
6. Reordering and Removing Columns (9 min)

### Module 2.4: Column Operations
**Topics**: Split, merge, extract, add custom columns, from examples

**Lessons**:
1. Splitting Columns by Delimiter (11 min)
2. Merging Columns (9 min)
3. Extracting Text (First, Last, Length) (10 min)
4. Column from Examples (AI-Assisted) (13 min)
5. Add Custom Column (Basics) (12 min)

### Module 2.5: Data Cleaning Techniques
**Topics**: Replace values, fill down/up, trim, handle nulls and errors

**Lessons**:
1. Replace Values and Find & Replace (9 min)
2. Trim and Clean Text (8 min)
3. Fill Down and Fill Up (10 min)
4. Handling Null Values (11 min)
5. Dealing with Errors (13 min)
6. Standardizing Data (12 min)

### Module 2.6: Query Management
**Topics**: Organize queries, reference vs. duplicate, parameters, documentation

**Lessons**:
1. Organizing Queries into Groups (8 min)
2. Reference vs. Duplicate Queries (10 min)
3. Loading Queries to Excel (11 min)
4. Query Documentation and Notes (9 min)
5. Refresh Options and Scheduling (10 min)
6. Performance Basics (12 min)

## Sample Data

**Dataset**: World Wide Importers - Sales Transactions
- CSV files with monthly sales data
- Intentional data quality issues (nulls, inconsistent formatting)
- Multiple files to practice folder import
- ~5,000 rows total across files

**Files**:
- `sales-data-messy/` - Folder with multiple CSV files
- `sales-data-reference.xlsx` - Expected clean output
- `exercises/` - Practice scenarios for each module
- `solutions/` - Step-by-step solution queries

## Key Concepts

### Power Query Benefits
- **Repeatability**: Save transformation steps, refresh with one click
- **Documentation**: Each step is visible and editable
- **No Formula Overload**: Visual interface, no complex formulas
- **Source Independence**: Same transformations work for any data source
- **Audit Trail**: See exactly what happened to your data

### Query Types
- **Source Query**: Connects to original data
- **Reference Query**: Points to another query (share transformations)
- **Append Query**: Stacks multiple queries (UNION)
- **Merge Query**: Combines queries by matching columns (JOIN)

### Applied Steps
Every action creates a step in the query:
- Steps execute in order (top to bottom)
- Can edit, delete, or reorder steps
- Each step shows preview of result
- Steps use M language behind the scenes

### Best Practices
- Rename queries with clear, descriptive names
- Document complex steps with notes
- Change data types explicitly (don't rely on auto-detect)
- Use "Close & Load To" for control over output
- Keep queries simple - break complex workflows into multiple queries

## Assessment

### Module Quizzes
- 5-7 questions per module
- Scenario-based questions
- 80% passing score

### Hands-On Checkpoints
- Import and combine multiple CSV files
- Clean a messy dataset (nulls, formatting, duplicates)
- Split and merge columns
- Apply proper data types
- Document transformation steps

### Course Project Component
Build a complete data preparation workflow:
1. Import monthly sales CSV files from folder
2. Clean and standardize data
3. Add calculated columns
4. Load to Excel table for analysis

**Success Criteria**:
- All data imported correctly
- No errors or nulls in critical columns
- Proper data types applied
- Query refreshes successfully
- Clear step documentation

## Resources

### Official Documentation
- Power Query Overview: https://docs.microsoft.com/power-query/
- Power Query M Reference: https://docs.microsoft.com/powerquery-m/
- Data Source Connectors: https://docs.microsoft.com/power-query/connectors/

### Video Resources
- Microsoft Power Query YouTube playlist
- Guy in a Cube - Power Query tips

### Practice Files
- Located in `modules/` subdirectories
- Each module has:
  - Source data files
  - Starter workbooks
  - Solution workbooks with completed queries
  - Exercise instructions

## Common Challenges

### "My query takes forever to refresh"
- Check for query folding (see performance module)
- Limit data early (filter at source when possible)
- Avoid complex custom columns in M

### "I get errors when I refresh"
- File paths changed? Update source settings
- Data structure changed? Review column steps
- Check data type assumptions

### "I accidentally deleted a step"
- Use undo (Ctrl+Z) in Power Query editor
- Worst case: delete query and recreate from source

## Next Course

**Course 3: Advanced Power Query** - Take your skills further with query combinations, custom logic, and performance optimization techniques.

---

*Last Updated: 2025-11-17*  
*Status: Outline Complete*
