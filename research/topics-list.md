# Approved Topic Taxonomy

This file maintains the 3-level topic hierarchy used for categorizing research and content.

**Last Updated**: 2025-10-04

---

## 📊 Topic Hierarchy Structure

```
Level 1: Pillar Topics (Folder names in Research/)
  └── Level 2: Learning Path Topics (Tagged in frontmatter)
      └── Level 3: Subtopics (Specific features/concepts)
```

---

## Level 1: Pillar Topics

**Used for**: Folder organization in `Research/` directory

These are the broadest categorizations that align with major content pillars.

| Pillar | Description | Folder |
|--------|-------------|--------|
| **DataSkills** | Foundational data analysis, manipulation, and visualization skills | `Research/DataSkills/` |
| **BusinessIntelligence** | BI tools, reporting, dashboards, and analytics platforms | `Research/BusinessIntelligence/` |
| **DataEngineering** | Data pipelines, ETL/ELT, orchestration, and infrastructure | `Research/DataEngineering/` |
| **AIAndAutomation** | Machine learning, AI implementation, automation, and intelligent systems | `Research/AIAndAutomation/` |
| **DataGeneration** | Tools and techniques for generating synthetic and sample data | `Research/DataGeneration/` |
| **CloudAndInfrastructure** | Cloud platforms, infrastructure, and deployment strategies | `Research/CloudAndInfrastructure/` |
| **LeadershipAndStrategy** | Data leadership, strategy, governance, and organizational topics | `Research/LeadershipAndStrategy/` |

---

## Level 2: Learning Path Topics

**Used for**: `topic-paths` field in research frontmatter

These map to specific technologies, tools, or domains that become learning paths or courses.

### **DataSkills Learning Paths**
- Excel
- PowerQuery
- SQL
- Python
- DataVisualization
- StatisticalAnalysis
- DataLiteracy

### **BusinessIntelligence Learning Paths**
- PowerBI
- Tableau (excluded per user preference)
- DAX
- DataModeling
- ReportingAndDashboards

### **DataEngineering Learning Paths**
- Airflow
- DataPipelines
- ETLAndELT
- DataWarehousing
- StreamProcessing

### **AIAndAutomation Learning Paths**
- MachineLearning
- PythonForAI
- AutomationAndScripting
- NaturalLanguageProcessing
- ComputerVision

### **DataGeneration Learning Paths**
- SyntheticData
- DataAnonymization
- TestDataManagement
- DataSimulation

### **CloudAndInfrastructure Learning Paths**
- Azure
- AWS (excluded per user preference)
- Snowflake (excluded per user preference)
- CloudDataPlatforms
- ContainerAndKubernetes

### **LeadershipAndStrategy Learning Paths**
- DataGovernance
- DataStrategy
- TeamLeadership
- ChangeManagement
- DataCulture

---

## Level 3: Subtopics

**Used for**: `topic-subtopics` field in research frontmatter

Specific features, concepts, techniques, or components within a Learning Path. This is the most granular level.

### **Excel Subtopics**
- PivotTables
- PowerQuery
- Formulas
- VBA
- DataValidation
- ConditionalFormatting
- ExcelCharts
- ExcelTables

### **PowerQuery Subtopics**
- PowerQueryEditor
- MLanguage
- DataTransformation
- QueryFolding
- DataConnectors
- ParametersAndFunctions
- AdvancedMerges

### **PowerBI Subtopics**
- PowerBIDAX
- PowerBIDataModeling
- PowerBIVisuals
- PowerBIService
- PowerBIGateways
- PowerBIEmbedded
- RowLevelSecurity
- IncrementalRefresh

### **Python Subtopics**
- PythonPandas
- PythonNumPy
- PythonMatplotlib
- PythonSeaborn
- PythonSQLAlchemy
- JupyterNotebooks
- PythonDataCleaning

### **SQL Subtopics**
- SQLJoins
- SQLAggregations
- SQLWindowFunctions
- SQLCTEs
- SQLIndexing
- SQLPerformanceTuning
- SQLStoredProcedures

### **Airflow Subtopics**
- AirflowDAGs
- AirflowOperators
- AirflowSensors
- AirflowHooks
- AirflowScheduling
- AirflowMonitoring

### **MachineLearning Subtopics**
- SupervisedLearning
- UnsupervisedLearning
- ModelEvaluation
- FeatureEngineering
- ModelDeployment
- MLOps

### **Azure Subtopics**
- AzureDataFactory
- AzureSynapse
- AzureDataLake
- AzureFunctions
- AzureDevOps
- AzureMLStudio

### **DataGeneration Subtopics**
- GenerativeAIForData
- RelationalDataGeneration
- AnonymizationTechniques
- DataMasking
- SyntheticDataQuality

### **DataGovernance Subtopics**
- DataQuality
- DataLineage
- MetadataManagement
- DataCatalogs
- ComplianceAndSecurity
- MasterDataManagement

---

## 🔄 How to Use This File

### **For Research Agents**
1. When starting research, check this file for existing topics
2. Suggest matches from existing topics first
3. If new topic needed, ask user for approval before adding
4. Auto-update this file when new topics are approved

### **For Content Creators**
1. Reference this taxonomy when structuring content
2. Use consistent topic names across research and content
3. Map content to appropriate pillar/path/subtopic levels
4. Propose new topics as needed

### **For Users**
1. Review this taxonomy to understand coverage areas
2. Suggest additions or modifications as needed
3. Approve new topics when research agent requests
4. Keep taxonomy aligned with content strategy

---

## 📝 Adding New Topics

### **Process**
1. Research agent identifies need for new topic during research
2. Agent suggests new topic name and placement in hierarchy
3. User reviews and approves (or suggests alternative)
4. Agent adds to this file with timestamp
5. Agent uses new topic in research frontmatter

### **Naming Conventions**
- **PascalCase** for all topic names (e.g., `PowerQuery`, not `power-query`)
- **Descriptive** and **specific** (e.g., `PowerQueryEditor`, not just `Editor`)
- **Avoid redundancy** (e.g., `DAX`, not `PowerBIDAX` at Learning Path level)
- **Consistent terminology** with industry standards

### **Approval Required**
✅ New Pillar Topics - Significant structural change, discuss first  
✅ New Learning Path Topics - Moderate impact, user approval required  
⚪ New Subtopics - Minor impact, user approval recommended but can be added automatically if clearly within scope

---

## 🗑️ Deprecating Topics

If a topic becomes obsolete or is consolidated:
1. Mark as **[DEPRECATED]** in this file
2. Note replacement topic if applicable
3. Keep for historical research reference
4. Do not use for new research

**Example:**
```
- ~~Snowflake~~ [DEPRECATED - 2025-10-03 - Out of scope per user preference]
```

---

## 📅 Change Log

| Date | Change | Approved By |
|------|--------|-------------|
| 2025-10-03 | Initial taxonomy created with 6 pillars, 30+ learning paths | User |
| 2025-10-03 | Removed: Tableau, Snowflake, AWS per user preference | User |
| 2025-10-03 | Added: DataLiteracy under DataSkills | User |
| 2025-10-04 | Added: DataGeneration pillar and topics | User |

---

**Maintained By**: Research chatmodes (auto-updated with user approval)  
**Review Frequency**: Quarterly or as needed
