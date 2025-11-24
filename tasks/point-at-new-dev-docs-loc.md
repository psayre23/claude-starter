Status: Not Started

## Problem:
The MD files talk about dev docs at `./dev`, but they have since been moved to `./.dev-docs`.

## Solution
Update the documentation to point to the new location of the development docs at `./.dev-docs`.

## Plan

### Files Requiring Updates

Based on exploration, 6 template files in the `/src` directory need updates:

#### 1. src/.claude/agents/codebase-reviewer.md
- **Line 134**: `./dev/reviews/codebase-review-[YYYY-MM-DD].md`
- **Update to**: `./.dev-docs/reviews/codebase-review-[YYYY-MM-DD].md`

#### 2. src/.claude/agents/branch-code-reviewer.md
- **Line 108**: `./dev/reviews/[branch-name]-code-review.md`
- **Update to**: `./.dev-docs/reviews/[branch-name]-code-review.md`

#### 3. src/.claude/agents/code-architecture-reviewer.md
- **Line 21**: `./dev/active/[task-name]/`
- **Update to**: `./.dev-docs/active/[task-name]/`
- **Line 65**: `./dev/active/[task-name]/[task-name]-code-review.md`
- **Update to**: `./.dev-docs/active/[task-name]/[task-name]-code-review.md`

#### 4. src/.dev-docs/README.md
Multiple references need updating:
- **Line 25**: `dev/active/` → `.dev-docs/active/`
- **Line 269**: `dev/active/` → `.dev-docs/active/`
- **Line 290**: `dev/archive/` → `.dev-docs/archive/`

#### 5. src/.claude/commands/dev-docs-update.md
- **Line 11**: `/dev/active/` → `./.dev-docs/active/`

#### 6. tasks/point-at-new-dev-docs-loc.md
- Update the task file Status to "Completed" after all changes are made

### Implementation Steps

1. Read each file to get the exact content and context around the changes
2. Use Edit tool to perform precise string replacements for each occurrence
3. Maintain consistency: Use `./.dev-docs/` format (with leading `./`) for relative paths in agent files, and `.dev-docs/` (without `./`) where appropriate in other contexts
4. Update task status to "Completed" once all changes are verified
