# Execution Sequence: Super-Intelligent Course Designer Workflow
**Feature**: 001-i-need-to  
**Total Tasks**: 51  
**Total Waves**: 13  
**Estimated Duration**: 18-22 hours (with optimal parallelization)

---

## Quick Reference: 13-Wave Execution Plan

```
WAVE 0: Foundation [5 min]
   └─> T001: Create .github/chatmodes/ directory
        ║
        ▼
WAVE 1: Directories [15 min] [PARALLEL x6]
   └─> T002-T007: Create all remaining directories
        ║
        ▼
WAVE 2: Database [2-3 hrs] [SEQUENTIAL]
   ├─> T008: Database schema (⚠️ TEST BEFORE PROCEEDING)
   ├─> T009: init-database.ps1
   └─> T010: export-inventory.ps1
        ║
        ▼
WAVE 3: Templates [1-2 hrs] [PARALLEL x5]
   └─> T041-T045: All content templates
        ║ (inform standards)
        ▼
WAVE 4: Custom Instructions [2-3 hrs] [PARALLEL x3] ⚠️ CRITICAL
   ├─> T020: global-standards.instructions.md
   ├─> T021: content-standards.instructions.md
   └─> T022: handoff-protocol.instructions.md
        ║ ⚠️ AGENTS DEPEND ON THESE
        ▼
WAVE 5: Phase 1 Agents [3-4 hrs] [PARALLEL x3]
   ├─> T011: Content Strategist
   ├─> T012: SME
   └─> T013: Librarian
        ║ (⚠️ MINI-VALIDATION RECOMMENDED)
        ▼
WAVE 6: Phase 2 Agents [5-6 hrs] [PARALLEL x6]
   ├─> T014: Scriptwriter
   ├─> T015: Editor
   ├─> T016: Community Manager
   ├─> T017: SEO Lead
   ├─> T018: QA Reviewer
   └─> T019: Monitoring Specialist
        ║
        ▼
WAVE 7: Prompt Files [4-6 hrs] [PARALLEL x8]
   └─> T023-T030: All prompt workflows
        ║
        ▼
WAVE 8: Workflow Docs [3-4 hrs] [SEQUENTIAL]
   ├─> T031: Handoff protocol guide (FIRST)
   ├─> T032: Stage gates guide
   └─> T033: Agent flow diagram
        ║
        ▼
WAVE 9: Example Scenarios [2-3 hrs] [PARALLEL x3]
   └─> T034-T036: Pillar creation, Rejection, Multi-agent
        ║
        ▼
WAVE 10: Quickstart [1-2 hrs] [SEQUENTIAL]
   └─> T037: Quickstart validation guide
        ║
        ▼
WAVE 11: Remaining Scripts [2-3 hrs] [SEQUENTIAL]
   ├─> T038: init-database.ps1
   ├─> T039: export-inventory.ps1
   └─> T040: generate-obsidian-mirror.ps1
        ║
        ▼
WAVE 12: VALIDATION [3-4 hrs] [SEQUENTIAL] ⚠️ HARD GATE
   ├─> T046: Manual test plan execution
   ├─> T047: Agent quality validation
   └─> T048: Database schema validation
        ║ (MUST PASS BEFORE PROCEEDING)
        ▼
WAVE 13: Integration [2-3 hrs] [SEQUENTIAL]
   ├─> T049: GitHub Projects setup guide
   ├─> T050: Obsidian integration guide
   └─> T051: Update project agent context
        ║
        ▼
   ✅ COMPLETE
```

---

## Critical Path (Minimum Time)

**Sequence**: Wave 0 → 1 → 2 → 4 → 5 → 8 → 10 → 12 → 13  
**Duration**: ~15-18 hours (assuming no rework from validation)

**Parallel Opportunities**: Waves 1, 3, 4, 5, 6, 7, 9 can have multiple tasks running simultaneously

---

## ⚠️ CRITICAL DEPENDENCIES

### 1. Custom Instructions Before Agents (Wave 4 → Wave 5-6)
**Why Critical**: Agents reference custom instruction files in their content. If instructions don't exist, agents will have broken references.

**What Happens If Ignored**: 
- Agents reference `.github/instructions/*.instructions.md` files that don't exist
- Quality issues in agent design
- Need to rework all 9 agents

**Solution**: Complete ALL of Wave 4 before starting Wave 5

### 2. Database Schema Before Scripts (Wave 2: T008 → T009-T010)
**Why Critical**: Scripts execute SQL against the schema. Wrong schema = broken scripts.

**What Happens If Ignored**:
- Scripts fail with "table not found" errors
- Need to recreate database and test again

**Solution**: Test schema with sample queries before creating scripts

### 3. Validation Before Integration (Wave 12 → Wave 13)
**Why Critical**: No point documenting integration if core system doesn't work.

**What Happens If Ignored**:
- Integration guides reference broken features
- Wasted effort documenting unusable system

**Solution**: Fix ALL validation issues before Wave 13

---

## 🎯 Recommended Daily Schedule

### Day 1: Foundation & Database (4-5 hours)
- Morning: Waves 0-2 (directories + database)
- Afternoon: Test database schema thoroughly

### Day 2: Standards & Templates (3-4 hours)
- Morning: Wave 3 (templates)
- Afternoon: Wave 4 (custom instructions) ⚠️ CRITICAL

### Day 3: Phase 1 Agents (3-4 hours)
- Morning: Wave 5 (3 agents)
- Afternoon: Mini-validation of Phase 1 agents

