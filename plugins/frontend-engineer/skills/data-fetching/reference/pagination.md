# Pagination

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
