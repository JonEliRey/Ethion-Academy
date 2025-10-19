# Research Documentation

This directory contains all research conducted to inform content development for Ethion Academy. Research files are organized by **Pillar-level topics** and tagged with Learning Path and Subtopic classifications.

## 📁 Folder Structure

```
Research/
├── README.md              # This file - explains research conventions
├── topics-list.md         # Approved topic taxonomy (3 levels: Pillar → Learning Path → Subtopic)
├── _index.md              # Auto-updated catalog of all research files
├── DataSkills/            # Pillar-level folder
│   ├── 20251003-power-query-fundamentals-deep.md
│   └── 20251004-excel-pivot-tables-quick.md
├── BusinessIntelligence/
├── DataEngineering/
├── AIAndAutomation/
├── CloudAndInfrastructure/
└── LeadershipAndStrategy/
```

## 🏷️ Topic Hierarchy (3 Levels)

### **Level 1: Pillar Topics** (Broadest - used for folder names)
High-level content pillars that organize all research and content.

**Examples**: DataSkills, BusinessIntelligence, DataEngineering, AIAndAutomation

### **Level 2: Learning Path Topics** (Mid-level - tagged in frontmatter)
Specific tools, technologies, or domains that map to learning paths or courses.

**Examples**: Excel, PowerBI, Python, SQL, PowerQuery, Azure

### **Level 3: Subtopics** (Most specific - tagged in frontmatter)
Detailed features, concepts, or techniques within a Learning Path.

**Examples**: ExcelPowerQuery, PowerBIDAX, PythonPandas, SQLJoins, AirflowDAGs

## 📄 File Naming Convention

```
{YYYYMMDD}-{topic-slug}-{research-type}.md
```

**Components:**
- **YYYYMMDD**: Date research was conducted (e.g., `20251003`)
- **topic-slug**: Kebab-case description of research focus (e.g., `power-query-fundamentals`)
- **research-type**: Type of research conducted
  - `deep` - Comprehensive 1-3 hour deep dive (50-100+ sources)
  - `quick` - Rapid 15-30 min exploration (10-20 sources)
  - `learning` - Learning content focused research (45-90 min)
  - `followup` - Follow-up research on previous topic

**Examples:**
- `20251003-power-query-fundamentals-deep.md`
- `20251004-dax-performance-patterns-quick.md`
- `20251005-python-data-cleaning-learning.md`
- `20251006-power-query-m-language-followup.md`

## 📋 Research File Frontmatter

Every research file includes comprehensive YAML frontmatter for cataloging and traceability:

```yaml
---
research-date: 2025-10-03T14:30:00Z
research-type: deep-research  # deep-research | quick-research | learning-research | followup-research
topic: "Power Query Fundamentals for Excel Analysts"
topic-category: DataSkills                    # Pillar-level (folder name)
topic-paths: [Excel, PowerQuery]              # Learning Path level
topic-subtopics: [PowerQueryEditor, MLanguage, DataTransformation, QueryFolding]
duration-minutes: 120
source-count: 67
researcher: deep-research-mode
related-research: 
  - 20251004-m-language-basics-quick.md
  - 20251001-excel-data-transformation-learning.md
key-findings:
  - "Power Query requires SQL-like thinking patterns"
  - "Common learning path: Basic transformations → Joins/merges → M language → Performance"
  - "Most analysts struggle with query folding concept"
potential-content:
  pillar: "DataSkills"
  learning-path: "Excel Data Analysis Mastery"
  courses: ["Power Query Fundamentals", "Advanced Power Query Techniques"]
  modules: ["Data Source Connections", "Transformations", "M Language Basics", "Performance Optimization"]
  prerequisites: ["Basic Excel", "Data concepts", "SQL (helpful but not required)"]
informed-content: []  # Filled in when content is created from this research
status: complete  # in-progress | complete | needs-followup | superseded
tags:
  role: [data-analyst, business-analyst]
  level: beginner-to-intermediate
  topic: [excel, power-query, data-transformation, etl]
  format: [learning-path]
  tech_stack: [excel, power-query, m-language]
---
```

