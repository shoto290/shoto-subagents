# Motion Techniques

## Performant Properties Only

Animate only what the compositor handles off the main thread:

- **Yes** — `transform` (translate, scale, rotate) and `opacity`.
- **No** — `width`, `height`, `top`, `left`, `margin`, `box-shadow`, `color`: these trigger layout or paint and jank.
- `will-change` sparingly — add right before an animation, remove after. Permanent `will-change` wastes memory and can hurt more than it helps.

To move or resize, translate/scale a `transform` rather than animating geometry.

## CSS vs Keyframes vs Spring

- **CSS `transition`** — default for state-driven changes (hover, active, open/close). Cheapest, declarative.
- **`@keyframes`** — multi-step or looping sequences with no JS state (spinners, attention pulses).
- **JS / spring library** (`motion` / Framer Motion) — only when you need spring physics, gesture-driven values, orchestrated sequences, layout/shared-element transitions, or animating mount/unmount cleanly. Keep it framework-light; reach for a library when CSS genuinely cannot express the interaction.

```css
.card {
  transition: transform 150ms ease-out, opacity 150ms ease-out;
}
.card:hover {
  transform: translateY(-2px);
}
```

## Common Micro-interactions

- **Hover / press** — small `transform` (scale 0.98 on press, slight lift on hover) plus opacity. Fast, ease-out.
- **Enter / exit** — fade + short translate for lists, toasts, menus. Stagger children subtly when many appear at once.
- **Layout / shared-element** — animate position changes between states. Use a spring library's layout animation, or the native `view-transition` API (`document.startViewTransition`) for cross-view continuity.

## Vocabulary

Shared names for motion patterns — entrances, sequencing, transforms, state transitions, scroll, feedback, springs, ambient loops, polish, and principles — so a request maps to a known pattern and you describe precisely what to build. See [reference/vocabulary.md](./vocabulary.md) for the full glossary (adapted from animations.dev).
