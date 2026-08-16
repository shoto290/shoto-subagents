# Loaders

The loader exists to start requests as soon as the router knows the URL: before the component mounts, and during preload on hover. Give it `ensureQueryData`, not a bare fetch, so loader and component read one cache entry.

- Put `queryClient` on the router context via `createRootRouteWithContext<{ queryClient: QueryClient }>()` so every loader reaches it without importing a singleton.
- Return nothing from the loader when Query owns the data — the component reads the cache. Two copies of the same data drift apart.
- Set `defaultPreloadStaleTime: 0` when Query is the cache, so the router stops holding its own copy and lets Query dedupe and decide freshness.
- `defaultPreload: "intent"` warms the next route on hover or focus. Cheapest perceived-performance win in the app.
- Awaiting every request blocks the whole navigation. Await only what the first paint needs; start the rest without awaiting and let a `Suspense` boundary fill them in.
- Cache lifetimes, invalidation, and mutation flows are `frontend-engineer:data-fetching`.

## Code-Splitting Per Route

Turn on `autoCodeSplitting: true` in the router's bundler plugin: critical config — path, loader, validators — stays in the main bundle while components ship per route. To split by hand, move the component into a `.lazy.tsx` file with `createLazyFileRoute`. Never lazy-load loaders or validators; the router needs them to match, validate, and preload.

## Where Data Belongs

- **Route loader** — what the screen cannot render without: the entity, the primary list, the permissions the layout branches on.
- **Component query** — what a region owns and can stream independently: a widget, a lazily opened panel, a tab's contents.
- **Never a component `useEffect`** — it starts after render, long after the router knew the URL. That is one avoidable round trip per level.
- Split the screen the way it fails: anything that must not block the shell goes in a component query behind its own `Suspense` boundary.

## Pitfalls

- **Awaiting everything in the loader** — navigation blocks on the slowest request. Await the critical path only.
- **Loader returning data Query also caches** — two owners, two lifetimes. Pick one.
