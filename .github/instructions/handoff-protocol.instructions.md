---
description: 'Agent handoff message format and transition rules'
applyTo: '**/*.md'
---

# Handoff Protocol

This custom instruction defines the standard format for agent-to-agent handoffs, context passing requirements, and state transition rules for the Super-Intelligent Course Designer system.

---

## Handoff Message Template

All agent handoffs MUST use this exact structure with ALL 9 components.

### Template Structure

```markdown
## 🔄 HANDOFF REQUIRED

**From**: [Source Agent Name]  
**To**: @[target-agent-name]  
**Reason**: [Why this handoff is needed - 1 sentence]

### Context
[2-4 paragraphs summarizing:
- What work has been completed
- Key decisions made
- Current state of deliverables
- Any open questions or concerns]

### Deliverables Attached
- [File 1 name/path] - [Brief description]
- [File 2 name/path] - [Brief description]
- [Link to resource] - [Brief description]

### What [Target Agent] Should Do
1. [Specific task 1]
2. [Specific task 2]
3. [Specific task 3]
[Clear, actionable tasks the target agent must perform]

### Expected Output
- [Deliverable 1] OR [Alternative outcome]
- [Deliverable 2] if [condition]

[Be specific about what the target agent should produce]

### Success Criteria
- [ ] [Criterion 1 - How to verify quality]
- [ ] [Criterion 2 - What constitutes completion]
- [ ] [Criterion 3 - Decision or approval threshold]

[Clear, measurable indicators of successful completion]

**Executive Producer**: Please switch to `@target-agent-name` and provide the attached [deliverable(s)] for [specific action].
```

---

## 9 Required Components

Every handoff message MUST include ALL of these components:

### 1. From Agent
Source agent name (who is initiating the handoff).

**Example**: `**From**: Content Strategist`

---

### 2. To Agent
Target agent name with `@mention` syntax for VS Code chat.

**Example**: `**To**: @sme`

---

### 3. Reason
One-sentence explanation of why the handoff is needed.

**Example**: `**Reason**: Technical validation needed for proposed DataOps pillar scope`

---

### 4. Context Summary
2-4 paragraphs explaining:
- Work completed so far
- Key decisions made
- Current state of deliverables
- Open questions or concerns

**Example**:
```markdown
### Context
Completed demand analysis for "DataOps Engineering" pillar. Identified strong market demand based on:
- 1,500+ job postings requiring Apache Airflow, dbt, and data quality tools
- 40% YoY growth in "DataOps" keyword searches
- 3 major industry reports highlighting data pipeline automation as top priority

Proposed scope includes 5 learning paths:
1. Pipeline Orchestration (Airflow, Dagster)
2. Data Testing & Quality (Great Expectations, dbt tests)
3. Observability & Monitoring (OpenTelemetry, Datadog)
4. CI/CD for Data Pipelines (GitHub Actions, GitLab CI)
5. Incident Management (Alerting, on-call playbooks)

Need technical validation to ensure scope is accurate, complete, and appropriately sequenced.
```

---

### 5. Deliverables Attached
List of files, links, or content being passed to the target agent.

**Example**:
```markdown
### Deliverables Attached
- `pillar-dataops-engineering-draft.md` (proposed pillar content with scope, audience, outcomes)
- Demand analysis spreadsheet (1,500 job posting data samples)
- Market research notes (3 industry reports summarized)
```

---

### 6. What Target Should Do
Specific, actionable tasks for the receiving agent. Use numbered lists for clarity.

**Example**:
```markdown
### What SME Should Do
1. Validate technical accuracy of proposed 5 learning paths
2. Identify prerequisites for each learning path (e.g., "Pipeline Orchestration requires Python + SQL basics")
3. Suggest 2-3 authoritative sources per learning path (official docs, community standards)
4. Flag any missing critical topics (e.g., "Should include data versioning with lakeFS")
5. Verify technology choices align with current industry best practices
```

