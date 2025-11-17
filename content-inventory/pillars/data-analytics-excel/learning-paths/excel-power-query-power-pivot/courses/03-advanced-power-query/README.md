# Course 3: Advanced Power Query

## Overview

**Duration**: 2-3 hours  
**Level**: Intermediate  
**Prerequisites**: Course 2 (Power Query Fundamentals)

Learn advanced Power Query techniques for handling complex data scenarios, combining queries, and optimizing performance.

## Purpose

Once you master Power Query basics, real-world scenarios demand more sophisticated techniques. This course teaches you to combine data from multiple sources, create dynamic queries with parameters, handle complex conditional logic, and optimize for performance.

## Learning Outcomes

By completing this course, you will:
- Combine data from multiple tables using merge and append
- Create calculated columns with conditional logic
- Work effectively with date/time data
- Parse and transform complex text data
- Build flexible queries using parameters
- Debug queries and optimize performance
- Write basic M code for custom transformations

## Module Structure

### Module 3.1: Combining Queries
**Topics**: Append (union), merge (join), join types, matching columns

**Lessons**:
1. Appending Queries (Stacking Data) (10 min)
2. Merge Basics - Inner Join (11 min)
3. Left, Right, and Full Outer Joins (13 min)
4. Handling Multiple Match Columns (10 min)
5. Expanding Merged Columns (9 min)

### Module 3.2: Custom Columns and Conditional Logic
**Topics**: Add custom column, if-then-else, nested conditions, common patterns

**Lessons**:
1. Creating Custom Columns (10 min)
2. IF-THEN-ELSE Logic (11 min)
3. Nested Conditions (13 min)
4. Using Column References (9 min)
5. Common Calculation Patterns (12 min)

### Module 3.3: Date and Time Operations
**Topics**: Date parts, date calculations, date ranges, fiscal calendars

**Lessons**:
1. Extracting Date Parts (Year, Month, Day) (9 min)
2. Date Calculations (Age, Duration) (11 min)
3. Working with Time (10 min)
4. Creating Date Tables (14 min)
5. Fiscal Year and Periods (12 min)

### Module 3.4: Text Manipulation
**Topics**: Text functions, extract, replace, pattern matching, cleanup

**Lessons**:
1. Text Functions Overview (9 min)
2. Advanced Text Extraction (12 min)
3. Pattern Matching and Replace (11 min)
4. Cleaning Complex Text Data (13 min)

### Module 3.5: Parameters and Dynamic Queries
**Topics**: Create parameters, use in queries, dynamic file paths, date ranges

**Lessons**:
1. Introduction to Parameters (10 min)
2. File Path Parameters (11 min)
3. Date Range Parameters (13 min)
4. Building Parameter-Driven Queries (14 min)

### Module 3.6: Error Handling and Performance
**Topics**: Try/catch, error replacement, query folding, performance tips

**Lessons**:
1. Understanding Query Errors (9 min)
2. Try-Catch Error Handling (12 min)
3. Replacing Errors Strategically (10 min)
4. Query Folding Explained (14 min)
5. Performance Optimization Techniques (13 min)
6. Debugging Power Query (11 min)

## Sample Data

**Dataset**: World Wide Importers - Multi-Table Scenario
- Customer table
- Orders table
- Order lines table
- Products table
- Practice realistic join scenarios
- ~10,000 rows total

**Files**:
- `customers.csv`
- `orders.csv`
- `order-lines.csv`
- `products.xlsx`
- `exercises/` - Complex transformation scenarios
- `solutions/` - Step-by-step solutions with M code

## Key Concepts

### Merge (Join) Types
- **Inner Join**: Only matching rows from both tables
- **Left Outer**: All from left + matches from right
- **Right Outer**: All from right + matches from left
- **Full Outer**: All rows from both tables
- **Anti Join**: Rows from left NOT in right

### Query Folding
Power Query pushes transformations back to data source:
- **Benefits**: Faster performance, less memory usage
- **When It Works**: Database sources, some file types
- **When It Breaks**: Custom columns, M functions
- **Check**: Right-click step, see if "View Native Query" enabled

### M Language Basics
Behind every visual step is M code:
- Functional language (like Excel formulas)
- Case-sensitive
- Each step creates a variable
- Can edit in Advanced Editor
- Learn by viewing generated code

### Parameters Best Practices
- Name clearly (e.g., "FilePath", "StartDate")
- Provide default values
- Document purpose
- Use for: file paths, date ranges, filter values
- Avoid for: structural changes (column names)

## Assessment

### Module Quizzes
- 5-7 questions per module
- Scenario-based, practical questions
- 80% passing score

### Hands-On Checkpoints
- Merge customer and order data (left join)
- Create conditional category column
- Extract year/month from date column
- Parse complex text field
- Build date-range parameter query
- Optimize slow-running query

### Course Project Component
Build comprehensive sales analysis query:
1. Merge customers, orders, and order lines
2. Add calculated columns (order age, category)
3. Extract date components for grouping
4. Implement error handling for missing data
5. Add parameters for date range filtering
6. Optimize for performance

**Success Criteria**:
- All tables merged correctly with proper join types
- Custom logic works for all edge cases
- Errors handled gracefully
- Query folds to source where possible
- Refresh time under 10 seconds

## Resources

### Official Documentation
- Power Query M Formula Reference: https://docs.microsoft.com/powerquery-m/
- M Function Categories: https://docs.microsoft.com/powerquery-m/power-query-m-function-reference
- Query Folding: https://docs.microsoft.com/power-query/query-folding-basics

### Community Resources
- Gil Raviv's Power Query book and blog
- PowerQuery.com community forums
- Reddit r/PowerQuery

### Practice Files
- `modules/` - Module-specific exercises
- `projects/` - Integrated projects combining techniques
- `m-code-examples/` - Common M code snippets

## Common Challenges

### "My merge returns too many/few rows"
- Check join type (inner vs. outer)
- Verify matching column data types match
- Look for duplicates in join keys
- Use Table.RowCount() to debug

### "Custom column gives errors"
- Check for null values (use try...otherwise)
- Verify column names spelled correctly
- Data types might not match operation
- Test logic with simple examples first

### "Query doesn't fold anymore"
- Custom columns often break folding
- Move custom logic after load when possible
- Check with "View Native Query"
- Consider doing calculations in Excel instead

### "Parameters not working as expected"
- Check parameter data type
- Ensure parameter used in right context
- Test with static value first, then parameterize
- Watch for text vs. number type issues

## Next Course

**Course 4: Power Pivot and Data Modeling** - Now that you can transform and combine data perfectly, learn to build data models and create advanced calculations with DAX.

---

*Last Updated: 2025-11-17*  
*Status: Outline Complete*
