---
task: pillar-airflow-demand
owner: content-strategist
started: 2025-11-15T10:00:00Z
status: in-progress
---

# Working Notes: Pillar Demand Validation (Airflow Operations)

## Context

- Goal: Gather fresh demand evidence for an Airflow-focused pillar prior to SME validation.
- Inputs: User request to quantify job demand plus recent wiki traffic queries for Power BI/Power Query.
- Constraints: Prior research stalled; need timestamped references for Executive Producer review.

## Research Log

- 2025-11-15 10:05Z — Noted Power BI/Power Query Wikimedia API calls were failing (HTTP 429). Flagged need for backoff or cached data.
- 2025-11-15 10:20Z — Pulled LinkedIn job search snapshot ("Apache Airflow" in title) showing 1,340 US listings (source: linkedin.com/jobs, manual query).
- 2025-11-15 10:32Z — Captured Google Trends comparison ("Airflow DAG", "Airflow scheduler") trending upward since Q2 2024; screenshot saved to `Research/General/airflow-trends-20251115.png`.

## Decisions

- Continue collecting at least one community signal (Reddit/Stack Overflow) before moving to SME review.
- Retry Wikimedia API later today with exponential backoff or use pre-built dataset.

## Open Questions

- Do we have historical student performance metrics for Airflow to cite alongside public demand?
- Should the same log support the Power BI vs. Power Query investigation, or split into separate tasks?
