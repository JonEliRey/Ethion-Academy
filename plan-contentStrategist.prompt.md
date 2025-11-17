## Plan: Migrate Active Agents to .github/agents

TL;DR: Move the three active agents (Content Strategist, SME, Librarian) into `.github/agents/` with lean, role-aligned frontmatter (target, name, description, argument-hint, tools, handoffs). Add minimal anchored body sections (`<stopping_rules>`, `<workflow>`, plus one or two role-specific anchors) and scoped tool lists reflecting responsibilities. Integrate `runSubagent` only where isolated research adds value. Archive originals after each successful migration.

### Steps
1. Create `.github/agents/` and draft `content-strategist.agent.md` (tools: ['search','fetch','runSubagent','githubRepo']; anchors: `<stopping_rules>`, `<workflow>`, `<research_protocol>`, `<proposal_style_guide>`; handoffs to SME + Plan).
2. Migrate `sme.chatmode.md` → `sme.agent.md` (tools: ['search','fetch','usages','problems','testFailure','runSubagent']; anchors: `<stopping_rules>`, `<workflow>`, `<validation_protocol>`, `<feedback_style>`; handoff back to Strategist + Librarian).
3. Migrate `librarian.chatmode.md` → `librarian.agent.md` (tools: ['search','fetch','editFiles','runSubagent']; anchors: `<stopping_rules>`, `<workflow>`, `<cataloging_protocol>`, `<index_scan>`; handoff to Strategist for gap report).
4. Add lean `argument-hint` per agent ("Provide target skill gap", "Paste proposal for validation", "Supply approved pillar ID"); include minimal `handoffs` arrays; archive original `.chatmode.md` files after each migration.
5. Update `AGENTS.md` links + brief tool rationale after each file move; final pass to confirm no stale `.chatmode.md` references before removing archived copies.

### Further Considerations
1. Optional tools to trim later: `githubRepo` (Strategist), `testFailure` (SME) if unused.
2. Keep body sections short (≤8 lines each) and rely on anchors instead of extra schema fields.
3. Defer model specification unless divergence needed; default inherited model acceptable.
