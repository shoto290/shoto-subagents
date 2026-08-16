---
name: design-systems
description: Token-driven React + TypeScript design system and theming.
---

# Design Systems

Build and evolve a token-driven design system. The whole discipline reduces to one rule: **components consume semantic tokens, never primitives or raw values.**

## Token Layers

Three layers, each referencing the one above. Components only ever touch the bottom layer. Semantic tokens decouple UI from raw values: change `--blue-500` once, or remap `--color-accent` per theme, and every consumer updates. No find-and-replace across components.

1. **Primitive** — raw, context-free values. `--blue-500: #3b82f6`, `--gray-900`, `--size-16`. Never used directly by components.
2. **Semantic** — intent, not appearance. `--color-bg`, `--color-fg`, `--color-fg-muted`, `--color-border`, `--color-accent`, `--space-4`. Maps to primitives. This is the layer theming swaps.
3. **Component** — optional, scoped overrides for one component. `--button-bg: var(--color-accent)`. Add only when a component needs to diverge.

## Naming & Scale Conventions

- **kebab-case**, prefixed by category: `--color-fg-muted`, `--space-4`.
- **Numeric scales** for continuous dimensions (spacing, type, radius): `--space-1`…`--space-12`. Predictable, extensible.
- **T-shirt sizes** for small discrete sets (radius, shadow): `sm` / `md` / `lg`.
- **Intent names** for color and z-index: `bg` / `fg` / `accent` / `danger`, `modal` / `toast` — describe role, not value (`--color-accent`, not `--color-blue`).

## Consistency Checks & Pitfalls

- **One-off values** — a raw `#`, `px`, or `rgb()` in a component is drift. Route it through a token.
- **Primitive leakage** — a component using `--blue-500` breaks theming. Always go through a semantic token.
- **Token sprawl** — don't add a token per component; reuse semantics first, add component tokens only on real divergence.
- **Contrast** — verify `--color-fg` on `--color-bg` meets WCAG AA in both light and dark.
- **Scale gaps** — keep numeric scales contiguous and evenly stepped; arbitrary in-between values signal a missing scale step.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/token-categories.md](./reference/token-categories.md) | Naming a new token or checking which category (color, spacing, typography, radius, elevation, z-index, motion) already covers a value. |
| [reference/theming-setup.md](./reference/theming-setup.md) | Wiring `:root` and `[data-theme="dark"]`, adding a theme, or toggling themes at runtime. |
| [reference/typed-accessor.md](./reference/typed-accessor.md) | Writing the TypeScript `cssVar` accessor or wiring a React component to semantic tokens. |
| [reference/workflows.md](./reference/workflows.md) | Creating a system from scratch, extending it without breaking consumers, or refactoring hardcoded values into tokens. |