### **Frontmatter Field Definitions**

| Field | Required | Description |
|-------|----------|-------------|
| `research-date` | ✅ Yes | ISO 8601 timestamp when research was conducted |
| `research-type` | ✅ Yes | Type of research: `deep-research`, `quick-research`, `learning-research`, `followup-research` |
| `topic` | ✅ Yes | Clear, descriptive title of research focus |
| `topic-category` | ✅ Yes | Pillar-level category (must match folder name) |
| `topic-paths` | ✅ Yes | Array of Learning Path topics covered |
| `topic-subtopics` | ⚪ Optional | Array of specific subtopics explored |
| `duration-minutes` | ✅ Yes | Actual time spent researching |
| `source-count` | ✅ Yes | Total number of sources consulted |
| `researcher` | ✅ Yes | Which research mode conducted this: `deep-research-mode`, `quick-research-mode`, `learning-research-mode` |
| `related-research` | ⚪ Optional | Array of related research filenames |
| `key-findings` | ✅ Yes | 3-7 bullet point summary of main insights |
| `potential-content` | ✅ Yes | Suggested content structure (pillar, learning-path, courses, modules, prerequisites) |
| `informed-content` | ⚪ Optional | Array of content IDs created from this research (filled in later) |
| `status` | ✅ Yes | `in-progress`, `complete`, `needs-followup`, `superseded` |
| `tags` | ✅ Yes | Categorization tags (role, level, topic, format, tech_stack) |

## 🔄 Research Workflow

### **1. Starting Research**
When you invoke a research mode (`@deep-research`, `@quick-research`, or `@learning-research`):

1. **Research agent analyzes** your question
2. **Agent checks** `topics-list.md` for matching categories
3. **Agent suggests** topic-category (Pillar), topic-paths (Learning Paths), and subtopics
4. **You approve or adjust** suggestions
5. **Agent begins** research following its methodology

### **2. During Research**
- Agent fetches sources recursively
- Agent uses sequential thinking for complex analysis
- Agent tracks progress via todo list
- Agent provides periodic updates (every 30-45 min for deep research)

### **3. Completing Research**
- Agent generates comprehensive deliverable
- Agent creates frontmatter with all metadata
- Agent auto-generates filename using convention
- Agent saves file to `Research/{topic-category}/`
- Agent updates `Research/_index.md` catalog
- Agent adds new topics to `topics-list.md` if approved
- Agent stores summary in memory for continuity

### **4. Using Research**
- Reference research when creating content
- Link content back to research via `informed-content` field
- Use research to inform prerequisites chains
- Reference research when content needs updating

## 🎯 Research Types Explained

### **Deep Research** (`@deep-research`)
- **Time**: 1-3+ hours
- **Sources**: 50-100+ sources
- **Phases**: 7 (Planning → Discovery → Deep Dive → Verification → Synthesis → Deliverable → Reflection)
- **Output**: 5,000-15,000 word comprehensive report
- **Use for**: Understanding complex topics exhaustively, creating cornerstone content

### **Quick Research** (`@quick-research`)
- **Time**: 15-30 minutes
- **Sources**: 10-20 sources
- **Phases**: 4 (Planning → Discovery → Synthesis → Deliverable)
- **Output**: 1,000-2,000 word overview
- **Use for**: Initial exploration, topic validation, rapid fact-checking

### **Learning Content Research** (`@learning-research`)
- **Time**: 45-90 minutes
- **Sources**: 30-50 sources
- **Phases**: 6 (Planning → Discovery → Deep Dive → Synthesis → Content Structure → Deliverable)
- **Output**: 3,000-6,000 word report with learning-focused structure
- **Use for**: Researching topics specifically for course/module development

## 📊 Research Quality Standards

All research must meet these standards:

