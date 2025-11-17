# Course 4: Power Pivot and Data Modeling

## Overview

**Duration**: 3-4 hours  
**Level**: Intermediate  
**Prerequisites**: Course 3 (Advanced Power Query) or equivalent

Build robust data models using Power Pivot and master DAX (Data Analysis Expressions) for advanced calculations.

## Purpose

Power Pivot transforms Excel from a spreadsheet tool into a true business intelligence platform. Learn to create data models with millions of rows, establish relationships between tables, and write DAX formulas for sophisticated business metrics. This is where Excel becomes a powerful analytics engine.

## Learning Outcomes

By completing this course, you will:
- Enable and navigate Power Pivot in Excel
- Design star schema data models
- Create and manage relationships between tables
- Understand cardinality and filter propagation
- Write DAX calculated columns and measures
- Use essential DAX functions (SUM, CALCULATE, FILTER, etc.)
- Implement time intelligence calculations
- Optimize data model performance

## Module Structure

### Module 4.1: Introduction to Power Pivot
**Topics**: What is Power Pivot, enabling the add-in, data model, vs. regular Excel

**Lessons**:
1. What Is Power Pivot and When to Use It (10 min)
2. Enabling Power Pivot Add-In (8 min)
3. Power Pivot Window Tour (11 min)
4. Loading Data into the Data Model (12 min)
5. Data Model vs. Worksheets (9 min)

### Module 4.2: Creating Relationships
**Topics**: Relationship basics, creating relationships, cardinality, active vs. inactive

**Lessons**:
1. Understanding Table Relationships (11 min)
2. Creating Your First Relationship (10 min)
3. Cardinality Explained (1:1, 1:Many, Many:1) (13 min)
4. Active vs. Inactive Relationships (12 min)
5. Relationship Filter Direction (14 min)
6. Common Relationship Issues (11 min)

### Module 4.3: DAX Fundamentals
**Topics**: DAX syntax, calculated columns vs. measures, basic functions

**Lessons**:
1. Introduction to DAX (10 min)
2. DAX Syntax and Structure (11 min)
3. Calculated Columns Explained (12 min)
4. Measures Explained (13 min)
5. Calculated Column vs. Measure - When to Use Each (14 min)

### Module 4.4: Common DAX Functions
**Topics**: Aggregation functions, iterator functions, logical functions

**Lessons**:
1. Basic Aggregations (SUM, AVERAGE, COUNT) (10 min)
2. CALCULATE - The Most Important DAX Function (15 min)
3. FILTER and Table Functions (14 min)
4. Iterator Functions (SUMX, AVERAGEX) (13 min)
5. Logical Functions (IF, AND, OR, SWITCH) (12 min)
6. Text and Date Functions in DAX (11 min)

### Module 4.5: Time Intelligence
**Topics**: Date tables, YTD, MTD, QTD, previous period, growth calculations

**Lessons**:
1. Creating a Date/Calendar Table (13 min)
2. Marking as Date Table (9 min)
3. Year-to-Date (YTD) Calculations (12 min)
4. Month-to-Date and Quarter-to-Date (11 min)
5. Previous Period Comparisons (14 min)
6. Growth and Variance Calculations (13 min)

### Module 4.6: Context in DAX
**Topics**: Row context, filter context, context transition, CALCULATE behavior

**Lessons**:
1. Understanding Row Context (12 min)
2. Understanding Filter Context (13 min)
3. Context Transition (14 min)
4. ALL and ALLEXCEPT Functions (12 min)
5. Common Context Mistakes (11 min)

### Module 4.7: Advanced DAX Patterns
**Topics**: RANKX, cumulative totals, complex filters, optimization

**Lessons**:
1. Ranking with RANKX (12 min)
2. Cumulative Totals (13 min)
3. Complex Filters with CALCULATE (14 min)
4. Creating Dynamic Measures (13 min)
5. DAX Performance Optimization (12 min)

## Sample Data

**Dataset**: World Wide Importers - Complete Data Model
- Fact table: Sales (order lines)
- Dimension tables: Customers, Products, Dates, Employees
- Star schema design
- ~50,000 sales transactions
- Proper relationship keys

