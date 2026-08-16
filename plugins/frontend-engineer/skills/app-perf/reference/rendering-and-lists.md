# Rendering and Lists

## Contain Re-Renders At Feature Scale

- Subscribe narrowly. `useQuery({ ...q, select: (d) => d.total })` re-renders only when the total changes.
- Move state down to the component that owns it, or lift slow content out via `children` so a frequently-changing parent does not re-render a static subtree.
- Pass ids across feature boundaries, not freshly-constructed objects. New identity every render defeats every memo downstream.
- `useDeferredValue` for filter and search inputs; `startTransition` for tab and route switches. Keep typing at 60fps while the expensive list catches up.
- Memoize only what the Profiler proved expensive. Store-level splitting in `frontend-engineer:app-state`.

## Long Lists

- Virtualize past roughly a hundred rows, or as soon as a row is non-trivial. Below that, virtualization costs more than it saves.
- Hoist `Intl.NumberFormat` / `Intl.DateTimeFormat` instances to module scope. Constructing them per cell is a classic invisible list killer.
- Memoize the row component and keep its props primitive.
- Provide a stable size estimate so the scrollbar does not thrash.
- Do not animate rows in a virtualized list — recycled nodes replay entrances.
