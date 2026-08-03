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

## 1. Derive It

If a value can be computed during render, it is not state. Storing it creates a second copy that will eventually disagree with the first.

```tsx
const visible = items.filter((item) => item.status === status);
const total = lines.reduce((sum, line) => sum + line.price * line.quantity, 0);
const canCheckout = visible.length > 0 && total <= budget;
```

Memoize a derivation only when profiling says it matters — see `frontend-engineer:app-perf`.

## 2. URL and Search Params

Anything that changes what the screen shows and that a user might bookmark, share, reload, or reach with the back button belongs in the URL: filters, sort, pagination, active tab, opened detail id, search query.

```tsx
const { status, page } = Route.useSearch();
const navigate = Route.useNavigate();

const setStatus = (next: Status) =>
  navigate({ search: (prev) => ({ ...prev, status: next, page: 1 }) });
```

The URL is the only container that survives a refresh, works in a new tab, and makes the back button behave. Validate the search schema at the route so params are typed and malformed URLs fall back to sane defaults — see `frontend-engineer:routing-craft`.

## 3. Server Cache

Data owned by the server is not application state; it is a cache of someone else's state. Read it from the cache, every time.

```tsx
const { data, isPending, isError } = useQuery({
  queryKey: ["invoices", { status, page }],
  queryFn: () => fetchInvoices({ status, page }),
});
```

Never copy `data` into `useState`. The moment you do, you own invalidation, refetching, staleness, and reconciliation with every other screen that mutates the same record. Filters go in the query key, not into a local mirror — see `frontend-engineer:data-fetching`.

## 4. Local State

Colocate. Declare state in the closest component that uses it and lift only when a second real consumer appears. Ephemeral UI — an open menu, a hovered row, an input draft — almost never leaves the component that renders it.

Lifting has a cost: every component between the owner and the consumer re-renders. When lifting would mean threading props through four layers, pass the rendered node down as `children` instead of passing the state down.

## 5. Global Store — Last Resort

A store earns its place only for client state that unrelated screens genuinely share and that has no business in the URL: a command palette, a wizard spanning routes, an undo stack, a toast queue.

```tsx
import { create } from "zustand";

type CommandPaletteStore = {
  open: boolean;
  query: string;
  setOpen: (open: boolean) => void;
  setQuery: (query: string) => void;
};

export const useCommandPalette = create<CommandPaletteStore>()((set) => ({
  open: false,
  query: "",
  setOpen: (open) => set({ open }),
  setQuery: (query) => set({ query }),
}));
```

## Split Stores, Select Narrow Slices

One store per domain, never one store for the app. Separate stores let unrelated features change without waking each other's subscribers, and each can be deleted on its own.

Subscribe to the smallest value you actually use. A selector returning the whole store re-renders on every unrelated write:

```tsx
const open = useCommandPalette((state) => state.open);
```

When a component needs several values, wrap the selector so a fresh object literal is not mistaken for a change on every render:

```tsx
import { useShallow } from "zustand/react/shallow";

const { open, query } = useCommandPalette(
  useShallow((state) => ({ open: state.open, query: state.query })),
);
```

Keep actions on the store. They are stable references, so a component that only dispatches never re-renders when state changes.

## Context Is Injection, Not State

Context passes things that are fixed for a subtree: a query client, a theme, a feature-flag reader, the current tenant. Every consumer re-renders when the context value changes, so it is the wrong home for anything high-churn — form drafts, cursor position, scroll offset. Those stay local or go in a store.

Context is also how you scope a store: when two instances of the same feature can be on screen at once, create the store per subtree and provide it, instead of exporting a module-level singleton.

## Pitfalls

- **Global by default** — putting state in a store because it might be needed elsewhere. Start local; promote on the second real consumer.
- **`useEffect` to sync derived values** — an effect that writes state computed from props or other state. Compute during render; the effect only adds a render, a stale window, and a bug.
- **Duplicating server state** — copying query results into `useState` "so they can be edited". You have just inherited cache invalidation.
- **One giant store** — every write wakes every subscriber. Split by domain.
- **Whole-store selectors** — `useStore((state) => state)` subscribes to everything you did not read.
- **Filters in `useState`** — the view cannot be shared and the back button does nothing. Put them in the URL.
- **High-churn context** — a provider holding a value that changes on every keystroke re-renders its entire subtree.
