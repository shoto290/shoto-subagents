---
name: routing-craft
description: Type-safe routes, loaders, search params, and navigation guards.
---

# Routing Craft

The route tree is the application's real state machine: it decides what is mounted, what is fetched, and what is shareable. TanStack Router is the reference; the judgment transfers to any router, the API does not.

## Non-Negotiables

- Never build a URL string by hand — use `to` plus `params`; a template literal bypasses every type check the router offers.
- Auth checks belong in `beforeLoad`, never inside a component — a component-level check lets the protected screen mount and fetch before the redirect lands.
- Merge search params through a functional updater; replacing the object drops unrelated params.
- Set `loaderDeps` whenever the loader reads search params, or it never re-runs on a filter change.
- Await only what the first paint needs in a loader; awaiting everything blocks the whole navigation on the slowest request.
- Throw `redirect()` and `notFound()` — returning them does nothing.
- The URL is the source of truth for shareable state; never mirror it into local state.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/typed-routes.md](./reference/typed-routes.md) | Wiring a route's params, reading them with `useParams`/`useSearch`, or linking with `<Link>`. |
| [reference/search-params.md](./reference/search-params.md) | Putting filters, sort, page, or tabs into the URL as validated, typed state. |
| [reference/loaders.md](./reference/loaders.md) | Loading data for a route, code-splitting by route, or deciding where fetched data should live. |
| [reference/guards.md](./reference/guards.md) | Gating a route behind auth in `beforeLoad`, or structuring a shared layout route. |
| [reference/route-fallbacks.md](./reference/route-fallbacks.md) | Adding a route's pending, error, or not-found UI. |
| [reference/navigation-blocking.md](./reference/navigation-blocking.md) | Blocking navigation away from a screen with unsaved changes. |
