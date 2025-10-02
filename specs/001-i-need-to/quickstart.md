# Quickstart: Validate Agent System

## Purpose
This guide provides a step-by-step validation scenario to test the complete Super-Intelligent Course Designer agent system with minimal setup.

**Scenario**: Pillar Approval Cycle  
**Agents**: Content Strategist, SME, Librarian  
**Duration**: ~30-45 minutes  
**Outcome**: Approved pillar cataloged in database

---

## Prerequisites

### Required Tools
- VS Code with GitHub Copilot (or equivalent chat interface)
- PowerShell 7+ (for database scripts)
- SQLite 3.x (for database operations)

### Repository Setup
1. Clone repository:  
   `git clone https://github.com/<your-org-or-username>/Ethion-Academy.git`  
   <!-- Replace <your-org-or-username> with your GitHub organization or username -->
2. Navigate to directory: `cd Ethion-Academy`
3. Verify structure:
   ```bash
   ls -la .github/chatmodes/     # Should see 9 agent files
   ls -la .github/instructions/  # Should see 3 instruction files
   ls -la content-inventory/     # Should see schema/ directory
   ```

---

## Step-by-Step Validation

### Step 1: Initialize Database
**Duration**: 2-3 minutes

**Command**:
```powershell
pwsh scripts/init-database.ps1 -DatabasePath content-inventory/content.db -SchemaPath content-inventory/schema/schema.sql
```

**Expected Output**:
```
✓ Database created successfully
✓ 16 tables created: Pillar, LearningPath, Course, Module, Lesson, ContentAsset, ...
✓ Indexes created
✓ Triggers created
Database initialized at: content-inventory/content.db
```

**Verification**:
```powershell
# Check tables exist
sqlite3 content-inventory/content.db ".tables"
# Should list: AgentAction, Approval, ContentAsset, ContentSource, ContentTag, Course, DemandSignal, LearningPath, Lesson, Module, Pillar, Prerequisite, Source, Tag, UpdateAlert, AssetProductionStatus
```

---

### Step 2: Load Content Strategist
**Duration**: 1 minute

**Action**: Open VS Code chat interface  
**Command**: `@content-strategist` (or load `.github/chatmodes/content-strategist.chatmode.md`)

**Prompt**: "I want to create content for DataOps. Can you analyze demand and propose a pillar?"

**Expected Response**:
- Agent performs demand analysis (searches job postings, trends, community signals)
- Provides 3+ demand sources with quantitative metrics
- Proposes pillar structure (name, description, scope, 3-7 learning paths)
- Identifies target audience (role × level)

**Validation Checklist**:
- [ ] Demand analysis includes 3+ sources
- [ ] Scope has "Included" and "Excluded" sections
- [ ] Target audience specified (e.g., "Data Engineers, Intermediate")
- [ ] Handoff message generated with all 9 required components

---

### Step 3: Receive Handoff to SME
**Duration**: 1 minute

**Expected Output**: Content Strategist generates handoff message:
```markdown
## 🔄 HANDOFF REQUIRED

**From**: Content Strategist
**To**: @sme
**Reason**: Technical validation needed for "DataOps Engineering" pillar

[Context, Deliverables, What SME Should Do, Expected Output, Success Criteria, Executive Producer instruction]
```

**Validation Checklist**:
- [ ] Handoff message has all 9 components
- [ ] Deliverables clearly listed (pillar-dataops-draft.md)
- [ ] Tasks for SME are specific and actionable
- [ ] Success criteria are measurable (checkboxes)
- [ ] Executive Producer instruction explicit (`@sme`)

---

### Step 4: Switch to SME
**Duration**: 1 minute

**Action**: Switch chat mode  
**Command**: `@sme`

**Prompt**: "Please validate the DataOps pillar proposal for technical accuracy."

**Expected Response**:
- Agent verifies technical claims against official documentation
- Checks current version numbers (e.g., Airflow 2.8, dbt 1.7)
- Identifies missing prerequisites
- Suggests authoritative sources
- Generates validation report with APPROVED/NEEDS REVISION status

**Validation Checklist**:
- [ ] All technical claims checked against official docs
- [ ] Tool versions verified (e.g., Airflow 2.8)
- [ ] Prerequisites identified (e.g., "Python functions", "SQL JOINs")
- [ ] Sources validated for freshness (updated within 6-12 months)
- [ ] Clear approval status (APPROVED or NEEDS REVISION with reasons)

---

### Step 5: Receive Handoff for Approval
**Duration**: 1 minute

**Expected Output**: SME generates handoff message:
```markdown
## 🔄 HANDOFF REQUIRED

**From**: SME
**To**: Executive Producer
**Reason**: Technical validation complete - pillar approved

[Context with validation findings, deliverables, approval recommendation]
```

**Validation Checklist**:
- [ ] Validation report attached
- [ ] Clear approval status
- [ ] Recommendations provided (e.g., "Start with Pipeline Orchestration path")

---

### Step 6: Approve as Executive Producer
**Duration**: 2-3 minutes

**Action**: Review validation report  
**Decision**: APPROVED (assuming validation passed)

**Command**: `@librarian`  
**Prompt**: "Please catalog the approved DataOps Engineering pillar in the database."

---

### Step 7: Switch to Librarian
**Duration**: 1 minute

