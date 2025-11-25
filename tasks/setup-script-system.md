Status: Not Started

## Problem

Users currently need to manually copy template files using `cp -r` commands from the README. This requires:
- Knowing the exact source paths (`src/.claude`, `src/.dev-docs`)
- Typing out full commands
- Understanding the repository structure

A simple automated setup script would make it easier for users to install the templates into their projects.

## Solution

Create a simple bash script `setup.sh` that automates the `cp -r` process, triggered by a `make setup` command. The script will:
- Accept a target directory as an argument (defaults to current directory)
- Warn if `.claude/` already exists but allow user to continue
- Copy templates with permissions preserved using `cp -rp`

## Plan

### 1. Create Task File
- [x] Create this task file at `./tasks/setup-script-system.md`

### 2. Update Makefile
- [ ] Update the empty `Makefile` at repository root
- [ ] Add `.PHONY: setup` declaration
- [ ] Add `setup` target that invokes `bash setup.sh`

### 3. Create setup.sh Script
- [ ] Create `setup.sh` at repository root
- [ ] Add shebang: `#!/usr/bin/env bash`
- [ ] Set bash strict mode: `set -e`
- [ ] Accept target directory argument (default to current directory)
- [ ] Check if `$TARGET/.claude` exists and warn user
- [ ] Prompt for confirmation if conflict detected
- [ ] Copy `src/.claude/` to target with `cp -rp`
- [ ] Copy `src/.dev-docs/` to target with `cp -rp`
- [ ] Display success message with target location
- [ ] Make script executable

### 4. Update README.md
- [ ] Add "Setup" section to README
- [ ] Document `make setup` command for current directory
- [ ] Document `./setup.sh /path/to/project` for specific directory
- [ ] Keep it concise (3-4 lines)

### Success Criteria
- [ ] `make setup` successfully copies templates to current directory
- [ ] `./setup.sh /path/to/project` successfully copies templates to specified directory
- [ ] Script warns when `.claude/` already exists
- [ ] Executable permissions preserved on hook scripts
- [ ] Documentation clearly explains usage
