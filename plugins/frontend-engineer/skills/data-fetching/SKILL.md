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

## Query Keys

Keys are the cache's addressing scheme and your invalidation API. Build them hierarchically from one factory per resource, then pair each key with its fetcher through `queryOptions` so key and return type travel together across `useQuery`, `prefetchQuery`, and `ensureQueryData`.

```ts
export const orderKeys = {
  all: ["orders"] as const,
  lists: () => [...orderKeys.all, "list"] as const,
  list: (filters: OrderFilters) => [...orderKeys.lists(), filters] as const,
  detail: (id: string) => [...orderKeys.all, "detail", id] as const,
};

export const orderQuery = (id: string) =>
  queryOptions({ queryKey: orderKeys.detail(id), queryFn: ({ signal }) => fetchOrder(id, signal) });
```

Prefix matching does the rest: invalidating `orderKeys.lists()` refreshes every filtered list and leaves details untouched. Every value the `queryFn` reads must appear in the key — a param missing from the key serves one query's data under another's address.

## staleTime vs gcTime

Two different clocks, and confusing them is the most common cache bug.

- **`staleTime`** — how long data counts as fresh. While fresh, mounting the query paints from cache and fires no request. Defaults to `0`, meaning a refetch on every mount, focus, and reconnect. This is the knob you tune, set from how fast the data actually changes: seconds for a live queue, minutes for a profile, `Infinity` for a reference list you invalidate by hand.
- **`gcTime`** — how long an *unused* query survives in memory after its last observer unmounts. Defaults to 5 minutes. It says nothing about freshness, only whether returning to a screen paints instantly or shows a cold skeleton. Set shorter than `staleTime`, it discards data you just declared fresh.

## The Four Render States

Every screen has four outcomes. Ship all four or you shipped one.

```tsx
if (query.isPending) return <OrderListSkeleton />;
if (query.isError) return <ErrorState onRetry={query.refetch} />;
if (query.data.length === 0) return <EmptyState action={<CreateOrder />} />;
return <OrderList orders={query.data} />;
```

- **Pending** — `isPending` means no data at all. Skeleton the real layout so nothing shifts when data lands, never a centered spinner.
- **Error** — name what failed and give a retry wired to `refetch`. Never a blank region.
- **Empty** — succeeded and returned nothing. **This is not an error.** An empty list is a valid answer: it gets its own copy and a primary action, never error styling.
- **Success** — the data. `isFetching` covers background refetches over data already on screen; never swap a populated screen back to a skeleton for one. Copy and announcement for these states are in `frontend-engineer:ux-checklist`.

## Mutations

Default to mutate, then invalidate the narrowest prefix that covers what changed — `onSuccess: (_data, vars) => queryClient.invalidateQueries({ queryKey: orderKeys.detail(vars.id) })`, with `queryClient` from `useQueryClient()`. One extra round trip, always correct. Go optimistic only where latency is visible and the action nearly always succeeds: toggles, reorder, inline rename. Cancel in-flight queries first or a stale response overwrites your write, and treat the `onError` restore and the `onSettled` invalidation as mandatory — they are what separates an optimistic update from a UI that silently lies.

```tsx
useMutation({
  mutationFn: toggleFavorite,
  onMutate: async (order) => {
    await queryClient.cancelQueries({ queryKey: orderKeys.detail(order.id) });
    const previous = queryClient.getQueryData(orderKeys.detail(order.id));
    queryClient.setQueryData(orderKeys.detail(order.id), { ...order, favorite: !order.favorite });
    return { previous };
  },
  onError: (_error, order, rollback) =>
    queryClient.setQueryData(orderKeys.detail(order.id), rollback?.previous),
  onSettled: () => queryClient.invalidateQueries({ queryKey: orderKeys.all }),
});
```

## Suspense And Error Boundaries

`useSuspenseQuery` deletes the pending branch from the component: `data` is never undefined, the fallback moves to `<Suspense>`, the failure to an error boundary.

- Scope boundaries per region, not per app — a failed sidebar widget must not blank the screen. Set `throwOnError` on a plain query only when a boundary handles it better than local error UI does.
- `useSuspenseQuery` has no `enabled` option; a conditional query stays `useQuery`. Two sibling `useSuspenseQuery` calls in one component serialize, since the first suspends before the second runs. Use `useSuspenseQueries` to fetch them in parallel.

## Kill The Waterfall

A component that fetches after its parent renders adds a full round trip per level. Start every request the moment you know its key.

- Prefetch in the route loader with `queryClient.ensureQueryData(...)` — it resolves from cache when fresh, fetches when not, and shares one entry with the component. Use `void queryClient.prefetchQuery(...)` for data the screen can render without. Loader wiring is `frontend-engineer:routing-craft`.
- Prefetch on intent: hover or focus of a link warms the detail view before the click. Fetch independent resources with `useQueries`, never a sequential `enabled` chain unless one truly depends on the other's result.

## Pagination And Infinite Lists

Paged tables keep the page in the URL and set `placeholderData: keepPreviousData`, so the table holds the previous page instead of collapsing to a skeleton on every change; gate the controls on `isPlaceholderData`.

```tsx
const feed = useInfiniteQuery({
  queryKey: orderKeys.lists(),
  queryFn: ({ pageParam }) => fetchOrders({ cursor: pageParam }),
  initialPageParam: null as string | null,
  getNextPageParam: (lastPage) => lastPage.nextCursor ?? undefined,
});
```

Render `data.pages.flatMap(...)` and drive the control with `hasNextPage` and `isFetchingNextPage`; returning `undefined` ends the list. Prefer cursors over offsets for anything that mutates while paging — offsets duplicate and skip rows under concurrent inserts. Long lists then cost render time, not fetch time: virtualize per `frontend-engineer:app-perf`.

## Typed API Boundary

`await response.json()` is `any` wearing a type annotation. Validate once at the edge, then trust the type inward.

```ts
const OrderSchema = z.object({ id: z.string(), total: z.number(), status: z.enum(["open", "paid"]) });

export async function fetchOrder(id: string, signal?: AbortSignal) {
  const response = await fetch(`/api/orders/${id}`, { signal });
  if (!response.ok) throw new ApiError(response.status);
  return OrderSchema.parse(await response.json());
}
```

One fetch wrapper owns base URL, auth headers, and error normalization; screens never call `fetch` directly. Throw on non-2xx, or a resolved promise carrying an error body makes every query look successful. Infer TypeScript types from the schema so runtime shape and compile-time type cannot drift, and when a response violates the contract, report it — that is `backend-engineer`'s to fix, not something to patch client-side.

## Pitfalls

- **Fetching in `useEffect`** — races, no cache, no dedupe, no cancellation.
- **Mirroring server data into `useState`** — two truths; the copy rots on the next cache update.
- **Key missing an input** — a filter the `queryFn` reads but the key omits. You will serve the wrong data.
- **Empty rendered as error** — zero results is a success state with its own copy and action.
- **Blanket invalidation** — `invalidateQueries()` with no key refetches the whole app.
- **Optimistic without rollback** — no `cancelQueries`, no `onError` restore; the UI keeps a value the server rejected.
- **`staleTime: 0` everywhere** — every mount and refocus refetches. Tune it to the data.
- **Waterfalls** — each nested component starting its own fetch. Hoist to the loader or `useQueries`.
