# OpenCode Personal Configuration

Personal configuration files for OpenCode that sync across machines.

## What's Inside

- **Custom Commands** (`command/`): Slash commands for enhanced workflows
  - `prompt-engineering/`: AI prompt optimization tools
  - `worktrees.md`: Git worktree management utilities
- **Configuration Files**: `opencode.json`, `oh-my-opencode.json`

## Setup

1. Clone this repo to `~/.config/opencode` (or `%USERPROFILE%\.config\opencode` on Windows)
2. OpenCode will automatically load configurations and commands from this directory

## Usage

Custom commands are available via slash syntax in OpenCode:
- `/worktrees` - Manage git worktrees
- `/prompt-enhancer` - Enhance AI prompts
- `/prompt-optimizer` - Optimize AI prompts

## Structure

```
.config/opencode/
├── command/              # Custom slash commands
│   ├── prompt-engineering/
│   └── worktrees.md
├── opencode.json         # OpenCode configuration
├── oh-my-opencode.json   # OhMyOpenCode settings
└── README.md
```
