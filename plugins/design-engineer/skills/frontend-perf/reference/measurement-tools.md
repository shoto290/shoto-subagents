# Measurement Tools

Never optimize blind. Find the actual bottleneck before touching code.

- React DevTools **Profiler** — which components re-render, how often, and why.
- **Lighthouse** / PageSpeed — field and lab Core Web Vitals.
- **Bundle analyzer** (`@next/bundle-analyzer`) — what is actually shipped to the client.
- **web-vitals** library — real-user LCP, CLS, INP in production.

Confirm the cost is real and locate it. A change with no measured before/after is not an optimization.