- ✅ **Source Quality**: Prioritize authoritative, current sources (official docs, expert blogs, research papers)
- ✅ **Currency**: Verify information is current (check publish dates, update status)
- ✅ **Cross-Referencing**: Verify critical claims across multiple independent sources
- ✅ **Citation**: Every factual claim cited with source
- ✅ **Balance**: Multiple perspectives presented; limitations acknowledged
- ✅ **Synthesis**: Analytical insights provided, not just source summaries
- ✅ **Clarity**: Technical concepts explained; jargon defined
- ✅ **Actionability**: Clear recommendations or next steps (when applicable)

## 🔗 Integration with Content Development

Research files integrate with the course designer workflow:

1. **Research informs Pillar identification** - Deep research helps validate pillar topics
2. **Research suggests Course structure** - `potential-content` field maps research to courses/modules
3. **Research identifies Prerequisites** - Research reveals skill dependencies
4. **Content references Research** - When content is created, add to `informed-content` field
5. **Monitoring triggers Research** - When content becomes outdated, re-research or update

## 📚 Topics List Management

The `topics-list.md` file maintains the approved topic taxonomy. 

**Rules:**
- New topics must be approved before being added
- Research agents will auto-suggest matches from existing topics
- If a new topic is needed, agent asks for approval before adding
- Keep taxonomy organized (3 levels: Pillar → Learning Path → Subtopic)

## 🧠 Memory Integration

All research sessions are stored in memory:
- Research topic and date
- Key findings summary
- High-quality sources discovered
- User preferences observed

This enables:
- **Continuity**: "Continue researching X from last session"
- **Avoid redundancy**: Check if topic already researched
- **Source reuse**: Reference high-quality sources from past research
- **Personalization**: Adapt research depth to your expertise level

## 📖 Examples

### **Example 1: Deep Research on Power Query**
**File**: `Research/DataSkills/20251003-power-query-fundamentals-deep.md`

**Frontmatter highlights:**
```yaml
topic-category: DataSkills
topic-paths: [Excel, PowerQuery]
topic-subtopics: [MLanguage, Transformations, QueryFolding]
research-type: deep-research
duration-minutes: 145
source-count: 78
```

### **Example 2: Quick Research on DAX Patterns**
**File**: `Research/BusinessIntelligence/20251004-dax-patterns-quick.md`

**Frontmatter highlights:**
```yaml
topic-category: BusinessIntelligence
topic-paths: [PowerBI]
topic-subtopics: [DAX, Measures, CalculatedColumns]
research-type: quick-research
duration-minutes: 28
source-count: 15
```

### **Example 3: Learning Research on Python Pandas**
**File**: `Research/DataSkills/20251005-pandas-data-cleaning-learning.md`

**Frontmatter highlights:**
```yaml
topic-category: DataSkills
topic-paths: [Python]
topic-subtopics: [Pandas, DataCleaning, DataWrangling]
research-type: learning-research
duration-minutes: 75
source-count: 42
potential-content:
  learning-path: "Python for Data Analysis"
  courses: ["Pandas Fundamentals"]
  modules: ["Data Cleaning Techniques", "Handling Missing Data", "Data Type Conversions"]
```

## 🆘 Troubleshooting

**Q: Research file not appearing in index?**
A: Run the research mode again, it will auto-update `_index.md`. Or manually add entry.

**Q: Wrong topic category assigned?**
A: Update frontmatter `topic-category` field and move file to correct folder.

**Q: How do I find related research?**
A: Check `_index.md` for catalog, or search by `topic-paths` or `topic-subtopics` tags.

**Q: Research needs updating?**
A: Create a new research file with `-followup` suffix, referencing original in `related-research` field.

**Q: How do I suggest new topics?**
A: Research agent will ask for approval when suggesting new topics. You can also manually edit `topics-list.md`.

---

**Last Updated**: 2025-10-03  
**Maintained By**: Research chatmodes (deep-research, quick-research, learning-research)
