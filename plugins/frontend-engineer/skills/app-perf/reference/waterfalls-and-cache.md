# Waterfalls and Cache

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
