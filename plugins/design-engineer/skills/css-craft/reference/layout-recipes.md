# Layout Recipes

## Layout Decision Guide

- **Flexbox** — one-dimensional. Content flows along a single axis and sizes itself: toolbars, button rows, nav bars, a label beside a value. Use when item count is dynamic and you want content-driven wrapping (`flex-wrap` + `gap`).
- **Grid** — two-dimensional. You control rows *and* columns, or you want explicit track sizing independent of content: page shells, card grids, form layouts, dashboards.
- **Heuristic** — if you find yourself nesting flex containers to fake rows and columns, switch to grid. If a grid has a single track and you only care about distribution, switch to flex.
- **Subgrid** — `grid-template-columns: subgrid` lets a nested grid inherit the parent's tracks so card internals (title, body, footer) align across siblings. Use it instead of hardcoding matching heights.

## Logical Properties

Use flow-relative properties so layout survives RTL and vertical writing modes without rework.

- `margin-inline` / `margin-block` over `margin-left/right` / `top/bottom`
- `padding-inline` / `padding-block`
- `inset-inline-start` / `inset` over `left` / `top`
- `border-inline-start`, `text-align: start`

Physical properties leak direction assumptions; logical properties are direction-safe by construction.

## Fluid Type, Space, and Intrinsic Sizing

- `clamp(min, preferred, max)` for type and spacing that scales with the viewport without breakpoints. Preferred value uses a viewport unit so it interpolates smoothly.
- `min()` / `max()` to cap or floor a value against context.
- `fit-content`, `min-content`, `max-content` for content-driven track and box sizing.

```css
:root {
  --step-0: clamp(1rem, 0.92rem + 0.4vw, 1.25rem);
  --step-1: clamp(1.25rem, 1.1rem + 0.75vw, 1.75rem);
  --step-2: clamp(1.56rem, 1.3rem + 1.3vw, 2.44rem);
}

h2 { font-size: var(--step-2); }
p  { font-size: var(--step-0); }
```

## Modern Niceties

- `gap` on flex, grid, *and* `display: flex` — never margin hacks for spacing between siblings.
- `aspect-ratio` for media boxes and avatars instead of padding-percent tricks.
- `:has()` — the relational selector. Style a parent from its children: `.field:has(input:invalid)`, `.card:has(img)`, `form:has(:focus-visible)`.

## Responsive Without Hacks

- **Mobile-first**: base styles for the smallest case, enhance upward with `min-width` container/media queries.
- **No magic numbers**: derive spacing and sizing from tokens (`clamp`, custom properties), not hand-tuned pixel constants.
- **Intrinsic layouts**: let content and available space drive wrapping. The auto-fit grid below reflows with zero breakpoints.

## Worked Example

**Responsive card grid (intrinsic, no media queries):**

```css
.grid {
  display: grid;
  gap: 1.5rem;
  grid-template-columns: repeat(auto-fit, minmax(min(16rem, 100%), 1fr));
}
```

Cards fill the row, wrap when they hit `16rem`, and `min(16rem, 100%)` prevents overflow on narrow screens.
