# Annotation Guide

## Responsive Intent

A fixed frame describes one width. Developers build for a range. Communicate how the layout *behaves*, not just how it looks at one size.

- **Reflow rules** — for each region, state fill vs hug, min/max width, and wrap behavior — not just absolute pixel positions.
- **Per-breakpoint behavior** — specify what changes at each breakpoint: stacking, column counts, hidden/shown elements, type scale shifts.
- **Elastic content** — show how the layout holds when text is short, long, or translated; mark what truncates, wraps, or grows.

## Annotations

Annotations carry the intent a static frame cannot. Attach them where the developer reads them — on the design, not in a separate doc that drifts.

- **Interaction notes** — triggers, transitions, what is tappable, gesture behavior, and motion specs (duration, easing).
- **Accessibility notes** — focus order, alt text, ARIA intent, contrast expectations, and reduced-motion behavior. For the full a11y discipline, defer to `accessibility-craft`.
- **Business rules** — conditional logic, permissions, formatting and validation rules, edge-case handling.
- **Prototype links** — link the interactive prototype for any flow that motion or branching cannot be captured in a still frame.
