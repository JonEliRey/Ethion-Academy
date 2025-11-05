---
description: 'Content file frontmatter and formatting standards'
applyTo: 'content-inventory/**/*.md, templates/**/*.md, docs/**/*.md'
---

# Content Standards

This custom instruction defines frontmatter schemas, tagging conventions, and formatting standards for all content files in the Super-Intelligent Course Designer system.

---

## Frontmatter Schema

All content files MUST include YAML frontmatter matching their content level (Pillar, Learning Path, Course, Module, Lesson).

### Pillar Frontmatter

```yaml
---
name: "[PILLAR NAME]"
description: "[1-2 SENTENCE DESCRIPTION]"
status: "proposed | approved | active | archived"
approved_at: "YYYY-MM-DD | null"
tags:
  topic: "[PRIMARY TOPIC]"
  level: "[TARGET LEVEL]"
  role: "[PRIMARY ROLE]"
---
```

**Required Fields**:
- `name` (string): Pillar name (e.g., "DataOps Engineering")
- `description` (string): Brief 1-2 sentence description
- `status` (enum): proposed, approved, active, archived
- `approved_at` (date | null): ISO 8601 date or null
- `tags` (object): Categorization metadata
  - `topic` (string): Primary subject area
  - `level` (string): Target experience level
  - `role` (string): Primary audience role

**Example**:
```yaml
---
name: "DataOps Engineering"
description: "Modern data pipeline orchestration, quality assurance, and operational excellence for data engineering teams"
status: "approved"
approved_at: "2025-01-15"
tags:
  topic: "data-engineering"
  level: "intermediate"
  role: "data-engineer"
---
```

---

### Learning Path Frontmatter

```yaml
---
pillar_id: "[PILLAR_ID]"
name: "[LEARNING PATH NAME]"
description: "[2-3 SENTENCE DESCRIPTION]"
target_audience:
  role: "[PRIMARY ROLE]"
  level: "[EXPERIENCE LEVEL]"
  context: "[LEARNER CONTEXT]"
prerequisites:
  - "[PREREQUISITE 1]"
  - "[PREREQUISITE 2]"
status: "draft | in-review | approved | published | archived"
tags:
  - "[TAG 1]"
  - "[TAG 2]"
estimated_duration: "[TOTAL HOURS]"
---
```

**Required Fields**:
- `pillar_id` (string): References parent pillar (e.g., "pillar-dataops-engineering")
- `name` (string): Learning path name
- `description` (string): 2-3 sentence description of what learners will achieve
- `target_audience` (object):
  - `role` (string): Primary role (data-engineer, ml-engineer, analyst, etc.)
  - `level` (string): Experience level (beginner, intermediate, advanced, expert)
  - `context` (string): Additional learner context
- `prerequisites` (array): List of required prior knowledge
- `status` (enum): draft, in-review, approved, published, archived
- `tags` (array): Relevant tags for categorization
- `estimated_duration` (string): Total time commitment (e.g., "12-15 hours")

**Example**:
```yaml
---
pillar_id: "pillar-dataops-engineering"
name: "Data Pipeline Orchestration with Apache Airflow"
description: "Master Apache Airflow for production-grade data pipelines. Build, deploy, and monitor workflows handling complex dependencies and data quality checks"
target_audience:
  role: "data-engineer"
  level: "intermediate"
  context: "Has Python experience, familiar with SQL, new to workflow orchestration"
prerequisites:
  - "Python programming fundamentals"
  - "SQL query writing and database basics"
  - "Basic understanding of data pipelines"
status: "approved"
tags:
  - "airflow"
  - "workflow-orchestration"
  - "data-engineering"
estimated_duration: "12-15 hours"
---
```

---

### Course Frontmatter

```yaml
---
path_id: "[LEARNING_PATH_ID]"
name: "[COURSE NAME]"
description: "[2-3 SENTENCE DESCRIPTION]"
outcomes:
  - "[OUTCOME 1]"
  - "[OUTCOME 2]"
  - "[OUTCOME 3]"
assessment_strategy: "[HOW MASTERY IS MEASURED]"
status: "draft | in-review | approved | published | archived"
tags:
  - "[TAG 1]"
  - "[TAG 2]"
estimated_duration: "[HOURS]"
prerequisites:
  - "[PREREQUISITE 1]"
---
```

**Required Fields**:
- `path_id` (string): References parent learning path
- `name` (string): Course name
- `description` (string): What learners will master
- `outcomes` (array): Specific, measurable learning outcomes
- `assessment_strategy` (string): How mastery is measured
- `status` (enum): draft, in-review, approved, published, archived
- `tags` (array): Relevant categorization tags
- `estimated_duration` (string): Course time commitment
- `prerequisites` (array): Required prior knowledge

