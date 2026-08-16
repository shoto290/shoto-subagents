# Query Keys

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
