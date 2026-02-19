# TASK: Port External Skills &amp; Update Master Manifest
Goal: Convert external tools into OpenCode skills and log them in the central `.opencode/skills/README.md`.

## Context &amp; Rules:
1. Documentation: https://opencode.ai/docs/skills/
2. Skill Folder: `.opencode/skills/&lt;skill-name&gt;/`
3. Skill File: `SKILL.md` (Strict YAML: name, description).
4. Master Manifest: `.opencode/skills/README.md` (Update this file with the source link).

## Execution Plan:
1. TARGET URL: [INSERT URL HERE]
2. ANALYZE &amp; DELEGATE:
   - Identify if the URL is a skill library or a standalone tool.
   - Spawn @general sub-agents to build the `.opencode/skills/&lt;skill-name&gt;/` structure.
3. FILE CREATION &amp; TRANSFER:
   - Create `SKILL.md`: Generate instructions with basic `name` and `description` headers.
   - Move all dependency scripts/assets into the local skill folder.
   - Update `SKILL.md` instructions to use local relative paths (e.g., `./script.py`).
4. MANIFEST UPDATE:
   - Locate `.opencode/skills/README.md`.
   - Append a new entry using the exact format:
     - [&lt;skill-name&gt;](&lt;skill-name&gt;/) - Source: &lt;original-url&gt;
   - If it&#39;s a standalone tool, ensure it&#39;s categorized under a &quot;### Standalone Tools&quot; section.

@general please process this URL, port the skill, and update the Master Manifest: