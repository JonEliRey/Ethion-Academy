# GitHub Configuration

This directory contains GitHub-specific configuration files for the Ethion Academy repository.

## Workflows

The repository uses GitHub Actions workflows for automation:

- **sync-labels.yml**: Synchronizes labels from `.github/labels.yml` to the repository
- **add-to-project.yml**: Automatically adds new issues and PRs to the project board
- **stage-automation.yml**: Manages project status based on stage labels

## Required Configuration

### Repository Variables

Configure these in Settings → Secrets and variables → Actions → Variables:

- **PROJECT_URL**: URL of the GitHub Project board
  - Example: `https://github.com/users/JonEliRey/projects/1`
  - Required for: add-to-project and stage-automation workflows

### Repository Secrets

Configure these in Settings → Secrets and variables → Actions → Secrets:

- **GH_PROJECT_TOKEN** (optional): Personal Access Token with `repo` and `project` permissions
  - Only needed if the default `GITHUB_TOKEN` lacks permission to manage the project
  - Create a classic PAT at: https://github.com/settings/tokens
  - Required permissions: `repo`, `project`
  - If not provided, workflows will fall back to `GITHUB_TOKEN`

## Labels

The `labels.yml` file defines stage gate labels that map to project columns:

- `stage/pillars` - Stage gate for Pillars
- `stage/paths` - Stage gate for Learning Paths
- `stage/courses` - Stage gate for Courses
- `stage/modules` - Stage gate for Modules
- `stage/lessons` - Stage gate for Lessons

## Testing Automation

After setting up variables and secrets:

1. **Test label sync**: Run the "Sync Labels" workflow manually or push a change to `.github/labels.yml`
2. **Test project automation**: Open a draft PR with a stage label (e.g., `stage/paths`) to validate that it's added to the project and status is updated correctly
