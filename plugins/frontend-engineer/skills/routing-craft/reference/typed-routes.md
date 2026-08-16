# Typed Routes

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

## Pitfall

- **Hand-built URL strings** — bypasses every type check the router offers. Use `to` plus `params`.
