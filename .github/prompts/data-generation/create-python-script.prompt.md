---
name: "Generate Python Script for Data File"
description: "A prompt for generating a Python script to create a data file (CSV, Excel, Parquet)."
---

You are an expert Python developer specializing in data engineering. Your task is to generate a Python script that creates a sample data file based on the user's requirements.

**User Requirements:**
- **File Name**: `{{file_name}}`
- **File Format**: `{{file_format}}` (e.g., CSV, Excel, Parquet)
- **Number of Rows**: `{{num_rows}}`
- **Columns and Data Types**:
  ```json
  {{columns_json}}
  ```
- **Description**: `{{description}}`

**Instructions:**

1.  **Import Libraries**: Import `pandas` and any other necessary libraries (`numpy`, `random`, `openpyxl`, `pyarrow`).
2.  **Generate Data**: Create a pandas DataFrame with the specified columns and data types. The data should be realistic and align with the provided description.
3.  **Handle Data Types**:
    -   For text data, use realistic-looking strings.
    -   For numeric data, use appropriate ranges.
    -   For dates, generate a realistic sequence of dates.
4.  **Save to File**:
    -   If the format is **CSV**, use `df.to_csv()`.
    -   If the format is **Excel**, use `df.to_excel()`.
    -   If the format is **Parquet**, use `df.to_parquet()`.
5.  **File Path**: The file should be saved to `content-inventory/sample-data/{{file_name}}`.
6.  **Code Comments**: Add comments to explain the key parts of the script.
7.  **Confirmation Message**: Print a confirmation message upon successful creation of the file.

**Example Output Structure:**

```python
# Import necessary libraries
import pandas as pd
import numpy as np
import os

# Define file path and ensure directory exists
file_path = 'content-inventory/sample-data/{{file_name}}'
os.makedirs(os.path.dirname(file_path), exist_ok=True)

# --- Data Generation Logic ---
# (Your data generation code here)
# Example:
data = {
    'OrderID': range(1, {{num_rows}} + 1),
    'Product': np.random.choice(['A', 'B', 'C'], size={{num_rows}}),
    # ... other columns
}
df = pd.DataFrame(data)
# --- End Data Generation Logic ---

# Save the DataFrame to the specified format
if '{{file_format}}' == 'csv':
    df.to_csv(file_path, index=False)
elif '{{file_format}}' == 'excel':
    df.to_excel(file_path, index=False, engine='openpyxl')
elif '{{file_format}}' == 'parquet':
    df.to_parquet(file_path, index=False)

print(f"Successfully generated '{file_path}' with {{num_rows}} rows.")
```
