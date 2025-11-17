# Course 5: Analytics and Reporting

## Overview

**Duration**: 2-3 hours  
**Level**: Intermediate  
**Prerequisites**: Course 4 (Power Pivot and Data Modeling)

Bring everything together by building interactive dashboards, applying visualization best practices, and learning automation basics.

## Purpose

You've mastered data transformation with Power Query and data modeling with Power Pivot. Now it's time to communicate insights effectively. This course teaches you to design professional analytical dashboards, apply best practices for visualization, and understand when Excel is the right tool versus when to graduate to Power BI.

## Learning Outcomes

By completing this course, you will:
- Create PivotTables connected to Power Pivot models
- Design interactive reports with slicers and timelines
- Apply data visualization best practices
- Build user-friendly analytical dashboards
- Implement refresh workflows and automation
- Understand Power Automate basics for Excel
- Know when to use Excel vs. Power BI
- Apply optimization and troubleshooting techniques

## Module Structure

### Module 5.1: PivotTables with Power Pivot
**Topics**: Create PivotTable from model, add fields, formatting, drill-down

**Lessons**:
1. Creating PivotTables from Data Model (10 min)
2. Working with Model Fields (11 min)
3. Drilling Down and Expanding (9 min)
4. PivotTable Formatting Best Practices (12 min)
5. Calculated Fields vs. DAX Measures (10 min)

### Module 5.2: Slicers and Timelines
**Topics**: Slicer basics, cross-filtering, timeline controls, slicer design

**Lessons**:
1. Introduction to Slicers (9 min)
2. Connecting Slicers to Multiple PivotTables (11 min)
3. Timeline Controls for Dates (10 min)
4. Slicer Formatting and Design (12 min)
5. Advanced Slicer Techniques (13 min)

### Module 5.3: Dashboard Design Principles
**Topics**: Layout, color theory, clarity, audience-focused design

**Lessons**:
1. Dashboard Design Fundamentals (13 min)
2. Color and Visual Hierarchy (11 min)
3. Layout and White Space (10 min)
4. Designing for Your Audience (12 min)
5. Common Dashboard Mistakes (10 min)

### Module 5.4: Advanced Visualizations
**Topics**: Charts from PivotTables, conditional formatting, sparklines, custom visuals

**Lessons**:
1. PivotCharts Basics (10 min)
2. Choosing the Right Chart Type (13 min)
3. Conditional Formatting in PivotTables (12 min)
4. Sparklines for Trends (9 min)
5. Custom Formatting Techniques (11 min)

### Module 5.5: Report Automation
**Topics**: Refresh workflows, scheduled refresh, change detection, version control

**Lessons**:
1. Manual vs. Automatic Refresh (9 min)
2. Refresh on Open Settings (8 min)
3. Scheduled Refresh Options (11 min)
4. Handling Refresh Errors (12 min)
5. Version Control Best Practices (10 min)

### Module 5.6: Power Automate Integration
**Topics**: What is Power Automate, trigger from Excel, simple workflows

**Lessons**:
1. Introduction to Power Automate (10 min)
2. Triggering Workflows from Excel (12 min)
3. Simple Automation Examples (14 min)
4. When to Use Power Automate vs. Excel (9 min)

### Module 5.7: Best Practices and Next Steps
**Topics**: Excel vs. Power BI decision, optimization, troubleshooting, career paths

**Lessons**:
1. Optimization Checklist (12 min)
2. Common Troubleshooting Scenarios (13 min)
3. Excel vs. Power BI - Decision Framework (14 min)
4. Maintaining Your Analytics Solutions (11 min)
5. Next Steps in Your Analytics Journey (10 min)

## Sample Data

**Dataset**: World Wide Importers - Complete Analytics Package
- Fully loaded data model with relationships
- Pre-built DAX measures
- Multiple scenario dashboards
- ~50,000 transactions

**Files**:
- `dashboard-starter.xlsx` - Blank canvas with loaded model
- `dashboard-examples.xlsx` - 5 complete dashboard examples
- `exercises/` - Dashboard design challenges
- `templates/` - Reusable dashboard layouts

## Key Concepts

### Dashboard Design Principles
**F-Pattern Layout**: Eyes scan left-to-right, top-to-bottom
- Critical metrics top-left
- Supporting details below and right
- Filters/slicers left sidebar

**5-Second Rule**: 
- Key insight visible in 5 seconds
- No hunting for important numbers
- Clear visual hierarchy

**Less Is More**:
- Don't overcrowd with charts
- 3-5 visualizations maximum per dashboard
- White space improves comprehension

### Color Best Practices
- **Consistent Palette**: 3-5 colors maximum
- **Meaningful Colors**: Red for negative, green for positive
- **Accessibility**: Avoid red-green only (colorblind-friendly)
- **Company Branding**: Use brand colors when appropriate

### Slicer Best Practices
- Group related slicers together
- Order logically (date, category, detail)
- Show item counts when helpful
- Clear default selections
- Sync across related PivotTables

### Refresh Strategies
**Manual Refresh**:
- User controls timing
- Good for: Ad-hoc analysis, unstable data sources

