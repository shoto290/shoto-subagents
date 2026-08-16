# DRY, KISS, YAGNI

## DRY

DRY is about a single source of truth for **knowledge**, not about deleting code that merely looks alike. Two functions with the same shape but different reasons to change are coincidental duplication — collapsing them couples unrelated concepts. Extract only when the same decision lives in two places and must always move together. For the duplication threshold that gates extraction, see the Rule of Three in `engineering:avoid-over-engineering`.

## KISS

Pick the simplest thing that works and reject cleverness that buys nothing. A reader should understand the code on first pass; a dense one-liner that needs a comment to decode has already failed.

```ts
const isAdult = (age: number) => age >= 18;
```

This embodies the **S** in SIMPLE: less code, fewer abstractions, no machinery the problem did not ask for.

## YAGNI

Build for today's requirement, not an imagined one. Every speculative parameter, feature flag, or config knob is code you maintain, test, and explain for a caller that may never arrive — `engineering:avoid-over-engineering` carries the before/after example.

## When they conflict

DRY and KISS pull against each other. Premature DRY is the more expensive mistake: a shared abstraction extracted too early hardens the wrong seam, and every later divergence fights the abstraction with flags and special cases. Prefer a little duplication over the wrong coupling — inline the repetition until the real shared knowledge is obvious, then extract once.
