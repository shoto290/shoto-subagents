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

## App Shell

One shell, owned by the layout route, mounted once. Routes swap the content region only. A shell that remounts per navigation loses scroll position, refetches, and flashes — see `frontend-engineer:routing-craft` for where the layout route belongs.

```css
.app-shell {
  display: grid;
  grid-template-areas:
    "sidebar header"
    "sidebar content";
  grid-template-columns: auto 1fr;
  grid-template-rows: auto 1fr;
  block-size: 100dvh;
}

.app-shell > .content {
  grid-area: content;
  min-block-size: 0;
  overflow-y: auto;
  overscroll-behavior: contain;
}
```

`100dvh`, not `100vh` — the dynamic unit follows mobile browser chrome. `min-block-size: 0` is mandatory: a grid item's default `min-content` floor refuses to shrink, so the scrollbar escapes to the document and your sticky header scrolls away.

## Pick The Scroll Container Deliberately

Decide, per screen, which single element scrolls. Ambiguity here produces nested scrollbars and lost keyboard position.

- **Document scrolls** — marketing, docs, long-form reads. Simplest; sticky headers and scroll restoration work for free.
- **Content region scrolls** — app shells with a fixed sidebar and header. Every ancestor of the scroller needs `min-block-size: 0`.
- Set `overscroll-behavior: contain` on inner scrollers so wheel momentum does not chain to the page.
- Set `scroll-padding-block-start` to the sticky header height on the scroll container, so anchor jumps and `:focus-visible` never land underneath it.
- Restore scroll per route, not per mount. Nested scrollers each need their own restoration or they silently reset.

## Page Grids

Give the page one grid with named lines; children opt into a column instead of carrying their own `max-width` and `margin: auto`.

```css
.page {
  display: grid;
  grid-template-columns:
    [full-start] minmax(var(--space-4), 1fr)
    [content-start] min(72rem, 100%) [content-end]
    minmax(var(--space-4), 1fr) [full-end];
  row-gap: var(--space-6);
}

.page > * {
  grid-column: content;
}

.page > .bleed {
  grid-column: full;
}
```

Full-bleed banners, sticky toolbars, and tables that need the whole width become a one-class opt-in instead of negative margins.

## Regions Respond To Themselves

A region adapts to its own inline size, not the viewport. The same detail panel sits in a wide route today and a drawer tomorrow; a viewport query hardcodes today.

```css
.list-detail {
  container-type: inline-size;
  display: grid;
  gap: var(--space-6);
}

@container (min-width: 60rem) {
  .list-detail {
    grid-template-columns: minmax(18rem, 26rem) 1fr;
  }
}
```

Reserve viewport media queries for genuine shell-level shifts: collapsing the sidebar to a drawer, switching a table screen to cards.

## Screen Archetypes

- **List / detail** — container-queried two-column above the threshold, stacked below. On narrow screens make the detail a real route, not a hidden sibling, so Back works.
- **Dashboard** — `grid-template-columns: repeat(auto-fit, minmax(min(20rem, 100%), 1fr))` and let widgets claim `grid-column: span 2` when they need it. No breakpoints, no per-widget media queries.
- **Table screen** — page header sticky at `inset-block-start: 0`, table head sticky beneath it, horizontal scroll on the table wrapper only.
- **Focused form** — single content column capped near `40rem`; the form owns vertical rhythm through `row-gap`, never through margins on the fields.

## Intrinsic Sizing And Logical Properties

- Size regions with `min()`, `max()`, `clamp()`, `fit-content`, and `minmax()` so they degrade without breakpoints.
- Use flow-relative properties throughout — `margin-inline`, `padding-block`, `inset-inline-start`, `block-size`. A screen built with physical properties needs a rewrite the day the app ships in Arabic or Hebrew.
- Never a fixed `height` on a region that holds user content. `min-block-size` plus intrinsic growth, or the content clips at the worst possible moment.

## Safe Areas And Mobile Viewport

- Pad fixed bottom bars with `env(safe-area-inset-bottom)` and add `viewport-fit=cover` to the viewport meta, or the home indicator eats your primary action.
- `100dvh` for full-height shells, `100svh` when an element must never be occluded by expanding browser chrome.
- The virtual keyboard shrinks the visual viewport, not the layout viewport. Keep the submit button in normal flow inside the scroll container rather than fixed to the bottom of a form screen.

## Pitfalls

- **`100vh` on mobile** — the bottom of the shell hides behind browser chrome. Use `dvh` / `svh`.
- **Missing `min-block-size: 0`** — the inner region never shrinks, the scrollbar jumps to the document, and the sticky header scrolls out of view.
- **Shell inside the page component** — every navigation remounts the sidebar and header. Put it in a layout route.
- **Reaching into primitives** — screen CSS overriding a component's padding or radius. That is a design-system change request, not a page style.
- **Viewport queries for regions** — couples a panel to the page it happens to live in today. Use container queries.
- **Ad-hoc z-index** — `z-index: 9999` on a sticky header. Use the app's documented stacking layers.
- **Unreserved async regions** — a region that sizes from data shifts the whole screen when it arrives. Reserve it; measurement and CLS budgeting live in `frontend-engineer:app-perf`.
