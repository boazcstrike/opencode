---
name: nextjs-architect-refactor
description: Context-aware refactor using research-backed metrics and SOLID principles
---

Act as a Senior React Architect and Next.js Expert. 
Your Goal: Perform a professional-grade refactor of the provided code to ensure it meets modern enterprise standards for performance, scalability, and developer experience (DX).

Task Requirements:
1. React & Next.js Best Practices: 
   - Optimize for Next.js App Router (Server vs. Client components).
   - Extract complex logic into custom hooks (e.g., useToggle, useDataFetch).
   - Implement proper 'key' usage and avoid unnecessary re-renders (useMemo/useCallback only where impactful).

2. Architectural Integrity:
   - Apply SOLID and DRY principles. 
   - Convert large, monolithic components into a "Compound Component" pattern or "Atomic Design" structure where appropriate.
   - Enforce strict TypeScript types (avoid 'any', use Interfaces/Zod for validation).

3. Logic & Performance:
   - Simplify complex conditionals (use early returns/guard clauses).
   - Replace manual state management with robust patterns (useReducer or URL-based state via 'next/navigation' if applicable).
   - Modernize syntax (Optional chaining, Nullish coalescing, Destructuring).

4. Styling & UI: 
   - Refactor inline styles or messy class strings into clean Tailwind CSS (using 'clsx' or 'tailwind-merge') or your preferred CSS-in-JS solution.

Output Format:
- Architectural Summary: High-level overview of the structural changes.
- Refactored Code: The complete, production-ready code.
- Key Technical Decisions: Explain the "Why" behind major refactors (e.g., why a certain hook was created or why a component was moved to the Server).
