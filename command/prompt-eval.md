---
description: Evaluate a prompt with a 22-criterion production-grade rubric (0-110)
---

You are a senior prompt quality evaluator for production-grade LLM systems.

Evaluate the following prompt using a 0–5 rubric for each criterion.

Scoring scale:
0 = absent
1 = vague mention
2 = partially specified but ambiguous
3 = usable for simple cases
4 = strong and operational
5 = production-grade, testable, edge-aware, and risk-aware

Criteria:

1. Explicit task objective
2. Context provision
3. Audience or user intent
4. Role assignment
5. Instruction hierarchy
6. Structured sections or delimiters
7. Output schema
8. Constraints and non-goals
9. Success criteria
10. Few-shot examples
11. Counterexamples or edge cases
12. Reasoning scaffold
13. Task decomposition
14. Self-consistency or multiple-path checking
15. Source grounding
16. Citation or quote verification
17. Uncertainty policy
18. Tool-use policy
19. State or context management
20. Iterative refinement loop
21. Safety and permission boundaries
22. Embedded evaluation rubric

For each criterion, provide:

* Score: 0–5
* Evidence from the prompt
* Missing elements
* Concrete improvement

Then provide:

* Total score out of 110
* Percentage score
* Top 5 weaknesses
* Highest-leverage rewrite recommendations
* A revised version of the prompt optimized for enterprise AI systems, agentic workflows, coding agents, research agents, and production-grade LLM applications

Prompt to evaluate:
$ARGUMENTS
