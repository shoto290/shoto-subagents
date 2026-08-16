---
name: motion
description: Animation and micro-interactions for React + TypeScript.
---

# Motion

Animation that communicates, not decorates. Every motion earns its place by clarifying one of three things: a **state change**, a **spatial relationship**, or **continuity** between views. Subtle and fast by default — if a user notices the animation instead of the result, it is too much.

## Timing & Easing

| Scope | Duration | Easing |
| :-- | :-- | :-- |
| Micro (hover, press, toggle) | 100–200ms | `ease-out` |
| Larger (enter, expand, page) | 200–400ms | `ease-out` in, `ease-in` out |

- **Entrances** ease-out — fast start, gentle settle. **Exits** ease-in — gentle start, quick finish.
- **Standard** for in-view transitions; **emphasized** (slower, more pronounced curve) only for hero moments.
- Avoid `linear` except for continuous loops (spinners, progress).

## Non-negotiable Rules

- Animate `transform` and `opacity` only — never `width`, `height`, `top`, `left`, `margin`, `box-shadow`, or `color`; use `will-change` sparingly, added right before an animation and removed after.
- CSS `transition` by default; `@keyframes` for multi-step or looping sequences; a spring library only when CSS genuinely cannot express the interaction.
- Every non-essential animation collapses under `prefers-reduced-motion: reduce`. Mandatory, not optional.

## Pitfalls

- **Over-animation** — everything moving competes for attention and slows the user. Motion is a budget; spend it where it clarifies.
- **Janky properties** — animating `width`/`top`/`box-shadow` drops frames. Use `transform` and `opacity`.
- **Blocking interaction** — never make the user wait on a flourish; keep durations short and let content be usable immediately.
- **Ignoring reduced-motion** — unguarded animation is an accessibility defect, not a polish gap.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/motion-techniques.md](./reference/motion-techniques.md) | Choosing between CSS transition, `@keyframes`, and a spring library, or building a hover, enter/exit, or shared-element micro-interaction. |
| [reference/reduced-motion.md](./reference/reduced-motion.md) | Guarding animation behind `prefers-reduced-motion`, in CSS or via a React hook. |
| [reference/vocabulary.md](./reference/vocabulary.md) | Naming a motion pattern, or mapping a vague animation request to a known pattern before building it. |
