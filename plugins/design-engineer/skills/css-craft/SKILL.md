---
name: css-craft
description: Modern CSS for layout, responsive design, and styling architecture.
---

# CSS Craft

Modern CSS for expert front-end work. Default to intrinsic, declarative layout. Reach for hacks only when a platform gap forces it.

## Rules

- Flexbox for one dimension, grid for two — nesting flex to fake rows and columns means switch to grid.
- `subgrid` to align nested card internals across siblings, never hardcoded matching heights.
- Container queries for component responsiveness; viewport media queries only for page-level shifts.
- Logical properties over physical ones — `margin-inline`, `padding-block`, `inset-inline-start`, `text-align: start`.
- `clamp()` for fluid type and space, `min()` / `max()` to cap or floor, `fit-content` / `min-content` / `max-content` for content-driven sizing.
- `:where()` at zero specificity for resets and defaults; `:is()` takes the specificity of its strongest argument.
- `@layer` orders override priority explicitly, independent of source order and specificity.
- `gap` for spacing between siblings, never margin hacks; `aspect-ratio` for media boxes, never padding-percent tricks.
- `:has()` to style a parent from its children: `.field:has(input:invalid)`, `.card:has(img)`, `form:has(:focus-visible)`.
- Mobile-first base styles, enhanced upward; derive spacing from tokens, never hand-tuned pixel constants.

## Pitfalls

- **Specificity wars** — escalating selectors and `!important`. Fix with `@layer` and `:where()`, not more specificity.
- **Fixed heights** — `height: 400px` clips content. Prefer `min-height`, intrinsic sizing, and `aspect-ratio`.
- **px-everything** — blocks user font scaling and fluid behavior. Use `rem` for type/space, `clamp()` for fluidity.
- **Deeply nested selectors** — `.a .b .c .d` is fragile and slow to override. Keep selectors flat and component-scoped.
- **Viewport queries for components** — couples a component to the page. Use container queries.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/layout-recipes.md](./reference/layout-recipes.md) | Choosing between flex, grid, and subgrid, or writing logical properties, fluid type scales, and intrinsic responsive layouts. |
| [reference/container-queries.md](./reference/container-queries.md) | Making a component respond to its own available width instead of the viewport. |
| [reference/cascade-layers.md](./reference/cascade-layers.md) | Ordering override priority with `@layer`, or ending a specificity war with `:where()` and `:is()`. |
