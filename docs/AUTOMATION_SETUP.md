# Project Automation Setup Guide

This guide covers the setup and verification of GitHub Project automation for the Ethion Academy stage-gate workflow.

## Overview

The automation system consists of:
1. **Label synchronization** - Syncs stage labels to the repository
2. **Project integration** - Auto-adds issues/PRs to GitHub Project
3. **Stage field updates** - Updates project stage based on labels
4. **PR templates** - Stage-specific templates for reviews

## Verification Checklist

### ✅ Step 1: Push workflows/templates/labels to main

The following files have been added to the repository:

**Workflows:**
- `.github/workflows/sync-labels.yml` - Syncs labels from config
- `.github/workflows/add-to-project.yml` - Auto-adds items to project
- `.github/workflows/update-project-stage.yml` - Updates stage field from labels

**Templates:**
- `.github/pull_request_template.md` - Default PR template
- `.github/PULL_REQUEST_TEMPLATE/pillars.md` - Pillars stage template
- `.github/PULL_REQUEST_TEMPLATE/paths.md` - Paths stage template
- `.github/PULL_REQUEST_TEMPLATE/courses.md` - Courses stage template
- `.github/PULL_REQUEST_TEMPLATE/modules.md` - Modules stage template
- `.github/PULL_REQUEST_TEMPLATE/lessons.md` - Lessons stage template

**Labels Configuration:**
- `.github/labels.yml` - Stage label definitions (already exists)

**Documentation:**
- `.github/workflows/README.md` - Workflow documentation

### ⏳ Step 2: Run Sync Labels workflow

After merging this PR to main:

1. **Automatic sync**: The workflow will run automatically when `.github/labels.yml` changes
2. **Manual sync**: You can trigger it manually:
   ```bash
   gh workflow run sync-labels.yml
   ```

Expected labels to be created:
- `stage/pillars` (blue #0366d6) - Stage gate — Pillars
- `stage/paths` (green #0e8a16) - Stage gate — Learning Paths
- `stage/courses` (yellow #fbca04) - Stage gate — Courses
- `stage/modules` (purple #7057ff) - Stage gate — Modules
- `stage/lessons` (red #d93f0b) - Stage gate — Lessons

### ⏳ Step 3: Create Draft PR with `stage/pillars` and verify labels

After labels are synced:

1. Create a test Draft PR:
   ```bash
   # Create a test branch
   git checkout -b test/stage-pillars-verification
   
   # Make a small change
   echo "# Test Pillars Stage" > test-pillars.md
   git add test-pillars.md
   git commit -m "test: verify stage/pillars label"
   git push origin test/stage-pillars-verification
   
   # Create draft PR
   gh pr create --draft --title "Test: Pillars Stage Verification" \
     --body "Testing stage/pillars label application" \
     --label "stage/pillars"
   ```

2. Verify the following:
   - [ ] PR is created as draft
   - [ ] `stage/pillars` label is applied
   - [ ] PR template is available (use `?template=pillars.md` in URL)

### ⏳ Step 4: Confirm Project field Stage updates from label

**Prerequisites:** 
This step requires a GitHub Project to be set up and configured.

#### Setup GitHub Project

1. **Create a GitHub Project:**
   - Go to https://github.com/users/JonEliRey/projects (or your org)
   - Click "New project"
   - Choose "Table" or "Board" view
   - Name it "Course Designer Workflow" (or similar)

2. **Add a Stage field:**
   - In the project, click "+ New field"
   - Name it "Stage"
   - Type: "Single select"
   - Add options:
     - Pillars
     - Paths
     - Courses
     - Modules
     - Lessons

3. **Configure columns (for Board view):**
   - Pillars
   - Paths
   - Courses
   - Modules
   - Lessons
   - Done

#### Configure Repository

1. **Generate a token:**
   ```bash
   # Create a fine-grained personal access token with:
   # - Repository access: This repository
   # - Permissions: Read and write access to projects
   # Or use a classic token with 'project' scope
   ```

2. **Set repository secret and variable:**
   ```bash
   # Set the project URL (replace with your project URL)
   gh variable set PROJECT_URL --body "https://github.com/users/JonEliRey/projects/1"
   
   # Set the project token
   gh secret set GH_PROJECT_TOKEN
   # Paste your token when prompted
   ```

3. **Verify configuration:**
   ```bash
   # Check variable is set
   gh variable list
   
   # Check secret is set (won't show value)
   gh secret list
   ```

#### Test Project Integration

1. Create a new issue or PR (will auto-add to project via `add-to-project.yml`)
2. Apply a stage label (e.g., `stage/pillars`)
3. Verify:
   - [ ] Item is added to the project automatically
   - [ ] Stage field is updated based on the label (via `update-project-stage.yml`)

**Note:** The `update-project-stage.yml` workflow provides the foundation for stage updates. Full GraphQL implementation may require additional configuration based on your specific project structure.

### ⏳ Step 5: Auto-add to Project (Pending Configuration)

**Status:** Workflow is in place but requires configuration.

**Required Actions:**
1. ✅ Workflow file created (`.github/workflows/add-to-project.yml`)
2. ⏳ Set `PROJECT_URL` repository variable
3. ⏳ Set `GH_PROJECT_TOKEN` repository secret

**Once configured:**
- New issues will automatically be added to the project
- New PRs will automatically be added to the project
- Stage labels will trigger project field updates

## Usage Guide

### Creating Stage-Gate PRs

1. **Choose the appropriate template:**
   - Pillars: `?template=pillars.md`
   - Paths: `?template=paths.md`
   - Courses: `?template=courses.md`
   - Modules: `?template=modules.md`
   - Lessons: `?template=lessons.md`

2. **Apply the matching stage label:**
   ```bash
   gh pr edit <PR_NUMBER> --add-label "stage/pillars"
   ```

3. **Request required reviews:**
   - Executive Producer
   - Subject Matter Expert

4. **Complete the template checklist** before requesting review

### Advancing Through Stages

1. Get approval from required reviewers
2. Merge the PR
3. Create a new PR for the next stage
4. Apply the next stage label
5. Process repeats: Pillars → Paths → Courses → Modules → Lessons

## Troubleshooting

### Labels not syncing
- Check workflow run logs: `gh workflow view sync-labels.yml`
- Verify `.github/labels.yml` syntax
- Ensure `GITHUB_TOKEN` has `issues: write` permission

### Items not added to project
- Verify `PROJECT_URL` variable is set correctly
- Verify `GH_PROJECT_TOKEN` secret is set and has correct permissions
- Check workflow runs: `gh run list --workflow=add-to-project.yml`

### Stage field not updating
- Ensure project has a "Stage" field with matching option names
- Verify token has project write permissions
- Check workflow logs for errors

## References

- [GitHub Actions: Add to Project](https://github.com/actions/add-to-project)
- [GitHub Actions: GitHub Script](https://github.com/actions/github-script)
- [GitHub Labeler Action](https://github.com/crazy-max/ghaction-github-labeler)
- [GitHub Projects Documentation](https://docs.github.com/en/issues/planning-and-tracking-with-projects)
