---
name: pragmatic-principles
description: Pragmatic Programmer principles - orthogonality, tracer bullets, DRY.
---

# Pragmatic Principles

Working habits from The Pragmatic Programmer, scoped to decisions about module boundaries, how to start risky work, and when to stop polishing. The SOLID/DRY/KISS/YAGNI rule set lives in `engineering:solid-dry-kiss-yagni`, broader system shape in `engineering:scalable-architecture` — read them there if your agent preloads them.

## Rules

- **Orthogonality** — Do: isolate each concern behind a seam so editing one leaves the rest untouched. Don't: let one module reach into another's representation.
- **Decoupling** — Do: accept an abstraction and let the caller supply the implementation. Don't: chain through objects you were merely handed (`a.getB().getC().run()`).
- **DRY as Knowledge** — Every piece of knowledge has a single, authoritative representation. DRY is about duplicated knowledge, not duplicated text — two lines that look alike but encode different decisions are not a violation.
  - Do: give each business rule, constant, or schema exactly one home.
  - Don't: collapse code that merely looks similar today — the Rule of Three in `engineering:avoid-over-engineering` is the counterweight.
- **Tracer Bullets** — Build a thin slice that runs end-to-end — real wiring, real boundaries — then flesh it out. A tracer bullet stays in the codebase and grows; you adjust aim with live feedback.
  - Do: connect every layer with minimal logic first, then deepen each layer.
  - Don't: confuse it with a throwaway prototype — prototypes are built to be discarded after they answer one question, tracer code is built to keep.
- **Good-Enough Software** — Ship at the quality bar the context demands. "Good enough" is a deliberate, negotiated target, not an excuse for sloppiness.
  - Do: agree on the acceptable bar with stakeholders, hit it, and release.
  - Don't: gold-plate past the point where added polish stops earning its cost.

This skill covers the day-to-day reflex; where interface boundaries belong is covered by `engineering:scalable-architecture`, and the dependency-inversion rationale by `engineering:solid-dry-kiss-yagni`, when your agent preloads them.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/orthogonality.md](./reference/orthogonality.md) | Deciding where a module boundary goes, or reviewing code where one module reaches into another's representation or chains through handed-over objects. |
| [reference/checklist.md](./reference/checklist.md) | Verifying a change against these principles before returning it. |