---

### 7. Expected Output
Clear description of what the target agent should produce. Include conditional outcomes if applicable.

**Example**:
```markdown
### Expected Output
- **Approved scope** with prerequisites identified and sources listed OR
- **Feedback for revision** with specific technical concerns noted and alternative suggestions

If approved: Include recommendation for which learning path to develop first
If feedback: Prioritize concerns by impact (critical vs. nice-to-have)
```

---

### 8. Success Criteria
Measurable indicators of successful completion. Use checkboxes for clarity.

**Example**:
```markdown
### Success Criteria
- [ ] All technical concepts accurately described (no incorrect terminology)
- [ ] Prerequisites correctly sequenced (foundational skills before advanced)
- [ ] Source materials are current (published/updated within 12 months)
- [ ] Scope aligns with industry best practices (validated against 2+ authoritative sources)
- [ ] Missing critical topics identified (if any)
```

---

### 9. Executive Producer Instruction
Explicit instruction for the human (Executive Producer) to switch chat modes.

**Example**:
```markdown
**Executive Producer**: Please switch to `@sme` and provide the attached `pillar-dataops-engineering-draft.md` for technical review.
```

---

## Context Passing Requirements

When handing off work to another agent, you MUST include sufficient context for the receiving agent to continue without asking clarifying questions.

### Include All Relevant Work Artifacts
- Markdown files created or modified
- Database entries (IDs, names, statuses)
- Links to external resources used
- Screenshots or diagrams (if applicable)

### Summarize Decisions Made
Explain **why** you made specific choices:

❌ **BAD**: "I created a pillar for DataOps."  
✅ **GOOD**: "I created a DataOps pillar because job market data shows 1,500+ postings requiring Airflow/dbt skills, and industry reports rank data pipeline automation as a top 2025 priority."

### Highlight Open Questions
Flag ambiguities that need resolution:

**Example**:
```markdown
### Open Questions
1. Should the observability learning path cover commercial tools (Datadog, New Relic) or only open-source (OpenTelemetry, Prometheus)?
   - **Impact**: Affects tool selection and examples
   - **Recommendation**: Start with open-source, add commercial in advanced lessons

2. Is Dagster mature enough to include alongside Airflow, or wait 6 months?
   - **Impact**: May date content quickly if Dagster ecosystem changes
   - **Recommendation**: SME should assess current Dagster adoption and stability
```

### Attach Supporting Files/Links
Provide direct access to resources:

```markdown
### Deliverables Attached
- `pillar-dataops-engineering-draft.md` (in `content-inventory/pillars/dataops-engineering/`)
- Job posting data: [Google Sheets link]
- Industry report: "State of DataOps 2024" - https://example.com/report
- Competitor analysis: LinkedIn Learning "Data Engineering" path
```

---

## Return-to-Human Conditions

Agents should hand back to the Executive Producer (human) when:

### 1. Ambiguity Requiring Judgment Call
The agent encounters a decision that requires human context or strategic direction.

**Example**:
```markdown
## 🔄 HANDOFF TO EXECUTIVE PRODUCER

**From**: Content Strategist  
**To**: Executive Producer (human)  
**Reason**: Strategic decision needed on content focus

### Context
Two competing demand signals detected:
1. **Cloud Data Warehouses** (Snowflake, BigQuery) - 2,000+ job postings
2. **Real-Time Streaming** (Kafka, Flink) - 1,200+ job postings

Both are strong candidates for next pillar. Need strategic direction on which aligns better with:
- Current audience profile (60% work with batch pipelines, 40% streaming)
- Business goals (maximize paid subscribers or maximize YouTube reach?)

### Question for Executive Producer
Which should we prioritize for next pillar development?

**Option A**: Cloud Data Warehouses (broader audience, higher SEO volume)  
**Option B**: Real-Time Streaming (deeper specialization, higher paid conversion rate)

Please advise on strategic priority.
```

