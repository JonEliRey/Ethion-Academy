# Excel Data Analytics Course Plan

## 1. Overview & Target Learner

- **Audience**: Business/Data Analysts (beginner-intermediate) who already live in Excel but have not systematized Power Query (PQ) or Power Pivot (PP) workflows.
- **Outcome**: Learners can ingest WWI data from multiple sources, automate cleanup, model business-ready datasets with PP, and refresh dashboards without rebuilding workbooks.
- **Format**: Self-paced YouTube playlist + GitHub-hosted practice files; all lessons 8–15 minutes with matching READMEs.
- **Prerequisites**: Confident Excel navigation, basic pivot tables, permission to install Power Query/Power Pivot add-ins, ability to restore WWI sample database locally or use CSV extracts.

## 2. Delivery Strategy

1. **YouTube-first**: Each lesson published as an individual video with cards linking to GitHub assets. Playlist order matches module/lesson numbers.
2. **GitHub pairing**: `/pillar-microsoft-data-analytics-journey/learning-paths/data-analytics-excel/courses/excel-data-analytics/` (proposed) will store course README, module summaries, lesson outlines, sample files, and WWI extracts.
3. **Runtime guardrails**: If recording >15 min, split into "Part A/B" while keeping GitHub folder shared.
4. **Leader's Lens**: Every lesson outline includes 90–150 word business context block for reuse in videos/blog posts.
5. **Self-assessment**: No quizzes; emphasize recap checklists + capstone rubric. Encourage learners to share GitHub gists or discussion comments for peer review.

## 3. Course Structure (Modules & Lessons)

### Module 1 — Modern Excel Setup for Analytics (Approx. 45 min)

| Lesson | Duration | Focus | Key Assets |
| --- | --- | --- | --- |
| 1.1 Course Orientation & WWI Toolkit | 10 min | Explain course map, download WWI sample (SQL backup + CSV pack), repo structure, playlist tips | `README`, WWI download links, checklist PDF |
| 1.2 Enabling Power Query/Power Pivot | 12 min | Walk through Office versions, enabling add-ins, verifying Data tab layout | Screen captures, troubleshooting guide |
| 1.3 Building a Reusable Workspace | 13 min | Configure workbook templates, named ranges for parameters, folder structure for data sources | Template workbook `wwi-foundation.xlsx` |
| 1.4 Data Mindset Shift | 10 min | Compare manual cleanup vs PQ automation, highlight refresh pipeline vision | Slide deck, before/after workbook |

### Module 2 — Power Query Data Ingestion (Approx. 55 min)

| Lesson | Duration | Focus | Key Assets |
| --- | --- | --- | --- |
| 2.1 Connecting to WWI SQL Backup | 12 min | Restore WWI in LocalDB/Azure SQL, connect via PQ, credentials hygiene | `.bacpac` instructions, connection script |
| 2.2 Working with CSV & Folder Sources | 13 min | Combine historical sales CSVs, leverage folder queries, file metadata columns | Sample CSV folder, PQ merge steps |
| 2.3 Query Parameters & Environment Variables | 15 min | Use parameters for server names, file paths, implement dev/prod toggles | Parameterized workbook, environment notes |
| 2.4 Column Profiling & Data Quality Checks | 13 min | Use PQ data profiling panes, detect nulls, define acceptance checklist | Data quality template, profiling cheat sheet |

### Module 3 — Power Query Transformation Patterns (Approx. 60 min)

| Lesson | Duration | Focus | Key Assets |
| --- | --- | --- | --- |
| 3.1 Sales Margin Shaping | 15 min | Transform Sales.InvoiceLines+StockItems, merge lookups, clean columns | M script, workbook output |
| 3.2 Purchasing & Inventory Normalization | 12 min | Shape Purchasing tables, unpivot seasonal demand, align with sales schema | `pq-purchasing.m` |
| 3.3 Advanced M Functions & Custom Columns | 15 min | Create reusable functions, conditional columns, error handling | Function library, reference guide |
| 3.4 Refresh Automation & Diagnostics | 12 min | Configure refresh order, handle credentials, log refresh outcomes | Refresh macro, diagnostic checklist |

### Module 4 — Power Pivot Modeling & Analysis (Approx. 55 min)

| Lesson | Duration | Focus | Key Assets |
| --- | --- | --- | --- |
| 4.1 Loading PQ Outputs to Data Model | 10 min | Load cleaned tables to PP, set table properties, manage table naming | Model-ready workbook |
| 4.2 Relationship Design | 15 min | Build star schema, relationships, cross-filter settings, role-playing dimensions | Relationship diagram, schema PDF |
| 4.3 Measures & KPIs in DAX | 15 min | Create base measures (Total Sales, Margin %), time intelligence preview | `dax-measures.txt`, cheat sheet |
| 4.4 Pivot Table & Visualization Patterns | 15 min | Construct executive-friendly pivots, slicers, conditional formatting tied to measures | `executive-dashboard.xlsx` |

