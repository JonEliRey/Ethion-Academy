# GitHub Workflows

This directory contains automation workflows for the Ethion Academy project.

## Workflows

### sync-labels.yml
Automatically syncs repository labels from `.github/labels.yml` to GitHub.

**Triggers:**
- Push to main branch when `.github/labels.yml` changes
- Manual trigger via workflow_dispatch

**Setup:**
No additional setup required. Uses default `GITHUB_TOKEN`.

### add-to-project.yml
Automatically adds new issues and pull requests to a GitHub Project.

**Triggers:**
- New issue opened
- New pull request opened

**Setup Required:**
1. Create a GitHub Project for tracking stage gates
2. Generate a Personal Access Token (classic) or fine-grained token with:
   - `project` scope (for classic tokens)
   - Read and write access to projects (for fine-grained tokens)
3. Add the token as a repository secret named `GH_PROJECT_TOKEN`
4. Add the project URL as a repository variable named `PROJECT_URL`
   - Format: `https://github.com/orgs/YOUR_ORG/projects/PROJECT_NUMBER`
   - Or: `https://github.com/users/YOUR_USER/projects/PROJECT_NUMBER`

**To set up:**
```bash
# Add repository variable (requires admin access)
gh variable set PROJECT_URL --body "https://github.com/users/JonEliRey/projects/1"

# Add repository secret (requires admin access)
gh secret set GH_PROJECT_TOKEN --body "YOUR_TOKEN_HERE"
```

### update-project-stage.yml
Updates the Project Stage field based on stage labels applied to issues/PRs.

**Triggers:**
- Label added or removed from pull request
- Label added or removed from issue

**Stage Labels:**
- `stage/pillars` → Pillars
- `stage/paths` → Paths
- `stage/courses` → Courses
- `stage/modules` → Modules
- `stage/lessons` → Lessons

**Setup Required:**
Same as `add-to-project.yml` - requires `GH_PROJECT_TOKEN` secret and `PROJECT_URL` variable.

**Note:** This workflow provides a foundation for stage updates. Full implementation requires:
- Project field ID for the "Stage" field
- Option IDs for each stage value
- These can be obtained via GitHub GraphQL API

## Pull Request Templates

Stage-specific PR templates are available in `.github/PULL_REQUEST_TEMPLATE/`:

- `pillars.md` - For Pillars stage reviews
- `paths.md` - For Learning Paths stage reviews
- `courses.md` - For Courses stage reviews
- `modules.md` - For Modules stage reviews
- `lessons.md` - For Lessons stage reviews

**Usage:**
When creating a PR, you can specify a template:
- Default: `.github/pull_request_template.md`
- Specific stage: Add `?template=pillars.md` to the PR creation URL

## Stage Gate Process

1. Create content for the current stage
2. Create a Draft PR for review
3. Apply the appropriate stage label (e.g., `stage/pillars`)
4. The PR will automatically be added to the project (if configured)
5. The project stage field will update based on the label
6. Request reviews from Executive Producer + SME
7. Upon approval, merge to advance to the next stage

## Labels

Labels are defined in `.github/labels.yml` and synced via the `sync-labels` workflow.

To manually sync labels:
```bash
gh workflow run sync-labels.yml
```
