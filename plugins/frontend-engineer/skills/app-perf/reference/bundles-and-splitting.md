# Bundles and Splitting

## Budget The Route, Not The App

- Set an initial-JS budget per route (a workable default: ~170KB gzipped for the first route a user hits) and enforce it in CI with `size-limit` or a bundle-size check on PRs.
- Track the budget per entry chunk. "The app is 2MB" is unactionable; "the orders route grew 90KB" gets fixed.
- Every new dependency states its cost before it is merged. A date library at 70KB to format one timestamp is a rejected PR, not a follow-up ticket.

## Route-Level Code Splitting

Routes are the natural split boundary — the user is already waiting for a navigation.

- Lazy-load route components; keep the shell, router, and the first route eager.
- Split heavy, conditionally-rendered features inside a route too: editors, charting, PDF viewers, date pickers used on one tab.
- Preload on intent — hover or focus of a link, or viewport entry — so the chunk is warm before the click.
- Avoid barrel files (`index.ts` re-exporting everything). One import from a barrel can defeat splitting and pull a whole feature into the wrong chunk.
- Never lazy-load what renders above the fold on first paint. That trades one round trip for two.
