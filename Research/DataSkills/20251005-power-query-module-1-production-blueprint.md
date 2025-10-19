---
research-date: 2025-10-05T17:06:00Z
research-type: learning-research
topic: "Power Query Module 1: Production Blueprint"
topic-category: DataSkills
topic-paths: [PowerQuery, Excel]
topic-subtopics: [DataConnectors, PowerQueryEditor, ETL]
duration-minutes: 5
source-count: 6
researcher: learning-research-mode
related-research: ["d:\\OneDrive\\Documents\\Code-Projects\\Ethion Academy\\Research\\DataSkills\\power-query-comprehensive-learning-path.md"]
key-findings:
  - "The most effective hook for beginners is demonstrating the 'pain' of manual data import before showing the Power Query solution."
  - "The core 'aha!' moment is the one-click refresh after the source data has changed."
  - "A simplified UI tour focusing on only 3 key areas (Queries, Preview, Applied Steps) is critical to reduce intimidation."
  - "The video script must follow a 'Pain -> Promise -> Path -> Payoff' narrative structure for maximum engagement."
potential-content:
  pillar: "DataSkills"
  learning-path: "Power Query"
  courses:
    - title: "Power Query Fundamentals"
      duration-hours: 1
      level: beginner
      modules:
        - "Module 1: Your First Refreshable Query"
  prerequisites:
    required: ["Microsoft Excel (2016+ or M365)", "Basic understanding of rows and columns"]
    recommended: []
    optional: []
  learning-outcomes:
    - "Explain the primary purpose of Power Query (to automate data preparation)."
    - "Locate the Power Query (Get & Transform) tools within Excel."
    - "Connect to a CSV data source and load it into an Excel worksheet."
    - "Demonstrate the value of a query by refreshing the data after the source file changes."
informed-content: []
status: complete
tags:
  role: [data-analyst, business-analyst, excel-user]
  level: beginner
  topic: [power-query, etl, data-automation]
  format: [video, tutorial]
  tech_stack: [excel, power-query]
  pedagogical_focus: [procedural, conceptual]
---

# Production Blueprint: Power Query Module 1 - Your First Refreshable Query

## 1. Executive Summary

This document provides a comprehensive production blueprint for creating a 10-minute introductory YouTube video on Power Query, based on Module 1 of the "Power Query Comprehensive Learning Path". The research focuses on creating a highly engaging and effective learning experience for absolute beginners.

The core strategy is a **"Pain -> Promise -> Path -> Payoff"** narrative. The video will first validate the viewer's struggle with manual data import, introduce Power Query as the solution, provide a simple step-by-step guide, and culminate in the "magic" of a one-click data refresh. This structure is designed to maximize viewer retention and deliver a powerful "aha!" moment that encourages further learning.

**Key Deliverables:**
*   A detailed 5-act video script outline.
*   Specific learning objectives for the video.
*   A complete list of required production assets, including on-screen graphics and downloadable materials.

## 2. Target Audience & Prerequisites

*   **Primary Audience:** Data analysts, business analysts, and regular Excel users who currently rely on manual copy-paste methods for data import and are unfamiliar with Power Query.
*   **Required Prerequisites:**
    *   Microsoft Excel (Microsoft 365, 2021, 2019, or 2016).
    *   A basic understanding of Excel concepts (worksheets, rows, columns).
*   **Explicitly Not Required:** Any programming, VBA, or prior ETL experience.

## 3. Learning Objectives for the Video

Upon completion of this 10-minute video, the viewer will be able to:

1.  **Explain** the primary purpose of Power Query (to automate data preparation).
2.  **Locate** the Power Query (Get & Transform) tools within their version of Excel.
3.  **Connect** to a CSV data source and load it into an Excel worksheet as a table.
4.  **Demonstrate** the value of a query by successfully refreshing the data after the source file changes.

## 4. Video Production Plan (Script & Visuals)

**Target Video Length:** 8-10 minutes

### Act 1: The Hook - The Manual Way (0:00 - 1:00)
*   **Visual:** Screen recording of opening a `Sales.csv`, selecting all data, copying, switching to Excel, and pasting.
*   **Script Focus:** Narrate the shared pain. "If you work with data, this probably looks familiar... It's tedious, it's slow, and you have to do it every single time. What if you make a mistake?"
*   **Business Context:** "How much time does your team waste on this? What's the cost of one error?"

### Act 2: The Promise - Introducing Power Query (1:00 - 2:30)
*   **Visual:** Transition to a clean Excel sheet. Zoom in on the `Data` tab. Display a **full-screen graphic** showing the location of "Get Data" in different Excel versions (M365 vs. older versions).
*   **Script Focus:** Introduce the solution. "But what if I told you Excel has a built-in tool to automate this? It's called Power Query... Think of it as a repeatable 'recipe' for your data."
*   **Analogy:** Visually and verbally introduce the "recipe" analogy for Applied Steps.

