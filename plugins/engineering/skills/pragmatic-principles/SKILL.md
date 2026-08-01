---
name: pragmatic-principles
description: Pragmatic Programmer principles - orthogonality, tracer bullets, DRY.
---

# Pragmatic Principles

Working habits from The Pragmatic Programmer, scoped to decisions about module boundaries, how to start risky work, and when to stop polishing. The SOLID/DRY/KISS/YAGNI rule set lives in `engineering:solid-dry-kiss-yagni`, broader system shape in `engineering:scalable-architecture` — read them there if your agent preloads them.

## Orthogonality

Decouple unrelated things so a change in one module does not ripple into others. Two components are orthogonal when neither knows the other exists.

- Do: isolate each concern behind a seam so editing one leaves the rest untouched.
- Don't: let one module reach into another's representation.

```ts
// Leaky: report logic knows how the store persists data
function buildReport(store: { rows: Row[] }) { return summarize(store.rows); }

// Orthogonal: report depends only on the data it needs
function buildReport(rows: Row[]) { return summarize(rows); }
```

## Decoupling

Talk to your immediate collaborators, not their internals.

- Do: accept an abstraction and let the caller supply the implementation.
- Don't: chain through objects you were merely handed (`a.getB().getC().run()`).

This skill covers the day-to-day reflex; where interface boundaries belong is covered by `engineering:scalable-architecture`, and the dependency-inversion rationale by `engineering:solid-dry-kiss-yagni`, when your agent preloads them.

## DRY as Knowledge

Every piece of knowledge has a single, authoritative representation. DRY is about duplicated knowledge, not duplicated text — two lines that look alike but encode different decisions are not a violation.

- Do: give each business rule, constant, or schema exactly one home.
- Don't: collapse code that merely looks similar today — the Rule of Three in `engineering:avoid-over-engineering` is the counterweight.

## Tracer Bullets

Build a thin slice that runs end-to-end — real wiring, real boundaries — then flesh it out. A tracer bullet stays in the codebase and grows; you adjust aim with live feedback.

- Do: connect every layer with minimal logic first, then deepen each layer.
- Don't: confuse it with a throwaway prototype — prototypes are built to be discarded after they answer one question, tracer code is built to keep.

## Good-Enough Software

Ship at the quality bar the context demands. "Good enough" is a deliberate, negotiated target, not an excuse for sloppiness.

- Do: agree on the acceptable bar with stakeholders, hit it, and release.
- Don't: gold-plate past the point where added polish stops earning its cost.

## Pass/fail checklist

- [ ] Changing one module leaves unrelated modules untouched.
- [ ] Code talks to its immediate collaborators, not their internals.
- [ ] Each piece of knowledge has exactly one authoritative source.
- [ ] Risky features start as a thin end-to-end slice, not a deep partial one.
- [ ] The quality bar was set against the context, not maxed by reflex.
- [ ] Tracer code is kept and grown; throwaway prototypes are discarded.
