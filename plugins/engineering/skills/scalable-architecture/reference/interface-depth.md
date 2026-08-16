# Interface Depth

## Deep vs shallow interfaces

Prefer **deep modules** (Ousterhout): a simple interface that hides a substantial implementation. The cost of a module is its interface; the value is what it does. Maximize value over cost.

Reject **shallow modules** — a wide interface guarding almost no logic. They add surface without hiding anything. **Pass-through methods** (a method that only forwards to another) are a smell: they widen the interface while adding zero abstraction.

```ts
// Shallow: caller still owns the work, the interface just relays it
class Cache { get(k: string) { return this.store.lookup(k); } }

// Deep: one call hides eviction, TTL, and refetch
class Cache { async get(k: string): Promise<Value> { /* ...substantial... */ } }
```

## Hide complexity

Apply information hiding: expose the **minimum surface** a caller needs, and keep design decisions (storage format, retry policy, ordering) inside the module. A caller that must know internals to use you correctly means the boundary leaks. Fewer public methods, fewer required parameters, fewer assumptions escape.
