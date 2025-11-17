---
description: 'Scribe logging protocol for long-running agent work'
applyTo: '**'
---

# Scribe Protocol Instructions

Guidance for maintaining a persistent research log during multi-step agent tasks.

## When to Invoke
- Task is expected to exceed ~15 minutes, span multiple tool calls, or require cross-session recall.
- Multiple data sources/decisions must be captured for later agents or reviewers.
- User explicitly requests a running log.

## Setup Steps
1. Create a log from `templates/scribe-log-template.md` inside `docs/working-notes/{agent-id}/` using a descriptive task slug (e.g., `pillar-airflow-demand.md`).
2. Update the frontmatter with task name, agent, start timestamp, and set `status: in-progress`.
3. If a relevant log already exists for the same task, continue in that file instead of creating a new one.

## Logging Cadence
- After every meaningful research chunk (new dataset, interpretation, blocker) or at least every 10 minutes.
- Use the `## Research Log` section with timestamped bullets that cite source, metric, and takeaway.
- Record key decisions in `## Decisions` and unresolved work in `## Open Questions`.
- When coordinating with a helper agent, prefix commands with `@scribe` (e.g., `@scribe log <summary>`). The helper's only role is to append entries and confirm they were recorded.

## Closure & Retention
1. When the task is finished, update the frontmatter `status` to `complete` and add a completion timestamp in `## Decisions`.
2. Move the file to `docs/working-notes/archive/` if it is no longer active but should remain available for future reference. Keep it in-place if ongoing work is expected soon.
3. Only delete a log after explicit confirmation from the user/lead that it is obsolete. Otherwise, treat logs as reusable history for future iterations.

## Do / Do Not
- **Do** keep entries concise, factual, and sourced.
- **Do** link to artifacts (queries, scripts, documents) when possible.
- **Do** reference this protocol in handoffs so next agents know a log exists.
- **Do Not** duplicate information already written in the final deliverable—link to it instead.
- **Do Not** store secrets or PII in the log.
