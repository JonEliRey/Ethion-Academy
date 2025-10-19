# Research Summary: AI-Powered Data Generation Assistant
**Research Date**: 2025-10-04
**Pillar**: DataGeneration
**Learning Path**: SyntheticData
**Subtopics**: GenerativeAIForData, RelationalDataGeneration

## 1. Executive Summary
The research confirms the feasibility of creating an AI agent to generate synthetic datasets for educational purposes from natural language prompts. The proposed solution is a multi-layered agent that combines a Large Language Model (LLM) for prompt interpretation and schema generation, with a specialized open-source library, the **Synthetic Data Vault (SDV)**, for the actual data synthesis. This approach directly addresses the user's need for generating varied, relationally-intact data (CSV, Excel, SQL) based on learning concepts.

## 2. Core Problem & Solution
- **Problem**: Instructors need an efficient way to create realistic, context-aware sample data for lessons without manual effort or using sensitive real data. The data must support various formats and relational structures.
- **Solution**: An AI agent that orchestrates two key technologies:
    1.  **LLM (e.g., GPT-4)**: To understand the user's request (e.g., "Create data for a lesson on customer orders") and translate it into a formal database schema.
    2.  **Synthetic Data Vault (SDV)**: To take the LLM-generated schema and synthesize high-quality, statistically-representative data that respects the defined tables, columns, and relationships.

## 3. Key Research Findings
- **Synthetic Data vs. Fake Data**: A critical distinction was identified. "Fake" data (from libraries like Faker) is random and lacks statistical realism. "Synthetic" data, which is what's needed here, mimics the patterns and correlations of real-world data.
- **Leading Tool**: The **Synthetic Data Vault (SDV)** is the most promising open-source tool. Its key advantages are:
    - **Relational Data Support**: It is explicitly designed to handle multi-table relational datasets, maintaining primary and foreign key integrity.
    - **Schema-First Generation**: It can generate data from a metadata schema *without* needing a real dataset to learn from, which is perfect for this use case.
    - **Extensibility**: It supports constraints and varied data types, allowing for fine-tuned, realistic data generation.
- **Proposed Agent Architecture**:
    - **Input**: A natural language prompt from the user describing the desired dataset.
    - **Step 1: NLP & Schema Generation (LLM)**: The LLM parses the prompt and generates a Python script containing an SDV `MetaData` definition. This definition specifies the tables, columns, data types (e.g., `integer`, `datetime`), and relationships.
    - **Step 2: Data Synthesis (SDV)**: The agent executes the generated Python script. SDV uses its internal models (like `HMASynthesizer` for relational data) to create the synthetic data based on the schema.
    - **Step 3: Output Formatting**: The agent saves the synthesized data into the user-specified formats (e.g., multiple CSV files, an Excel file with multiple sheets, or an SQL script).

## 4. Technical Feasibility & Implementation
The proposed architecture is highly feasible with current technology.

- **Inputs to the Agent**:
    - `prompt`: "I need data for a lesson on product sales. It should include tables for products, customers, and sales transactions."
    - `output_formats`: `['csv', 'excel']`
    - `num_rows`: `{'customers': 50, 'products': 20, 'sales': 200}`

- **Core Logic (Python Pseudocode)**:
  ```python
  # 1. LLM generates this schema based on the prompt
  schema_definition = """
  from sdv.metadata import MultiTableMetadata

  metadata = MultiTableMetadata()
  metadata.add_table(name='customers', data=None, primary_key='customer_id')
  metadata.add_table(name='products', data=None, primary_key='product_id')
  metadata.add_table(name='sales', data=None, primary_key='sale_id')

  metadata.update_column(table_name='customers', column_name='customer_id', sdtype='id')
  metadata.update_column(table_name='products', column_name='product_id', sdtype='id')
  # ... other column definitions ...

  metadata.add_relationship(
      parent_table_name='customers',
      child_table_name='sales',
      parent_primary_key='customer_id',
      child_foreign_key='customer_id'
  )
  # ... other relationships ...
  """

  # 2. Agent executes the script to synthesize data
  # (This would be a separate Python process)
  from sdv.multi_table import HMASynthesizer

  # Assume 'metadata' is created from the string above
  synthesizer = HMASynthesizer(metadata)
  synthesizer.fit_from_demo() # or fit without data
  synthetic_data = synthesizer.sample(scale=1) # Uses num_rows from input

  # 3. Agent saves the data
  for table_name, table_df in synthetic_data.items():
      if 'csv' in output_formats:
          table_df.to_csv(f'{table_name}.csv', index=False)
      # ... logic for other formats
  ```

## 5. Next Steps & Design Considerations
The next phase is to design the agent's workflow, including:
- **Prompt Engineering**: Designing robust prompts for the LLM to reliably generate correct SDV schemas.
- **Error Handling**: What happens if the user's request is ambiguous? The agent should ask clarifying questions.
- **User Interface**: How will the user interact with the agent? A chat-based interface is a natural fit.
- **Environment**: The agent will need a Python environment with `sdv` and its dependencies installed.

This research provides a strong foundation for building a powerful and efficient AI Data Generation Assistant.
