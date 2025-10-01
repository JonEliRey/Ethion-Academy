# Setting Up Project Automation

This guide walks through the steps to enable GitHub Projects automation for the Ethion Academy repository.

## Prerequisites

1. A GitHub Project board (e.g., https://github.com/users/JonEliRey/projects/1)
2. Repository admin access to configure variables and secrets

## Step 1: Configure Repository Variable

1. Navigate to your repository on GitHub
2. Go to **Settings** → **Secrets and variables** → **Actions** → **Variables** tab
3. Click **New repository variable**
4. Add the following:
   - **Name**: `PROJECT_URL`
   - **Value**: `https://github.com/users/JonEliRey/projects/1` (or your project URL)
5. Click **Add variable**

## Step 2: Configure Repository Secret (Optional)

> **Note**: This step is only needed if the default `GITHUB_TOKEN` doesn't have permission to manage your project. Try skipping this step first and only add it if the workflows fail with permission errors.

1. Go to https://github.com/settings/tokens
2. Click **Generate new token** → **Generate new token (classic)**
3. Give it a descriptive name (e.g., "Ethion Academy Project Automation")
4. Select the following scopes:
   - `repo` (Full control of private repositories)
   - `project` (Full control of projects)
5. Click **Generate token** and copy it immediately
6. Navigate to your repository on GitHub
7. Go to **Settings** → **Secrets and variables** → **Actions** → **Secrets** tab
8. Click **New repository secret**
9. Add the following:
   - **Name**: `GH_PROJECT_TOKEN`
   - **Value**: (paste the token you copied)
10. Click **Add secret**

## Step 3: Test Label Sync

1. Navigate to **Actions** tab in your repository
2. Find the **Sync Labels** workflow
3. Click **Run workflow** → **Run workflow**
4. Wait for the workflow to complete
5. Check **Issues** → **Labels** to verify that the stage labels were created

## Step 4: Test Project Automation

1. Create a new draft PR or issue
2. Add a stage label (e.g., `stage/paths`)
3. Check that:
   - The item is automatically added to your project board
   - The status/column is updated based on the label

## Workflow Details

### sync-labels.yml
- **Trigger**: Push to main (when `.github/labels.yml` changes) or manual dispatch
- **Purpose**: Syncs labels from `.github/labels.yml` to the repository
- **Permissions**: Uses `GITHUB_TOKEN`

### add-to-project.yml
- **Trigger**: Issues/PRs opened, labeled, or marked ready for review
- **Purpose**: Automatically adds new items to the project board
- **Permissions**: Uses `GH_PROJECT_TOKEN` (if available) or `GITHUB_TOKEN`

### stage-automation.yml
- **Trigger**: Issues/PRs labeled or unlabeled with `stage/*` labels
- **Purpose**: Updates project status/column based on stage labels
- **Permissions**: Uses `GH_PROJECT_TOKEN` (if available) or `GITHUB_TOKEN`

## Stage Labels

The following stage labels are defined in `.github/labels.yml`:

- `stage/pillars` - Stage gate for Pillars
- `stage/paths` - Stage gate for Learning Paths
- `stage/courses` - Stage gate for Courses
- `stage/modules` - Stage gate for Modules
- `stage/lessons` - Stage gate for Lessons

## Troubleshooting

### Workflows fail with permission errors
- Add the `GH_PROJECT_TOKEN` secret as described in Step 2

### Labels not syncing
- Verify the `sync-labels.yml` workflow ran successfully
- Check that `.github/labels.yml` is valid YAML

### Items not added to project
- Verify `PROJECT_URL` variable is set correctly
- Check that the project URL is accessible
- Review workflow logs in the Actions tab

## Next Steps

After setup is complete:

1. Create project columns matching the stage gates (Pillars, Paths, Courses, Modules, Lessons)
2. Set up required reviewers (Executive Producer + SME)
3. Configure project automation rules to move cards between columns based on PR status
4. Test the full workflow by creating a draft PR for each stage

## Related Documentation

- `.github/README.md` - GitHub configuration overview
- `specs/001-i-need-to/spec.md` - Feature specification for the course designer workflow
- `docs/course-designer-workflow/super-intelligent-course-designer/plan/project-plan.md` - Project plan
