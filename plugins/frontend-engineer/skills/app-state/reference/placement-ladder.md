# Placement Ladder

## 1. Derive It

If a value can be computed during render, it is not state. Storing it creates a second copy that will eventually disagree with the first.

```tsx
const visible = items.filter((item) => item.status === status);
const total = lines.reduce((sum, line) => sum + line.price * line.quantity, 0);
const canCheckout = visible.length > 0 && total <= budget;
```

Memoize a derivation only when profiling says it matters — see `frontend-engineer:app-perf`.

## 2. URL and Search Params

Anything that changes what the screen shows and that a user might bookmark, share, reload, or reach with the back button belongs in the URL: filters, sort, pagination, active tab, opened detail id, search query.

```tsx
const { status, page } = Route.useSearch();
const navigate = Route.useNavigate();

const setStatus = (next: Status) =>
  navigate({ search: (prev) => ({ ...prev, status: next, page: 1 }) });
```

The URL is the only container that survives a refresh, works in a new tab, and makes the back button behave. Validate the search schema at the route so params are typed and malformed URLs fall back to sane defaults — see `frontend-engineer:routing-craft`.

## 3. Server Cache

Data owned by the server is not application state; it is a cache of someone else's state. Read it from the cache, every time.

```tsx
const { data, isPending, isError } = useQuery({
  queryKey: ["invoices", { status, page }],
  queryFn: () => fetchInvoices({ status, page }),
});
```

Never copy `data` into `useState`. The moment you do, you own invalidation, refetching, staleness, and reconciliation with every other screen that mutates the same record. Filters go in the query key, not into a local mirror — see `frontend-engineer:data-fetching`.

## 4. Local State

Colocate. Declare state in the closest component that uses it and lift only when a second real consumer appears. Ephemeral UI — an open menu, a hovered row, an input draft — almost never leaves the component that renders it.

Lifting has a cost: every component between the owner and the consumer re-renders. When lifting would mean threading props through four layers, pass the rendered node down as `children` instead of passing the state down.
