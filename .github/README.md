# GitHub Automation and Templates

This directory contains GitHub-specific automation workflows, issue/PR templates, and configuration files to support the stage-gated content development workflow.

## 🔄 Workflows

### sync-labels.yml
Automatically syncs repository labels from `labels.yml` to ensure consistent stage gate labels across the repository.

**Triggers:**
- Push to main when `labels.yml` changes
- Manual trigger via workflow_dispatch

**Labels managed:**
- `stage/pillars` - Stage gate for Pillars
- `stage/paths` - Stage gate for Learning Paths
- `stage/courses` - Stage gate for Courses
- `stage/modules` - Stage gate for Modules
- `stage/lessons` - Stage gate for Lessons

### auto-project-linker.yml
Automatically links PRs and issues to the GitHub Project when they are labeled with stage gate labels.

**Triggers:**
- PR opened, labeled, or reopened
- Issue opened, labeled, or reopened

**Note:** Requires the project URL to be configured for your organization/user.

## 📋 Issue Templates

### Stage Gate Review (stage-gate.yml)
Use this template to request review and approval for stage-gated deliverables. Each stage (Pillars → Paths → Courses → Modules → Lessons) should create an issue using this template.

**Key fields:**
- Stage selection
- Evidence & rationale with citations
- Tags (topic, level, role, format)
- Definition of Done checklist

### Content Update Alert (content-update.yml)
Flag content that needs updating due to source changes or freshness SLA breaches (90/180 day windows).

**Key fields:**
- Update type (source changes, SLA breach, etc.)
- Affected content identification
- Priority level
- Impact map

### Bug Report (bug-report.yml)
Report issues with repository, workflows, or content.

### Feature Request (feature-request.yml)
Suggest new features or enhancements to the workflow.

## 🔀 Pull Request Template

The PR template (PULL_REQUEST_TEMPLATE.md) guides contributors through the stage-gated review process.

**Key sections:**
- Stage gate identification
- Evidence & rationale
- Content inventory impact
- Definition of Done checklist
- Executive Producer notes

## 👥 CODEOWNERS

The CODEOWNERS file defines required reviewers for different parts of the repository:
- Specifications (`/specs/`) require Executive Producer review
- Documentation (`/docs/`) requires Executive Producer review
- Content inventory requires approval
- Constitution changes require review

## 📖 Usage Guide

### Creating a Stage Gate Review

1. Navigate to Issues → New Issue
2. Select "Stage Gate Review" template
3. Fill in all required fields:
   - Select the appropriate stage
   - Provide evidence and citations
   - List applicable tags
   - Describe deliverables
   - Check Definition of Done items
4. Submit and wait for Executive Producer review

### Creating a Draft PR

1. Create your changes in a feature branch
2. Open a PR (template will auto-populate)
3. Select the appropriate stage gate checkbox
4. Add stage label (e.g., `stage/pillars`)
5. The PR will automatically link to the project
6. Complete the checklist and request review

### Syncing Labels

Labels are automatically synced when `labels.yml` is updated on main. To manually trigger:

1. Go to Actions → Sync Labels
2. Click "Run workflow"
3. Select main branch
4. Click "Run workflow"

## 🔗 Integration with GitHub Projects

The workflows are designed to work with GitHub Projects (beta/v2):

1. Create a project with columns matching stage gates:
   - Pillars
   - Learning Paths
   - Courses
   - Modules
   - Lessons

2. Configure the `auto-project-linker.yml` workflow with your project URL

3. As PRs/issues are labeled with stage tags, they automatically appear in the project

4. Move cards across columns as they progress through review and approval

## 📚 References

- [Constitution](../CONSTITUTION.md) - Core principles and rules
- [Feature Spec](../specs/001-i-need-to/spec.md) - Super-Intelligent Course Designer Workflow
- [GitHub Projects Documentation](https://docs.github.com/en/issues/planning-and-tracking-with-projects)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
