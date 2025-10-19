# Scenario 1: Pillar Approval Flow

## Overview
This scenario walks through the complete pillar creation workflow from idea to cataloged record.

**Agents**: Content Strategist → SME → Executive Producer → Librarian  
**Duration**: ~4 hours of agent effort + ~10 minutes human review  
**Outcome**: Approved `pillar-dataops-engineering` recorded in the inventory database

---

## Walkthrough

### 1. Executive Producer prompts Content Strategist
- Switch to `@content-strategist`
- Prompt: "Analyze demand and propose a DataOps pillar"

### 2. Content Strategist analyzes demand
- Aggregates job market, Google Trends, community signals
- Drafts pillar proposal with scope, inclusions/exclusions, audience, outcomes
- Prepares handoff to SME using standard template

### 3. SME reviews technical scope
- Validates tools (Airflow, dbt, Great Expectations, OpenTelemetry)
- Adds prerequisites (Python functions/decorators, SQL JOINs, Git basics)
- Confirms sources current (within 12 months)
- Returns APPROVED handoff to Executive Producer

### 4. Executive Producer approves
- Reviews validation report, confirms business alignment
- Switches to `@librarian` for cataloging

### 5. Librarian catalogs pillar
- Applies canonical tags (topic, level, role)
- Inserts record into `content-inventory/content.db`
- Exports `pillars.json`
- Sends completion handoff back to Executive Producer

---

## Key Artifacts
- `pillar-dataops-engineering-draft.md`
- `validation-report-dataops-pillar.md`
- `pillar-dataops-engineering` record in SQLite
- `content-inventory/exports/pillars.json`

---

## Quality Gates Met
- Demand justified (1,500+ job postings, +40% YoY search)
- Scope technically accurate and current
- Prerequisites documented
- Handoffs followed template requirements
- Inventory updated and exported

---

## Next Steps
- Begin Learning Path development with the approved pillar
- Recommended starting path: "Apache Airflow for Data Pipeline Orchestration"
