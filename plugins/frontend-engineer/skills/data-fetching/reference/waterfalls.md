# Waterfalls

A component that fetches after its parent renders adds a full round trip per level. Start every request the moment you know its key.

- Prefetch in the route loader with `queryClient.ensureQueryData(...)` — it resolves from cache when fresh, fetches when not, and shares one entry with the component. Use `void queryClient.prefetchQuery(...)` for data the screen can render without. Loader wiring is `frontend-engineer:routing-craft`.
- Prefetch on intent: hover or focus of a link warms the detail view before the click. Fetch independent resources with `useQueries`, never a sequential `enabled` chain unless one truly depends on the other's result.