---

### 2. Approval Checkpoint Reached
The agent has completed deliverables requiring executive decision (approve/reject/revise).

**Example**:
```markdown
## 🔄 APPROVAL CHECKPOINT

**From**: SME  
**To**: Executive Producer (human)  
**Reason**: Pillar scope validated and ready for approval

### Context
Completed technical validation of "DataOps Engineering" pillar. All technical concepts accurate, prerequisites correctly identified, sources current and authoritative.

### Recommendation
**APPROVE** - Pillar is ready for content development with following priority:
1. Start with "Pipeline Orchestration with Airflow" (highest demand)
2. Follow with "Data Quality Engineering" (complementary skill)
3. Defer "CI/CD for Data Pipelines" until first two paths complete

### Decision Options
- **Approve**: Proceed with pillar and prioritized learning path development
- **Revise**: Provide feedback on specific concerns (scope, priority, sources)
- **Reject**: Explain reasoning and suggest alternative direction

**Executive Producer**: Please review and decide on pillar approval.
```

---

### 3. Error Condition Requiring Intervention
The agent encounters a technical error or blockerwhich it cannot resolve.

**Example**:
```markdown
## 🔄 ERROR - HUMAN INTERVENTION NEEDED

**From**: Librarian  
**To**: Executive Producer (human)  
**Reason**: Database write operation failed

### Error Details
Attempted to catalog approved pillar "DataOps Engineering" to database.  
**Error**: `FOREIGN KEY constraint failed - pillar_id does not exist`

### Diagnosis
The pillar record was not created in the database before attempting to create related learning path records.

### Recommended Resolution
1. Verify database schema is up-to-date: `pwsh scripts/init-database.ps1`
2. Manually insert pillar record: 
   ```sql
   INSERT INTO Pillar (id, name, description, status, approved_at)
   VALUES ('pillar-dataops', 'DataOps Engineering', '...', 'approved', '2025-01-15');
   ```
3. Retry cataloging operation

**Executive Producer**: Please resolve database issue and re-initiate `@librarian` to catalog content.
```

---

### 4. Explicit Request for Feedback
The agent completes a deliverable and explicitly asks for human review before proceeding.

**Example**:
```markdown
## 🔄 FEEDBACK REQUESTED

**From**: Scriptwriter  
**To**: Executive Producer (human)  
**Reason**: First lesson script draft ready for review

### Context
Completed first lesson script for "Implementing Branching Logic with BranchPythonOperator". This is the first lesson in the entire content library, setting the tone and format for all future lessons.

### Deliverables
- `lesson-branching-logic-script.md` (full lesson outline with code examples)
- Sample code: `airflow-branching-example.py` (tested and working)

### Feedback Needed
Before proceeding with remaining 20+ lessons, please review:
1. Is the script depth appropriate (25 minutes of content)?
2. Does the "Leader's Lens" section provide sufficient business context?
3. Are code examples clear and well-commented?
4. Is the practice exercise appropriately challenging?

**Executive Producer**: Please review and provide feedback or approval to proceed with remaining lessons using this format.
```

---

## Approval Checkpoint Format

When handing work to the Executive Producer for approval, use this structure:

### Template

```markdown
## 🔄 APPROVAL CHECKPOINT

**From**: [Agent Name]  
**To**: Executive Producer (human)  
**Reason**: [Content item] ready for decision

### Content Summary
[Brief summary of what was created/validated]

### Analysis
**Pros**:
- [Strength 1]
- [Strength 2]
- [Strength 3]

**Cons** (if any):
- [Concern 1 and mitigation]
- [Concern 2 and mitigation]

### Recommendation
[Agent's recommendation: APPROVE, REVISE, or REJECT with clear rationale]

### Decision Options
- **Approve**: [What happens next if approved]
- **Revise**: [What aspects need changes]
- **Reject**: [Alternative direction if rejected]

**Executive Producer**: Please review and decide on [content item] approval.
```