### Day 4: Phase 2 Agents (5-6 hours)
- Full day: Wave 6 (6 agents)
- Test 1-2 agents as you go

### Day 5: Prompts (4-6 hours)
- Full day: Wave 7 (8 prompt files)

### Day 6: Documentation (5-7 hours)
- Morning: Wave 8 (workflow docs)
- Afternoon: Wave 9 (example scenarios)
- Evening: Wave 10 (quickstart)

### Day 7: Scripts & Validation (5-7 hours)
- Morning: Wave 11 (remaining scripts)
- Afternoon: Wave 12 (VALIDATION) ⚠️ GATE
- Evening: Fix any issues found

### Day 8: Integration & Polish (2-3 hours)
- Morning: Wave 13 (integration guides)
- Afternoon: Final review and commit

**Total**: 31-42 hours across 8 work days (1-2 weeks full-time, 2-3 weeks part-time)

---

## 📊 Parallelization Summary

| Wave | Parallel Tasks | Max Speed-Up | Time Saved |
|------|----------------|--------------|------------|
| 1 | 6 tasks | 6x | ~1-2 hrs |
| 3 | 5 tasks | 5x | ~4-5 hrs |
| 4 | 3 tasks | 3x | ~2 hrs |
| 5 | 3 tasks | 3x | ~2-3 hrs |
| 6 | 6 tasks | 6x | ~5-6 hrs |
| 7 | 8 tasks | 8x | ~7-8 hrs |
| 9 | 3 tasks | 3x | ~2 hrs |

**Total Potential Savings**: ~23-27 hours (reduces 44 hours to 18-22 hours)

---

## 🚨 Common Mistakes to Avoid

### ❌ Starting agents before custom instructions
**Mistake**: "Both are marked [P], so I'll do them together"  
**Impact**: Broken references, need to rework all 9 agents  
**Fix**: Always complete Wave 4 before Wave 5

### ❌ Skipping database schema testing
**Mistake**: "Schema looks good, I'll move on"  
**Impact**: Scripts fail, validation fails, need to recreate database  
**Fix**: Run sample INSERT/SELECT queries after T008

### ❌ Not validating Phase 1 agents
**Mistake**: "I'll validate all agents together at the end"  
**Impact**: Multiply quality issues across Phase 2 agents  
**Fix**: Mini-validation after Wave 5

### ❌ Treating validation as formality
**Mistake**: "Wave 12 is just checking boxes"  
**Impact**: Shipping broken system, major rework later  
**Fix**: Take validation seriously, fix ALL issues before Wave 13

### ❌ Skipping templates (Wave 3)
**Mistake**: "I'll do templates whenever"  
**Impact**: Custom instructions (Wave 4) lack concrete examples  
**Fix**: Do Wave 3 before Wave 4

---

## ✅ Success Criteria by Wave

### Wave 2: Database Foundation
- [ ] Can execute `pwsh scripts/init-database.ps1` successfully
- [ ] All 16 tables created with correct schema
- [ ] Sample INSERT works for Pillar, Path, Lesson
- [ ] Foreign key constraints enforced
- [ ] Timestamps auto-update

### Wave 4: Custom Instructions
- [ ] All 3 `.instructions.md` files exist in `.github/instructions/`
- [ ] Frontmatter includes `description` and `applyTo`
- [ ] Content covers all required sections
- [ ] Examples are concrete and complete

### Wave 5: Phase 1 Agents (+ Mini-Validation)
- [ ] `@content-strategist` loads in VS Code chat
- [ ] Can propose pillar with demand evidence
- [ ] Handoff message has all 9 components
- [ ] `@sme` validates technical scope
- [ ] `@librarian` catalogs content

### Wave 12: Validation (HARD GATE)
- [ ] Quickstart scenario executes end-to-end
- [ ] All 9 agents produce quality outputs
- [ ] Database operations work correctly
- [ ] JSON export generates valid files
- [ ] No critical issues remain

### Wave 13: Integration
- [ ] GitHub Projects guide is actionable
- [ ] Obsidian integration is documented
- [ ] Agent context file updated
- [ ] All 51 tasks marked complete

---

## 📝 Daily Checklist Template

Copy this for each work session:

```markdown
## Work Session: [Date]

**Target Wave**: [Wave #]
**Tasks**: [Task IDs]
**Estimated Duration**: [Hours]

### Pre-Work
- [ ] Previous wave's gate passed
- [ ] Required files/directories exist
- [ ] Templates/references available

### During Work
- [ ] Follow TEMPLATE-chatmode.md structure
- [ ] Reference custom instructions correctly
- [ ] Test as you go (for scripts/agents)
- [ ] Commit after each task

### Post-Work
- [ ] All tasks in wave complete
- [ ] Mini-validation passed (if applicable)
- [ ] Gate criteria met
- [ ] Ready for next wave

### Issues/Notes
[Document any problems, deviations, or insights]
```

---

## 🎓 Key Learnings for Next Time

**What Worked**:
- Templates before standards (Wave 3 → 4)
- Mini-validation after Phase 1 agents (Wave 5)
- Separate database schema from scripts (Wave 2 split)

**What to Remember**:
- Dependencies marked in original plan.md may conflict with [P] markers
- Custom instructions are foundational, not just configuration
- Validation takes real time, not a formality

**Process Improvements**:
- Wave structure clearer than phase structure
- Gates prevent wasted work downstream
- Daily schedule helps with estimation

---

**Status**: Ready for Wave 0  
**First Task**: T001 - Create `.github/chatmodes/` directory  
**First Gate**: Directory exists → Proceed to Wave 1
