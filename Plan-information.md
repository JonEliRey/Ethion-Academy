# Input Context for Plan Stage
**For our project**: We'll use custom instructions in `.github/instructions/` to define:
- Content file frontmatter requirements
- Database operation standards
- Agent handoff formatting rules
- Project-wide conventions all agents should follow

**Custom instruction file structure**:
```markdown
---
description: 'Brief description of what standards this defines'
applyTo: '**/*.md, **/*.json'
---

# Instruction Title

[Standards and guidelines]
```

**Key points**:
- File naming: `*.instructions.md` (e.g., `global-standards.instructions.md`)
- Frontmatter includes `description` and `applyTo` (file patterns)
- Stored in `.github/instructions/`

**Documentation**: https://code.visualstudio.com/docs/copilot/customization/custom-instructionsocument provides **Chat mode file structure** (based on Beastmode example):
```markdown
---
description: Agent Name
tools: ['codebase', 'search', 'fetch', 'runCommands', 'editFiles']
---

# Agent Name

[Main content: instructions, steps, examples, guidelines]
```

**Note**: YAML frontmatter with `---` delimiters goes at the BEGINNING of the file.S Code Copilot customization features and reference materials that will be used to implement the Super-Intelligent Course Designer meta-development system.

**Note**: For comprehensive input to the plan stage, see `PLAN-STAGE-INPUT.md` which includes this information plus specification context, agent requirements, and success criteria.

---

## VS Code Copilot Customization Features

These are the technical capabilities we'll use to build our agent system:

### Custom instructions
Custom instructions let you define common guidelines or rules in a Markdown file for tasks like generating code, performing code reviews, or generating commit messages. With custom instruction, you describe how a specific task should be performed. VS Code can automatically apply these instructions or you can choose to include them in specific chat requests.

Use custom instructions to:

- Specify coding practices, preferred technologies, or project requirements, so generated code follows your standards
- Provide guidelines about how a commit message or pull request title and description should be structured
- Set rules for code reviews, such as checking for security vulnerabilities, performance issues, or adherence to coding standards

**For our project**: We'll use custom instructions to define:
- Content file frontmatter requirements
- Database operation standards
- Agent handoff formatting rules
- Project-wide conventions all agents should follow

**Documentation**: https://code.visualstudio.com/docs/copilot/customization/custom-instructions 

---

### Chat modes
Chat modes are a way to create a specialist assistant for specific roles or tasks, like a database administrator, front-end development, or planning. Within a chat mode Markdown file, you describe its scope and capabilities, which tools it can access, and a preferred language model.

Use chat modes to:
- Create a chat mode for planning, where the AI has read-only access to the codebase and can only generate implementation plans
- Define a research chat mode, where the AI can reach out to external resources to explore new technologies or gather information
- Create a front-end developer chat mode, where the AI can only generate and modify code related to front-end development

**For our project**: **This is the core implementation mechanism**. Each of our 9 agent personas will be a chat mode stored in `.github/chatmodes/`:
1. `content-strategist.chatmode.md` - Content Strategist chat mode
2. `sme.chatmode.md` - SME (Subject Matter Expert) chat mode
3. `scriptwriter.chatmode.md` - Scriptwriter chat mode
4. `editor.chatmode.md` - Editor chat mode
5. `community-manager.chatmode.md` - Community Manager chat mode
6. `seo-lead.chatmode.md` - SEO/Distribution Lead chat mode
7. `qa-reviewer.chatmode.md` - QA Reviewer chat mode
8. `librarian.chatmode.md` - Librarian/Archivist chat mode
9. `monitoring-specialist.chatmode.md` - Monitoring Specialist chat mode

Each chat mode will define:
- The agent's role and scope (in the main markdown content)
- Specific instructions and examples (in the main markdown content)
- Handoff conditions (in the main markdown content)
- Which tools it can access (in YAML frontmatter at end of file)
- Optional: Preferred language model (in YAML frontmatter)

**Chat mode file structure** (based on Beastmode example):
```markdown
# Agent Name

[Main content: instructions, steps, examples, guidelines]

---
description: Agent Name
tools: ['codebase', 'search', 'fetch', 'runCommands', etc.]
---
```

**Note**: YAML frontmatter with `---` delimiters goes at the END of the file, not the beginning.

**Documentation**: https://code.visualstudio.com/docs/copilot/customization/custom-chat-modes

---

### Prompt files
Prompt files let you define reusable prompts for common and repeatable development tasks in a Markdown file. Prompt files are standalone prompts that you can run directly in chat. You can include task-specific context and guidelines about how the task should be performed. Combine prompt files with custom instructions to ensure consistent execution of complex tasks.

