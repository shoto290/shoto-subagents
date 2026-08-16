---
name: frontend-perf
description: React/Next performance — rendering, bundle size, Core Web Vitals.
---

# Frontend Perf

Performance work in React + Next.js. The rule above all: measure first, change second. Optimize the proven bottleneck, not the suspected one.

## Measure First
Never optimize blind. Find the actual bottleneck before touching code — tools in [reference/measurement-tools.md](./reference/measurement-tools.md). A change with no measured before/after is not an optimization.

## Rendering
- Avoid needless re-renders. Lift state to where it is used; co-locate it so a change does not re-render an unrelated subtree.
- Reach for `memo` / `useMemo` / `useCallback` **only when profiling shows they help**. Gratuitous memoization adds cost and noise.
- Use stable, identity-preserving keys in lists — never the array index for reorderable data.
- Do not allocate new objects, arrays, or inline functions in render hot paths; they break referential equality and defeat memoization downstream.

## Hooks Discipline
Do **not** reach for `useEffect` by default — it is for synchronizing with an external system only.
- Derive values during render instead of mirroring them into state via an effect.
- Run logic in event handlers, not effects, when it responds to a user action.
- Subscribe to external stores with `useSyncExternalStore`, not an effect-plus-state pattern.
- Effect-driven data fetching is an anti-pattern here: prefer server components, route loaders, or a query library.

## Server, Bundle, Assets
Keep data and heavy logic off the client, ship less JS, and never let images or fonts block first paint — rules in [reference/bundle-and-assets.md](./reference/bundle-and-assets.md).

## Core Web Vitals
Budget LCP, CLS, and INP explicitly; per-metric rules in [reference/core-web-vitals.md](./reference/core-web-vitals.md).

## Pitfalls
Premature optimization — tuning code that was never the bottleneck. Over-memoization — `memo`/`useMemo`/`useCallback` everywhere, unmeasured. Giant client bundles — `"use client"` too high in the tree, heavy deps shipped to the browser. Effect-driven data fetching instead of server components or a query layer.

## Reference
| File | Read when |
| :-- | :-- |
| [reference/measurement-tools.md](./reference/measurement-tools.md) | Before changing any code, to pick the profiler, analyzer, or field-data tool that locates the real bottleneck. |
| [reference/bundle-and-assets.md](./reference/bundle-and-assets.md) | When the client bundle is too large, a `"use client"` boundary sits too high, or images, fonts, or CSS block first paint. |
| [reference/core-web-vitals.md](./reference/core-web-vitals.md) | When tuning a specific LCP, CLS, or INP score against a budget. |
