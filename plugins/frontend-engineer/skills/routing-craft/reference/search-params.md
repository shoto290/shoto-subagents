# Search Params

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

## Pitfalls

- **Missing `loaderDeps`** — the loader never re-runs on a search-param change and the screen keeps the previous filter's data.
- **Replacing the whole search object** — drops unrelated params. Always spread `prev`.
- **Ephemeral state in the URL** — transient toggles pollute history and re-trigger loaders.
- **Route state mirrored into local state** — the URL is the source of truth; the copy desyncs the first time the user hits Back.