### Example

```markdown
## 🔄 APPROVAL CHECKPOINT

**From**: SME  
**To**: Executive Producer (human)  
**Reason**: "Cloud Data Warehouses" pillar ready for approval

### Content Summary
Technical validation complete for "Cloud Data Warehouses" pillar covering Snowflake, BigQuery, Redshift, and Databricks SQL. 4 learning paths proposed with 12 total courses.

### Analysis
**Pros**:
- High market demand (2,000+ job postings requiring cloud DW skills)
- Clear learning progression (basics → optimization → advanced analytics)
- Strong source availability (excellent official docs from all 4 vendors)
- Synergy with existing "DataOps Engineering" pillar

**Cons**:
- Competitive landscape crowded (Udemy has 50+ Snowflake courses)
- Vendor-specific content may date quickly (new features every quarter)
- Requires cloud accounts for hands-on practice (cost for learners)

**Mitigations**:
- Differentiate with "Leader's Lens" business context (not just technical how-to)
- Focus on platform-agnostic concepts first, then vendor-specific optimizations
- Provide free-tier instructions and cost estimates upfront

### Recommendation
**APPROVE** - Strong demand signal, manageable cons, clear differentiation strategy.

Suggested priority: Start with "Snowflake Fundamentals" (highest job posting volume), then BigQuery (Google ecosystem integration).

### Decision Options
- **Approve**: Proceed with pillar creation, starting with Snowflake learning path
- **Revise**: Adjust scope (e.g., remove one vendor, add cost-comparison section)
- **Reject**: Explain concerns and suggest alternative pillar focus

**Executive Producer**: Please review and decide on "Cloud Data Warehouses" pillar approval.
```

---

## State Transitions

Valid agent-to-agent handoff sequences.

### Common Valid Sequences

1. **Content Strategist → SME → Executive Producer (Approval) → Librarian**
   - Pillar proposal → Technical validation → Human approval → Catalog in database

2. **Scriptwriter → Editor → Scriptwriter (Revision)**
   - Lesson draft → Quality review → Incorporate feedback

3. **Community Manager → SEO Lead → Editor → Scriptwriter (Optimization)**
   - Engagement analysis → SEO recommendations → Content refinement → Script updates

4. **Monitoring Specialist → SME → Content Strategist → Scriptwriter (Update Cycle)**
   - Outdated content detected → Technical re-validation → Scope adjustment → Script update

### Forbidden Transitions

❌ **Librarian → Content Strategist** (Librarian should not propose new content)  
❌ **Community Manager → SME** (Skip content validation role)  
❌ **Scriptwriter → QA Reviewer → Scriptwriter → QA Reviewer** (Infinite loop without Editor)

### Circular Handoff Detection

If an agent receives a handoff from the same agent it previously handed off to **within the same conversation session**, flag a circular dependency:

**Example**:
```markdown
## ⚠️ CIRCULAR HANDOFF DETECTED

**From**: Scriptwriter  
**To**: Executive Producer (human)  
**Reason**: Potential rework loop identified

### Situation
- **Handoff #1**: Scriptwriter → Editor (lesson draft review)
- **Handoff #2**: Editor → Scriptwriter (feedback: add more examples)
- **Handoff #3**: Scriptwriter → Editor (revised draft with examples)
- **Handoff #4**: Editor → Scriptwriter (feedback: examples too verbose)

**Circular loop detected**: Scriptwriter ↔ Editor for 2 cycles without resolution.

### Recommended Intervention
Executive Producer should review lesson with both Scriptwriter and Editor to align on:
- Target example depth (how many, how detailed?)
- Quality criteria for "good enough" (specific checklist)

**Executive Producer**: Please break the loop by providing clear direction on example requirements.
```

---

## Quality Gates

