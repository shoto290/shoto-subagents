# Functions and Control Flow

## Short functions & single responsibility

A function has one reason to change. Extract until each does one thing. Prefer early returns over nested conditionals.

- If you reach for a comment to separate "sections", split into functions.
- A function that mixes fetching, transforming, and rendering does three jobs — split it.

```ts
function save(user: User) {
  if (!user.email) throw new Error("email required");
  if (!user.name) throw new Error("name required");
  db.insert(user);
}
```

## Readable control flow

- Guard clauses first; return early to flatten nesting.
- No flag arguments — they hide two functions in one.
- No clever one-liners that trade clarity for brevity.

```ts
// Before
function render(node: Node, asDraft: boolean) {
  if (asDraft) return renderDraft(node);
  return renderPublished(node);
}
```

```ts
// After
function renderDraft(node: Node) { /* ... */ }
function renderPublished(node: Node) { /* ... */ }
```