**Action**: Switch chat mode  
**Command**: `@librarian`

**Expected Response**:
- Agent assigns canonical tags (topic, level, role)
- Identifies prerequisites (none for foundational pillar)
- Searches for related content
- Records in database using parameterized queries
- Verifies database entry
- Exports to JSON

**Validation Checklist**:
- [ ] Tags assigned match canonical taxonomy (e.g., "data-engineering" not "data_engineering")
- [ ] Database INSERT query uses parameterized values (no SQL injection risk)
- [ ] Verification SELECT query confirms record exists
- [ ] JSON export generated

---

### Step 8: Verify Database Entry
**Duration**: 2-3 minutes

**Command**:
```powershell
# Query database directly
sqlite3 content-inventory/content.db "SELECT * FROM Pillar WHERE id = 'pillar-dataops-engineering';"
```

**Expected Output**:
```
pillar-dataops-engineering|DataOps Engineering|Modern data pipeline orchestration...|approved|2025-01-15 14:30:00|...
```

**Validation Checklist**:
- [ ] Record exists with correct ID
- [ ] Status is "approved"
- [ ] approved_at timestamp populated
- [ ] Name and description match proposal

---

### Step 9: Verify JSON Export
**Duration**: 1 minute

**Command**:
```powershell
pwsh scripts/export-inventory.ps1 -Format Json -Entity Pillars
```

**Expected Output**:
```
✓ Exported Pillars to content-inventory/exports/pillars.json
Records exported: 1
```

**Verification**:
```powershell
# Check JSON file
cat content-inventory/exports/pillars.json
# Should contain pillar-dataops-engineering entry
```

**Validation Checklist**:
- [ ] JSON file exists
- [ ] Contains pillar-dataops-engineering entry
- [ ] JSON is valid (properly formatted)
- [ ] All metadata present (name, description, status, tags)

---

## Success Criteria

### Complete Validation Passed If:
- [x] Database initialized successfully (16 tables created)
- [x] Content Strategist performed demand analysis (3+ sources)
- [x] Handoff message generated with all 9 components
- [x] SME validated technical accuracy
- [x] Librarian cataloged content in database
- [x] Database query returns pillar record
- [x] JSON export contains pillar entry

### System is Ready For Production If:
- [x] All agents respond correctly to prompts
- [x] Handoff protocol followed (all 9 components present)
- [x] Database operations work (INSERT, SELECT, export)
- [x] No SQL errors or broken references
- [x] Tags use canonical values (no typos)

---

## Troubleshooting

### Database Initialization Fails
**Error**: "sqlite3: command not found"  
**Fix**: Install SQLite 3.x: `apt-get install sqlite3` (Linux) or download from sqlite.org

**Error**: "schema.sql not found"  
**Fix**: Verify file exists at `content-inventory/schema/schema.sql`

### Agent Not Responding
**Error**: Chat mode not loading  
**Fix**: Verify `.github/chatmodes/[agent].chatmode.md` file exists and has correct frontmatter

### Handoff Message Missing Components
**Error**: Handoff only has 5 of 9 components  
**Fix**: Agent may need re-prompting: "Please generate a complete handoff message following the standard protocol (9 required components)"

### Database Query Returns Empty
**Error**: `SELECT * FROM Pillar` returns 0 rows  
**Fix**: Check Librarian output for SQL errors. Re-run cataloging step. Verify database path is correct.

### JSON Export Empty or Invalid
**Error**: `pillars.json` is empty or malformed  
**Fix**: Check database has records: `sqlite3 content-inventory/content.db "SELECT COUNT(*) FROM Pillar;"`

---

## Next Steps After Validation

### If All Tests Pass:
1. **Proceed with Learning Path Development**: Use approved pillar to create learning paths
2. **Test Full Production Pipeline**: Create a lesson and run through all 7 agents (Scriptwriter → Editor → Community Manager → SEO Lead → QA → EP → Librarian)
3. **Monitor Performance**: Track agent response times, quality of outputs

### If Tests Fail:
1. **Review Agent Specifications**: Check `.github/chatmodes/[agent].chatmode.md` for correct structure
2. **Verify Custom Instructions**: Ensure `.github/instructions/*.instructions.md` files exist and are referenced
3. **Check Database Schema**: Verify all 16 tables exist with correct columns
4. **Consult Troubleshooting Guide**: See above for common issues

---

## Additional Validation Scenarios

### Scenario 2: Rejection Flow
Test what happens when SME rejects a proposal:
1. Content Strategist proposes pillar with insufficient evidence (1 source only)
2. SME rejects with specific feedback
3. Content Strategist revises and re-submits
4. SME re-validates and approves
5. Verify rework loop completes successfully

### Scenario 3: Multi-Agent Lesson Production
Test full lesson creation pipeline:
1. Scriptwriter creates lesson outline
2. Editor reviews (finds 2-3 minor issues)
3. Scriptwriter revises
4. Community Manager optimizes engagement
5. SEO Lead adds keywords
6. QA Reviewer performs final check
7. Executive Producer approves
8. Librarian catalogs
9. Verify lesson in database with all tags, prerequisites, cross-references

---

*Expected Completion Time*: 30-45 minutes for basic validation, 2-3 hours for all additional scenarios
