---
description: Forward-looking blueprint & governance guidelines for autonomous agent development
applyTo: '**/docs/agent-development/**'
---

# Agent Development Blueprint Usage Guidelines

These instructions apply when interacting with any file in `docs/agent-development/`.

---

## 📋 Purpose

Provide a **forward-looking canonical blueprint** for designing transparent, verifiable, tool-driven autonomous agents.  
Secondary (archived) content exists ONLY for historical root-cause traceability—do not replicate legacy patterns.

---

## 📁 Structure Overview

```
docs/agent-development/
├── index.md (blueprint entry point)
├── blueprint/ (active design modules)
└── archive/ (legacy fix cycles)
```

Blueprint modules are numbered (01–09). Additional modules (10+) require RFC approval (see `08-contribution-and-evolution-process.md`).

---

## 🔍 Usage Flow

1. Open `index.md` → follow "Start Here" section.
2. Read modules sequentially on first exposure: 01 → 05 (core), then 06–09 as needed (09 introduces multi-agent orchestration).
3. While building an agent:
   - Map phases using 01 + 02
   - Establish working file contract via 03
   - Plan depth model via 04
   - Enforce tool orchestration via 05
   - Select mode template via 06
   - Insert QA gates via 07
   - Log changes via 08 (RFC if structural)
   - Implement delegation / specialization via 09 (if multi-agent)
4. Archive folder = historical context ONLY (never a design source of truth).

---

## ✍️ When to Add / Modify

Create or modify blueprint content ONLY when:
- ✅ A NEW reusable pattern is validated (repeatable & generalizable)
- ✅ A lifecycle phase changes materially
- ✅ Tool orchestration contract expands (new mandatory tool or sequencing rule)
- ✅ Verification / gate model evolves
- ✅ Governance process (RFC, versioning) updates

Do NOT add for:
- ❌ One-off fix logs (archive instead)
- ❌ Temporary mitigations without proven generality
- ❌ Redundant restatements of existing modules
- ❌ Cosmetic reformatting (submit as PATCH inside module)

---

## 📝 Module Standards (REQUIRED)

Every new document MUST include:

### 1. **Header Block**
```markdown
# [Title]

**Date**: YYYY-MM-DD
**Topics**: [topic1, topic2, topic3]
**Status**: [active | superseded | archived]
**Related Docs**: [links to related documentation]
```

### 2. **Executive Summary**
- 2-3 sentence overview of the problem/solution
- Clear statement of impact
- Key takeaway

### 3. **Problem-Solution (ONLY for new module or MAJOR change)**
- **The Problem**: What was broken? What was the user impact?
- **Root Cause**: Why did it happen? What was the underlying issue?
- **The Solution**: What was changed? How does it work now?
- **Verification**: How do we know it's fixed?

### 4. **Concrete Examples / Patterns**
- ❌ **DON'T**: Write vague prose like "Agent should execute tools properly"
- ✅ **DO**: Show before/after code blocks, screenshots, or tool call sequences

### 5. **Lessons / Extension Notes**
- Extractable patterns that apply to other scenarios
- What would you do differently next time?
- What should future agents watch out for?

---

## 🗂️ File Organization Rules

### **Active vs Archive**
- `blueprint/` = authoritative
- `archive/` = historical ONLY
   - NEVER modify archived content retroactively
   - Add an RFC link when archiving due to replacement

### **Numbered Prefixes (Active Modules)**
01–09 reserved for core blueprint. Extended modules MUST start at 10+.

### **Filenames**
Use clear, searchable names:
- ✅ `working-file-iteration-fix.md`
- ✅ `silent-mode-complete-removal.md`
- ❌ `fix.md`
- ❌ `update-2025-10-04.md`

---

## 🔄 Updating the Index (CRITICAL)

**Every time you add, move, or delete a document, you MUST update `docs/agent-development/index.md`**:

### When Adding a Module:
1. Add entry to the appropriate topic table with:
   - Number (if chronological)
   - Document link
   - Date
   - Topic tags
   - Summary
