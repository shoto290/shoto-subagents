---
name: screen-layout
description: Compose app shells, page grids, and responsive screen regions.
---

# Screen Layout

Layout at screen scale: the shell a route renders into, the regions inside a page, and the space between primitives. The primitives themselves — their padding, their variants, their internal grid — belong to the design system. You compose them; you never redesign them from a screen file.

## Ownership Boundary
- The **page owns the space between primitives** — grid tracks, `gap`, region widths, stacking order, where things scroll.
- The **primitive owns its internals** — padding, radius, internal alignment. Never reach in with a descendant selector (`.orders-page .btn { padding: 0 }`) to fix a layout problem. Change the track, add a wrapper, or ask for a variant.
- **Consume tokens, never define them.** `var(--space-4)` comes from the design system. A raw `17px` in a screen file is a gap in the scale to report, not a local constant to invent.
- When the same composition appears in a third screen, it is a layout primitive — promote it to the design system instead of copying the CSS a fourth time.

## Non-Negotiables
- One app shell, mounted once by the layout route; routes swap only the content region. See [reference/app-shell.md](./reference/app-shell.md).
- Pick exactly one scroll container per screen, deliberately. See [reference/scroll-containers.md](./reference/scroll-containers.md).
- One named page grid; children opt into a column instead of their own `max-width`. See [reference/page-grids.md](./reference/page-grids.md).
- Regions respond to their own inline size via container queries, not the viewport. See [reference/container-queries.md](./reference/container-queries.md).
- List/detail, dashboard, table, and focused-form each have one canonical composition. See [reference/screen-archetypes.md](./reference/screen-archetypes.md).
- Size regions with `min()`, `max()`, `clamp()`, `fit-content`, and `minmax()` so they degrade without breakpoints.
- Use flow-relative properties throughout — `margin-inline`, `padding-block`, `inset-inline-start`, `block-size`. A screen built with physical properties needs a rewrite the day the app ships in Arabic or Hebrew.
- Never a fixed `height` on a region that holds user content. `min-block-size` plus intrinsic growth, or the content clips at the worst possible moment.
- Use `dvh`/`svh` and safe-area insets on fixed bars; never bare `100vh`. See [reference/mobile-viewport.md](./reference/mobile-viewport.md).

## Pitfalls
- **Reaching into primitives** — screen CSS overriding a component's padding or radius. That is a design-system change request, not a page style.
- **Ad-hoc z-index** — `z-index: 9999` on a sticky header. Use the app's documented stacking layers.
- **Unreserved async regions** — a region that sizes from data shifts the whole screen when it arrives. Reserve it; measurement and CLS budgeting live in `frontend-engineer:app-perf`.

## Reference
| File | Read when |
| :-- | :-- |
| [reference/app-shell.md](./reference/app-shell.md) | Building or changing the one grid-based shell a layout route mounts. |
| [reference/scroll-containers.md](./reference/scroll-containers.md) | Deciding which single element scrolls, or fixing nested-scrollbar bugs. |
| [reference/page-grids.md](./reference/page-grids.md) | Setting up the page-level named grid and full-bleed opt-ins. |
| [reference/container-queries.md](./reference/container-queries.md) | Making a region respond to its own inline size instead of the viewport. |
| [reference/screen-archetypes.md](./reference/screen-archetypes.md) | Building a list/detail, dashboard, table, or focused-form screen. |
| [reference/mobile-viewport.md](./reference/mobile-viewport.md) | Handling safe areas, `dvh`/`svh`, or the virtual keyboard. |
