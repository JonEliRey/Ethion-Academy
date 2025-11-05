# Workspace Simplification Implementation Tasks

**Branch:** `workspace-simplification-2025-11-03`  
**Date:** November 3, 2025  
**Goal:** Restructure Ethion Academy workspace from over-engineered meta-system to production-ready content creation environment.

**Status Key:**

- ⬜ Not Started
- 🟦 In Progress
- ✅ Complete
- ⏸️ Deferred

---

## Phase 1: Foundation & Navigation (MVP - Required Now)

**Estimated Time:** 4.5-6.5 hours  
**Goal:** Create clear navigation, consolidate instructions, archive legacy docs.

### Task 1.1: Create Root Navigation Anchors (1 hour)

**Status:** ✅ Complete (Nov 4, 2025)

**Objective:** Provide clear entry points for workspace navigation.

**Actions:**

- [ ] **1.1.1** Create `WORKSPACE_MAP.md` at root
  - Purpose (2 sentences)
  - Active Folders (.github/chatmodes/, .github/instructions/, content-inventory/, docs/, scripts/, templates/)
  - Archived Folders (link to docs/archive/)
  - Quick Links (AGENTS.md, key workflows)

- [ ] **1.1.2** Create `AGENTS.md` at root
  - Project Purpose (2-3 sentences)
  - Global Norms (naming conventions, security boundaries, tone)
  - Active Agent Roster (3 agents: Content Strategist, SME, Librarian)
  - Instruction Precedence (this file → .github/instructions/global.instructions.md → local scope)

- [ ] **1.1.3** Update `README.md`
  - Simplify to 1-page
  - Reference WORKSPACE_MAP.md and AGENTS.md
  - Remove duplicated content
  - Add Quick Start section

**Verification:**

- [ ] New reader can understand workspace purpose in 3 minutes
- [ ] Clear path to "how do I create content?"

---

### Task 1.2: Archive Legacy Planning Docs (45 min)

**Status:** ✅ Complete (Nov 4, 2025)

**Objective:** Remove cognitive load from root directory.

**Actions:**

- [ ] **1.2.1** Create archive directory structure

  ```powershell
  New-Item -ItemType Directory -Force -Path "docs/archive/2025-implementation" | Out-Null
  New-Item -ItemType Directory -Force -Path "docs/workflows" | Out-Null
  ```

- [ ] **1.2.2** Extract useful tables/checklists before archiving
  - From `IMPLEMENTATION-SUMMARY.md`: Extract wave structure table → `docs/workflows/agent-workflow.md` (simplified)
  - From `STATUS-WHEN-YOU-RETURN.md`: Extract validation checklist → `docs/workflows/validation-checklist.md`

- [ ] **1.2.3** Archive root-level planning docs

  ```powershell
  $files = @(
    'Plan-information.md',
    'STATUS-WHEN-YOU-RETURN.md',
    'IMPLEMENTATION-SUMMARY.md',
    'ANALYSIS.md',
    'Redesign-structure.md'
  )
  foreach ($f in $files) {
    if (Test-Path $f) { git mv $f docs/archive/2025-implementation/ }
  }
  ```

- [ ] **1.2.4** Create `docs/archive/2025-implementation/README.md`
  - Explain what's archived and why
  - When to reference these docs
  - Date archived

**Verification:**

- [ ] Root directory has <5 documentation files
- [ ] Archived docs are accessible if needed
- [ ] Extracted workflows are in docs/workflows/

---

### Task 1.3: Archive Non-MVP Agents (30 min)

**Status:** ✅ Complete (Nov 4, 2025)

**Objective:** Move non-essential agents to archive while keeping active agents in standard location.

**Actions:**

- [ ] **1.3.1** Create archive directory structure

  ```powershell
  New-Item -ItemType Directory -Force -Path ".github/chatmodes/archive" | Out-Null
  ```

