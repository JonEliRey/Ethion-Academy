---
description: "Global AgentGraph (handoff adjacency and invariants)"
applyTo: "**/*.md"
---

# AgentGraph – Global Handoff Rules

This file defines allowed handoffs between agents and key invariants. Agents must still follow the standard handoff protocol and consult nearest Agents.md for scope rules.

## Allowed Handoffs (Adjacency)

- content-strategist → sme → executive-producer → librarian
- scriptwriter → editor → sme → executive-producer → librarian
- editor → community-manager
- monitoring-specialist → sme → content-strategist → scriptwriter
- community-manager → seo-lead → editor → scriptwriter

## Alternate Paths (Decision Heuristics)

- scriptwriter → research when evidence gaps or missing sources are detected
- scriptwriter → sme when technical uncertainty is high
- sme → research for source verification or standards updates
- monitoring-specialist → research for impact assessment deep-dives

## Invariants

- Librarian never proposes new content (no librarian → content-strategist)
- Avoid circular loops beyond 2 cycles; escalate to executive-producer
- Use applyTo filters in Agents.md to limit context loading

## Return-to-Human Conditions

- Ambiguity requiring judgment, approval checkpoints, or error conditions per handoff protocol
