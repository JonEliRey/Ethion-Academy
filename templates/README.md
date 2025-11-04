# Content Templates

**Purpose:** Reusable templates for creating structured, consistent content at all hierarchy levels.

## Available Templates

### MVP Templates (Ready to Use)
- **[pillar-template.md](pillar-template.md)** - Top-level content area definition
- **[learning-path-template.md](learning-path-template.md)** - Structured learning journey

### Future Templates (Available When Needed)
- **[course-template.md](course-template.md)** - Grouped modules covering specific skills
- **[module-template.md](module-template.md)** - Topic grouping within courses
- **[lesson-template.md](lesson-template.md)** - Individual learning units

## How to Use Templates

### Creating a Pillar
1. Copy `pillar-template.md` to `content-inventory/pillars/pillar-[name].md`
2. Replace all `[PLACEHOLDER]` text with actual content
3. Follow frontmatter schema from `.github/instructions/content.md`
4. Complete all required sections (Overview, Scope, Target Audience, Key Outcomes)
5. Get SME validation before marking as "approved"

### Creating a Learning Path
1. Ensure parent pillar exists and is approved
2. Copy `learning-path-template.md` to `content-inventory/pillars/[pillar-name]/learning-paths/path-[name].md`
3. Replace all `[PLACEHOLDER]` text
4. Map to parent pillar via `pillar_id` in frontmatter
5. Define clear prerequisites and learning progression

## Template Standards

### Frontmatter Requirements
All templates include YAML frontmatter with:
- **Required fields** - Cannot be omitted
- **Status values** - Must use canonical values (draft, in-review, approved, published, archived)
- **Tag categories** - Must follow taxonomy (see `.github/instructions/content.md`)

### Placeholder Format
- Use `[UPPERCASE PLACEHOLDER TEXT]` for sections requiring user input
- Include inline comments `<!-- guidance -->` where helpful
- Provide examples in comments to clarify intent

### Completeness Checklist
Each template includes a review checklist at the bottom to verify all requirements are met before marking content ready for review.

## Customization Guidelines

### When to Modify Templates
- **Add sections** - If new content type requires additional structure
- **Remove sections** - If section proves unnecessary during pilot
- **Clarify guidance** - If placeholders are confusing

### When NOT to Modify Templates
- **Don't remove required frontmatter fields**
- **Don't change naming conventions** (breaks tooling)
- **Don't deviate from approved tag taxonomy**

## Workflow Integration

Templates are designed to work with agent workflows:
1. **Content Strategist** - Uses pillar and learning path templates
2. **SME** - Validates content against template requirements
3. **Librarian** - Extracts frontmatter for database cataloging

See `docs/workflows/` for complete workflow documentation.

---

*Templates evolve based on pilot feedback. Document suggested improvements in `docs/decisions/`.*