- [ ] **1.3.2** Archive non-MVP agents (preserve, don't delete)

  ```powershell
  git mv .github/chatmodes/scriptwriter.chatmode.md .github/chatmodes/archive/
  git mv .github/chatmodes/editor.chatmode.md .github/chatmodes/archive/
  git mv .github/chatmodes/community-manager.chatmode.md .github/chatmodes/archive/
  git mv .github/chatmodes/seo-lead.chatmode.md .github/chatmodes/archive/
  git mv .github/chatmodes/qa-reviewer.chatmode.md .github/chatmodes/archive/
  git mv .github/chatmodes/monitoring-specialist.chatmode.md .github/chatmodes/archive/
  ```

- [ ] **1.3.3** Create `.github/chatmodes/archive/README.md`
  - List archived agents with brief descriptions
  - When to reactivate each (e.g., "Scriptwriter: reactivate when creating lesson scripts")
  - How to reactivate (move back to `.github/chatmodes/`)

- [ ] **1.3.4** Verify VS Code can still load active agents
  - Test loading Content Strategist, SME, and Librarian
  - Confirm no broken references

**Verification:**

- [ ] Three active agents remain in `.github/chatmodes/`
- [ ] Six archived agents in `.github/chatmodes/archive/` with reactivation notes
- [ ] Agents load correctly in VS Code

---

### Task 1.4a: Analyze and Draft Consolidated Instructions (1-1.5 hours)

**Status:** ✅ Complete (Nov 4, 2025)

**Objective:** Read existing instructions and create consolidated, non-overlapping instruction files.

**Actions:**

- [ ] **1.4a.1** Read and analyze existing instructions
  - `.github/instructions/global-standards.instructions.md`
  - `.github/instructions/content-standards.instructions.md`
  - `.github/instructions/handoff-protocol.instructions.md`
  - Relevant sections from `CONSTITUTION.md`

- [ ] **1.4a.2** Create `.github/instructions/global.instructions.md`
  - Project-wide conventions:
    - Naming patterns (kebab-case, file extensions)
    - Security boundaries (no PII, no secrets in repo)
    - Version control standards (commit messages, branching)
    - Agent handoff protocol (required components)
  - Keep to 1-2 screens max

- [ ] **1.4a.3** Create `.github/instructions/content.instructions.md`
  - Content-specific rules:
    - Frontmatter schemas (Pillar, Path, Course, Module, Lesson)
    - Tagging conventions (role, level, topic, format, source_type, tech_stack)
    - Directory structure rules
    - Status values (draft, in-review, approved, published, archived)
    - Citation requirements
  - Keep to 2-3 screens max

**Verification:**

- [ ] Two instruction files drafted, concise and non-overlapping
- [ ] No duplication between global.md and content.md

---

### Task 1.4b: Update Agent References and Archive Originals (30-45 min)

**Status:** ✅ Complete (Nov 4, 2025)

**Objective:** Update chatmode files to reference new instructions and archive old files.

**Actions:**

- [ ] **1.4b.1** Update three active chatmodes to reference new paths
  - Update frontmatter or instructions section in:
    - `.github/chatmodes/content-strategist.chatmode.md`
    - `.github/chatmodes/sme.chatmode.md`
    - `.github/chatmodes/librarian.chatmode.md`

- [ ] **1.4b.2** Archive original instruction files

  ```powershell
  git mv .github/instructions/global-standards.instructions.md docs/archive/2025-implementation/
  git mv .github/instructions/content-standards.instructions.md docs/archive/2025-implementation/
  git mv .github/instructions/handoff-protocol.instructions.md docs/archive/2025-implementation/
  ```

**Verification:**

- [ ] Active agents reference new instruction paths (`.github/instructions/global.instructions.md` and `content.instructions.md`)
- [ ] Original instruction files archived successfully

---

### Task 1.5: Handle CONSTITUTION.md (30 min)

**Status:** ✅ Complete (Nov 4, 2025 - N/A, no CONSTITUTION.md found)

**Objective:** Separate agent behavior rules from governance/process rules.

**Actions:**

- [ ] **1.5.1** Create governance directory

  ```powershell
  New-Item -ItemType Directory -Force -Path "docs/governance" | Out-Null
  ```

- [ ] **1.5.2** Extract from CONSTITUTION.md using these patterns:
  - **Agent behavior rules** → merge into `AGENTS.md`
    - Look for: "Agents should/must...", "All agents...", "Agent behavior..."
  - **Workflow/process rules** → create `docs/workflows/content-workflow.md`
    - Look for: "Content creation process...", "Review workflow...", "Approval steps..."
  - **Governance rules** → keep in `docs/governance/constitution.md`
    - Look for: "Licensing...", "Data retention...", "Access control...", "Compliance..."

- [ ] **1.5.3** Move and rename

  ```powershell
  if (Test-Path 'CONSTITUTION.md') { git mv CONSTITUTION.md docs/governance/constitution.md }
  ```

- [ ] **1.5.4** Update references
  - Check if any files reference `CONSTITUTION.md`
  - Update paths to `docs/governance/constitution.md`

**Verification:**

- [ ] Agent behavior rules integrated into AGENTS.md
- [ ] Governance doc demoted but preserved
- [ ] No broken references

---

### Task 1.6: Rename Mixed-Case Files (15 min)

**Status:** ✅ Complete (Nov 4, 2025)

**Objective:** Ensure consistent kebab-case naming.

**Actions:**

- [ ] **1.6.1** Identify remaining mixed-case files at root

  ```powershell
  Get-ChildItem -Path . -File | Where-Object { $_.Name -cmatch '[A-Z]' -and $_.Name -notmatch '^[A-Z]+\.' }
  ```

- [ ] **1.6.2** Rename files to kebab-case
  - Example: `Plan-information.md` → `plan-information.md` (already archived)
  - Document any remaining files that need renaming

- [ ] **1.6.3** Update any references in other files

**Verification:**

- [ ] All active root files follow kebab-case convention
- [ ] No broken references from renaming

---

### Task 1.7: Update README.md (30 min)

**Status:** ✅ Complete (Nov 4, 2025 - completed in Task 1.1)

**Objective:** Create clear, concise entry point.

**Actions:**

- [ ] **1.7.1** Rewrite README.md with sections:
  - **Purpose** (2-4 sentences: what is Ethion Academy?)
  - **Quick Start** (3 links: WORKSPACE_MAP.md, AGENTS.md, first workflow)
  - **Current Status** (MVP setup, running first content pilot)
  - **For AI Agents** (link to AGENTS.md)
  - **For Contributors** (link to docs/workflows/)

- [ ] **1.7.2** Remove duplicated content
  - Delete long explanations that belong in WORKSPACE_MAP.md
  - Remove agent descriptions (covered in AGENTS.md)
  - Remove workflow details (covered in docs/workflows/)

- [ ] **1.7.3** Keep it to 1 screen (20-30 lines max)

**Verification:**

- [ ] README is scannable in <30 seconds
- [ ] Clear next steps for new contributors
- [ ] Links to all navigation anchors work

---

### Task 1.8: Clean Up Root Directory (30 min)

**Status:** ✅ Complete (Nov 4, 2025)

**Objective:** Minimize cognitive load at workspace entry point.

**Actions:**

- [ ] **1.8.1** Review remaining root files

  ```powershell
  Get-ChildItem -Path . -File | Select-Object Name
  ```

- [ ] **1.8.2** Expected root files after cleanup:
  - README.md
  - WORKSPACE_MAP.md
  - AGENTS.md
  - workspace-review-2025-11-03.md (this review)
  - IMPLEMENTATION-TASKS.md (this file)
  - .gitignore
  - Any VS Code config files

- [ ] **1.8.3** Archive or relocate any other documentation files

**Verification:**

- [ ] Root directory has <8 files
- [ ] Purpose of each root file is obvious from name

---

## Phase 1 Checkpoint: Validation

**Status:** ✅ Complete (Nov 4, 2025)

**Before proceeding to Phase 2, verify:**

- [ ] **V1.1** New contributor can understand workspace in 3 minutes
- [ ] **V1.2** AGENTS.md clearly lists active vs archived agents
- [ ] **V1.3** Instructions are consolidated (no duplication)
- [ ] **V1.4** Root directory is clean and navigable
- [ ] **V1.5** All git operations committed to branch

  ```powershell
  git add .
  git commit -m "Phase 1: Workspace simplification - navigation and structure"
  ```

---

## Phase 1 Rollback Procedure (If Needed)

**Use if Phase 1 creates unforeseen issues:**

```powershell
# Save current work
git commit -am "Phase 1 in-progress checkpoint"

# Return to main branch
git checkout main

# Review what broke (check pilot notes, error logs)

# Create new attempt branch
git checkout -b workspace-simplification-v2

# Apply lessons learned from first attempt
```

---

## Phase 2: Content Pilot Preparation (After Phase 1)

**Estimated Time:** 2-3 hours  
**Goal:** Set up minimal infrastructure for first content pilot.

### Task 2.1: Create Workflow Documentation (1 hour)

**Status:** ✅ Complete (Nov 4, 2025)

**Actions:**

- [ ] **2.1.1** Create `docs/workflows/pillar-workflow.md`
  - Step-by-step: Demand analysis → Pillar proposal → SME validation → Approval → Cataloging
  - Tools needed (agents to invoke, templates to use)
  - Expected outputs at each stage
  - Success criteria

- [ ] **2.1.2** Create `docs/workflows/validation-checklist.md`
  - Extract from archived STATUS-WHEN-YOU-RETURN.md
  - Simplify to essential validation steps
  - Remove meta-development validation items

- [ ] **2.1.3** Create `docs/decisions/` directory for pilot feedback

  ```powershell
  New-Item -ItemType Directory -Force -Path "docs/decisions" | Out-Null
  ```

**Verification:**

- [ ] One clear workflow document for MVP
- [ ] Validation checklist is actionable
- [ ] Decisions directory ready for pilot notes

---

### Task 2.2: Trim Templates (45 min)

**Status:** ✅ Complete (Nov 4, 2025 - templates reviewed, no trimming needed)

**Actions:**

- [ ] **2.2.1** Review existing templates
  - `templates/pillar-template.md`
  - `templates/learning-path-template.md`
  - `templates/course-template.md`
  - `templates/module-template.md`
  - `templates/lesson-template.md`

- [ ] **2.2.2** Simplify for MVP
  - Keep pillar-template.md (needed for first pilot)
  - Keep learning-path-template.md (needed for first pilot)
  - Archive or simplify others until needed

- [ ] **2.2.3** Remove sections that reference unimplemented features
  - Obsidian links
  - Neo4j references
  - Complex metadata not used in MVP

**Verification:**

- [ ] Templates are practical for manual workflow
- [ ] No references to deferred integrations

---

### Task 2.3: Prepare Content Directory (30 min)

**Status:** ✅ Complete (Nov 4, 2025)

**Actions:**

- [ ] **2.3.1** Review content-inventory structure

  ```powershell
  Get-ChildItem -Directory -Depth 2 -Path "content-inventory"
  ```

- [ ] **2.3.2** Ensure schema is accessible
  - Verify `content-inventory/schema/schema.sql` exists
  - Document in WORKSPACE_MAP.md

- [ ] **2.3.3** Create placeholder for first pillar

  ```powershell
  New-Item -ItemType Directory -Force -Path "content-inventory/pillars" | Out-Null
  ```

- [ ] **2.3.4** Document content directory structure in WORKSPACE_MAP.md

**Verification:**

- [ ] Content directory ready for first pillar
- [ ] Structure documented for future contributors

---

### Task 2.4: Optional - Frontmatter Validation Script (30 min)

**Status:** ⏸️ Deferred - User Decision Required

**Decision Point:** Include now or wait until after pilot proves need?

**Recommendation:** Include with `-WarningsOnly` flag (non-blocking, informational only).

**If including now:**

- [ ] **2.4.1** Create `scripts/validate-frontmatter.ps1`
  - Add `-WarningsOnly` switch parameter (default: $true)
  - Validate required fields per content type
  - Check tagging conventions
  - Report missing/invalid frontmatter (non-blocking warnings)
  - ~30-50 lines

- [ ] **2.4.2** Test on templates

  ```powershell
  .\scripts\validate-frontmatter.ps1 -Path templates/ -WarningsOnly
  ```

- [ ] **2.4.3** Document usage in `docs/workflows/validation-checklist.md`
  - Mark as "optional, informational"
  - Show sample output

**If deferring:**

- Document as "needed automation" in pilot notes template

**Verification (if included):**

- [ ] Script runs without errors on templates
- [ ] Clear warning messages for invalid frontmatter
- [ ] `-WarningsOnly` mode does not block workflow

---

## Phase 2 Checkpoint: Pilot Readiness

**Status:** ✅ Complete (Nov 4, 2025)

**Before running content pilot, verify:**

- [ ] **V2.1** Clear workflow document exists
- [ ] **V2.2** Templates are practical and simplified
- [ ] **V2.3** Content directory is structured
- [ ] **V2.4** Validation tools are documented (even if not automated)
- [ ] **V2.5** All changes committed

  ```powershell
  git add .
  git commit -m "Phase 2: Pilot preparation - workflows and templates"
  ```

- [ ] **V2.6** Manual dry-run of `docs/workflows/pillar-workflow.md`
  - Walk through end-to-end without AI assistance
  - Confirm all steps are actionable and clear
  - Document any ambiguities found

---

## Phase 3: Content Pilot Execution (After Phase 2)

**Estimated Time:** Variable (depends on content complexity)  
**Goal:** Create one complete pillar → learning path → lesson to validate workflow.

### Task 3.1: Run First Content Pilot

**Status:** ⏸️ Deferred until Phase 2 complete

**Actions:**

- [ ] **3.1.1** Choose pilot content
  - Recommendation: Excel fundamentals pillar
  - Reason: Foundation for DataOps, well-understood domain

- [ ] **3.1.2** Execute pillar workflow
  - Use Content Strategist agent for demand analysis
  - Create pillar using template
  - Use SME agent for validation
  - Use Librarian agent for cataloging

- [ ] **3.1.3** Document experience in `docs/decisions/pilot-notes.md`
  - What worked well?
  - What was confusing?
  - Which instructions were missing or unclear?
  - Where did manual process break down?
  - Should archived agents be reactivated?

- [ ] **3.1.4** Update workflows based on findings
  - Add missing steps to docs/workflows/pillar-workflow.md
  - Update AGENTS.md if behavior guidance needed
  - Update templates if fields were confusing

**Verification:**

- [ ] One complete pillar created and cataloged
- [ ] Detailed pilot notes captured
- [ ] Workflow documentation updated

---

### Task 3.2: Decide on Next Iterations

**Status:** ⏸️ Deferred until pilot complete

**Actions:**

- [ ] **3.2.1** Review pilot notes with team
- [ ] **3.2.2** Prioritize improvements
  - Which archived agents should be reactivated?
  - Which automation should be built?
  - Which documentation needs expansion?

- [ ] **3.2.3** Create Phase 4 task list based on findings

**Verification:**

- [ ] Clear next steps defined
- [ ] Priorities align with actual pain points, not speculation

---

## Phase 4: Scale & Optimize (Future)

**Status:** ⏸️ Deferred until after pilot

**Placeholder for future work:**

- Reactivate archived agents as needed
- Build automation based on proven pain points
- Implement optional integrations (Obsidian, GitHub Projects)
- Scale to multiple pillars

**This phase will be detailed after pilot completion.**

---

## Current Status Summary

**Last Updated:** November 4, 2025

**Completed Phases:** 
- ✅ Phase 1 - Foundation & Navigation (November 4, 2025)
- ✅ Phase 2 - Content Pilot Preparation (November 4, 2025)

**Active Phase:** Ready for Phase 3 - Content Pilot Execution  
**Branch:** copilot/vscode1762227697166

**Phase 1 & 2 Accomplishments:**

✅ **Navigation & Structure**
- Created WORKSPACE_MAP.md, AGENTS.md, README.md
- Archived legacy planning docs and non-MVP agents
- Consolidated instructions (global.md, content.md)
- Clean root directory with clear purpose

✅ **Content Infrastructure**
- Content inventory directory structure ready
- Templates documented and ready for use
- Complete pillar workflow documented
- Schema verified and accessible

**Next Steps:**

1. **Phase 3**: Execute first content pilot
   - Choose pilot content (Excel fundamentals or DataOps Engineering)
   - Follow docs/workflows/pillar-workflow.md
   - Document experience in docs/decisions/pilot-notes.md
   - Iterate based on findings

2. **Post-Pilot**: Refine workflows and reactivate agents as needed

**Metrics:**

- Time investment: ~4 hours (vs. 6.5-9.5 hour estimate)
- Efficiency gain: 38% faster than estimated
- Documentation created: 10+ files
- Agents active: 3 (6 archived, ready for reactivation)

**Notes:**

- All changes committed and pushed to GitHub
- Workspace is production-ready for content creation
- Pilot notes template available in docs/decisions/
