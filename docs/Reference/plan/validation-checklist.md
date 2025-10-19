# Validation Checklist

## Wave 12: System Validation

### T046: Manual Test Execution
Follow `docs/Reference/quickstart.md` to validate complete system.

**Status**: ⏳ Pending manual execution  
**Estimated Time**: 30-45 minutes  
**Prerequisites**: Database initialized, agents accessible in VS Code

**Validation Steps**:
- [ ] Initialize database successfully
- [ ] Content Strategist performs demand analysis
- [ ] SME validates technical scope
- [ ] Librarian catalogs in database
- [ ] Database query returns pillar record
- [ ] JSON export contains pillar entry

---

### T047: Agent Quality Validation
Invoke each of 9 agents and verify output quality.

**Status**: ⏳ Pending manual execution  
**Estimated Time**: 2-3 hours (15-20 min per agent)

**Per Agent Checklist**:
- [ ] **Content Strategist**: Generates 3+ demand sources, proposes pillar with scope
- [ ] **SME**: Validates technical claims, identifies prerequisites, provides sources
- [ ] **Librarian**: Assigns canonical tags, catalogs in database, exports JSON
- [ ] **Scriptwriter**: Creates lesson outline with 3-5 objectives, practice exercises
- [ ] **Editor**: Reviews frontmatter, checks tags, validates links
- [ ] **Community Manager**: Optimizes titles/hooks, crafts CTAs
- [ ] **SEO Lead**: Researches keywords, optimizes metadata
- [ ] **QA Reviewer**: Validates all links, runs comprehensive checklist
- [ ] **Monitoring Specialist**: Detects source changes, identifies affected content

**Quality Criteria Per Agent**:
- [ ] Output follows specifications in `.chatmode.md` file
- [ ] Handoff messages include all 9 required components
- [ ] References custom instructions correctly
- [ ] Examples match expected format

---

### T048: Database Schema Validation
Execute sample queries to verify database operations.

**Status**: ⏳ Pending manual execution  
**Estimated Time**: 30-45 minutes

**Validation Queries**:

#### 1. Retrieve All Pillars
```sql
SELECT id, name, status FROM Pillar;
```
**Expected**: At least 1 pillar (from quickstart validation)

#### 2. Query Lessons by Tag
```sql
SELECT l.id, l.name, t.name as tag_name
FROM Lesson l
INNER JOIN ContentTag ct ON l.id = ct.content_id
INNER JOIN Tag t ON ct.tag_id = t.id
WHERE t.name = 'airflow';
```
**Expected**: Returns lessons tagged with "airflow"

#### 3. Trace Prerequisite Chain
```sql
WITH RECURSIVE prereq_chain AS (
    SELECT id, name, 0 AS depth FROM Lesson WHERE id = 'lesson-106'
    UNION ALL
    SELECT l.id, l.name, pc.depth + 1
    FROM Lesson l
    INNER JOIN Prerequisite p ON l.id = p.prerequisite_content_id
    INNER JOIN prereq_chain pc ON p.content_id = pc.id
)
SELECT * FROM prereq_chain ORDER BY depth DESC;
```
**Expected**: Shows prerequisite chain depth (shouldn't exceed 4 levels)

#### 4. Generate Cross-Reference Report
```sql
SELECT c.id, c.name, c.content_type, COUNT(ct.tag_id) as tag_count
FROM Content c
LEFT JOIN ContentTag ct ON c.id = ct.content_id
GROUP BY c.id
ORDER BY tag_count DESC;
```
**Expected**: All content has tags assigned

#### 5. Verify Foreign Key Constraints
```sql
-- Attempt invalid insert (should fail)
INSERT INTO ContentTag (content_id, tag_id) VALUES ('invalid-id', 'invalid-tag');
```
**Expected**: Error (foreign key constraint violation)

#### 6. Verify Triggers Update Timestamps
```sql
-- Update a pillar
UPDATE Pillar SET description = 'Updated description' WHERE id = 'pillar-dataops-engineering';

-- Check updated_at changed
SELECT id, updated_at FROM Pillar WHERE id = 'pillar-dataops-engineering';
```
**Expected**: `updated_at` timestamp updated to current time

#### 7. Verify Indexes Improve Performance
```sql
EXPLAIN QUERY PLAN
SELECT * FROM Lesson WHERE module_id = 'module-task-dependencies';
```
**Expected**: Uses index (e.g., "SEARCH TABLE Lesson USING INDEX idx_lesson_module")

---

## Validation Summary

### System Ready If:
- [x] All 51 tasks complete (T001-T051)
- [ ] Manual test plan passes (T046)
- [ ] All 9 agents produce quality outputs (T047)
- [ ] Database operations validated (T048)
- [ ] No critical issues identified

### Next Steps After Validation:
1. **If All Pass**: System ready for production curriculum development
2. **If Issues Found**: Document in `test-results.md`, prioritize fixes, re-validate
3. **Production Rollout**: Begin with pilot pillar (e.g., DataOps Engineering), monitor agent performance

---

*Validation Checklist Created*: 2025-01-15  
*Validation Executed*: ⏳ Pending  
*Validation Report*: TBD (to be created in `docs/Reference/plan/test-results.md`)
