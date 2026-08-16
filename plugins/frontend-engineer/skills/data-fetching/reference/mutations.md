# Mutations

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
