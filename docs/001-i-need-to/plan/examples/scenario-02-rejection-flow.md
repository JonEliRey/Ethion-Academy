# Scenario 2: Rejection Flow (Rework Loop)

## Overview
Demonstrates what happens when content doesn't meet quality standards and requires revision.

**Agents Involved**: Content Strategist → SME → Content Strategist (revision) → SME → Executive Producer  
**Duration**: ~4 hours agent time (including rework)  
**Outcome**: Rejected pillar revised and ultimately approved

---

## Initial Proposal

### Step 1: Content Strategist Proposes Pillar
**Proposal**: "Blockchain for Data Engineering"  
**Demand Evidence**: 200 job postings (only 1 source)

### Step 2: SME Reviews and REJECTS

**Status**: NEEDS REVISION

**Issues Identified**:
1. **Insufficient Demand Evidence**: Only 1 source (200 job postings), need 3+ sources
2. **Unclear Scope**: Not clear how this differs from general blockchain content
3. **Missing Prerequisites**: No clear prerequisite identification

**Feedback to Content Strategist**:
```markdown
## 🔄 HANDOFF REQUIRED

**From**: SME  
**To**: @content-strategist  
**Reason**: Technical validation revealed insufficient demand evidence and unclear scope

### Context
Reviewed "Blockchain for Data Engineering" pillar proposal. Found issues requiring revision before approval possible.

**Critical Issues**:
1. Only 1 demand source provided (200 job postings) - need 3+ sources per standards
2. Scope unclear: What makes this "for data engineering" vs general blockchain?
3. Missing prerequisite analysis

### What Content Strategist Should Do
1. Add 2+ additional demand sources (industry reports, community signals, search trends)
2. Clarify scope: What's included vs. excluded? How does this relate to existing pillars?
3. Identify prerequisites explicitly
4. Re-submit for validation

### Success Criteria
- [ ] 3+ demand sources documented
- [ ] Scope includes "Included" and "Excluded" subsections
- [ ] Prerequisites listed

**Executive Producer**: Please switch to `@content-strategist` with attached feedback for revision.
```

---

## Revision Cycle

### Step 3: Content Strategist Revises
**Duration**: ~2 hours

**Actions**:
1. Adds demand sources:
   - Google Trends: "blockchain data engineering" search volume
   - Reddit r/dataengineering: Community discussions about blockchain data sources
   - Gartner report: Blockchain for data provenance
   
2. Clarifies scope:
   ```markdown
   **Included**: Using blockchain as data source (indexing events, smart contract data)
   **Excluded**: Smart contract development, cryptocurrency trading
   ```

3. Identifies prerequisites: "Distributed systems fundamentals", "API integration", "Python"

### Step 4: Re-submit to SME
**Handoff**: Content Strategist → SME with revised proposal

### Step 5: SME Re-validates
**Status**: APPROVED

**Validation Report**:
```markdown
## Validation Report (v2): Blockchain for Data Engineering

**Status**: APPROVED  
**Changes from v1**:
- Added 2 demand sources (Google Trends, Gartner report)
- Clarified scope (blockchain as data source, not development)
- Prerequisites explicitly identified

**Technical Accuracy**: ✓ Verified  
**Scope**: ✓ Clear boundaries  
**Prerequisites**: ✓ Complete  

**Recommendation**: APPROVED - Ready for Executive Producer final decision
```

### Step 6: Executive Producer Approves
**Decision**: APPROVED (after revision)  
**Time**: ~5 minutes

---

## Outcome

✅ **Pillar Approved After Revision**:
- Initial rejection prompted improvements
- Revised proposal met all quality standards
- Total time: +2 hours for rework cycle (vs immediate approval)

**Lessons Learned**:
- Insufficient evidence causes rejection
- Clear scope boundaries are critical
- Rework loops catch quality issues early

---

*See scenario-01-create-pillar.md for successful approval without revision*