### Act 3: The Demo - Your First Query (2:30 - 7:00)
*   **Visual:** A clear, step-by-step screen recording with animated highlights and zoom effects.
*   **Step 1: Connect.** Navigate `Data > Get Data > From File > From Text/CSV`. Narrate each click clearly.
*   **Step 2: Load.** In the CSV preview window, immediately click the **"Load"** button. **Crucially, do not click "Transform Data"** to keep it simple.
*   **Step 3: The 60-Second UI Tour.**
    *   Once data is loaded, double-click the new query in the "Queries & Connections" pane to open the editor.
    *   **Script:** "This editor can look overwhelming. For now, you only need to know about these three things."
    *   Use **graphical callouts** to highlight: 1. The Query Name (left), 2. The Data Preview (center), and 3. The Applied Steps (right).
    *   Explain that the Applied Steps are the saved "recipe".
    *   Immediately click "Close & Load".

### Act 4: The Payoff - The Magic of Refresh (7:00 - 9:00)
*   **Visual:** Switch to a text editor (like Notepad) showing the source `Sales.csv`. Add a new row of data and save the file.
*   **Script Focus:** Build anticipation. "Now for the magic. A new sale has come in, and our source file is updated."
*   **Visual:** Return to Excel. Perform a slow zoom on the data table. Right-click > "Refresh".
*   **Visual:** Use a **dramatic highlight animation** as the new row appears in the Excel table.
*   **Script Focus:** Deliver the key takeaway. "And just like that. No more copying. No more pasting. Your report is instantly up-to-date. This is the power of Power Query."
*   **Business Context:** "This means your reports are always accurate, and you can spend your time *analyzing* data, not just preparing it."

### Act 5: The Recap & Next Steps (9:00 - 10:00)
*   **Visual:** Display a simple **"Before vs. After" summary graphic** (Manual copy-paste vs. One-click refresh).
*   **Script Focus:** Recap the core benefits (saves time, reduces errors, ensures consistency).
*   **Teaser/Call to Action:** "We've only scratched the surface. In our next video, we'll dive into the 'Transform' part of Power Query to start cleaning messy data. Download the sample file from the description below to try this yourself, and subscribe for the next lesson in our Power Query series."

## 5. Required Production Assets

*   **Software:** Microsoft Excel (M365/2016+).
*   **Downloadable `.zip` file for viewers:**
    *   `Sales_Data_Start.csv`: A clean CSV with ~10 rows and headers (`Date,Region,Product,Units,Sale_Amount`).
    *   `Sales_Data_With_New_Row.csv`: The final state of the file for comparison.
    *   `README.txt`: Simple instructions for the exercise.
*   **Video Assets:**
    1.  **Screen Recordings:** High-resolution (1080p+), smooth cursor movements.
    2.  **Animated Callouts:** Arrows, circles, and highlights to guide the viewer's eye.
    3.  **Full-Screen Graphic #1:** "Where to Find Power Query" (showing UI for M365 vs. Excel 2016).
    4.  **Full-Screen Graphic #2:** "Before vs. After" summary graphic.
    5.  **Lower Thirds:** For key terms (`Power Query`, `ETL`) and speaker identification.
    6.  **Branded Intro/Outro Slates.**
    7.  **Royalty-free background music.**

## 6. Sources & References

1.  **Automate data cleaning with Power Query - Training | Microsoft Learn**
    *   URL: `https://learn.microsoft.com/en-us/training/modules/automate-data-cleaning-power-query/`
    *   Educational Value: Provided the official, structured learning objectives for an introductory module.

2.  **The Power Query user interface | Microsoft Learn**
    *   URL: `https://learn.microsoft.com/en-us/power-query/power-query-ui`
    *   Educational Value: Confirmed the correct terminology for the UI tour (Queries Pane, Applied Steps).

3.  **What is Power Query? | Microsoft Learn**
    *   URL: `https://learn.microsoft.com/en-us/power-query/power-query-what-is-power-query`
    *   Educational Value: Provided the official definition to shape the "What is it?" part of the script.

4.  **Introduction to Power Query | MyOnlineTrainingHub**
    *   URL: `https://www.myonlinetraininghub.com/introduction-to-power-query`
    *   Educational Value: Inspired the need to create a graphic for different Excel versions and highlighted common beginner errors to be aware of.

5.  **Introduction to Power Query | Excel Off The Grid**
    *   URL: `https://exceloffthegrid.com/power-query-introduction/`
    *   Educational Value: The narrative style heavily influenced the "Pain -> Promise" structure of the video script, providing a proven hook for engagement.

6.  **Where to get data | Microsoft Learn**
    *   URL: `https://learn.microsoft.com/en-us/power-query/where-to-get-data`
    *   Educational Value: Provided the exact procedural steps for connecting to data in Excel.
