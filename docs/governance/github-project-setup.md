# GitHub Project Setup (Stage Gates)

Goal: One Project (Projects v2) to track stage-gated flow — Pillars → Paths → Courses → Modules → Lessons.

## Create the Project
1. Go to your GitHub profile → Projects → New project
2. Name: "Ethion Academy Workflow" (or similar). Type: Table or Board view
3. Fields:
  - Status (workflow): To do, In progress, Review, Done
  - Stage (enumeration): Pillar, Path, Course, Module, Lesson
  - Audience Role (single-select): Analyst, Engineer, Manager
  - Audience Level (single-select): Beginner, Intermediate, Advanced
  - SLA Due (date) — optional
  
  Audience modeling options:
  - Preferred: Set Audience Role and Audience Level via Project fields (single-selects). For multiple segments, also apply labels (see below).
  - Alternative: Use a combined "Audience Segment" single-select (e.g., Analyst-Beginner, Engineer-Intermediate). Keeps fields simple but grows options list.
  - For multi-segment items: apply labels like `role/analyst`, `role/engineer`, and `level/beginner` to represent additional segments.
4. Create views filtered by Stage or Status (e.g., a board grouped by Status with filters per Stage)

## Wire the Repo to the Project
- Repo variable: PROJECT_URL set to the project URL (use your actual URL: https://github.com/users/JonEliRey/projects/1)
- Secret: GH_PROJECT_TOKEN — classic PAT with repo + project access (needed if GITHUB_TOKEN can’t add to Projects v2)

The workflow .github/workflows/add-to-project.yml will add issues/PRs to the Project when opened or labeled.

## Labels & Automation
- Labels are defined in .github/labels.yml; run the "Sync labels" workflow once (or push a change to labels.yml)
- Inside the Project UI, add automation rules (Settings → Workflows):
  - When label "stage/pillars" is added → set Stage = Pillar
  - When label "stage/paths" is added → set Stage = Path
  - When label "stage/courses" is added → set Stage = Course
  - When label "stage/modules" is added → set Stage = Module
  - When label "stage/lessons" is added → set Stage = Lesson
  - When PR is opened → set Status = In progress (optional)
  - When PR is approved → set Status = Review
  - When PR is merged → set Status = Done

## Hierarchy and Tasks
- Treat Stage as an attribute of work, not a Status. Status tracks progress (To do → Done); Stage indicates the level (Pillar/Path/Course/Module/Lesson).
- Use parent/child relationships to model hierarchy:
  - Parent issue/PR for a Pillar
  - Child issues for Paths under that Pillar
  - Child issues for Courses under each Path, and so on
- Each Stage may have its own subtasks (e.g., evidence gathering, audience declaration, SEO brief, Leader’s Lens review).

## PR Template & Enforcement
- PULL_REQUEST_TEMPLATE.md enforces stage checklist
- enforce-stage-label workflow fails PRs without a stage label

## Recommended Branch Protection
- Protect main; require PRs, require status checks (label enforcement), and code owner review
- Optionally require approving review from @JonEliRey

## Verification Checklist
- Project access: Open https://github.com/users/JonEliRey/projects/1 and confirm you can view/edit. For collaborators, use “Manage access” on the Project to grant permissions.
- Repo variable: In repo Settings → Secrets and variables → Actions → Variables, add PROJECT_URL = https://github.com/users/JonEliRey/projects/1
- Secret: In repo Settings → Secrets and variables → Actions → Secrets, add GH_PROJECT_TOKEN with classic PAT (repo + project scopes) if needed.
- Labels: Run the “Sync labels” workflow (Actions tab) or push a change to .github/labels.yml
- Test automation:
  1) Open a new Draft PR and apply a stage label (e.g., stage/pillars)
  2) Confirm the PR appears in the Project and Stage is set from the label
  3) Approve the PR to see Status move to Review; merge to Done
