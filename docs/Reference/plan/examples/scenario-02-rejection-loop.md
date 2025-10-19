# Scenario 2: Rejection and Rework Loop

## Overview
Illustrates how the workflow handles a rejection, revision cycle, and final approval.

**Agents**: Content Strategist ↔ SME → Executive Producer  
**Duration**: ~4 hours total (initial attempt + rework)  
**Outcome**: Pillar refined to meet standards and ultimately approved

---

## Walkthrough

### 1. Initial proposal (Content Strategist)
- Proposed pillar: "Blockchain for Data Engineering"
- Evidence: Only 200 job postings from a single source

### 2. Validation failure (SME)
- Flags issues: insufficient demand sources, unclear scope, no prerequisites
- Sends rejection handoff back to `@content-strategist` with corrective actions

### 3. Revision (Content Strategist)
- Adds additional demand signals (Google Trends, community forums, industry report)
- Clarifies scope: using blockchain as a data source, excluding smart contract development
- Identifies prerequisites: distributed systems fundamentals, Python, API integration
- Re-submits to SME

### 4. Re-validation (SME)
- Confirms corrections and technical accuracy
- Approves with recommendation to proceed

### 5. Executive Producer decision
- Reviews second validation report
- Approves pillar to continue in pipeline

---

## Key Artifacts
- `pillar-blockchain-data-engineering-draft.md` (v1 and v2)
- `validation-report-blockchain-pillar.md`
- Rejection and approval handoff messages

---

## Quality Lessons
- Provide at least 3 demand sources in initial proposals
- Scope must include clear inclusions/exclusions
- Always document prerequisites before SME review
- Rejection loops maintain quality and clarity

---

## Next Steps
- With approval, proceed to cataloging or revisit prioritization against other pillars
- Capture rejection learnings in team retrospectives
