# Pillar Creation Workflow

**Purpose:** Create a new content pillar from initial idea through to database cataloging.

**Estimated Time:** 1-2 hours for demand analysis + validation; 30 minutes for cataloging

**Agents Involved:** Content Strategist → SME → Librarian

---

## Prerequisites

- [ ] Clear understanding of target technology/domain area
- [ ] Access to market research tools (Google Trends, job boards, community forums)
- [ ] Familiarity with [AGENTS.md](../../AGENTS.md) and agent handoff protocol

---

## Phase 1: Demand Analysis & Proposal (Content Strategist)

**Estimated Time:** 45-60 minutes

### Step 1: Initiate Content Strategist

In VS Code chat, invoke: `@content-strategist`

### Step 2: Provide Context

Share with the agent:

- **Topic/Domain:** What technology or skill area? (e.g., "DataOps Engineering", "Real-Time Streaming")
- **Target Audience:** Role + experience level (e.g., "Data Engineers, Intermediate")
- **Business Goal:** What are we trying to achieve? (YouTube reach, paid course conversions, SEO authority)
- **Existing Content:** Any related pillars or paths already created?

### Step 3: Request Demand Analysis

Ask the agent to:

1. Analyze market demand using 3+ data sources
2. Review competitor offerings and identify gaps
3. Propose pillar structure with scope boundaries

### Step 4: Review Proposal

The agent will create a pillar proposal markdown file. Review:

- [ ] Demand evidence is strong (3+ sources with quantitative metrics)
- [ ] Scope boundaries are clear (what's included vs. excluded)
- [ ] Target audience is well-defined
- [ ] Learning path ideas are logical and sequential

### Step 5: Save Proposal

Save the proposal as: `content-inventory/pillars/pillar-[pillar-name].md`

---

## Phase 2: Technical Validation (SME)

**Estimated Time:** 30-45 minutes

### Step 6: Hand Off to SME

The Content Strategist will prepare a handoff message. When ready:

1. Switch to SME: `@sme`
2. Provide the pillar proposal file
3. Ask SME to validate technical accuracy

### Step 7: SME Review

The SME will:

- Validate technical concepts and tool selections
- Identify prerequisites for each learning path
- Suggest authoritative sources
- Flag missing critical topics

### Step 8: Address Feedback

**If Approved:**

- Proceed to Phase 3

**If Revision Needed:**

- Return to `@content-strategist` with SME feedback
- Update proposal
- Re-submit to `@sme` for validation

---

## Phase 3: Approval Checkpoint (Human Decision)

**Estimated Time:** 5-10 minutes

### Step 9: Executive Review

As the Executive Producer (human), review:

- [ ] Demand evidence convincing
- [ ] Technical validation passed
- [ ] Scope aligns with business strategy
- [ ] Prerequisites realistic for target audience
- [ ] Learning path ideas are compelling

### Step 10: Make Decision

**Options:**

- **Approve:** Proceed to cataloging
- **Revise:** Send back to Content Strategist with specific feedback
- **Reject:** Explain why and suggest alternative direction

---

## Phase 4: Cataloging (Librarian)

**Estimated Time:** 10-15 minutes

### Step 11: Hand Off to Librarian

Once approved:

1. Switch to Librarian: `@librarian`
2. Provide approved pillar file
3. Request cataloging in database

### Step 12: Database Entry

The Librarian will:

- Add pillar to SQLite database (`content-inventory/content.db`)
- Assign proper tags following canonical taxonomy
- Generate pillar ID (e.g., `pillar-dataops-engineering`)
- Create database relationships for future learning paths

### Step 13: Verify Cataloging

Check that:

- [ ] Pillar appears in database exports (run `pwsh scripts/export-inventory.ps1` if available)
- [ ] Pillar status is set to "approved"
- [ ] Tags are correctly assigned
- [ ] Pillar ID follows naming convention

---

## Phase 5: Documentation & Next Steps

**Estimated Time:** 5 minutes

### Step 14: Update Workspace

- [ ] Update `IMPLEMENTATION-TASKS.md` if this was a planned task
- [ ] Document any workflow pain points in `docs/decisions/pilot-notes.md`
- [ ] Commit changes to Git

### Step 15: Plan Learning Paths

With approved pillar in place:

- Review proposed learning paths from Phase 1
- Prioritize which path to develop first
- Begin learning path workflow (when ready)

---

## Troubleshooting

### Agent Handoff Failed

**Issue:** Agent doesn't have all needed context

**Solution:**

- Ensure handoff message includes all 9 required components (see `.github/instructions/global.instructions.md`)
- Attach all relevant files explicitly
- Provide 2-4 paragraph context summary

### Demand Evidence Weak

**Issue:** <3 sources or unclear market signals

**Solution:**

- Research additional sources (Reddit, Stack Overflow, LinkedIn Skills, GitHub stars)
- Check for regional variations (US vs. Europe vs. Asia)
- Consider broadening or narrowing topic scope

### SME Rejects Scope

**Issue:** Technical inaccuracies or missing critical topics

**Solution:**

- Return to Content Strategist with specific SME feedback
- Revise scope boundaries
- Update tool/technology selections
- Re-submit for validation

### Database Cataloging Fails

**Issue:** SQL errors or database not initialized

**Solution:**

- Run `pwsh scripts/init-database.ps1` to create/reset database
- Verify file paths are correct
- Check that prerequisite relationships are valid

---

## Success Criteria

Before considering pillar "complete," verify:

- [x] Demand analysis completed with 3+ sources
- [x] Pillar proposal document created with frontmatter
- [x] SME validation passed (no technical concerns)
- [x] Executive approval granted
- [x] Pillar cataloged in database with correct tags
- [x] Git changes committed
- [x] Next steps documented (which learning path to develop first)

---

*This workflow will be refined based on pilot experience. Document any improvements in `docs/decisions/`.*
