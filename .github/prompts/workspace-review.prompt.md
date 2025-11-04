---
mode: 'qa-reviewer'
description: 'Perform a comprehensive, deep-dive review of the entire workspace to build foundational understanding of the project'
tools: ['search', 'fetch', 'codebase']
---

**Objective**: Perform a comprehensive, deep-dive review of the entire workspace. Your goal is to build a foundational understanding of the project's architecture, goals, and current state by analyzing the *content* of the files, not just their names or structure.

**Execution Plan**:

1.  **Recursive File Traversal**:
    *   Start at the root of the workspace.
    *   Recursively list all files and directories to create a complete map of the project.

2.  **Content Analysis & Synthesis**:
    *   For each file, read its entire content.
    *   As you read, synthesize the key information into a structured summary. Focus on:
        *   **Purpose**: What is the primary role of this file? (e.g., "Defines the Content Strategist agent persona," "Specifies the database schema," "Outlines global standards for all agents").
        *   **Key Directives**: Extract critical instructions, requirements, or rules (e.g., "FR-001: The system MUST deliver a fully functional meta-development workflow," "All content files require frontmatter," "Handoffs must use the standard format").
        *   **Relationships**: Note any explicit dependencies or connections to other files (e.g., "This plan is based on `spec.md`," "This chatmode uses prompts from `.vscode/prompts/`").
        *   **Status & Recency**: Identify if the content is a draft, final, or archived. Note any dates.

3.  **Persistent Knowledge Log**:
    *   Create a new file named `ANALYSIS.md` in the root of the workspace.
    *   For each file you analyze, append your structured summary to `ANALYSIS.md`. Use clear Markdown formatting with headings for each file path. This will serve as your external memory, ensuring you don't lose context.

    **Example entry in `ANALYSIS.md`**:
    ```markdown
    ### `/.github/chatmodes/content-strategist.chatmode.md`

    *   **Purpose**: Defines the "Content Strategist" AI agent persona.
    *   **Key Directives**: 
        *   Responsible for demand analysis and defining content pillars/paths.
        *   Uses web search and trend analysis tools.
        *   Follows Fabric patterns like `analyze_tech_impact`.
    *   **Relationships**: 
        *   Handoffs to SME for validation and to the Executive Producer for approval.
        *   References `handoff-protocol.instructions.md`.
    ```

4.  **Final Synthesis Report**:
    *   Once you have processed all files and populated `ANALYSIS.md`, read this file in its entirety.
    *   Produce a final summary report that answers the following:
        *   **Project's Core Mission**: What is the primary goal of this repository?
        *   **Architectural Overview**: How is the system designed? (e.g., "A meta-development system using VS Code chatmodes as agents, orchestrated by a human, with a SQLite backend for content tracking.").
        *   **Key Workflow**: Describe the main operational flow (e.g., "A stage-gated process from Pillars to Lessons, managed via GitHub Projects and manual agent handoffs.").
        *   **Identified Discrepancies**: Are there any remaining conflicts, redundancies, or ambiguities in the *content*?
        *   **Actionable Recommendations**: Suggest concrete steps to improve clarity and consistency.

By following this structured process, you will build a deep, content-aware understanding of the project and have a persistent log of your findings to ensure high-quality, contextually-aware responses.