**Example**:
```yaml
---
path_id: "path-airflow-orchestration"
name: "Airflow DAG Development Fundamentals"
description: "Learn to design, build, and debug Apache Airflow DAGs. Master operators, task dependencies, and workflow patterns for production data pipelines"
outcomes:
  - "Build DAGs with 5+ tasks using Python decorators"
  - "Configure task retries, timeouts, and SLAs"
  - "Debug failed tasks using Airflow UI and logs"
  - "Apply workflow patterns (sequential, parallel, branching)"
assessment_strategy: "Hands-on project building 3 production-grade DAGs + quiz on best practices"
status: "approved"
tags:
  - "airflow"
  - "dag-development"
  - "python"
estimated_duration: "4-5 hours"
prerequisites:
  - "Python functions and decorators"
  - "Basic understanding of workflow automation"
---
```

---

### Module Frontmatter

```yaml
---
course_id: "[COURSE_ID]"
name: "[MODULE NAME]"
description: "[1-2 SENTENCE DESCRIPTION]"
topics:
  - "[TOPIC 1]"
  - "[TOPIC 2]"
  - "[TOPIC 3]"
status: "draft | in-review | approved | published | archived"
tags:
  - "[TAG 1]"
  - "[TAG 2]"
estimated_duration: "[HOURS]"
---
```

**Required Fields**:
- `course_id` (string): References parent course
- `name` (string): Module name
- `description` (string): Brief description of module focus
- `topics` (array): Key topics covered
- `status` (enum): draft, in-review, approved, published, archived
- `tags` (array): Categorization tags
- `estimated_duration` (string): Module time commitment

**Example**:
```yaml
---
course_id: "course-airflow-dag-development"
name: "Task Dependencies and Execution Flow"
description: "Master Airflow's task dependency operators and execution patterns. Build complex workflows with sequential, parallel, and conditional task flows"
topics:
  - "upstream/downstream dependencies"
  - "cross_downstream and chain operators"
  - "branching with BranchPythonOperator"
  - "dynamic task generation"
status: "approved"
tags:
  - "airflow"
  - "task-dependencies"
  - "workflow-patterns"
estimated_duration: "1.5-2 hours"
---
```

---

### Lesson Frontmatter

```yaml
---
module_id: "[MODULE_ID]"
name: "[LESSON NAME]"
objectives:
  - "[OBJECTIVE 1]"
  - "[OBJECTIVE 2]"
  - "[OBJECTIVE 3]"
prerequisites:
  - "[PREREQUISITE 1]"
  - "[PREREQUISITE 2]"
status: "draft | in-review | approved | published | archived"
tags:
  - "[TAG 1]"
  - "[TAG 2]"
estimated_duration: "[MINUTES]"
---
```

**Required Fields**:
- `module_id` (string): References parent module
- `name` (string): Lesson name
- `objectives` (array): Specific skills learners will gain
- `prerequisites` (array): Required knowledge before starting
- `status` (enum): draft, in-review, approved, published, archived
- `tags` (array): Categorization tags
- `estimated_duration` (string): Lesson time commitment

**Example**:
```yaml
---
module_id: "module-task-dependencies"
name: "Implementing Branching Logic with BranchPythonOperator"
objectives:
  - "Configure BranchPythonOperator to route workflows based on runtime conditions"
  - "Implement try/except branching for error handling"
  - "Build self-healing DAGs that route to recovery tasks on failure"
prerequisites:
  - "Understanding of Airflow task dependencies"
  - "Python conditional logic (if/else)"
status: "approved"
tags:
  - "airflow"
  - "branching"
  - "conditional-logic"
estimated_duration: "25-30 minutes"
---
```

---

## Tagging Conventions

Use **canonical tag values** to ensure consistency and enable accurate filtering/search.

### Tag Categories

#### 1. Role Tags
Audience personas who will use this content:

**Values**:
- `developer` - Software developers, engineers
- `data-engineer` - Data pipeline engineers
- `ml-engineer` - Machine learning engineers
- `analyst` - Business analysts, data analysts
- `architect` - Solution architects, system designers
- `manager` - Engineering managers, team leads
- `executive` - C-level, directors, VPs

**Example**: `role: ["data-engineer", "ml-engineer"]`

---

#### 2. Level Tags
Experience level required:

**Values**:
- `beginner` - New to the topic, limited experience
- `intermediate` - 1-3 years experience, understands fundamentals
- `advanced` - 3-5+ years experience, seeking optimization/mastery
- `expert` - 5+ years, deep specialization, teaching others

**Example**: `level: "intermediate"`

---

#### 3. Topic Tags
Subject areas covered:

**Values** (examples - extend as needed):
- `data-engineering`
- `machine-learning`
- `cloud-architecture`
- `devops`
- `workflow-orchestration`
- `data-quality`
- `monitoring-observability`
- `security`

**Example**: `topic: "workflow-orchestration"`

---

#### 4. Format Tags
Content delivery format:

**Values**:
- `video` - YouTube video, recorded tutorial
- `blog` - Written blog post
- `lesson` - Academy lesson (video + exercises)
- `course` - Full Academy course
- `workshop` - Live or recorded workshop
- `article` - In-depth written article

**Example**: `format: "video"`

---

#### 5. Source Type Tags
Origin of content:

