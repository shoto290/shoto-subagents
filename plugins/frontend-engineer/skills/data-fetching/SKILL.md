---
name: data-fetching
description: Server state with TanStack Query — keys, cache, mutations, states.
---

# Data Fetching

Server state is a cache of data you do not own: it is shared, it goes stale, it fails, and it comes back empty. TanStack Query is the reference here; the judgment transfers to whatever query layer the repo already uses.

## Server State Is Not App State

- Never fetch in `useEffect`. It races, double-fires in StrictMode, refetches on every remount, caches nothing, and hands you cancellation to manage. Use a query.
- Never copy query data into `useState`. The copy rots the moment the cache updates and you now own two truths. Derive during render, or project with `select`.
- The only writes to server state are mutations — a local edit that is not sent and invalidated is a lie on screen. Where non-server state lives is `frontend-engineer:app-state`; the API contract itself belongs to `backend-engineer` and you only consume it.

## Pitfalls

- **Fetching in `useEffect`** — races, no cache, no dedupe, no cancellation.
- **Mirroring server data into `useState`** — two truths; the copy rots on the next cache update.
- **Key missing an input** — a filter the `queryFn` reads but the key omits. You will serve the wrong data.
- **Empty rendered as error** — zero results is a success state with its own copy and action.
- **Blanket invalidation** — `invalidateQueries()` with no key refetches the whole app.
- **Optimistic without rollback** — no `cancelQueries`, no `onError` restore; the UI keeps a value the server rejected.
- **`staleTime: 0` everywhere** — every mount and refocus refetches. Tune it to the data.
- **Waterfalls** — each nested component starting its own fetch. Hoist to the loader or `useQueries`.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/query-keys.md](./reference/query-keys.md) | Building a key factory, wiring `queryOptions`, or invalidating a prefix |
| [reference/cache-timing.md](./reference/cache-timing.md) | Tuning `staleTime` or `gcTime`, or chasing an unwanted refetch |
| [reference/render-states.md](./reference/render-states.md) | Rendering pending/error/empty/success, or adopting Suspense |
| [reference/mutations.md](./reference/mutations.md) | Writing a mutation, or going optimistic with rollback |
| [reference/waterfalls.md](./reference/waterfalls.md) | A child component fetches after its parent renders |
| [reference/pagination.md](./reference/pagination.md) | Paging a table or building an infinite list |
| [reference/typed-api-boundary.md](./reference/typed-api-boundary.md) | Validating a fetch response or writing the fetch wrapper |
