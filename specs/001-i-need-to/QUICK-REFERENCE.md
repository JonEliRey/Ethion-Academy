# Quick Reference: Critical Sequencing Rules

## 🚨 THE BIG THREE RULES

### 1️⃣ CUSTOM INSTRUCTIONS BEFORE AGENTS
```
Wave 4 (T020-T022) → Wave 5-6 (T011-T019)
```
**Why**: Agents reference `.github/instructions/*.instructions.md` files  
**If broken**: All 9 agents have broken references, need rework  

### 2️⃣ DATABASE SCHEMA BEFORE SCRIPTS
```
T008 → T009-T010, T038-T040
```
**Why**: Scripts execute SQL against schema  
**If broken**: Scripts fail with "table not found"  

### 3️⃣ VALIDATION BEFORE INTEGRATION
```
Wave 12 (T046-T048) → Wave 13 (T049-T051)
```
**Why**: No point documenting broken features  
**If broken**: Integration guides reference unusable system  

---

## 📋 Pre-Flight Checklist

Before starting ANY wave, verify:

### Before Wave 5 (Phase 1 Agents):
- [ ] Wave 4 complete (ALL 3 custom instructions exist)
- [ ] `.github/instructions/global-standards.instructions.md` exists
- [ ] `.github/instructions/content-standards.instructions.md` exists
- [ ] `.github/instructions/handoff-protocol.instructions.md` exists

### Before Wave 8 (Workflow Docs):
- [ ] ALL 9 agents complete (T011-T019)
- [ ] Can load `@content-strategist` in VS Code chat
- [ ] Can load `@sme` in VS Code chat

### Before Wave 12 (Validation):
- [ ] Quickstart guide exists (T037)
- [ ] All configuration complete (Waves 4-7)
- [ ] Database initialized successfully

### Before Wave 13 (Integration):
- [ ] T046 passed (manual test)
- [ ] T047 passed (agent quality)
- [ ] T048 passed (database validation)
- [ ] No critical issues remain

---

## ⚡ Speed Tips

### Maximum Parallelization Opportunities:
1. **Wave 1**: Run all 6 directory tasks simultaneously (~15 min → 3 min)
2. **Wave 6**: Run all 6 Phase 2 agents simultaneously (~30 hrs → 5-6 hrs)
3. **Wave 7**: Run all 8 prompts simultaneously (~32 hrs → 4-6 hrs)

### Use AI Coding Assistants For:
- Agent chat mode creation (repetitive structure)
- Prompt file creation (similar formats)
- Template creation (parallel work)
- PowerShell scripts (boilerplate)

### Do Manually For:
- Database schema design (needs careful thought)
- Custom instructions (foundational, needs accuracy)
- Validation (human judgment required)
- Example scenarios (quality matters)

---

## 🎯 Daily Goals

### Day 1: "Foundation Day"
**Goal**: Get infrastructure ready  
**Target**: Complete Waves 0-2  
**Success**: Can initialize database successfully  

### Day 2: "Standards Day"
**Goal**: Define all standards and templates  
**Target**: Complete Waves 3-4  
**Success**: Custom instructions exist, ready for agents  

### Day 3: "Phase 1 Agents Day"
**Goal**: Create and validate core 3 agents  
**Target**: Complete Wave 5 + mini-validation  
**Success**: Can execute pillar proposal cycle  

### Day 4: "Phase 2 Agents Day"
**Goal**: Create remaining 6 agents  
**Target**: Complete Wave 6  
**Success**: All 9 agents loadable in VS Code  

### Day 5: "Prompts Day"
**Goal**: Create all workflow prompts  
**Target**: Complete Wave 7  
**Success**: Each agent has associated prompts  

### Day 6: "Documentation Day"
**Goal**: Document all workflows and examples  
**Target**: Complete Waves 8-10  
**Success**: Quickstart guide ready for testing  

### Day 7: "Validation Day" ⚠️
**Goal**: Test everything thoroughly  
**Target**: Complete Waves 11-12  
**Success**: All validation passes, no critical issues  

### Day 8: "Polish Day"
**Goal**: Finish integration and final touches  
**Target**: Complete Wave 13  
**Success**: System fully documented and ready for use  

---

## 🔍 Gate Checklist

Copy this before each wave:

```markdown
## Gate: Entering Wave [#]

### Prerequisites Met:
- [ ] Previous wave complete
- [ ] All dependencies satisfied
- [ ] Required files exist
- [ ] No blocking issues

### Ready to Proceed:
- [ ] Understand wave goals
- [ ] Have templates/examples ready
- [ ] Time allocated (X hours)
- [ ] Validation plan clear

### After Wave Complete:
- [ ] All tasks done
- [ ] Gate criteria met
- [ ] Committed to Git
- [ ] Ready for next wave
```

---

## 🆘 Troubleshooting

### "Agent can't find custom instruction file"
**Problem**: Started Wave 5 before Wave 4 complete  
**Fix**: Complete T020-T022, then restart agent creation  

### "Database script fails"
**Problem**: Schema not tested before creating scripts  
**Fix**: Validate T008 with sample queries, fix schema, recreate scripts  

### "Validation fails at Wave 12"
**Problem**: Quality issues in earlier waves  
**Fix**: Identify root cause, return to relevant wave, fix, re-validate  

### "Example scenarios reference wrong format"
**Problem**: Created scenarios before workflow docs (T031)  
**Fix**: Review T031 (handoff protocol), update scenarios to match  

---

## 📊 Time Estimates by Role

### Solo Developer (doing everything):
- **With parallelization**: 18-22 hours (1-2 weeks part-time)
- **Sequential**: 32-44 hours (3-4 weeks part-time)

### With AI Coding Assistant:
- **Configuration tasks**: 50% faster (Waves 4-7)
- **Documentation**: 30% faster (Waves 8-10)
- **Validation**: Same time (human judgment)
- **Total**: ~15-18 hours (1 week part-time)

### Team of 2-3:
- **Wave 6** (6 agents): 2 hours instead of 6
- **Wave 7** (8 prompts): 2 hours instead of 6
- **Total**: ~12-15 hours (3-4 days part-time)

---

## ✅ Definition of Done

### Per Wave:
- [ ] All tasks in wave complete
- [ ] Files committed to Git
- [ ] Gate criteria verified
- [ ] No known issues

### Per Day:
- [ ] Daily goal achieved
- [ ] Mini-validations passed
- [ ] Progress documented
- [ ] Blockers identified

### Final (After Wave 13):
- [ ] All 51 tasks complete
- [ ] Quickstart scenario executes successfully
- [ ] All agents produce quality outputs
- [ ] Database operations work
- [ ] System documented and ready for content production

---

**Current Status**: Ready to begin  
**Next Action**: Execute T001 (Wave 0)  
**Time to First Gate**: 5 minutes