Before ANY handoff, the source agent must verify deliverables meet quality standards.

### Pre-Handoff Checklist (General)

- [ ] All deliverables mentioned in handoff message are attached or linked
- [ ] Context summary is clear and complete (no ambiguous references)
- [ ] Tasks for target agent are specific and actionable
- [ ] Success criteria are measurable
- [ ] Source agent has completed ALL tasks within their domain

### Handoff-Type-Specific Checklists

#### Content Strategist → SME (Technical Validation)
- [ ] Demand evidence includes 3+ sources (job postings, trend reports, community signals)
- [ ] Scope boundaries clearly defined (included vs. excluded topics)
- [ ] Target audience specified with role × level (e.g., "Data Engineers, Intermediate")
- [ ] Preliminary learning path outline included (at least 3 paths with course ideas)

#### SME → Executive Producer (Approval Request)
- [ ] Technical accuracy verified against official documentation
- [ ] Prerequisites correctly identified and sequenced
- [ ] Sources current (checked within 6 months for fast-moving tools, 12 months for stable)
- [ ] Missing critical topics flagged (if any)
- [ ] Recommendation clearly stated (APPROVE, REVISE, or REJECT with reasoning)

#### Scriptwriter → Editor (Content Review)
- [ ] Full lesson script complete (intro, body, practice, recap)
- [ ] Code examples tested and functional
- [ ] "Leader's Lens" section provides business context
- [ ] Citations/sources included for all claims
- [ ] Duration estimate realistic (based on content depth)

#### Editor → Community Manager (Engagement Strategy)
- [ ] Content reviewed for clarity and accuracy
- [ ] Engagement hooks identified (3+ per lesson)
- [ ] CTAs appropriate for platform (YouTube vs. Blog vs. Academy)
- [ ] SEO keywords preliminary list included

---

## Rollback Procedure

If a handoff fails quality gate checks, return to the source agent with specific feedback.

### Rollback Template

```markdown
## 🔄 HANDOFF REJECTED - QUALITY GATE FAILURE

**From**: [Target Agent]  
**To**: [Source Agent]  
**Reason**: [Specific quality issue]

### Quality Gate Failures
- [ ] ❌ [Criterion 1 not met] - [Specific issue]
- [ ] ❌ [Criterion 2 not met] - [Specific issue]
- [ ] ✅ [Criterion 3 met] - [Confirmation]

### Required Corrections
1. [Specific action to fix issue 1]
2. [Specific action to fix issue 2]

### Re-Handoff Conditions
Once corrections complete:
- [Verification method 1]
- [Verification method 2]

Please make corrections and re-initiate handoff.
```

### Example

```markdown
## 🔄 HANDOFF REJECTED - QUALITY GATE FAILURE

**From**: SME  
**To**: Content Strategist  
**Reason**: Insufficient demand evidence for proposed "Blockchain for Data Engineering" pillar

### Quality Gate Failures
- [ ] ❌ **Demand evidence** - Only 1 source provided (need 3+)
  - Provided: 200 job postings mentioning "blockchain + data"
  - Missing: Industry trend reports, community discussions, skill growth data

- [ ] ❌ **Scope boundaries** - Unclear distinction from general blockchain content
  - What makes this "for data engineering" vs. general blockchain development?
  - How does this relate to existing "DataOps Engineering" pillar?

- [ ] ✅ **Target audience** - Clearly specified (Data Engineers, Advanced level)

### Required Corrections
1. **Add 2+ additional demand sources**:
   - Check Gartner/Forrester reports for blockchain + data engineering trends
   - Search Reddit r/dataengineering and HackerNews for community signals
   - Analyze LinkedIn skill growth data for "blockchain data engineering"

2. **Clarify scope boundaries**:
   - Explicitly define: "Blockchain for data engineering focuses on using distributed ledgers as data sources (e.g., indexing blockchain events, building data pipelines from smart contracts)"
   - Explicitly exclude: General smart contract development, cryptocurrency trading

### Re-Handoff Conditions
Once corrections complete, verify:
- 3+ demand sources documented in pillar draft
- Scope section includes "Included Topics" and "Excluded Topics" subsections

Please make corrections and re-initiate handoff.
```

