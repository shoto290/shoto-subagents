# Render States

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

## Suspense And Error Boundaries

`useSuspenseQuery` deletes the pending branch from the component: `data` is never undefined, the fallback moves to `<Suspense>`, the failure to an error boundary.

- Scope boundaries per region, not per app — a failed sidebar widget must not blank the screen. Set `throwOnError` on a plain query only when a boundary handles it better than local error UI does.
- `useSuspenseQuery` has no `enabled` option; a conditional query stays `useQuery`. Two sibling `useSuspenseQuery` calls in one component serialize, since the first suspends before the second runs. Use `useSuspenseQueries` to fetch them in parallel.
