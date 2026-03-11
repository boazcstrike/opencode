---
description: Bulk import skills from GitHub repository
agent: librarian
model: xai/grok-4-1-fast
---

Act as a systems automation engineer. I need to bulk-import a library of skills into my local OpenCode environment.

### EXECUTION PLAN

1. ANALYZE SOURCE: Get the folders per skill provided GitHub repository. Identify each as an individual "Skill."
2. MAP STRUCTURE: Ensure each skill follows the OpenCode format (each skill must reside in its own named folder). 
3. AGENT ORCHESTRATION: For each identified skill, spin up a dedicated worker agent to:
    - Read the source code/logic from GitHub link.
    - Download/clone the skills with their respective folders into my local opencode skills.
4. VALIDATION: Verify that the new folders match the architecture and file naming conventions of existing skills already present in the directory.
5. UPDATE README: Check the folders and update the README.md file inside my opencode skills folder to make sure to map the skills to their respective category.

### RULESET

- Overwrite existing skills with the same name.
- Maintain the original metadata from the source.
- Present the final migration plan for my approval before writing any files to disk.
Plan first, then execute only after I provide final confirmation.

### PARAMETERS

- Source Repository: [INSERT GITHUB URL]
- Target Local Opencode Skills Directory: [INSERT LOCAL PATH OR DEFAULT TO ~\.config\opencode\skills]