**On-Open Refresh**:
- Automatic when file opens
- Good for: Daily reports, shared files

**Scheduled Refresh** (requires OneDrive/SharePoint):
- Automatic at specific times
- Good for: Executive dashboards, regular reports

### Excel vs. Power BI Decision Matrix

**Use Excel When**:
- < 1M rows of data
- Individual or small team use
- Users already comfortable with Excel
- Ad-hoc, flexible analysis needed
- Existing Excel infrastructure

**Use Power BI When**:
- > 1M rows of data
- Organization-wide sharing
- Need web/mobile access
- Real-time or near-real-time data
- Advanced visualizations required
- Governance and security critical

### Power Automate Use Cases
**Light Automation** (covered in this course):
- Email report on schedule
- Save file to SharePoint
- Notify when data refreshes
- Simple approval workflows

**Not Covered** (separate learning path):
- Complex multi-step workflows
- Data processing at scale
- API integrations

## Assessment

### Module Quizzes
- 5-7 questions per module
- Design principles and practical scenarios
- 80% passing score

### Hands-On Checkpoints
- Create PivotTable from data model
- Add slicers and timelines
- Design dashboard with 3-5 visuals
- Apply conditional formatting
- Set up refresh workflow
- Evaluate Excel vs. Power BI scenario

### Course Project - Final Dashboard
Build complete sales analytics dashboard:

**Requirements**:
1. **Summary Section**: KPI cards showing total sales, orders, customers
2. **Trends**: Sales by month with year-over-year comparison
3. **Breakdown**: Sales by product category and customer segment
4. **Geography**: Sales by region (table or chart)
5. **Filters**: Slicers for date range, category, region

**Design Standards**:
- Clean layout following F-pattern
- Consistent color palette
- Appropriate chart types
- Professional formatting
- Mobile-friendly (if possible)

**Functionality**:
- All slicers connected properly
- Refresh works without errors
- Drill-down enabled where appropriate
- Documentation included

**Success Criteria**:
- [ ] Dashboard loads in under 5 seconds
- [ ] Key metrics visible immediately
- [ ] All filters work correctly
- [ ] Charts update dynamically
- [ ] Professional appearance
- [ ] No errors on refresh
- [ ] Includes documentation

## Resources

### Official Documentation
- PivotTable and PivotChart: https://support.microsoft.com/pivottables
- Slicers: https://support.microsoft.com/slicers
- Power Automate: https://powerautomate.microsoft.com/learn

### Design Resources
- **Dashboard Design**: Stephen Few's "Information Dashboard Design"
- **Color Tools**: Adobe Color, Coolors.co
- **Examples**: Excel Dashboard School, Chandoo.org dashboards

### Community
- r/excel - Dashboard feedback and ideas
- Excel Dashboard Templates - Free downloadable templates
- Power BI Community - For next steps

### Practice Files
- `modules/` - Design exercises
- `templates/` - Professional dashboard templates
- `examples/` - Industry-specific dashboard samples

## Common Challenges

### "My dashboard looks cluttered"
- Remove unnecessary elements
- Increase white space
- Limit to 3-5 main visuals
- Use tabs if needed for detail

### "Slicers don't affect all PivotTables"
- Check PivotTable connections (Right-click slicer → Report Connections)
- Ensure all PivotTables use same data model
- Verify fields exist in all tables

### "Refresh takes too long"
- Review Power Query folding
- Limit data to necessary rows
- Consider Power BI for large datasets
- Optimize DAX measures

### "Colors look great on my screen, terrible on projector"
- Test in actual presentation environment
- Avoid very light or very dark colors
- Use high-contrast combinations
- Check colorblind simulator

## Capstone Project

### Executive Sales Dashboard
**Scenario**: Build dashboard for VP of Sales showing:
- Current month performance vs. target
- Trending: Last 12 months sales
- Top 10 customers by revenue
- Product category performance
- Regional breakdown

**Deliverables**:
1. Excel workbook with dashboard
2. Documentation explaining:
   - Data model design
   - Key DAX measures
   - Refresh process
   - User instructions
3. 2-minute video presentation

**Evaluation Criteria**:
- Data model correctness (20%)
- DAX measure accuracy (20%)
- Dashboard design quality (25%)
- Functionality and interactivity (20%)
- Documentation clarity (15%)

## Congratulations!

You've completed the Excel Data Analytics learning path! You now have skills to:
- Transform messy data into clean, structured datasets
- Build sophisticated data models
- Create powerful calculations with DAX
- Design professional analytical dashboards

### Next Steps

**Immediate Application**:
1. Apply these skills to your current work
2. Build a portfolio project
3. Share knowledge with colleagues

**Continue Learning**:
- **Power BI Desktop**: Take your skills to enterprise BI
- **Advanced DAX**: Deep dive into complex calculations
- **SQL**: Query databases directly
- **Python/Pandas**: Programming-based data analysis

**Career Development**:
- Update LinkedIn with new skills
- Consider Microsoft certification (PL-300: Power BI Data Analyst)
- Join communities (r/PowerBI, r/excel)
- Build portfolio of projects

---

*Last Updated: 2025-11-17*  
*Status: Outline Complete*
