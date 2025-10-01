# GitHub Project Setup for Ethion Academy

This document outlines how to configure and use GitHub Projects for the stage-gated content development workflow described in the Constitution and Feature Specification (FR-017).

## Overview

The Ethion Academy uses a stage-gated workflow to develop learning content. Each stage requires approval before proceeding to the next level of detail:

1. **Pillars** → High-level strategic direction
2. **Learning Paths** → Structured learning journeys  
3. **Courses** → Specific course outlines
4. **Modules** → Course module details
5. **Lessons** → Individual lesson content

## GitHub Project Configuration

### 1. Create a GitHub Project

1. Navigate to your repository or organization
2. Go to **Projects** tab
3. Click **New project**
4. Choose **Board** view
5. Name it "Ethion Academy Content Pipeline"

### 2. Configure Project Columns

Create columns matching the stage gates:

| Column Name | Purpose | Status |
|------------|---------|---------|
| **Backlog** | New ideas and proposals | - |
| **Pillars Review** | High-level strategic review | Draft PR with `stage/pillars` label |
| **Paths Planning** | Learning path design | Draft PR with `stage/paths` label |
| **Course Design** | Course outline and structure | Draft PR with `stage/courses` label |
| **Module Development** | Module content creation | Draft PR with `stage/modules` label |
| **Lesson Production** | Individual lesson content | Draft PR with `stage/lessons` label |
| **Done** | Approved and merged | PR merged to main |

### 3. Set Up Column Automation

For each stage column:

1. Click the **⋯** menu on the column
2. Select **Manage automation**
3. Configure:
   - **Move to this column when**: Label `stage/[stage]` is added
   - **Move items with status**: Draft PRs
   - **Auto-archive**: When PR is merged, move to Done

### 4. Configure Project Variables

Set the project URL in repository variables:

1. Go to **Settings** → **Secrets and variables** → **Actions** → **Variables**
2. Add a new variable:
   - Name: `PROJECT_URL`
   - Value: Your project URL (e.g., `https://github.com/users/JonEliRey/projects/1`)

### 5. Set Up Personal Access Token (Optional)

For enhanced project automation, create a PAT with project permissions:

1. Go to **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)**
2. Generate new token with these scopes:
   - `repo` (Full control of private repositories)
   - `project` (Full control of projects)
3. Add as repository secret:
   - Name: `PAT_TOKEN`
   - Value: Your PAT

**Note**: The default `GITHUB_TOKEN` will work for basic functionality, but a PAT provides more robust project access.

## Workflow Process

### For Content Creators

1. **Create an issue** using the Pillar Proposal template (or manually for other stages)
2. **Apply the appropriate stage label**: `stage/pillars`, `stage/paths`, etc.
3. The issue is **automatically added to the project** via the `add-to-project` workflow
4. **Create a Draft PR** linked to the issue when ready to start work
5. The PR is **automatically moved** to the correct column based on its stage label
6. **Request reviews** from the Executive Producer and relevant SMEs
7. **Address feedback** and update the PR as needed
8. Once **approved**, the PR advances to the next stage or is merged

### Stage Gate Review Process

Each stage requires:

- ✅ **Executive Producer approval**
- ✅ **Relevant SME review** (when applicable)
- ✅ **All Definition of Done criteria** met (see CONSTITUTION.md)
- ✅ **Evidence and citations** provided
- ✅ **Tags properly applied**

### Enforced Automation

The following workflows run automatically:

#### Sync Labels (`sync-labels.yml`)
- **Trigger**: Push to main affecting `.github/labels.yml` or manual dispatch
- **Purpose**: Syncs repository labels from the YAML configuration
- **Run manually**: Go to Actions → Sync Labels → Run workflow

#### Enforce Stage Label (`enforce-stage-label.yml`)
- **Trigger**: PR opened, labeled, unlabeled, or synchronized
- **Purpose**: Ensures every PR has exactly one stage label
- **Failure**: Blocks PR merge and adds a comment with guidance

#### Add to Project (`add-to-project.yml`)
- **Trigger**: Issue or PR opened with a stage label
- **Purpose**: Automatically adds items to the configured GitHub Project
- **Requires**: `PROJECT_URL` variable configured

## Labels Reference

The following labels are defined in `.github/labels.yml`:

| Label | Color | Description |
|-------|-------|-------------|
| `stage/pillars` | Blue (`0366d6`) | Stage gate — Pillars |
| `stage/paths` | Green (`0e8a16`) | Stage gate — Learning Paths |
| `stage/courses` | Yellow (`fbca04`) | Stage gate — Courses |
| `stage/modules` | Purple (`7057ff`) | Stage gate — Modules |
| `stage/lessons` | Red (`d93f0b`) | Stage gate — Lessons |

## Best Practices

### Draft PRs for Stage Gates
- Always create PRs as **Drafts** initially
- Convert to "Ready for review" only when all criteria are met
- Link related issues with "Closes #X" in the PR description

### Approval Flow
1. **Pillars** → Executive Producer must approve strategic direction
2. **Paths/Courses** → EP + Content Strategist or SME
3. **Modules/Lessons** → EP + SME + (optionally) Scriptwriter/Editor

### Moving Between Stages
- **Approval** → Merge or convert the PR and create new PR for next stage
- **Rejection** → Add comments with required changes, move card back to previous column
- **On hold** → Convert to draft, remove from active columns

### Content Freshness Monitoring
- Items with `freshness-tier: fast` → Review every 90 days
- Items with `freshness-tier: standard` → Review every 180 days
- Create review tickets automatically when SLA approaches

## Troubleshooting

### Issues not appearing in project
1. Check that `PROJECT_URL` variable is set correctly
2. Verify the issue/PR has a valid stage label
3. Ensure the `add-to-project` workflow ran successfully

### PR merge blocked by stage label check
1. Add exactly one stage label from: `stage/pillars`, `stage/paths`, `stage/courses`, `stage/modules`, `stage/lessons`
2. Remove any duplicate stage labels
3. Wait for the workflow check to re-run

### Labels not syncing
1. Run the "Sync Labels" workflow manually from the Actions tab
2. Check that `.github/labels.yml` is properly formatted
3. Verify the workflow has appropriate permissions

## Related Documentation

- **Constitution**: `/CONSTITUTION.md` - Rules for hierarchy, tagging, and Definition of Done
- **Feature Spec**: `/specs/001-i-need-to/spec.md` - Super-Intelligent Course Designer Workflow
- **Project Plan**: `/docs/course-designer-workflow/super-intelligent-course-designer/plan/project-plan.md`
- **PR Template**: `/.github/PULL_REQUEST_TEMPLATE.md`
- **Issue Templates**: `/.github/ISSUE_TEMPLATE/`

## Quick Reference Commands

```bash
# Sync labels manually (after updating labels.yml)
gh workflow run sync-labels.yml

# List all PRs with stage labels
gh pr list --label "stage/pillars,stage/paths,stage/courses,stage/modules,stage/lessons"

# View project board
gh project list
gh project view <PROJECT_NUMBER>

# Create a pillar proposal issue
gh issue create --template pillar-proposal.yml
```

## Support

For questions or issues with the GitHub Project setup:
1. Review this documentation
2. Check the workflow run logs in the Actions tab
3. Consult the Constitution and Feature Specification
4. Contact the Executive Producer (@JonEliRey)
