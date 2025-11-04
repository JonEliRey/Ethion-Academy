---
description: 'Content file frontmatter and formatting standards'
applyTo: 'content-inventory/**/*.md, templates/**/*.md'
---

# Content Standards

Frontmatter schemas, tagging conventions, and formatting standards for all content files.

## Frontmatter Schemas

All content files MUST include YAML frontmatter matching their content level.

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

**Required Fields:**
- `name` - Pillar name (e.g., "DataOps Engineering")
- `description` - Brief 1-2 sentence description
- `status` - proposed, approved, active, archived
- `approved_at` - ISO 8601 date or null
- `tags.topic` - Primary subject area
- `tags.level` - Target experience level
- `tags.role` - Primary audience role

### Learning Path Frontmatter

```yaml
---
pillar_id: "[PILLAR_ID]"
name: "[PATH NAME]"
description: "[2-3 SENTENCE DESCRIPTION]"
target_audience:
  role: "[ROLE]"
  level: "[LEVEL]"
  context: "[CONTEXT]"
prerequisites:
  - "[PREREQUISITE 1]"
  - "[PREREQUISITE 2]"
status: "draft | in-review | approved | published | archived"
tags:
  - "[TAG 1]"
  - "[TAG 2]"
estimated_duration: "[HOURS]"
---
```

**Required Fields:**
- `pillar_id` - References parent pillar
- `name` - Learning path name
- `description` - What learners will achieve
- `target_audience.role` - Primary role
- `target_audience.level` - Experience level
- `target_audience.context` - Learner context
- `prerequisites` - Required prior knowledge
- `status` - Current content state
- `tags` - Categorization tags
- `estimated_duration` - Time commitment

### Course Frontmatter

```yaml
---
path_id: "[PATH_ID]"
name: "[COURSE NAME]"
description: "[2-3 SENTENCE DESCRIPTION]"
outcomes:
  - "[OUTCOME 1]"
  - "[OUTCOME 2]"
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

### Module Frontmatter

```yaml
---
course_id: "[COURSE_ID]"
name: "[MODULE NAME]"
description: "[1-2 SENTENCE DESCRIPTION]"
topics:
  - "[TOPIC 1]"
  - "[TOPIC 2]"
status: "draft | in-review | approved | published | archived"
tags:
  - "[TAG 1]"
estimated_duration: "[HOURS]"
---
```

### Lesson Frontmatter

```yaml
---
module_id: "[MODULE_ID]"
name: "[LESSON NAME]"
objectives:
  - "[OBJECTIVE 1]"
  - "[OBJECTIVE 2]"
prerequisites:
  - "[PREREQUISITE 1]"
status: "draft | in-review | approved | published | archived"
tags:
  - "[TAG 1]"
estimated_duration: "[MINUTES]"
---
```

## Tagging Conventions

Use **canonical tag values** for consistency.

### Role Tags
Audience personas:
- `developer` - Software developers, engineers
- `data-engineer` - Data pipeline engineers
- `ml-engineer` - Machine learning engineers
- `analyst` - Business analysts, data analysts
- `architect` - Solution architects, system designers
- `manager` - Engineering managers, team leads
- `executive` - C-level, directors, VPs

### Level Tags
Experience required:
- `beginner` - New to topic, limited experience
- `intermediate` - 1-3 years, understands fundamentals
- `advanced` - 3-5+ years, seeking optimization
- `expert` - 5+ years, deep specialization

### Topic Tags
Subject areas (examples):
- `data-engineering`
- `machine-learning`
- `cloud-architecture`
- `devops`
- `workflow-orchestration`
- `data-quality`
- `monitoring-observability`
- `security`

### Format Tags
Content delivery:
- `video` - YouTube video, recorded tutorial
- `blog` - Written blog post
- `lesson` - Academy lesson (video + exercises)
- `course` - Full Academy course
- `workshop` - Live or recorded workshop
- `article` - In-depth written article

### Source Type Tags
Content origin:
- `official` - Official vendor/project documentation
- `original` - Created by our team
- `community` - Community tutorials, guides
- `partner` - Partner-created content
- `curated` - Curated external content

### Tech Stack Tags
Tools and platforms (examples):
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

## Status Values

All content uses standard lifecycle status:

1. **draft** - Initial creation, work in progress
2. **in-review** - Ready for quality review
3. **approved** - Reviewed and approved, ready for production
4. **published** - Live and accessible to learners
5. **needs-update** - Flagged for updates
6. **archived** - No longer actively maintained

**Status Transitions:**
```
draft → in-review → approved → published
                                   ↓
                            needs-update → in-review
                                   ↓
                              archived
```

## Directory Structure

Content organized hierarchically:

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

**README Requirements:**
- Every directory level MUST include a `README.md`
- Summarize contents and purpose
- Link to child content
- Provide navigation context

## Content Quality Guidelines

### Plain Language
- Avoid jargon; define technical terms on first use
- Use analogies to explain complex concepts
- Write for learners, not experts

### Structure
- Start with "What" and "Why" before "How"
- Include practical examples and use cases
- Provide clear learning objectives
- Add "Leader's Lens" for business context (lessons)

### Code Examples
- Test all code examples before publishing
- Include comments explaining key concepts
- Provide working, copy-pasteable code
- Show realistic scenarios, not toy examples

### Prerequisites
- Clearly state required knowledge
- Link to prerequisite content when available
- Don't assume expertise beyond stated level

### Citations
- Link to official documentation
- Reference authoritative sources
- Keep sources current (check every 6-12 months)
- Cite industry standards and best practices

## Validation Checklist

Before marking content as "in-review":

### Frontmatter
- [ ] All required fields present
- [ ] Status value is valid
- [ ] Tags use canonical values
- [ ] Prerequisites accurate
- [ ] Duration estimate realistic

### Content Quality
- [ ] Learning objectives specific and measurable
- [ ] Code examples tested and functional
- [ ] Sources current (within 3-6 months)
- [ ] Plain language guidelines followed
- [ ] Business context provided (if lesson)

### Structure
- [ ] File naming follows conventions
- [ ] Located in correct directory
- [ ] README exists in parent directory
- [ ] Cross-references accurate

## Related Documentation

- **Global Standards:** See `.github/instructions/global.md` for project-wide conventions
- **Agent Guide:** See `AGENTS.md` for agent roster and handoff protocol
- **Templates:** See `templates/` for content templates with examples

---

*These standards ensure consistent, high-quality content across all pillars, paths, courses, modules, and lessons.*