---

## Examples - Complete Handoff Scenarios

### Example 1: Pillar Approval Flow

```markdown
## 🔄 HANDOFF REQUIRED

**From**: Content Strategist  
**To**: @sme  
**Reason**: Technical validation needed for "Machine Learning Operations (MLOps)" pillar

### Context
Completed demand analysis for MLOps pillar targeting ML Engineers and Data Scientists transitioning to production ML systems. Market signals show strong demand:
- 1,800+ job postings requiring MLOps skills (MLflow, Kubeflow, model monitoring)
- 65% YoY growth in "MLOps" search volume (Google Trends)
- 2 major industry reports (Gartner, Databricks) rank MLOps as critical 2025 skill

Proposed scope:
1. **Model Lifecycle Management** (MLflow, Weights & Biases)
2. **Model Deployment Patterns** (Batch, real-time, edge)
3. **Model Monitoring & Observability** (Drift detection, performance tracking)
4. **ML Pipelines** (Kubeflow, Airflow for ML)
5. **Feature Stores** (Feast, Tecton)

Target audience: ML Engineers and Data Scientists (Intermediate to Advanced)

### Deliverables Attached
- `pillar-mlops-draft.md` (full pillar proposal)
- Demand analysis spreadsheet (1,800 job postings sampled)
- Competitive analysis (Coursera and Udemy MLOps courses reviewed)

### What SME Should Do
1. Validate technical accuracy of 5 learning path topics
2. Verify tool selections are current industry standards (MLflow vs. alternatives?)
3. Identify prerequisites for each learning path (e.g., "Model Monitoring requires Python + ML fundamentals")
4. Suggest 2-3 authoritative sources per learning path
5. Flag missing critical topics (e.g., "Should model explainability be separate path or integrated?")

### Expected Output
- **Approved scope** with prerequisites mapped and sources listed OR
- **Feedback for revision** with specific technical concerns and alternatives

If approved: Recommend which learning path to prioritize first

### Success Criteria
- [ ] All 5 learning path topics technically accurate
- [ ] Tool selections align with 2024-2025 industry adoption trends
- [ ] Prerequisites correctly sequenced (foundational skills before advanced)
- [ ] Sources current (official docs published/updated within 12 months)
- [ ] Critical missing topics identified (if any)

**Executive Producer**: Please switch to `@sme` and provide the attached `pillar-mlops-draft.md` for technical review.
```

---

### Example 2: Content Update Cycle

```markdown
## 🔄 HANDOFF REQUIRED

**From**: Monitoring Specialist  
**To**: @content-strategist  
**Reason**: Outdated content detected - Apache Airflow 2.8 released with breaking changes

### Context
Automated monitoring detected Airflow 2.8 release (2025-01-10) with significant changes affecting our existing content:
- **Breaking Change**: `BranchPythonOperator` API modified (new `follow_task_ids_if_true` parameter required)
- **New Feature**: Native deferrable operators for all AWS/GCP providers
- **Deprecation**: Old `SubDagOperator` fully removed

**Impact Assessment**:
- **High Impact** (requires immediate update):
  - Lesson: "Implementing Branching Logic with BranchPythonOperator" (code examples broken)
  - Course: "Airflow DAG Development" (3 lessons affected)
  
- **Medium Impact** (update within 30 days):
  - Lesson: "Building Scalable AWS Workflows" (can demonstrate new deferrable operators)

### Deliverables Attached
- Airflow 2.8 release notes: [Apache Airflow GitHub link]
- Affected content inventory: `monitoring/airflow-2.8-impact-analysis.md`
- Priority matrix: High/Medium/Low impact lessons

### What Content Strategist Should Do
1. Review impact analysis and validate priority assessment
2. Determine update strategy:
   - **Option A**: Immediate hotfix for broken code examples
   - **Option B**: Comprehensive update including new features
3. Estimate effort (hours) and timeline
4. Decide if update justifies incrementing course version (v1.0 → v1.1 or v2.0?)

### Expected Output
- **Update Plan** specifying:
  - Which lessons to update immediately vs. defer
  - Scope of updates (fix-only vs. feature additions)
  - Estimated timeline and resource allocation
  - Version increment decision

### Success Criteria
- [ ] All High Impact content flagged for immediate update
- [ ] Update scope clearly defined (what changes, what stays)
- [ ] Timeline realistic (considers Scriptwriter and Editor capacity)
- [ ] Version increment decision documented with rationale

**Executive Producer**: Please switch to `@content-strategist` and review the attached impact analysis to prioritize content updates.
```

