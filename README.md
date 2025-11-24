# Claude Starter Templates

A curated collection of Claude Code configuration templates, agents, commands, hooks, and skills to help you get started with Claude Code in your projects.

## What is This?

This repository contains template files that enhance Claude Code's capabilities in your development projects. Rather than starting from scratch, you can copy these pre-configured templates into your project and customize them to your needs.

## What's Included

The `/src` directory contains:

- **`.claude/agents/`** - Specialized agent configurations for code review, refactoring, documentation, and more
- **`.claude/commands/`** - Custom slash commands for common development workflows
- **`.claude/hooks/`** - Event hooks that trigger on specific actions
- **`.claude/skills/`** - Reusable skill definitions and the skill developer toolkit
- **`.claude/settings.json`** - Claude Code configuration settings
- **`.claude/DEVELOPMENT_PRINCIPLES.md`** - Comprehensive development guidelines
- **`.dev-docs/`** - Development documentation structure

## How to Use

### Quick Start

1. **Copy the templates you need** from `/src` into your project:
   ```bash
   # Copy all Claude Code configurations
   cp -r src/.claude /path/to/your/project/

   # Copy development docs structure
   cp -r src/.dev-docs /path/to/your/project/
   ```

2. **Customize the templates** to match your project's needs:
   - Update `settings.json` with your preferences
   - Modify or remove agents you don't need
   - Adjust development principles to match your team's standards

3. **Start using Claude Code** in your project with the enhanced configurations

### Selective Installation

You don't need to copy everything. Pick what's useful for your project:

```bash
# Just the agents
cp -r src/.claude/agents /path/to/your/project/.claude/

# Just specific commands
cp src/.claude/commands/dev-docs.md /path/to/your/project/.claude/commands/

# Just the skill developer toolkit
cp -r src/.claude/skills/skill-developer /path/to/your/project/.claude/skills/
```

## Template Highlights

### Specialized Agents
- **Code Architecture Reviewer** - Reviews architectural decisions and patterns
- **Code Refactor Master** - Assists with complex refactoring tasks
- **Documentation Architect** - Helps create and maintain documentation
- **Plan Reviewer** - Reviews implementation plans before execution
- **Web Research Specialist** - Conducts targeted research using web search

### Custom Commands
- `/dev-docs` - Manages development documentation
- `/dev-docs-update` - Updates existing development docs

### Skills
- **Skill Developer** - Complete toolkit for creating custom Claude Code skills

### Development Principles
A comprehensive guide covering:
- Core principles (DRY, YAGNI, KISS)
- Testing philosophy and TDD practices
- Code quality standards
- Frontend and backend best practices
- Docker-first development workflow
- Security guidelines

## Project Structure

```
claude-starter/
├── README.md              # This file
├── CLAUDE.md             # Instructions for Claude Code
├── Makefile              # Build automation (if applicable)
└── src/                  # Template files (copy these to your projects)
    ├── .claude/          # Claude Code configurations
    │   ├── agents/       # Custom agent definitions
    │   ├── commands/     # Slash command definitions
    │   ├── hooks/        # Event hooks
    │   ├── skills/       # Skill definitions
    │   ├── settings.json # Configuration settings
    │   └── DEVELOPMENT_PRINCIPLES.md
    └── .dev-docs/        # Documentation structure
        ├── active/       # Current documentation
        ├── archive/      # Archived docs
        └── reviews/      # Review documentation
```

## Customization Tips

1. **Start small** - Copy only what you need and expand over time
2. **Adapt to your stack** - Modify development principles and configs for your tech stack
3. **Team alignment** - Review and adjust templates to match your team's conventions
4. **Iterate** - Templates are starting points, not rigid requirements

## Requirements

- Claude Code (latest version recommended)
- A project where you want to use these templates

## Contributing

Suggestions and improvements welcome! If you create useful agents, commands, or skills that could benefit others, consider contributing them back.

## License

These templates are provided as-is for use in your projects. Customize freely.

## Learn More

- [Claude Code Documentation](https://github.com/anthropics/claude-code)
- [Claude Agent SDK](https://github.com/anthropics/claude-agent-sdk)

---

**Note**: This is a template repository. The files in `/src` are meant to be copied into your actual development projects, not executed here.
