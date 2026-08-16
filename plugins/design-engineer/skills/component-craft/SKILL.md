---
name: component-craft
description: Build accessible, reusable, well-typed React components.
---

# Component Craft

Build React + TypeScript components that are small, composable, accessible, and precisely typed. Default to the simplest component that solves the problem; add flexibility only when a second real use case demands it.

## Mindset
- Build from the smallest reusable unit up. One component, one responsibility.
- A component is an API. Design the call site first, then the implementation.
- Prefer composition (subcomponents, `children`) over configuration (a wall of boolean props).

## Handle every interactive state
A component is not done until all states are styled and reachable: `default` · `hover` · `focus-visible` · `active` · `disabled` · `loading` · `error`

- Use `:focus-visible` (not `:focus`) so keyboard users get a ring without mouse-click rings.
- `disabled` must block interaction and convey it (`disabled` attribute / `aria-disabled`), not just dim opacity.
- `loading` should set `aria-busy` and prevent duplicate submits.

## Accessibility baked in
- Semantic element first: a `<button>` before a `<div role="button">`. Native semantics give you keyboard, focus, and roles for free.
- Add `role` / `aria-*` only where semantics fall short (custom widgets: tabs, combobox, dialog).
- Keyboard: every interactive element reachable and operable by keyboard; respect expected key behavior (Enter/Space, Arrow keys, Esc).
- Manage focus deliberately for overlays — move focus in on open, restore it on close, trap it while open.
- Pair every icon-only control with an accessible name (`aria-label`).

## Pitfalls
- **Prop drilling** — threading props through layers that do not use them. Lift to composition (`children`) or context.
- **Leaky abstractions** — a wrapper that hides native props consumers need (`id`, `aria-*`, `type`). Spread `...rest` to the root instead.
- **Premature flexibility** — config props, slots, and generics added for a use case that does not exist yet. Build for the second real case, not the imagined one.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/prop-api-patterns.md](./reference/prop-api-patterns.md) | Shaping a component's public API: choosing required props and defaults, modelling variants as a union, forwarding refs, replacing boolean props with compound subcomponents, typing a variant style map, or deciding on generics and `useEffect`. |
| [reference/worked-button.md](./reference/worked-button.md) | You want a full end-to-end implementation to copy from — a Button showing native props, variant union, exhaustive style map, ref forwarding, rest spreading, and merged `disabled` + `loading`. |