**Values**:
- `official` - Official vendor/project documentation
- `original` - Created by our team
- `community` - Community tutorials, guides
- `partner` - Partner-created content
- `curated` - Curated external content

**Example**: `source_type: "original"`

---

#### 6. Tech Stack Tags
Tools, platforms, frameworks covered:

**Values** (examples - extend as needed):
- `airflow`
- `dbt`
- `python`
- `sql`
- `azure`
- `aws`
- `gcp`
- `kubernetes`
- `docker`
- `terraform`

**Example**: `tech_stack: ["airflow", "python"]`

---

## Directory Structure Rules

Content files are organized hierarchically to reflect learning progression.

### Hierarchical Structure

```
content-inventory/
├── pillars/
│   └── {pillar-name}/
│       ├── README.md
│       ├── pillar-{pillar-name}.md
│       └── learning-paths/
│           └── {path-name}/
│               ├── README.md
│               ├── path-{path-name}.md
│               └── courses/
│                   └── {course-name}/
│                       ├── README.md
│                       ├── course-{course-name}.md
│                       └── modules/
│                           └── {module-name}/
│                               ├── README.md
│                               ├── module-{module-name}.md
│                               └── lessons/
│                                   └── lesson-{lesson-name}.md
```

### README Files
Every directory level MUST include a `README.md` summarizing:
- What this level contains
- Relationship to parent/child levels
- Navigation links to child content

**Example - `pillars/dataops-engineering/README.md`**:
```markdown
# DataOps Engineering Pillar

## Overview
Modern data pipeline orchestration, quality assurance, and operational excellence for data engineering teams.

## Learning Paths
1. [Data Pipeline Orchestration with Apache Airflow](learning-paths/airflow-orchestration/)
2. [Data Quality Engineering with Great Expectations](learning-paths/data-quality/)
3. [Monitoring and Observability for Data Pipelines](learning-paths/monitoring/)

## Status
- **Status**: Approved
- **Target Audience**: Data Engineers (Intermediate level)
- **Approved**: 2025-01-15
```

---

## Status Values

All content files use standard status values to track content lifecycle.

### Valid Status Values

1. **draft** - Initial creation, work in progress
2. **in-review** - Ready for quality review (SME, Editor, QA)
3. **approved** - Reviewed and approved, ready for production
4. **published** - Live and accessible to learners
5. **needs-update** - Flagged by Monitoring Specialist for updates
6. **deprecated** - No longer actively maintained, archived

### Status Transitions

```
draft → in-review → approved → published
                                   ↓
                            needs-update → in-review (revision cycle)
                                   ↓
                              deprecated
```

---

## Plain Language Guidelines

All content should be accessible, clear, and learner-friendly.

### Avoid Jargon
❌ **BAD**: "Leverage the DAG's idempotent task semantics for upsert operations"  
✅ **GOOD**: "Use Airflow tasks that can run multiple times safely, updating existing data instead of duplicating it"

### Define Acronyms on First Use
❌ **BAD**: "Configure your DAG with an SLA"  
✅ **GOOD**: "Configure your DAG with an SLA (Service Level Agreement) - a maximum time limit for task completion"

### Use Analogies
❌ **BAD**: "Airflow uses directed acyclic graphs"  
✅ **GOOD**: "Airflow workflows are like flowcharts: tasks flow in one direction, and you can't create circular loops"

### Include "Why It Matters" Sections
Every major concept should explain practical value:

**Example**:
```markdown
## Task Dependencies

### What It Is
Task dependencies define the order in which Airflow executes tasks.

### Why It Matters
Real-world data pipelines often have complex sequencing requirements:
- Data extraction must finish before transformation starts
- Quality checks must pass before loading data to production
- Notifications should only send after all steps succeed

Without proper dependencies, your pipeline risks processing incomplete data or failing silently.
```

---

## Quality Checklist

Before marking content as "in-review", verify:

### Frontmatter Validation
- [ ] All required fields present
- [ ] Status value is valid (draft, in-review, approved, published, needs-update, deprecated)
- [ ] Tags use canonical values from this document
- [ ] Prerequisites accurately reflect required knowledge
- [ ] Duration estimate is realistic

### Content Quality
- [ ] Learning objectives are specific and measurable
- [ ] Code examples are tested and functional
- [ ] Sources are current (checked within 3-6 months)
- [ ] Plain language guidelines followed
- [ ] "Leader's Lens" section provides business context (for Lessons)

### Structural Integrity
- [ ] File naming follows conventions (kebab-case)
- [ ] File located in correct directory hierarchy
- [ ] README file exists in parent directory
- [ ] Cross-references to related content are accurate

---

## Related Instructions

- **Global Standards**: See `.github/instructions/global-standards.instructions.md` for project-wide conventions
- **Handoff Protocol**: See `.github/instructions/handoff-protocol.instructions.md` for agent transition rules

---

*Last Updated*: 2025-01-15  
*Applies To*: All content files (`content-inventory/**/*.md`, `templates/**/*.md`, `docs/**/*.md`)  
*Version*: 1.0.0
```
