---
name: app-perf
description: 'Application performance: routes, bundles, queries, lists, vitals.'
---

# App Perf

Performance of a running application: what a route ships, when it starts fetching, how often it re-renders, and what the user actually waits for. Measure first, change second — an optimization with no before/after number is a guess with a diff.

## Pitfalls

- **Optimizing unmeasured code** — the memoization landed, the number did not move.
- **Component-level fetching** — chunk, render, request: a three-hop waterfall on every navigation.
- **`staleTime: 0` everywhere** — the cache exists and the app still refetches constantly.
- **Barrel-file imports** — one named import pulls an entire feature into the shell chunk.
- **Memoizing everything** — more allocations, more comparisons, no gain, and a codebase nobody can read.
- **Virtualizing early** — added complexity and broken Ctrl+F on a 30-row table.
- **Whole-app scores** — a 95 on the login page while the dashboard takes 6 seconds.
- **Duplicating design-system work** — component render cost and library bundle size belong to the design system's own perf work, not to a screen.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/measurement.md](./reference/measurement.md) | Diagnosing where time actually goes before changing anything — Lighthouse, bundle visualizer, web-vitals, Profiler, query devtools, network waterfall. |
| [reference/bundles-and-splitting.md](./reference/bundles-and-splitting.md) | Setting a route's JS budget, or deciding what to code-split, lazy-load, or preload. |
| [reference/waterfalls-and-cache.md](./reference/waterfalls-and-cache.md) | Fixing serial network waterfalls in loaders, or tuning `staleTime`/`gcTime`/query cache behavior. |
| [reference/rendering-and-lists.md](./reference/rendering-and-lists.md) | Containing re-renders at feature scale, or virtualizing and optimizing long lists. |
| [reference/vitals-and-assets.md](./reference/vitals-and-assets.md) | Fixing Core Web Vitals (LCP, CLS, INP), or optimizing images and fonts. |