**Files**:
- `data-model-starter.xlsx` - Pre-loaded tables, relationships to be created
- `data-model-complete.xlsx` - Finished model with relationships and DAX
- `exercises/` - DAX formula practice scenarios
- `solutions/` - Detailed DAX formulas with explanations

## Key Concepts

### Data Model Benefits
- **Handle Large Data**: Millions of rows (vs. 1M limit in worksheets)
- **Relationships**: Connect tables without VLOOKUP
- **Calculated Fields**: DAX more powerful than Excel formulas
- **Performance**: Optimized for fast analysis
- **Memory Efficient**: Columnar compression

### Star Schema Design
- **Fact Table**: Transactions/events (sales, orders)
- **Dimension Tables**: Descriptive attributes (customers, products, dates)
- **Relationships**: Fact to dimension (typically 1:many)
- **Best Practice**: One fact table with multiple dimensions

### Calculated Column vs. Measure
**Calculated Column**:
- Stored in model (uses memory)
- Calculated row-by-row
- Can be used in slicers/filters
- Use for: categorization, flags

**Measure**:
- Calculated on-the-fly
- Aggregates data
- Changes based on context
- Use for: all aggregations (sums, averages, counts)

**Rule of Thumb**: Use measures for anything you'd normally put in VALUES area of PivotTable

### DAX Context Types
**Row Context**: 
- Iterates one row at a time
- Calculated columns have automatic row context
- Measures need iterators (SUMX, FILTER) for row context

**Filter Context**:
- Comes from report (PivotTable rows/columns/filters)
- Determines which rows are visible to calculation
- CALCULATE modifies filter context

### Time Intelligence Requirements
1. Date table with continuous dates
2. Marked as date table in Power Pivot
3. Relationship from fact table to date table
4. Date column in date table (not datetime)

## Assessment

### Module Quizzes
- 5-7 questions per module
- Conceptual and practical DAX scenarios
- 80% passing score

### Hands-On Checkpoints
- Create relationships in data model
- Write calculated columns
- Create measures with SUM, CALCULATE, FILTER
- Build time intelligence measures
- Troubleshoot relationship issues
- Optimize DAX formulas

### Course Project Component
Build complete sales analytics data model:
1. Load fact and dimension tables
2. Create all necessary relationships
3. Build date table and mark it
4. Create calculated columns for categorization
5. Write measures for:
   - Total sales, quantity, profit
   - YTD, MTD, prior period
   - Growth percentages
   - Top N customers
6. Optimize model for performance

**Success Criteria**:
- All relationships active and correct direction
- Calculated columns used appropriately (not measures)
- Measures aggregate correctly
- Time intelligence works across all date granularities
- No circular dependencies or errors
- Model refreshes in under 5 seconds

## Resources

### Official Documentation
- DAX Function Reference: https://docs.microsoft.com/dax/
- Power Pivot Overview: https://support.microsoft.com/power-pivot
- Time Intelligence Functions: https://docs.microsoft.com/dax/time-intelligence-functions-dax

### Expert Resources
- **SQLBI** (Marco Russo, Alberto Ferrari): DAX patterns and best practices
- **DAX.guide**: Complete function reference with examples
- **PowerPivotPro**: Practical DAX tutorials

### Practice Files
- `modules/` - Module exercises with starter models
- `dax-library/` - Reusable DAX formulas
- `projects/` - Complete model building projects

## Common Challenges

### "My relationship won't create"
- Check data types match (both numbers or both text)
- Look for nulls or blanks in key columns
- Verify values in both columns actually match
- Check for many-to-many (not directly supported)

### "My measure returns wrong total"
- Likely using calculated column instead of measure
- Check if aggregation function (SUM, AVERAGE) used
- Verify filter context - might need ALL or CALCULATE
- Debug with simpler formula first

### "Time intelligence not working"
- Date table must be continuous (no gaps)
- Must be marked as date table
- Relationship to fact table required
- Date column must be Date type (not DateTime)

### "DAX formula too slow"
- Avoid calculated columns when measure works
- Use CALCULATE instead of FILTER when possible
- Don't use iterators (SUMX) if SUM works
- Check for unnecessary ALL() functions

## Next Course

**Course 5: Analytics and Reporting** - Now that you have a powerful data model with calculations, learn to create stunning interactive dashboards and reports.

---

*Last Updated: 2025-11-17*  
*Status: Outline Complete*