---

### Example 3: Multi-Agent Collaboration

```markdown
## 🔄 HANDOFF REQUIRED

**From**: Editor  
**To**: @community-manager  
**Reason**: Lesson approved and ready for engagement strategy planning

### Context
Completed editorial review of "Implementing Branching Logic with BranchPythonOperator" lesson. All quality checks passed:
- Code examples tested and functional (Airflow 2.8 compatible)
- "Leader's Lens" provides clear business value (self-healing pipelines reduce on-call burden)
- Practice exercises appropriately challenging (3 branching scenarios: sequential, parallel, error-handling)
- Duration realistic (25-30 minutes including practice)

Approved for production with 2 minor edits incorporated:
1. Added diagram illustrating branching workflow (visual aid for learners)
2. Clarified error handling best practices (added "try/except is not enough" caveat)

### Deliverables Attached
- `lesson-branching-logic-final.md` (approved lesson script)
- `airflow-branching-diagram.png` (workflow visualization)
- Code samples: `airflow-branching-examples.zip` (3 working DAG files)

### What Community Manager Should Do
1. Design YouTube engagement strategy:
   - Craft 3 title options optimized for CTR
   - Write compelling description with timestamps
   - Suggest 3-5 engagement prompts for comments ("What's your most complex branching scenario?")
   
2. Plan blog cross-promotion:
   - Identify 2-3 related blog posts for internal linking
   - Suggest blog post companion ("5 Real-World Airflow Branching Patterns")
   
3. Academy integration:
   - Recommend related lessons for "Next Steps" section
   - Suggest quiz questions (5-7 questions testing comprehension)

### Expected Output
- **YouTube Strategy Document**:
  - 3 title options (with CTR reasoning)
  - Video description (with keywords and timestamps)
  - Thumbnail concept
  - 5 comment prompts
  
- **Blog Cross-Promotion Plan**:
  - Internal links to add
  - Companion blog post outline
  
- **Academy Integration Plan**:
  - Related lesson recommendations
  - Quiz questions (5-7 with answers)

### Success Criteria
- [ ] YouTube titles follow best practices (curiosity gap, keyword inclusion, <60 chars)
- [ ] Video description includes SEO keywords naturally (no keyword stuffing)
- [ ] Engagement prompts spark discussion (open-ended questions)
- [ ] Internal links relevant and add value (not just for SEO)
- [ ] Quiz questions test understanding (not just memorization)

**Executive Producer**: Please switch to `@community-manager` and use the attached final lesson script to create engagement strategy.
```

---

## Related Instructions

- **Global Standards**: See `.github/instructions/global-standards.instructions.md` for project-wide conventions
- **Content Standards**: See `.github/instructions/content-standards.instructions.md` for frontmatter schemas and formatting rules

---

*Last Updated*: 2025-01-15  
*Applies To*: All agent-to-agent handoffs (`**/*.md`)  
*Version*: 1.0.0
```
