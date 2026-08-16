# Orthogonality and Decoupling

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
