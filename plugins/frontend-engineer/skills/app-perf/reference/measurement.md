# Measurement

Never tune from intuition. Reproduce the slowness, attribute it, then fix the attributed cause.

- **Route-level Lighthouse** — run against the real authenticated route, not the marketing home page. Whole-app scores hide the screen that is slow.
- **Bundle visualizer** (`rollup-plugin-visualizer`) — what each route chunk actually contains, and which dependency dragged in the rest.
- **web-vitals in production** — LCP, CLS, INP tagged with the route pattern. Field data decides priorities; lab data explains them.
- **React Profiler** — which components re-render on the interaction that feels slow, and why.
- **Query devtools** — duplicate keys, refetch storms, cache misses on data you already had.
- **Network waterfall** — the single most useful view. Anything that starts only after something else finished is the bug.