2. Add topic tags to "Quick Reference by Topic Tag" section
3. Update "Last Updated" date at top of index
4. Update directory structure tree if needed

### When Renaming:
1. Update all links in the index
2. Check for cross-references in other documents
3. Update directory structure tree

### When Archiving (Superseded):
1. Move document to `archive/` subfolder
2. Add note in index explaining why archived
3. Keep link for historical reference

---

## 🔗 Cross-Referencing

When documents reference each other:
- Use relative links (example): `[Agent Design Principles](../../docs/agent-development/blueprint/01-agent-design-principles.md)`
- Always include context: "As documented in [Module 03], we standardized the working file contract..."
- After moves/renames, re-validate all links

---

## 🚫 Exclusions

This directory is NOT for:
- ❌ User-facing tutorials or guides → Use `docs/` root or `docs/tutorials/`
- ❌ API documentation → Use `docs/api/`
- ❌ Project planning documents → Use `specs/` or `docs/planning/`
- ❌ Meeting notes or general discussions → Use `docs/meetings/` or similar
- ❌ Temporary scratch files → Use `.temp/` folders or local workspace

---

## 🎯 Key Principles (Reinforced)

### 1. **Documentation is for Future You (and Future Agents)**
Write as if you're explaining to someone who will encounter the same problem in 6 months.

### 2. **Lessons Learned are Gold**
The "why" is often more valuable than the "what". Explain your reasoning.

### 3. **Show, Don't Tell**
Concrete examples > Vague descriptions

### 4. **Keep It Organized**
An outdated or messy docs folder is worse than no docs folder. Maintain the index.

### 5. **Search-Friendly**
Use topic tags, clear filenames, and consistent terminology so future agents can find what they need.

---

## 📊 Module Submission Checklist

Before finalizing new documentation, verify:

- [ ] **Header block complete** (Date, Topics, Status, Related Docs)
- [ ] **Executive summary provided** (2-3 sentences)
- [ ] **Problem clearly stated** (What was broken?)
- [ ] **Root cause explained** (Why did it happen?)
- [ ] **Solution documented** (What was changed?)
- [ ] **Examples included** (Before/after code, tool calls, etc.)
- [ ] **Lessons learned extracted** (Patterns for future use)
- [ ] **Index.md updated** (Table entry, topic tags, date, structure tree)
- [ ] **Filename descriptive** (Clear, searchable, follows conventions)
- [ ] **Links verified** (Cross-references work, no broken links)

---

## 🛠 Example Workflow (Adding New Module 10)

**Scenario**: You just fixed a bug where agents were creating files in the wrong location.

1. **Create the document**:
   ```
   docs/agent-development/file-system-fixes/01-incorrect-file-paths.md
   ```

2. **Follow the template**:
   ```markdown
   # Incorrect File Path Resolution Fix
   
   **Date**: 2025-10-06
   **Topics**: [file-system, path-resolution, debugging]
   **Status**: active
   **Related Docs**: [Working File Iteration Fix](../../docs/agent-development/archive/chatmode-enhancements/03-working-file-iteration-fix.md)
   
   ## Executive Summary
   Agents were creating files in workspace root instead of target directories due to relative path interpretation. Fixed by enforcing absolute path validation.
   
   ## The Problem
   [Detailed explanation with examples]
   
   ## Root Cause
   [Why it happened]
   
   ## The Solution
   [What was changed]
   
   ## Lessons Learned
   - Always use absolute paths for file operations
   - Add path validation before file creation
   - Test with different workspace structures
   ```

3. **Update the index**:
   - Add to topic table
   - Add topic tags
   - Update date
   - Update structure tree

4. **Verify**:
   - Read through once as if you're a new agent
   - Check all links work
   - Ensure examples are clear

---

## 🔧 Maintenance & Governance Cadence

- **Weekly**: Review index for broken links
- **Monthly**: Check for outdated documentation (mark as superseded if needed)
- **Quarterly**: Review lessons learned, consolidate common patterns into higher-level guides

---

**Remember**: The blueprint is a living contract. Optimize for clarity, enforceability, and reproducibility—avoid nostalgia.