Use prompt files to:
- Create reusable prompts for common coding tasks, such as scaffolding a new component, API route, or generating tests
- Define prompts for performing code reviews, such as checking for code quality, security vulnerabilities, or performance issues
- Create step-by-step guides for complex processes or project-specific patterns
- Define prompts for generating implementation plans, architectural designs, or migration strategies

**For our project**: We'll create prompt files in `.vscode/prompts/` for repeatable workflows:
- `define-pillar.prompt.md` - Guide Content Strategist through pillar creation
- `define-learning-path.prompt.md` - Learning Path creation workflow
- `validate-technical-scope.prompt.md` - SME validation checklist
- `create-lesson-brief.prompt.md` - Scriptwriter lesson template
- `perform-content-review.prompt.md` - QA Reviewer checklist
- `handoff-summary.prompt.md` - Standard handoff template
- `catalog-content.prompt.md` - Librarian cataloging process
- `check-for-updates.prompt.md` - Monitoring Specialist update scan

**Prompt file structure** (with frontmatter at beginning):
```markdown
---
mode: 'agent-name'
description: 'Brief description of what this prompt does'
tools: ['codebase', 'search', 'editFiles']
---

# Prompt Title

[Main content: instructions, variables, execution steps]
```

**Key points**:
- File naming: `*.prompt.md` (e.g., `define-pillar.prompt.md`)
- Frontmatter includes `mode` (which chat mode uses this), `description`, optional `tools`
- Stored in `.vscode/prompts/`

**Documentation**: https://code.visualstudio.com/docs/copilot/customization/prompt-files

---

## Reference Materials for Agent Design

### Primary Source: Daniel Miessler's Fabric Patterns
**Repository**: https://github.com/danielmiessler/Fabric/tree/main/data/patterns

**Why use this**: 
- Extensive, proven collection of AI persona patterns
- Clear structure: identity, purpose, steps, output format
- Covers diverse roles relevant to our needs (analyst, writer, researcher, reviewer)
- Real-world tested and effective

**Recommended patterns to study**:
- `analyze_tech_impact` - Understanding tool changes and impacts
- `create_summary` - Distilling complex documentation
- `explain_code` - Breaking down technical concepts simply
- `extract_insights` - Demand signal analysis
- `write_essay` - Blog content creation
- `create_video_script` - YouTube video planning
- `rate_content` - QA review processes
- `improve_writing` - Editorial review
- `create_quiz` - Learning assessment

**How to use**: 
- Study the pattern structure and adapt to our 9 agents
- Maintain consistent format across all agent specifications
- Use clear, directive language like Fabric patterns
- Include explicit steps and output formats

---

### Secondary Source: Awesome Copilot Prompts
**Repository**: https://github.com/github/awesome-copilot

**Why use this**:
- Community-curated, proven prompts
- GitHub Copilot-specific best practices
- Task-specific examples and patterns

**Relevant for**:
- Prompt engineering techniques
- Role-based prompt structures
- VS Code Copilot optimization

---

### Example: Beastmode Agentic Researcher
**Gist**: https://gist.githubusercontent.com/burkeholland/88af0249c4b6aff3820bf37898c8bacf/raw/e1898331f1755aff3265d50e30106b8c6987c4f7/beastmode3.1.chatmode.md

**Why this is valuable**:
- Sophisticated example of a complex chat mode
- Demonstrates recursive research capabilities (exploring multiple layers of documentation)
- Shows tool usage patterns and boundary setting
- Excellent model for our Monitoring Specialist agent

**Key learnings**:
- How to structure complex agent behavior
- When to use different tools (search, analyze, summarize)
- Clear output formatting
- Scope and boundary definitions

---

## How These Fit Together

**The Plan Stage Should**:
1. Study Fabric patterns to understand proven agent structure
2. Use VS Code chat mode format to implement each agent
3. Create prompt files for repeatable workflows within each agent
4. Define custom instructions for project-wide standards
5. Use Beastmode as inspiration for complex research/monitoring agents

**Result**: 9 well-designed chat mode files + supporting prompt files + custom instructions = Complete meta-development system

---

## Next Steps

See **`PLAN-STAGE-INPUT.md`** for comprehensive planning context including:
- Complete specification and clarifications
- Detailed requirements for all 9 agents
- Database schema requirements
- Handoff protocol design
- Implementation roadmap
- Success criteria

**Start Planning**: Begin with the Fabric patterns repository to design your first agent (Content Strategist).
