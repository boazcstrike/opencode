# OpenCode Personal Configuration

Personal configuration files for OpenCode that sync across machines. Supports both full Sisyphus orchestration (oh-my-opencode.json) and slim specialist agents (oh-my-opencode-slim.json).

## What's Inside

- **Custom Commands** (`command/`): Slash commands for enhanced workflows
  - `prompt-engineering/`: AI prompt optimization tools
  - `worktrees.md`: Git worktree management utilities
  - `gsd/`: Get Shit Done (GSD) project management workflows (`/gsd new-project`, `/gsd plan-phase`, etc.)
- **Skills** (`skills/`): Specialized capabilities
  - `cartography/`: Repository mapping and codemap generation
- **Get Shit Done** (`get-shit-done/`): Templates and workflows for structured development (discovery, plan, execute, verify)
- **Configuration Files**: `opencode.json`, `oh-my-opencode.json` (Sisyphus), `oh-my-opencode-slim.json` (Slim)

## Oh My OpenCode Configurations

Lightweight preset using a team of specialist sub-agents coordinated by the Orchestrator. Focuses on quality, speed, cost, and reliability through targeted delegation.

For detailed information about Oh My OpenCode configuration options, see the [official documentation](https://github.com/code-yeongyu/oh-my-opencode/blob/dev/docs/configurations.md).

### Standard (Sisyphus)

When enabled (default), Sisyphus provides a powerful orchestrator with optional specialized agents:

- **Sisyphus**: Primary orchestrator agent (Claude Opus 4.5) that coordinates complex development workflows, delegates specialized tasks to appropriate agents, manages parallel execution for maximum throughput, and ensures code quality through structured implementation cycles.

- **OpenCode-Builder**: OpenCode's default build agent, renamed due to SDK limitations (disabled by default). Handles compilation, testing, and deployment tasks while maintaining build consistency and error resolution.

- **Prometheus (Planner)**: OpenCode's default plan agent with work-planner methodology (enabled by default). Creates detailed implementation plans, breaks down complex requirements into actionable steps, and establishes structured development workflows with clear milestones and deliverables.

- **Metis (Plan Consultant)**: Pre-planning analysis agent that identifies hidden requirements and AI failure points. Performs deep requirement analysis, uncovers implicit assumptions, validates technical approaches, and provides strategic guidance before implementation begins.

### Slim (Dynamic Preset)

### The Roles: Who Does What?

| Role        | Alias            | Function                                                                 | Recommended Model (2026)              |
|-------------|------------------|--------------------------------------------------------------------------|--------------------------------------|
| Orchestrator | \"The Boss\"     | The main primary agent. It doesn't usually write code; it plans, delegates, and coordinates the other sub-agents. | Grok-4-1-fast / GPT-5.2             |
| Oracle      | \"The Strategist\" | High-IQ advisor used for complex debugging or architectural decisions. It is the \"reasoning engine\" called when the team gets stuck. | DeepSeek R1 / GPT-5.2               |
| Designer    | \"The Visualist\"  | Focused on Frontend/UI/UX. It has access to browser-automation tools to verify visual states. | Gemini 3 Flash                      |
| Explorer    | \"The Scout\"     | Scans your local codebase. It maps out directory structures and finds relevant files using Grep/LSP to keep the Orchestrator's context lean. | Grok-Fast-Non-Reasoning             |
| Librarian   | \"The Researcher\" | Searches external documentation and GitHub (via grep_app). It finds how to use specific libraries so the team doesn't \"hallucinate\" APIs. | DeepSeek V3.2 / Gemini 3 Flash      |
| Fixer       | \"The Janitor\"   | Dedicated to refactoring and error correction. It uses LSP diagnostics to surgically fix linting or type errors. | DeepSeek R1 / Grok-Code-Fast        |

### Current Setup (\"dynamic\" preset)

- **Orchestrator**: `xai/grok-4-1-fast` (all skills, websearch MCP)
- **Oracle**: `xai/grok-4-1-fast` (high variant)
- **Designer**: `google/gemini-3-flash` (medium variant, agent-browser skill)
- **Explorer**: `xai/grok-4-1-fast-non-reasoning` (low variant)
- **Librarian**: `xai/grok-4-1-fast` (low variant, websearch/context7/grep_app MCPs)
- **Fixer**: `xai/grok-code-fast-1` (low variant)

**Fallback Chains**: Enabled with 15s timeout for reliability across models/providers.

## Source Repositories

These repositories provide the agents, commands, skills, and workflows integrated into this configuration:

- **[oh-my-opencode](https://github.com/code-yeongyu/oh-my-opencode)**: Core agent orchestration framework featuring Sisyphus for complex workflows, Prometheus planning, Metis analysis, and more. Enables advanced multi-agent coordination.

- **[oh-my-opencode-slim](https://github.com/alvinunreal/oh-my-opencode-slim)**: Lightweight specialist agents (Orchestrator, Oracle, Designer, Explorer, Librarian, Fixer) for efficient, cost-optimized task delegation.

- **[get-shit-done](https://github.com/gsd-build/get-shit-done)**: Structured slash commands and templates for phased development (discovery, research, plan, execute, verify, debug).

Synced here for a portable, enhanced OpenCode experience across machines.

## Setup

1. Clone this repo to `~/.config/opencode` (or `%USERPROFILE%\.config\opencode` on Windows)
2. OpenCode will automatically load configurations and commands from this directory

## Usage

Custom commands are available via slash syntax in OpenCode:
- `/worktrees` - Manage git worktrees
- `/prompt-enhancer` - Enhance AI prompts
- `/prompt-optimizer` - Optimize AI prompts
- `/gsd help` - Get Shit Done project workflows (new-project, plan-phase, execute-phase, etc.)

## Structure

```
.config/opencode/
├── command/                    # Custom slash commands
│   ├── prompt-engineering/
│   │   ├── prompt-enhancer.md
│   │   └── prompt-optimizer.md
│   ├── worktrees.md
│   └── gsd/                    # GSD commands
├── skills/                     # Specialized skills
│   └── cartography/
├── get-shit-done/              # GSD templates & workflows
│   ├── templates/
│   └── workflows/
├── opencode.json              # OpenCode config (plugins, providers)
├── oh-my-opencode-slim.json   # Slim agent preset
└── README.md
```