### Module 5 — Capstone: WWI Analytics Sprint (Approx. 60 min)

| Lesson | Duration | Focus | Key Assets |
| --- | --- | --- | --- |
| 5.1 Capstone Brief & Architecture | 9 min | Present business scenario (Ops Director needs weekly snapshot), review requirements, success criteria | Capstone brief PDF |
| 5.2 Build the PQ Pipeline | 15 min | Combine Sales + Purchasing + ExchangeRate data, parameterize refresh, document steps | Starter workbook, TODO checklist |
| 5.3 Model & Analyze in Power Pivot | 18 min | Create relationships, measures, KPIs, scenario calculations | DAX template, modeling diagram |
| 5.4 Storytelling & Self-Assessment | 12 min | Assemble pivot-based dashboard, build Leader's Lens summary, review rubric & next steps | Self-assessment rubric, submission template |

## 4. Capstone Blueprint & Rubric

- **Scenario**: Operations director wants a weekly WWI dashboard covering Sales vs Purchasing variance, inventory turns, and high-risk SKUs. Must refresh in <5 min using PQ + PP.
- **Inputs**: Sales.InvoiceLines, Purchasing.PurchaseLines, StockItemTransactions, ExchangeRates; optional Budget table for stretch goal.
- **Deliverables**: Automated PQ queries with parameterized sources, Power Pivot model with relationships + measures, pivot-based dashboard, Leader's Lens narrative.

### Rubric (self-evaluation)

| Criteria | Description | Score (0-3) |
| --- | --- | --- |
| Data Ingestion | All required tables ingested with parameterized connections & documented refresh steps | 0–3 |
| Transformations | Applied cleaning/merging logic from modules; handles nulls, data types, and lookups | 0–3 |
| Data Model | Relationships + measures enable requested metrics without manual formulas | 0–3 |
| Insights & Narrative | Dashboard answers scenario questions and Leader's Lens frames business impact | 0–3 |
| Refresh Reliability | Workbook refreshes without errors using provided credentials | 0–3 |

Learners "pass" when total ≥12; encourage GitHub Issues/comments to request informal feedback.

## 5. World Wide Importers Dataset Packaging

1. **Sources**: Use official Microsoft WWI sample (SQL backup + CSV). Provide direct MS links plus mirrored extracts (CSV subsets) stored under `Research/DataGeneration/WWI/` for convenience.
2. **Structure**:
   - `/data/raw/sql/wwi.bacpac`
   - `/data/raw/csv/sales/`, `/data/raw/csv/purchasing/`
   - `/data/intermediate/power-query/` (M scripts, staged results)
   - `/data/final/power-pivot/` (model-ready tables, `.xlsx` templates)
3. **Licensing**: Reference Microsoft sample license; include NOTICE referencing Microsoft as source, specify non-commercial educational use.
4. **Integrity**: Publish SHA256 checksums for each archive + instructions for verifying download.
5. **Refresh Guidance**: Document how to update CSV extracts when Microsoft releases new WWI versions; version folders `v1`, `v1.1`, etc.

## 6. Release & Approval Workflow

1. **Pre-production**: Content Strategist finalizes module briefs → SME (Power Query) validates Modules 2–3 → SME (Power Pivot) validates Modules 4–5.
2. **Executive Producer Gate**: Approves course + module briefs before recording; signs off again after scripts/lesson outlines ready.
3. **Recording & Publishing**:
   - Scriptwriter prepares run-of-show + Leader's Lens copy.
   - Executive Producer records video; Editor trims to runtime target.
   - GitHub assets (notebook, dataset, README) merged via PR referencing lesson ID.
   - YouTube description links to matching GitHub folder, capstone rubric, WWI instructions.
4. **Versioning**: Tag GitHub repo and YouTube description with `CourseVersion: 2025.11`. When updates occur, increment patch version (e.g., `2025.11.1`).
5. **Monitoring**: Add Module 2–4 steps to Monitoring Specialist watchlist (Excel/Power Query release notes). SLA: review every 90 days for Excel feature changes.

## 7. Cross-Path Hooks

- Highlight in Module 4.4 how the Power Pivot model can be imported into Power BI Desktop (table relationships & measures remain intact).
- Tag lessons with `topic:excel-analytics`, `role:analyst`, `level:intermediate`, plus `hook:power-bi` where future Power BI course will pick up.
- Document export steps (Data Model → Power BI) to accelerate a parallel "Power BI for Excel Analysts" path without re-building the dataset.

## 8. Outstanding Items

- Confirm WWI redistribution terms allow bundling trimmed CSVs in repo (expect yes with attribution).
- Decide if Module 3.4 should mention Power Automate for refresh notifications or keep purely Excel.
- Align with SEO lead on playlist/video titles before recording to speed metadata work.
