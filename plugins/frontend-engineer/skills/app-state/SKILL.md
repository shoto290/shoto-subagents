---
name: app-state
description: Decide where each piece of application state belongs.
---

# App State

Most state bugs are placement bugs, not logic bugs. Before adding anything, walk this ladder from the top and stop at the first rung that works. Every rung down adds a copy of the truth, and copies are where bugs live.

## The Placement Ladder

| Rung | Use when | Tool |
| :-- | :-- | :-- |
| 1. Derive | the value is computable from what you already have | a plain expression |
| 2. URL | the user could share, reload, or go back to it | route and search params |
| 3. Server cache | the server owns it | TanStack Query |
| 4. Local | one subtree owns it and nothing outside reads it | `useState` / `useReducer` |
| 5. Global store | genuinely cross-screen client state | Zustand |

## Pitfalls

- **Global by default** — putting state in a store because it might be needed elsewhere. Start local; promote on the second real consumer.
- **`useEffect` to sync derived values** — an effect that writes state computed from props or other state. Compute during render; the effect only adds a render, a stale window, and a bug.
- **Duplicating server state** — copying query results into `useState` "so they can be edited". You have just inherited cache invalidation.
- **One giant store** — every write wakes every subscriber. Split by domain.
- **Whole-store selectors** — `useStore((state) => state)` subscribes to everything you did not read.
- **Filters in `useState`** — the view cannot be shared and the back button does nothing. Put them in the URL.
- **High-churn context** — a provider holding a value that changes on every keystroke re-renders its entire subtree.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/placement-ladder.md](./reference/placement-ladder.md) | Implementing a rung — derive, URL params, server cache, or local state — and need the prose and code example for it |
| [reference/zustand-stores.md](./reference/zustand-stores.md) | Reaching for a Zustand global store, splitting stores by domain, or selecting narrow slices |
| [reference/context-injection.md](./reference/context-injection.md) | Deciding whether a value belongs in React Context versus local state or a store |
