# Bundle and Assets

## Server vs Client

- Prefer **React Server Components** and server-side work. Keep data and heavy logic off the client.
- Keep `"use client"` boundaries small and pushed to the leaves — every client component and its imports ship as JS.
- Use **Suspense** and streaming to show meaningful content sooner instead of blocking on the slowest data.

## Bundle

- Code-split with dynamic `import()` (`next/dynamic`) for routes and heavy, non-critical UI.
- Ensure tree-shaking works: import named exports, avoid barrel files that pull in whole libraries.
- Audit heavy dependencies — prefer a lighter alternative or a native API over a large transitive dependency.
- Defer non-critical JS; do not block first paint on analytics or third-party widgets.

## Assets

- Use `next/image` (or correct `width`/`height` + lazy loading) so images are sized, responsive, and non-blocking.
- Load fonts with `next/font`; set `font-display: swap` and preload the critical face to avoid invisible or shifting text.
- Eliminate render-blocking resources — inline critical CSS, defer the rest.
