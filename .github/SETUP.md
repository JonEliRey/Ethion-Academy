# Setup Guide for GitHub Automations

This guide walks you through setting up the GitHub automations for the stage-gated workflow.

## Prerequisites

- Repository admin access
- GitHub Projects enabled for your account/organization

## Step 1: Create GitHub Project

1. Navigate to your GitHub profile → Projects
2. Click "New project"
3. Choose "Board" view
4. Name it "Ethion Academy Stage Gates" (or similar)
5. Create columns matching the stage gates:
   - **Pillars** - Initial high-level content pillars
   - **Learning Paths** - Learning path definitions
   - **Courses** - Course outlines and structure
   - **Modules** - Module breakdowns
   - **Lessons** - Detailed lesson plans

## Step 2: Configure Project URL

1. After creating your project, note its URL (e.g., `https://github.com/users/USERNAME/projects/1`)
2. Update `.github/workflows/auto-project-linker.yml`:
   - Find the `project-url` field
   - Replace with your project's URL
   - Commit the change

## Step 3: Sync Labels

Labels should already be defined in `.github/labels.yml`. To sync them to your repository:

**Option A: Automatic (when merged to main)**
- Labels will sync automatically when changes to `labels.yml` are pushed to main

**Option B: Manual trigger**
1. Go to Actions → "Sync Labels"
2. Click "Run workflow"
3. Select branch (usually `main`)
4. Click "Run workflow"

**Option C: Using GitHub CLI**
```bash
gh workflow run sync-labels.yml
```

## Step 4: Verify CODEOWNERS

1. Review `.github/CODEOWNERS`
2. Update usernames to match your team:
   - Replace `@JonEliRey` with appropriate reviewers
   - Add SMEs for specific domains as needed
3. Ensure branch protection rules require code owner reviews (optional but recommended)

## Step 5: Test the Workflow

### Test 1: Create a Stage Gate Issue
1. Go to Issues → New Issue
2. Select "Stage Gate Review" template
3. Fill in the form for "Pillars" stage
4. Submit the issue
5. Add label `stage/pillars`
6. Verify the issue appears in your project

### Test 2: Create a Draft PR
1. Create a test branch:
   ```bash
   git checkout -b test/stage-pillars
   echo "# Test Pillar" > test-pillar.md
   git add test-pillar.md
   git commit -m "test: add test pillar"
   git push origin test/stage-pillars
   ```
2. Open a PR from GitHub UI
3. The PR template should auto-populate
4. Check the "Pillars" stage checkbox
5. Add label `stage/pillars`
6. Mark as draft
7. Verify the PR appears in your project under "Pillars" column

### Test 3: Verify CODEOWNERS
1. Using the test PR from above
2. Check if the appropriate reviewers are automatically requested
3. If not, verify branch protection settings

## Step 6: Project Automation (Optional)

For advanced automation, configure GitHub Project workflows:

1. Go to your Project → Settings → Workflows
2. Add workflow: "Auto-add to project"
   - Trigger: When items are labeled
   - Filters: Labels matching `stage/*`
3. Add workflow: "Auto-archive on close"
   - Trigger: When PR is closed/merged
   - Action: Archive the item

## Troubleshooting

### Labels not syncing
- Check if workflow has correct permissions (`issues: write`)
- Verify `labels.yml` syntax is valid
- Review workflow run logs in Actions tab

### Items not linking to project
- Verify project URL in `auto-project-linker.yml`
- Check if workflow has permissions for projects
- May need to use a Personal Access Token (PAT) instead of `GITHUB_TOKEN` for user projects
  - Create PAT with `project` scope
  - Add as repository secret named `PROJECT_TOKEN`
  - Update workflow to use `${{ secrets.PROJECT_TOKEN }}`

### CODEOWNERS not working
- Ensure branch protection is enabled on main
- Verify "Require review from Code Owners" is checked in branch protection settings
- CODEOWNERS users must have write access to repository

## Next Steps

Once setup is complete:

1. Review and familiarize with [README.md](README.md) for usage guidelines
2. Review the [Constitution](../CONSTITUTION.md) for content requirements
3. Start creating stage-gated content following the workflow in the [Feature Spec](../specs/001-i-need-to/spec.md)

## Support

For issues with the workflows or templates:
- Open an issue using the "Bug Report" template
- Review existing issues for similar problems
- Check GitHub Actions logs for workflow errors
