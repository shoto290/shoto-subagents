---
name: design-foundations
description: Visual fundamentals of UI design.
---

# Design Foundations

The visual craft a senior designer reuses on every screen. Five systems — type, color, spacing, grid, hierarchy — that turn a wireframe into something that reads as intentional. The through-line: **decisions come from a small, fixed system, never picked ad hoc per element.** Grounded in Refactoring UI (Wathan & Schoger), the Prototypr wireframe-to-high-fidelity workflow, and Smart Mentors' color/typography/layout guidance.

## Non-Negotiables

- Every size, color, and gap comes from a fixed system — never improvised per element.
- Type: one modular ratio (1.2 dense, 1.25 airy), 5–7 sizes total, body line length 45–75 characters.
- Reach for weight and color before a larger size — most hierarchy fits inside two or three sizes.
- Color: a 9–10 step neutral ramp plus one accent, mapped to semantic roles rather than hues.
- Never `#000` on `#fff` — dark desaturated ink on an off-white surface.
- Text contrast is a hard gate: 4.5:1 body, 3:1 large. Pass/fail, not taste; detail defers to `accessibility-craft`.
- Spacing: one base unit (4px or 8px) and one fixed ladder — 4, 8, 12, 16, 24, 32, 48, 64.
- The same component gets the same padding everywhere; sibling elements share one gap value.
- Group by proximity and alignment before reaching for borders and boxes.
- Cap content width (~1200–1280px) and center it; whitespace is placed deliberately, never leftover.
- One primary action per view — demote the secondary rather than enlarging the primary.

## Pitfalls

- **Too many type sizes** — five improvised sizes where three from a scale would do. Collapse to the modular scale.
- **Inconsistent spacing** — gaps off the scale (13px here, 18px there). Snap everything to the ladder.
- **Low-contrast gray text** — light gray on white fails AA and tires the eye. Darken until it passes; verify with `accessibility-craft`.
- **Decorative-over-functional color** — color used for prettiness dilutes the accent meant to guide action. Spend color where it directs attention.
- **Crowded layouts** — filling every pixel. Whitespace is the cheapest upgrade to perceived quality; add it on purpose.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/type-scale.md](./reference/type-scale.md) | Choosing a type ratio or an exact size, line-height, or weight for a role, or fixing a screen with improvised type sizes. |
| [reference/color-system.md](./reference/color-system.md) | Building a palette, defining a neutral ramp or semantic color roles, or deriving hover, active, and subtle-background variants. |
| [reference/spacing-and-grid.md](./reference/spacing-and-grid.md) | Setting a base unit, spacing ladder, gutters, container widths, or breakpoints, or deciding how much whitespace a layout needs. |
| [reference/worked-example-card.md](./reference/worked-example-card.md) | Ranking elements by hierarchy levers, or promoting a wireframe to high fidelity and wanting a full worked example to follow. |
