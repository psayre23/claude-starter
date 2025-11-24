# Docker Claude with Task Management

**Status**: Not Started

## Problem

Developers need a way to run Claude Code in a Docker container and have Claude add tasks to the project's task management system via Make commands. This enables:
- Consistent, isolated Claude Code environment across teams
- Integration with existing Make-based workflows
- Ability for Claude to create and track tasks in a structured way
- Containerized development workflow that matches production patterns

## Solution

Create Docker infrastructure at the repository root that:
1. Provides a containerized Claude Code environment with full project access
2. Exposes Make commands for running Claude and managing tasks
3. Allows Claude to create task files in `./tasks/` directory
4. Maintains persistence of tasks on the host filesystem

**Scope**: This is purely infrastructure - no changes to `/src` templates.

## Plan

### 1. Create Root-Level Dockerfile
- [ ] Write Dockerfile at repository root
- [ ] Base image with Node.js and necessary tools
- [ ] Install Claude Code CLI
- [ ] Set working directory to `/workspace`
- [ ] Configure for Claude API key via environment variable
- [ ] Ensure proper permissions for file creation

### 2. Create Docker Compose Configuration
- [ ] Write docker-compose.yml at root
- [ ] Mount entire project directory: `.:/workspace`
- [ ] Set up environment variable passing from `.env`
- [ ] Configure service name (e.g., `claude-dev`)

### 3. Create Makefile with Docker Commands
- [ ] Create or update Makefile at root
- [ ] `make docker-claude` - Interactive Claude session
- [ ] `make docker-claude-task` - Claude creates a task file
- [ ] `make docker-shell` - Shell access to container
- [ ] `make docker-build` - Build container image
- [ ] `make docker-clean` - Remove containers and images

### 4. Create Environment Configuration
- [ ] Create `.env.example` with ANTHROPIC_API_KEY placeholder
- [ ] Document other required environment variables
- [ ] Add .env to .gitignore if not already present

### 5. Create .dockerignore
- [ ] Exclude node_modules
- [ ] Exclude .git (or include based on needs)
- [ ] Exclude temporary files
- [ ] Exclude .env (use .env.example as template)

### 6. Update Documentation
- [ ] Add Docker section to README.md
- [ ] Document setup: copying .env.example to .env
- [ ] Document all Make commands with examples
- [ ] Add troubleshooting section
- [ ] Explain how Claude accesses project files

## Implementation Details

### File Structure (Repository Root)
```
claude-starter/
├── Dockerfile              # New - Claude Code environment
├── docker-compose.yml      # New - Service definition
├── Makefile               # New/Updated - Docker commands
├── .env.example           # New - Environment template
├── .dockerignore          # New - Exclude unnecessary files
├── tasks/                 # Existing - writable by Claude
├── src/                   # Existing - readable by Claude
└── README.md              # Updated - Docker instructions
```

### Example Makefile Targets
```makefile
docker-build:
    docker-compose build

docker-claude:
    docker-compose run --rm claude-dev

docker-claude-task:
    docker-compose run --rm claude-dev claude-code --prompt "Create a task file in ./tasks/ for: $(TASK)"

docker-shell:
    docker-compose run --rm claude-dev /bin/bash

docker-clean:
    docker-compose down -v
    docker-compose rm -f
```

### Example Usage
```bash
# First time setup
cp .env.example .env
# Edit .env to add ANTHROPIC_API_KEY
make docker-build

# Run Claude interactively
make docker-claude

# Have Claude create a task
make docker-claude-task TASK="implement user authentication"

# Debug container
make docker-shell
```

### Volume Mount Strategy
- Mount entire project: `.:/workspace`
- Claude sees all files at `/workspace` in container
- Changes to `./tasks/` persist on host
- No changes needed to `/src` templates

## Success Criteria

- [ ] Dockerfile builds successfully
- [ ] Claude Code runs in container with full project access
- [ ] Make commands work as expected
- [ ] Claude can create task files that persist on host
- [ ] Documentation enables easy setup for new users
- [ ] No modifications required to `/src` template files

## Notes

- This is infrastructure only - template files in `/src` remain unchanged
- Focus is on THIS repository's Docker setup
- Users can copy Dockerfile/docker-compose.yml to their projects if desired
- Task creation workflow should be intuitive via Make commands
