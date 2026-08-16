# Premature Abstraction and Optimization

## Premature abstraction

No speculative interfaces, base classes, or plugin systems for a single caller. An interface with one implementation is indirection with no payoff.

```ts
// Before: one implementation hiding behind an interface
interface Notifier { send(m: string): void }
class EmailNotifier implements Notifier { send(m: string) { /* ... */ } }

// After: just the function the one caller needs
function sendEmail(m: string) { /* ... */ }
```

## Premature optimization

Measure before optimizing. Readable, correct code first; only optimize a path proven hot by a profiler or a real metric (Measurable). Clever code traded for unmeasured speed is a net loss.

```ts
// Before: hand-rolled cache for a list of 12 items
const memo = new Map<string, User>();
function find(id: string) { /* cache plumbing */ }

// After: trivially correct, fast enough
const find = (id: string) => users.find(u => u.id === id);
```
