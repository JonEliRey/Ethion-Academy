---
title: "Data Generation Agent"
epic: "Course Content Creation"
feature: "Automated Sample Data Generation"
status: "in-progress"
date: 2025-10-04
---

# SPEC: Data Generation Agent

## 1. Overview

This document specifies the requirements for an AI agent dedicated to generating sample datasets for educational content. The agent will support various formats (Excel, CSV, Parquet, SQL) and complexity levels, from simple tables to relational database schemas.

## 2. Goals

- **Accelerate Content Creation**: Reduce the manual effort required to create relevant and high-quality sample data for lessons and modules.
- **Improve Learning Experience**: Provide learners with realistic and contextually appropriate data to practice their skills.
- **Ensure Consistency**: Maintain a consistent standard for sample data across all learning content.
- **Support Diverse Needs**: Cater to a wide range of data requirements, from basic data frames to complex relational models.

## 3. Requirements

### 3.1. Core Capabilities

- **Multi-Format Support**: The agent must be able to generate data in the following formats:
    - Excel (`.xlsx`)
    - CSV (`.csv`)
    - Parquet (`.parquet`)
    - SQL (`.sql` insert statements)
- **Data Complexity**: The agent must support a range of complexities:
    - **Simple**: Single tables with a few columns and rows.
    - **Intermediate**: Tables with various data types, including text, numbers, dates, and booleans.
    - **Complex**: Multiple related tables forming a relational schema.
- **Context-Aware Generation**: The agent should take a lesson or module concept as input and generate data that is thematically aligned with the topic.
- **Script Generation**: For formats like Excel and Parquet, the agent will generate a Python script (using libraries like `pandas` and `pyarrow`) that, when run, produces the data file. For SQL, it will generate the `CREATE TABLE` and `INSERT INTO` statements.

### 3.2. Workflow

1.  **User Prompt**: The user (Content Creator) invokes the agent with a request specifying the lesson topic, required data format, complexity, and any specific entities or fields to include.
2.  **Agent Clarification (If Needed)**: The agent asks clarifying questions to resolve ambiguities.
3.  **Generation**:
    - The agent determines the appropriate tool for the job (e.g., Python script for Parquet, SQL statements for a database).
    - It uses a prompt template to construct the code or script needed.
4.  **Output**: The agent provides the generated script or SQL statements to the user.
5.  **File Creation**: The user (or another agent) executes the script/SQL to create the physical data file(s) in the `content-inventory/sample-data/` directory.

## 4. Technical Details

- **Chatmode**: The agent's persona and core instructions will be defined in `.github/chatmodes/data-generation.chatmode.md`.
- **Prompts**: Standardized prompts for generating scripts will be stored in `.github/prompts/data-generation/`.
- **Output Location**: All generated data files will be stored in `content-inventory/sample-data/`.
- **Tooling**:
    - **Python**: For generating `.xlsx`, `.csv`, and `.parquet` files.
        - `pandas`
        - `openpyxl`
        - `pyarrow`
    - **SQL**: For generating `.sql` files with `CREATE TABLE` and `INSERT` statements.

## 5. Example Usage

**User Prompt**:
> "@data-gen, I need a dataset for a lesson on basic sales analysis. Please create a CSV file with sales transactions. It should include columns for `OrderID`, `Product`, `Category`, `SaleAmount`, and `OrderDate`."

**Agent Response**:
> "Understood. I will generate a Python script to create the `sales_transactions.csv` file. How many sample rows would you like?"

**User**:
> "Let's start with 100."

**Agent Output (Python Script)**:
```python
import pandas as pd
import numpy as np

# ... (script to generate 100 rows of realistic sales data) ...

df.to_csv('content-inventory/sample-data/sales_transactions.csv', index=False)

print("Successfully generated sales_transactions.csv with 100 rows.")
```
