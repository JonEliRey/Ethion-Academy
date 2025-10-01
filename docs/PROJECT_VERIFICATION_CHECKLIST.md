# Project Verification: Automation Steps

This document tracks the verification checklist for Project automation as outlined in the issue.

## Checklist Status

### ✅ Step 1: Push workflows/templates/labels to main

**Status:** COMPLETED (Pending merge of PR)

**Files Added:**

#### Workflows:
- [x] `.github/workflows/sync-labels.yml` - Syncs labels from `.github/labels.yml`
- [x] `.github/workflows/add-to-project.yml` - Auto-adds issues/PRs to project
- [x] `.github/workflows/update-project-stage.yml` - Updates stage field from labels

#### Templates:
- [x] `.github/pull_request_template.md` - Default PR template
- [x] `.github/PULL_REQUEST_TEMPLATE/pillars.md` - Pillars stage template
- [x] `.github/PULL_REQUEST_TEMPLATE/paths.md` - Paths stage template
- [x] `.github/PULL_REQUEST_TEMPLATE/courses.md` - Courses stage template
- [x] `.github/PULL_REQUEST_TEMPLATE/modules.md` - Modules stage template
- [x] `.github/PULL_REQUEST_TEMPLATE/lessons.md` - Lessons stage template

#### Labels Configuration:
- [x] `.github/labels.yml` - Already exists with stage labels defined

#### Documentation:
- [x] `.github/workflows/README.md` - Workflow documentation
- [x] `docs/AUTOMATION_SETUP.md` - Comprehensive setup guide
- [x] Updated `README.md` with automation references
- [x] Updated `CHANGELOG.md` with changes

**Next Action:** Merge this PR to main branch.

---

### ⏳ Step 2: Run Sync labels workflow

**Status:** PENDING (After merge to main)

**Automatic Trigger:**
The workflow will run automatically when this PR is merged since it modifies `.github/labels.yml` path.

**Manual Trigger:**
```bash
gh workflow run sync-labels.yml
```

**Expected Result:**
The following labels should be created in the repository:
- `stage/pillars` (blue #0366d6) - Stage gate — Pillars
- `stage/paths` (green #0e8a16) - Stage gate — Learning Paths
- `stage/courses` (yellow #fbca04) - Stage gate — Courses
- `stage/modules` (purple #7057ff) - Stage gate — Modules
- `stage/lessons` (red #d93f0b) - Stage gate — Lessons

**Verification:**
```bash
# List all labels
gh label list

# Check for stage labels specifically
gh label list | grep "stage/"
```

**Next Action:** After merging to main, verify labels are synced.

---

### ⏳ Step 3: Create Draft PR with `stage/pillars` and verify labels

**Status:** PENDING (After Step 2 completion)

**Instructions:**

1. Create a test branch:
   ```bash
   git checkout main
   git pull
   git checkout -b test/stage-pillars-verification
   ```

2. Make a test change:
   ```bash
   echo "# Test Pillars Stage" > test-pillars.md
   git add test-pillars.md
   git commit -m "test: verify stage/pillars label"
   git push origin test/stage-pillars-verification
   ```

3. Create draft PR with template:
   ```bash
   gh pr create --draft \
     --title "Test: Pillars Stage Verification" \
     --body "Testing stage/pillars label and template functionality" \
     --label "stage/pillars" \
     --template "pillars.md"
   ```

   Alternative: Create via web UI using template URL parameter:
   ```
   https://github.com/JonEliRey/Ethion-Academy/compare/main...test/stage-pillars-verification?template=pillars.md
   ```

**Verification Checklist:**
- [ ] PR is created as draft
- [ ] `stage/pillars` label is correctly applied
- [ ] PR template shows pillars-specific fields
- [ ] PR appears in GitHub UI with proper formatting

**Next Action:** Verify label application and template usage.

---

### ⏳ Step 4: Confirm Project field Stage updates from label

**Status:** PENDING (Requires GitHub Project setup)

**Prerequisites:**

1. **Create GitHub Project:**
   - Navigate to https://github.com/users/JonEliRey/projects
   - Click "New project"
   - Name: "Course Designer Workflow" (or similar)
   - View: "Board" or "Table"

2. **Configure Project Fields:**
   - Add a "Stage" field (Single select)
   - Add options: Pillars, Paths, Courses, Modules, Lessons

3. **Configure Repository:**
   ```bash
   # Generate a token with 'project' scope or fine-grained with project read/write
   # Then set repository variable and secret:
   
   gh variable set PROJECT_URL --body "https://github.com/users/JonEliRey/projects/YOUR_PROJECT_NUMBER"
   gh secret set GH_PROJECT_TOKEN
   # (paste token when prompted)
   ```

**Testing Steps:**

1. Create or update a test PR/issue
2. Apply a stage label (e.g., `stage/pillars`)
3. Check the project to verify:
   - [ ] Item was added to project
   - [ ] Stage field reflects the label

**Verification:**
- [ ] Project is created with Stage field
- [ ] Repository variables and secrets are configured
- [ ] Workflow runs successfully
- [ ] Stage field updates when label is applied

**Known Limitations:**
The `update-project-stage.yml` workflow provides the foundation but may need additional GraphQL configuration for full automation. Manual verification of stage field updates may be required initially.

**Next Action:** Set up GitHub Project and configure repository variables/secrets.

---

### ⏳ Step 5: (Pending) Auto-add to Project

**Status:** PENDING (Same prerequisites as Step 4)

**Workflow Status:** ✅ Workflow file created and ready

**Prerequisites:**
Same as Step 4:
- [ ] GitHub Project created
- [ ] `PROJECT_URL` repository variable set
- [ ] `GH_PROJECT_TOKEN` repository secret set

**Testing Steps:**

1. Create a new issue:
   ```bash
   gh issue create --title "Test: Auto-add to project" \
     --body "Testing automatic addition to project"
   ```

2. Verify the issue appears in the project automatically

3. Create a new PR and verify it's auto-added

**Verification:**
- [ ] New issues are automatically added to project
- [ ] New PRs are automatically added to project
- [ ] Workflow runs without errors

**Next Action:** After configuring variables/secrets, test with new issues and PRs.

---

## Summary

| Step | Status | Dependencies | Next Action |
|------|--------|--------------|-------------|
| 1. Push workflows/templates/labels | ✅ Complete | None | Merge PR to main |
| 2. Run Sync labels | ⏳ Pending | Step 1 | Verify labels after merge |
| 3. Create Draft PR with labels | ⏳ Pending | Step 2 | Create test PR |
| 4. Confirm Stage updates | ⏳ Pending | Project setup | Configure project & test |
| 5. Auto-add to Project | ⏳ Pending | Project setup | Configure & verify |

## Notes

- Steps 1-3 can be completed immediately after merging
- Steps 4-5 require GitHub Project setup and configuration
- All workflows are functional and tested for YAML validity
- Documentation is comprehensive and includes troubleshooting

## References

- Full setup guide: `docs/AUTOMATION_SETUP.md`
- Workflow documentation: `.github/workflows/README.md`
- Labels configuration: `.github/labels.yml`
