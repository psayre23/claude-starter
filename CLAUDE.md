# Claude Code Template Repository

## Repository Context

**IMPORTANT**: This repository is a collection of template files and configurations for Claude Code. The `/src` directory contains template files that are meant to be copied into OTHER projects, not executed as part of this project.

## Understanding the `/src` Directory

The `/src` directory structure contains:
- `.claude/` - Claude Code configuration templates (agents, commands, hooks, skills, settings)
- `.dev-docs/` - Development documentation templates

**These are templates, not active code for this repository.**

When working in this repository:
- Files in `/src` should be treated as documentation/templates to maintain and organize
- Do NOT attempt to execute, run, or test the template files as if they were part of this project
- Focus on maintaining clarity, completeness, and usefulness of the templates
- Changes should improve the templates for use in other projects

## When Asked to Work on Templates

If asked to modify or create templates in `/src`:
1. Understand the template is for use in OTHER projects
2. Ensure the template follows Claude Code best practices
3. Include clear comments and documentation within the template
4. Consider how developers will use and customize the template

## Repository-Specific Operations

When working on THIS repository (not the templates):
- Focus on repository documentation (README.md, this file, etc.)
- Help organize and structure the template collection
- Assist with creating new template variations
- Improve discoverability and documentation of templates

## Tasks Directory

The `./tasks/` directory contains maintenance and improvement tasks for this template repository.

**Task File Format:**
Each task file follows this structure:
- **Status**: Current state (Not Started, In Progress, Completed, Blocked)
- **Problem**: Description of what needs to be addressed
- **Solution**: High-level approach to solve the problem
- **Plan**: Detailed implementation steps

**Working with Tasks:**
1. When asked to work on repository improvements, check `./tasks/` for relevant tasks
2. Update the Status field as you progress (Not Started → In Progress → Completed)
3. Fill in the Plan section with specific steps before starting work
4. These tasks are about maintaining THIS repository and its templates, not about the templates themselves
5. After completing a task, update the Status to "Completed" and add any notes about the changes made

## Usage Model

This repository follows the pattern:
```
claude-starter/            # This meta-repository
└── src/                   # Template files
    ├── .claude/           # Copy to target-project/.claude/
    └── .dev-docs/         # Copy to target-project/.dev-docs/
```

Users will copy files from `src/` into their actual projects where they will be used.
