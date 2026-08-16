---
name: interaction-motion
description: App-scale motion for routes, lists, and async state.
---

# Interaction Motion

Motion between screens and around data: route transitions, lists that change, the moment a mutation lands. Its only job is continuity — telling the user where they came from, what changed, and what is still in flight.

## What Belongs Here, What Does Not

- **Here** — route and view transitions, list enter/leave/reorder, skeleton-to-content handoff, optimistic-update feedback, orchestration across a screen.
- **Not here** — button press, hover lift, focus ring, switch toggle, spinner spin, the timing scale and easing curves themselves. Those are primitive micro-interactions and they ship with the design system, already tuned. Reuse the component; do not re-animate it from the screen.
- If a screen needs a motion the design system does not provide on its primitives, that is a request to the design system, not a local `transition` override.

## When Not To Animate

- Anything on the critical path of a fast action. A 200ms flourish on a 40ms mutation makes the app slower, not smoother.
- Content the user is reading or typing into.
- Rows in a virtualized list — recycled nodes replay entrances and the list strobes.
- Any state the user triggers repeatedly (filters, tab switches, pagination). Repeat use turns delight into latency.
- Errors. Show them instantly; motion reads as hesitation.

## Pitfalls

- **Animating into a pending state** — the transition plays, then a spinner appears. Resolve, then transition.
- **Entrance animations on every render** — a list that re-animates on refetch, filter, or tab return. Animate changes, not renders.
- **Blocking navigation on a transition** — the route is ready and the user is watching an easing curve. Motion never gates interaction.
- **Skeleton and content differently sized** — the swap becomes a jump. The skeleton's job is the box, not the shimmer.
- **Re-animating primitives from the screen** — duplicated, drifting timings that fight the design system's own transitions.
- **Reduced motion handled per component** — one unguarded animation makes the whole setting look ignored.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/view-transitions.md](./reference/view-transitions.md) | Implementing route/view transitions, shared-element transitions, or the `startViewTransition` helper. |
| [reference/list-motion.md](./reference/list-motion.md) | Animating list enter/exit/reorder, keys, or staggered rows. |
| [reference/async-feedback.md](./reference/async-feedback.md) | Animating optimistic updates, pending indicators, or skeleton-to-content swaps. |
| [reference/layout-safe-motion.md](./reference/layout-safe-motion.md) | Avoiding layout shift in an animation, expanding regions, or reduced-motion handling. |
