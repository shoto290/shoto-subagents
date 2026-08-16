---
name: clean-code-craft
description: Clean-code craft - naming, small functions, readable control flow.
---

# Clean Code Craft

Write code that explains itself. Names carry intent, functions do one thing, control flow reads top to bottom, and nothing stays that does not earn its place.

## Naming

- Verbs for functions (`fetchUser`, `isExpired`), nouns for values (`user`, `retryCount`).
- Booleans as predicates: `isActive`, `hasAccess`, `shouldRetry`.
- No abbreviations, no single letters — except a loop index (`i`, `j`).
- Name length tracks scope: a tight, short-lived scope tolerates a short name; a wide or long-lived one demands a descriptive one.
- A comment that restates the code is a smell. Extract a well-named function or constant instead.

## Functions & control flow

- A function has one reason to change. Extract until each does one thing.
- If you reach for a comment to separate "sections", split into functions.
- Guard clauses first; return early to flatten nesting.
- No flag arguments — they hide two functions in one.
- No clever one-liners that trade clarity for brevity.

## Refactoring & dead code

- Small, safe steps — one rename or extraction at a time, verify, repeat.
- Rename freely the moment a name stops fitting.
- Leave it cleaner, but only within the scope you are already touching — see AGENTS.md Surgical Changes. Do not refactor sections that are not broken.
- Delete unused functions, variables, and imports — version control remembers them. Never comment out code "for later"; delete it.
- No just-in-case parameters or branches that nothing exercises.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/naming.md](./reference/naming.md) | Naming a symbol, weighing name length against scope width, or deciding whether a comment should become a name. |
| [reference/functions-and-control-flow.md](./reference/functions-and-control-flow.md) | Splitting a long function, flattening nested conditionals, or removing a flag argument. |
| [reference/checklist.md](./reference/checklist.md) | Verifying a written or reviewed change before returning it. |
