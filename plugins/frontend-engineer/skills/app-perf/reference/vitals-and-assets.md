# Vitals and Assets

## Core Web Vitals Of Real Pages

- **LCP** — identify the actual LCP element per route. It must not be lazy-loaded, must not wait on a client fetch, and its origin should be `preconnect`ed. Server-render or stream the shell where the stack allows.
- **CLS** — reserve space for every async region, image, and banner before it arrives. Layout mechanics live in `frontend-engineer:screen-layout`; here, verify the number.
- **INP** — long tasks come from big synchronous re-renders on keypress and from third-party scripts. Break up the work, defer non-critical scripts, and never do layout reads in a scroll handler.

## Images And Fonts

- Explicit `width`/`height` or `aspect-ratio` on every image, always.
- `loading="lazy"` below the fold, `fetchpriority="high"` on the LCP image, and never both.
- Responsive `srcset` + `sizes`; modern formats for anything content-sized.
- Self-host fonts, preload the single critical face, `font-display: swap`, and subset. One extra weight is a real LCP regression.
