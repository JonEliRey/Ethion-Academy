# Archived AI Agents

**Status:** Preserved for future reactivation as needed

## Overview

These agents are fully functional but not needed for the current MVP (Minimum Viable Product) content creation workflow. They were archived to reduce workspace complexity and focus on the essential content planning, validation, and cataloging workflow.

## Archived Agents

### Scriptwriter
**File:** `scriptwriter.chatmode.md`

**Purpose:** Creates detailed lesson scripts with code examples, "Leader's Lens" business context, and practice exercises.

**When to Reactivate:** When ready to scale from pillar/path planning to detailed lesson creation.

**Reactivation:** `git mv .github/chatmodes/archive/scriptwriter.chatmode.md .github/chatmodes/`

---

### Editor
**File:** `editor.chatmode.md`

**Purpose:** Reviews content for clarity, grammar, style consistency, and learner accessibility.

**When to Reactivate:** When producing high-volume content that needs quality control review before publication.

**Reactivation:** `git mv .github/chatmodes/archive/editor.chatmode.md .github/chatmodes/`

---

### Community Manager
**File:** `community-manager.chatmode.md`

**Purpose:** Plans engagement strategies, writes compelling titles/descriptions, and designs cross-promotion campaigns.

**When to Reactivate:** When content is ready for publication and audience growth becomes a priority.

**Reactivation:** `git mv .github/chatmodes/archive/community-manager.chatmode.md .github/chatmodes/`

---

### SEO Lead
**File:** `seo-lead.chatmode.md`

**Purpose:** Optimizes content for search discoverability, keyword targeting, and organic traffic.

**When to Reactivate:** When scaling published content and SEO performance becomes measurable.

**Reactivation:** `git mv .github/chatmodes/archive/seo-lead.chatmode.md .github/chatmodes/`

---

### QA Reviewer
**File:** `qa-reviewer.chatmode.md`

**Purpose:** Tests code examples, validates learning exercises, and ensures hands-on content is functional.

**When to Reactivate:** When lesson scripts include code that learners will execute (not just read).

**Reactivation:** `git mv .github/chatmodes/archive/qa-reviewer.chatmode.md .github/chatmodes/`

---

### Monitoring Specialist
**File:** `monitoring-specialist.chatmode.md`

**Purpose:** Tracks content freshness, flags outdated material based on tool version changes, and prioritizes update cycles.

**When to Reactivate:** When content library is large enough that manual tracking of updates becomes impractical.

**Reactivation:** `git mv .github/chatmodes/archive/monitoring-specialist.chatmode.md .github/chatmodes/`

---

## Active Agents

For current active agents, see **[AGENTS.md](../../../AGENTS.md)** in the workspace root.

Currently active:
- Content Strategist
- Subject Matter Expert (SME)
- Librarian

---

## Reactivation Guidelines

1. **Move file back:** Use git mv to restore agent to `.github/chatmodes/`
2. **Update AGENTS.md:** Add restored agent to "Active Agent Roster" section
3. **Test in VS Code:** Verify agent loads correctly with `@agent-name` mention
4. **Update workflows:** Document how the reactivated agent fits into current content workflow

---

*Archived agents are production-ready and can be reactivated within minutes as workflow needs evolve.*
