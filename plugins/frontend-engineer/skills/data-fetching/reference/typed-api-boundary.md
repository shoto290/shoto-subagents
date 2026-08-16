# Typed API Boundary

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
