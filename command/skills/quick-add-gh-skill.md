---
description: Bulk import skills from GitHub repository
agent: librarian
model: xai/grok-4-1-fast
---

Act as a systems automation engineer. I need to bulk-import a library of skills into my local OpenCode environment.



### EXECUTION PLAN

1. ANALYZE SOURCE: Fetch the file structure of the provided GitHub repository. Identify each sub-folder as an individual "Skill."

2. MAP STRUCTURE: Ensure each skill follows the OpenCode format (each skill must reside in its own named sub-folder within the Target Local Directory). 

3. AGENT ORCHESTRATION: For each identified skill, spin up a dedicated worker agent to:

    - Read the source code/logic from GitHub.

    - Replicate the folder structure locally.

    - Generate/Write the necessary files into the specific local folder.

4. VALIDATION: Verify that the new folders match the architecture and file naming conventions of existing skills already present in the directory.



### CONSTRAINTS

- Do not overwrite existing skills with the same name.

- Maintain the original metadata from the source.

- Present the final migration plan for my approval before writing any files to disk.



Plan first, then execute only after I provide final confirmation.



### PARAMETERS

- Source Repository: [INSERT GITHUB URL]

- Target Local Directory: [INSERT LOCAL PATH OR DEFAULT TO ~\.config\opencode\skills]