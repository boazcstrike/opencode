# OpenCode Skills Repository

This directory contains skills ported to OpenCode-compatible format from various external repositories. Each skill is in its own subdirectory with a `SKILL.md` file containing the skill documentation and instructions.

## Ported Skills

### Anthropic Skills (https://github.com/anthropics/skills/tree/main/skills)
The following 16 skills have been ported from the Anthropic Skills repository:

- [algorithmic-art](algorithmic-art/) - Source: https://github.com/anthropics/skills/blob/main/skills/algorithmic-art/SKILL.md
- [brand-guidelines](brand-guidelines/) - Source: https://github.com/anthropics/skills/blob/main/skills/brand-guidelines/SKILL.md
- [canvas-design](canvas-design/) - Source: https://github.com/anthropics/skills/blob/main/skills/canvas-design/SKILL.md
- [doc-coauthoring](doc-coauthoring/) - Source: https://github.com/anthropics/skills/blob/main/skills/doc-coauthoring/SKILL.md
- [docx](docx/) - Source: https://github.com/anthropics/skills/blob/main/skills/docx/SKILL.md
- [frontend-design](frontend-design/) - Source: https://github.com/anthropics/skills/blob/main/skills/frontend-design/SKILL.md
- [internal-comms](internal-comms/) - Source: https://github.com/anthropics/skills/blob/main/skills/internal-comms/SKILL.md
- [mcp-builder](mcp-builder/) - Source: https://github.com/anthropics/skills/blob/main/skills/mcp-builder/SKILL.md
- [pdf](pdf/) - Source: https://github.com/anthropics/skills/blob/main/skills/pdf/SKILL.md
- [pptx](pptx/) - Source: https://github.com/anthropics/skills/blob/main/skills/pptx/SKILL.md
- [skill-creator](skill-creator/) - Source: https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md
- [slack-gif-creator](slack-gif-creator/) - Source: https://github.com/anthropics/skills/blob/main/skills/slack-gif-creator/SKILL.md
- [theme-factory](theme-factory/) - Source: https://github.com/anthropics/skills/blob/main/skills/theme-factory/SKILL.md
- [web-artifacts-builder](web-artifacts-builder/) - Source: https://github.com/anthropics/skills/blob/main/skills/web-artifacts-builder/SKILL.md
- [webapp-testing](webapp-testing/) - Source: https://github.com/anthropics/skills/blob/main/skills/webapp-testing/SKILL.md
- [xlsx](xlsx/) - Source: https://github.com/anthropics/skills/blob/main/skills/xlsx/SKILL.md

### Superpowers Skills (https://github.com/obra/superpowers/tree/main/skills)
The following 9 skills have been ported from the Superpowers Skills repository:

- [brainstorming](brainstorming/) - Source: https://github.com/obra/superpowers/blob/main/skills/brainstorming/SKILL.md
- [dispatching](dispatching/) - Source: https://github.com/obra/superpowers/blob/main/skills/dispatching/SKILL.md
- [executing](executing/) - Source: https://github.com/obra/superpowers/blob/main/skills/executing/SKILL.md
- [subagent](subagent/) - Source: https://github.com/obra/superpowers/blob/main/skills/subagent/SKILL.md
- [systematic-debugging](systematic-debugging/) - Source: https://github.com/obra/superpowers/blob/main/skills/systematic-debugging/SKILL.md
- [test-driven-development](test-driven-development/) - Source: https://github.com/obra/superpowers/blob/main/skills/test-driven-development/SKILL.md
- [using-superpowers](using-superpowers/) - Source: https://github.com/obra/superpowers/blob/main/skills/using-superpowers/SKILL.md
- [writing-plans](writing-plans/) - Source: https://github.com/obra/superpowers/blob/main/skills/writing-plans/SKILL.md
- [writing-skills](writing-skills/) - Source: https://github.com/obra/superpowers/blob/main/skills/writing-skills/SKILL.md

### AWS Skills (https://github.com/zxkane/aws-skills/tree/main/plugins)
The following 3 skills have been ported from the AWS Skills repository:

- [aws-agentic-ai](aws-agentic-ai/) - Source: https://github.com/zxkane/aws-skills/blob/main/plugins/aws-agentic-ai/SKILL.md
- [aws-cost-operations](aws-cost-operations/) - Source: https://github.com/zxkane/aws-skills/blob/main/plugins/aws-cost-operations/SKILL.md
- [aws-cdk-development](aws-cdk-development/) - Source: https://github.com/zxkane/aws-skills/blob/main/plugins/aws-cdk-development/SKILL.md

### Standalone Tools
The following 7 skills have been ported from standalone external tools:

- [sheets-cli](sheets-cli/) - Source: https://github.com/gmickel/sheets-cli
- [agent-browser](agent-browser/) - Source: https://github.com/vercel-labs/agent-browser/tree/main/skills/agent-browser
- [react-best-practices](react-best-practices/) - Source: https://github.com/vercel-labs/agent-skills/tree/main/skills/react-best-practices
- [web-design-guidelines](web-design-guidelines/) - Source: https://github.com/vercel-labs/agent-skills/tree/main/skills/web-design-guidelines
- [extracting-pdf-text](extracting-pdf-text/) - Source: https://github.com/letta-ai/skills/tree/main/tools/extracting-pdf-text
- [google-workspace](google-workspace/) - Source: https://github.com/letta-ai/skills/tree/main/tools/google-workspace
- [slack](slack/) - Source: https://github.com/letta-ai/skills/tree/main/tools/slack

## Skill Format

Each skill directory contains:
- `SKILL.md`: The main skill documentation with YAML frontmatter and instructions
- Optional supporting files (scripts, templates, references, etc.)

The YAML frontmatter includes:
- `name`: Skill name
- `description`: Brief description (≤1024 characters)
- `compatibility`: opencode
- `metadata`: Additional information including audience, workflow, and source

## Updating This README

To update this README when new skills are added:

1. Add the new skill entry to the appropriate section above
2. Include the link to the original source repository
3. Ensure the skill directory name matches the link text
4. Update the count in the section header if necessary

Trigger: When porting new skills from external repositories, update this README to include the new entries with their source links.

## Total Skills: 35