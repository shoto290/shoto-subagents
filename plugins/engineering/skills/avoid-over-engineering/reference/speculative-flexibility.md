# Speculative Flexibility

## Write less code

The senior paradox: seniority is measured by the code you remove and the problems you avoid, not the lines you ship. The code you don't write can't break, can't drift, and costs nothing to maintain. **Delete over add** — when a change can be made by removing code, prefer that.

- Before adding, ask: can an existing function do this? (reuse over duplication)
- Before keeping, ask: does anything still call this? If not, delete it.

## Golden hammer

Don't force a favorite tool or pattern onto every problem. State machines, event buses, dependency-injection containers, and generics are tools, not defaults. Pick the pattern the problem asks for, not the one you reached for last time.

## Speculative flexibility

Delete unused params, options, and "just-in-case" machinery (Intentional: every line exists for a reason). Flexibility that wasn't requested is dead weight that still has to be read and maintained.

```ts
// Before: options nobody passes
function format(d: Date, opts?: { tz?: string; locale?: string; pad?: boolean }) { /* ... */ }

// After: the signature the callers actually use
function format(d: Date) { /* ... */ }
```

Add a parameter when a real caller needs it — not before.
