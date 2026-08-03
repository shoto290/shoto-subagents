---
name: app-perf
description: 'Application performance: routes, bundles, queries, lists, vitals.'
---

# App Perf

Performance of a running application: what a route ships, when it starts fetching, how often it re-renders, and what the user actually waits for. Measure first, change second — an optimization with no before/after number is a guess with a diff.

## Measure First

Never tune from intuition. Reproduce the slowness, attribute it, then fix the attributed cause.

- **Route-level Lighthouse** — run against the real authenticated route, not the marketing home page. Whole-app scores hide the screen that is slow.
- **Bundle visualizer** (`rollup-plugin-visualizer`) — what each route chunk actually contains, and which dependency dragged in the rest.
- **web-vitals in production** — LCP, CLS, INP tagged with the route pattern. Field data decides priorities; lab data explains them.
- **React Profiler** — which components re-render on the interaction that feels slow, and why.
- **Query devtools** — duplicate keys, refetch storms, cache misses on data you already had.
- **Network waterfall** — the single most useful view. Anything that starts only after something else finished is the bug.

## Budget The Route, Not The App

- Set an initial-JS budget per route (a workable default: ~170KB gzipped for the first route a user hits) and enforce it in CI with `size-limit` or a bundle-size check on PRs.
- Track the budget per entry chunk. "The app is 2MB" is unactionable; "the orders route grew 90KB" gets fixed.
- Every new dependency states its cost before it is merged. A date library at 70KB to format one timestamp is a rejected PR, not a follow-up ticket.

## Route-Level Code Splitting

Routes are the natural split boundary — the user is already waiting for a navigation.

- Lazy-load route components; keep the shell, router, and the first route eager.
- Split heavy, conditionally-rendered features inside a route too: editors, charting, PDF viewers, date pickers used on one tab.
- Preload on intent — hover or focus of a link, or viewport entry — so the chunk is warm before the click.
- Avoid barrel files (`index.ts` re-exporting everything). One import from a barrel can defeat splitting and pull a whole feature into the wrong chunk.
- Never lazy-load what renders above the fold on first paint. That trades one round trip for two.

## Kill Waterfalls

The most expensive frontend bug is serial requests. Start fetches as early as the router lets you.

```ts
export const Route = createFileRoute("/orders/$orderId")({
  loader: ({ context, params }) =>
    Promise.all([
      context.queryClient.ensureQueryData(orderQuery(params.orderId)),
      context.queryClient.ensureQueryData(orderEventsQuery(params.orderId)),
    ]),
  component: lazyRouteComponent(() => import("./order-detail")),
});
```

- Fetching in the component means code chunk, then render, then request — three sequential trips. A loader collapses them to one.
- Fetch siblings in parallel. Dependent requests are a data-shape problem to push to the API, not a frontend fact of life.
- Prefetch the next likely route on link hover; prefetch detail data from a list row.
- Place Suspense boundaries per region so a slow widget never gates the whole screen. Fetching patterns in `frontend-engineer:data-fetching`, route wiring in `frontend-engineer:routing-craft`.

## Cache Tuning Is A Perf Lever

`staleTime` is usually the single highest-leverage line in an app.

```ts
const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 30_000,
      gcTime: 5 * 60_000,
      refetchOnWindowFocus: false,
      retry: 1,
    },
  },
});
```

- A `staleTime` of 0 refetches on every mount and every focus. Set it from how fast the data actually changes: reference data in minutes, dashboards in seconds, prices at 0.
- Keep `gcTime` long enough that Back is instant.
- Use `placeholderData` to hold the previous page during pagination — the list stays put instead of collapsing to a skeleton on every page change.
- Stable, serializable query keys or the cache silently misses and every render refetches.
- `select` narrows both the subscription and the re-render surface.

## Contain Re-Renders At Feature Scale

- Subscribe narrowly. `useQuery({ ...q, select: (d) => d.total })` re-renders only when the total changes.
- Move state down to the component that owns it, or lift slow content out via `children` so a frequently-changing parent does not re-render a static subtree.
- Pass ids across feature boundaries, not freshly-constructed objects. New identity every render defeats every memo downstream.
- `useDeferredValue` for filter and search inputs; `startTransition` for tab and route switches. Keep typing at 60fps while the expensive list catches up.
- Memoize only what the Profiler proved expensive. Store-level splitting in `frontend-engineer:app-state`.

## Long Lists

- Virtualize past roughly a hundred rows, or as soon as a row is non-trivial. Below that, virtualization costs more than it saves.
- Hoist `Intl.NumberFormat` / `Intl.DateTimeFormat` instances to module scope. Constructing them per cell is a classic invisible list killer.
- Memoize the row component and keep its props primitive.
- Provide a stable size estimate so the scrollbar does not thrash.
- Do not animate rows in a virtualized list — recycled nodes replay entrances.

## Core Web Vitals Of Real Pages

- **LCP** — identify the actual LCP element per route. It must not be lazy-loaded, must not wait on a client fetch, and its origin should be `preconnect`ed. Server-render or stream the shell where the stack allows.
- **CLS** — reserve space for every async region, image, and banner before it arrives. Layout mechanics live in `frontend-engineer:screen-layout`; here, verify the number.
- **INP** — long tasks come from big synchronous re-renders on keypress and from third-party scripts. Break up the work, defer non-critical scripts, and never do layout reads in a scroll handler.

## Images And Fonts

- Explicit `width`/`height` or `aspect-ratio` on every image, always.
- `loading="lazy"` below the fold, `fetchpriority="high"` on the LCP image, and never both.
- Responsive `srcset` + `sizes`; modern formats for anything content-sized.
- Self-host fonts, preload the single critical face, `font-display: swap`, and subset. One extra weight is a real LCP regression.

## Pitfalls

- **Optimizing unmeasured code** — the memoization landed, the number did not move.
- **Component-level fetching** — chunk, render, request: a three-hop waterfall on every navigation.
- **`staleTime: 0` everywhere** — the cache exists and the app still refetches constantly.
- **Barrel-file imports** — one named import pulls an entire feature into the shell chunk.
- **Memoizing everything** — more allocations, more comparisons, no gain, and a codebase nobody can read.
- **Virtualizing early** — added complexity and broken Ctrl+F on a 30-row table.
- **Whole-app scores** — a 95 on the login page while the dashboard takes 6 seconds.
- **Duplicating design-system work** — component render cost and library bundle size belong to the design system's own perf work, not to a screen.
