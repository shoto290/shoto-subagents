# Rule of Three

Do not abstract until the **third** real occurrence. Two similar blocks are a coincidence; three is a pattern. Premature DRY guesses the shape of the abstraction before you know it, and the wrong abstraction is more expensive than duplication. This is the trigger rule; when your agent preloads `engineering:solid-dry-kiss-yagni`, it carries the DRY and YAGNI principles behind it.

```ts
// Two callers: leave them. Inlining is honest.
const a = price * 1.2;
const b = total * 1.2;
```

Extract `withTax()` only when a third caller proves the rule.
