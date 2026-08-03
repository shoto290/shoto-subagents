---
name: routing-craft
description: Type-safe routes, loaders, search params, and navigation guards.
---

# Routing Craft

The route tree is the application's real state machine: it decides what is mounted, what is fetched, and what is shareable. TanStack Router is the reference; the judgment transfers to any router, the API does not.

## Typed Routes, Typed Params

File-based routing generates the tree, and the generated types are the whole point. `createFileRoute` binds a path to its params, search, loader data, and context — so a wrong `to`, a missing param, or a renamed route is a compile error instead of a production 404.

```tsx
export const Route = createFileRoute("/orders/$orderId")({
  loader: ({ context, params }) => context.queryClient.ensureQueryData(orderQuery(params.orderId)),
  component: OrderDetail,
});

function OrderDetail() {
  const { orderId } = Route.useParams();
  const { data } = useSuspenseQuery(orderQuery(orderId));
  return <OrderSummary order={data} />;
}
```

- Read with `Route.useParams()` / `Route.useSearch()` inside the route; use `getRouteApi("/orders/$orderId")` from a component further down. Never thread route values as props through three layers.
- Never build a URL string by hand. `<Link to="/orders/$orderId" params={{ orderId }}>` is checked end to end; a template literal is not.
- Path params arrive as strings. Coerce them at the route boundary, not in each component, so every consumer receives the same type.

## Search Params Are Typed State

Search params are the router's answer to what belongs in the URL: filters, sort, page, active tab, open panel. Anything a user should be able to refresh, deep-link, or share lives there. Validate the whole object with defaults so the route always receives a complete value.

```tsx
const orderSearchSchema = z.object({
  page: z.number().int().min(1).default(1),
  status: z.enum(["open", "paid", "void"]).default("open"),
  q: z.string().default(""),
});

export const Route = createFileRoute("/orders/")({
  validateSearch: orderSearchSchema,
  loaderDeps: ({ search }) => ({ page: search.page, status: search.status }),
  loader: ({ context, deps }) => context.queryClient.ensureQueryData(orderListQuery(deps)),
  component: OrderList,
});
```

- `validateSearch` runs on every navigation against user-editable input. Fall back with `.default()` / `.catch()` rather than throwing when someone hand-types `?page=abc`.
- Update through a functional updater — `navigate({ search: (prev) => ({ ...prev, page: prev.page + 1 }) })`. Replacing the object silently drops unrelated params.
- `loaderDeps` is what puts search params in the loader's cache key. Omit it and the loader never re-runs when the filter changes.
- Use `replace: true` for high-frequency updates like a search box, or Back walks through every keystroke. State that is neither shareable nor survivable across refresh stays out of the URL — see `frontend-engineer:app-state`.

## Loaders And The Query Cache

The loader exists to start requests as soon as the router knows the URL: before the component mounts, and during preload on hover. Give it `ensureQueryData`, not a bare fetch, so loader and component read one cache entry.

- Put `queryClient` on the router context via `createRootRouteWithContext<{ queryClient: QueryClient }>()` so every loader reaches it without importing a singleton.
- Return nothing from the loader when Query owns the data — the component reads the cache. Two copies of the same data drift apart.
- Set `defaultPreloadStaleTime: 0` when Query is the cache, so the router stops holding its own copy and lets Query dedupe and decide freshness.
- `defaultPreload: "intent"` warms the next route on hover or focus. Cheapest perceived-performance win in the app.
- Awaiting every request blocks the whole navigation. Await only what the first paint needs; start the rest without awaiting and let a `Suspense` boundary fill them in.
- Cache lifetimes, invalidation, and mutation flows are `frontend-engineer:data-fetching`.

## Guards Belong In `beforeLoad`

`beforeLoad` runs before the loader, top-down, and is the only correct place for an auth gate. A redirect fired from a component runs after the protected screen has already mounted and fetched.

```tsx
export const Route = createFileRoute("/_authenticated")({
  beforeLoad: ({ context, location }) => {
    if (!context.auth.isAuthenticated) {
      throw redirect({ to: "/login", search: { redirect: location.href } });
    }
  },
});
```

- **Throw** the `redirect()`; returning it does nothing. Guard once on a pathless layout route, not on every child.
- Carry the attempted URL in search so login returns the user where they were.
- What `beforeLoad` returns merges into `context` for descendants — resolve the session once there instead of re-reading it per child.

## Layout Routes

- A **pathless** layout route (`_authenticated.tsx`) adds a wrapper, a guard, and shared context without adding a URL segment.
- A **path** layout route (`orders.tsx` above `orders/index.tsx` and `orders/$orderId.tsx`) renders the shell once; its `<Outlet />` swaps only the child, so the shell keeps its scroll position and its data across child navigations.
- Mount the app shell in the root or a top layout route so navigation never remounts the sidebar — see `frontend-engineer:screen-layout`. Nest to share layout, guards, or data; nesting that only mirrors the file system buys matched routes and no behavior.

## Per-Route Pending, Error, And Not Found

Each route declares its own fallbacks and the nearest one handles the failure, so a broken child renders inside its parent's shell instead of blanking the app.

- `pendingComponent` — shown once the loader exceeds `defaultPendingMs` (1s) and held at least `defaultPendingMinMs` (500ms) so fast loads never flash. Skeleton the real layout.
- `errorComponent` — receives the error and a reset handler. Always offer a retry.
- `notFoundComponent` — pair it with `throw notFound()` in the loader when the record does not exist. A missing entity is a route state, not an error toast.
- Set `defaultPendingComponent` / `defaultErrorComponent` on the router for the baseline; override per route only where the shape genuinely differs.

## Code-Splitting Per Route

Turn on `autoCodeSplitting: true` in the router's bundler plugin: critical config — path, loader, validators — stays in the main bundle while components ship per route. To split by hand, move the component into a `.lazy.tsx` file with `createLazyFileRoute`. Never lazy-load loaders or validators; the router needs them to match, validate, and preload.

## Blocking Navigation On Unsaved Work

```tsx
const { status, proceed, reset } = useBlocker({
  shouldBlockFn: () => form.formState.isDirty,
  withResolver: true,
});
```

Render your own dialog while `status === "blocked"`: `proceed()` discards, `reset()` stays. Add `enableBeforeUnload` to cover reload and tab close, which no in-app dialog can intercept. Block only on genuinely unsaved input — a blocker that fires on a pristine form trains users to click through it.

## Where Data Belongs

- **Route loader** — what the screen cannot render without: the entity, the primary list, the permissions the layout branches on.
- **Component query** — what a region owns and can stream independently: a widget, a lazily opened panel, a tab's contents.
- **Never a component `useEffect`** — it starts after render, long after the router knew the URL. That is one avoidable round trip per level.
- Split the screen the way it fails: anything that must not block the shell goes in a component query behind its own `Suspense` boundary.

## Pitfalls

- **Hand-built URL strings** — bypasses every type check the router offers. Use `to` plus `params`.
- **Auth checks inside components** — the protected screen mounts and fetches before the redirect lands. Guard in `beforeLoad`.
- **Missing `loaderDeps`** — the loader never re-runs on a search-param change and the screen keeps the previous filter's data.
- **Replacing the whole search object** — drops unrelated params. Always spread `prev`.
- **Ephemeral state in the URL** — transient toggles pollute history and re-trigger loaders.
- **Awaiting everything in the loader** — navigation blocks on the slowest request. Await the critical path only.
- **Route state mirrored into local state** — the URL is the source of truth; the copy desyncs the first time the user hits Back.
- **Loader returning data Query also caches** — two owners, two lifetimes. Pick one.
