---
name: design-handoff
description: Handing off designs to developers cleanly.
---

# Design Handoff

A handoff is the contract between design and engineering. The work is not done when the happy-path screen looks right — it is done when a developer can build every state, at every breakpoint, without guessing. Most handoff failures are not visual; they are missing intent, missing states, and unnamed primitives.

## Non-Negotiables

- Agree in/out scope, breakpoints, and platforms with engineering before anything is annotated.
- Use the names design and engineering already share, so a "card" means one thing on both sides.
- Specify responsive behavior — reflow, per-breakpoint rules, elastic content — never a single fixed frame.
- Design and annotate every state: empty, loading, error, success, disabled, long-content, zero/overflow.
- Attach annotations on the design itself: interaction, accessibility, business rules, prototype links.
- Ship real named components with auto layout, styles and variables bound, handed off via Dev Mode.
- Pass every checklist item before declaring the handoff dev-ready.
- Deliver specs, not application code — implementation is owned by the `design-engineer` agent.

## Pitfalls

- Handing off one fixed width and letting the developer guess the whole range.
- Shipping the happy path only, so edge states get invented during the build.
- Raw hex and magic numbers instead of named styles that map to code tokens.
- Intent parked in a separate doc that drifts away from the file.
- Detached groups and pixel-pushed copies passed off as components.
- Exploration and scratch frames left on the handoff surface.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/handoff-checklist.md](./reference/handoff-checklist.md) | Scoping a handoff, enumerating edge states, or running the dev-ready pass/fail gate before delivery. |
| [reference/annotation-guide.md](./reference/annotation-guide.md) | Writing responsive intent or annotating interaction, accessibility, business rules, and prototype links. |
| [reference/file-hygiene.md](./reference/file-hygiene.md) | Preparing the source file itself — components, styles, variables, page structure, Code Connect, Dev Mode. |
