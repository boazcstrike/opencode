# OpenCode Personal Configuration

Personal configuration files for OpenCode that sync across machines.

## What's Inside

- **Custom Commands** (`command/`): Slash commands for enhanced workflows
  - `prompt-engineering/`: AI prompt optimization tools
  - `worktrees.md`: Git worktree management utilities
- **Configuration Files**: `opencode.json`, `oh-my-opencode.json`

## Oh My OpenCode Configuration

For detailed information about Oh My OpenCode configuration options, see the [official documentation](https://github.com/code-yeongyu/oh-my-opencode/blob/dev/docs/configurations.md).

### Sisyphus Agent

When enabled (default), Sisyphus provides a powerful orchestrator with optional specialized agents:

- **Sisyphus**: Primary orchestrator agent (Claude Opus 4.5) that coordinates complex development workflows, delegates specialized tasks to appropriate agents, manages parallel execution for maximum throughput, and ensures code quality through structured implementation cycles.

- **OpenCode-Builder**: OpenCode's default build agent, renamed due to SDK limitations (disabled by default). Handles compilation, testing, and deployment tasks while maintaining build consistency and error resolution.

- **Prometheus (Planner)**: OpenCode's default plan agent with work-planner methodology (enabled by default). Creates detailed implementation plans, breaks down complex requirements into actionable steps, and establishes structured development workflows with clear milestones and deliverables.

- **Metis (Plan Consultant)**: Pre-planning analysis agent that identifies hidden requirements and AI failure points. Performs deep requirement analysis, uncovers implicit assumptions, validates technical approaches, and provides strategic guidance before implementation begins.

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
