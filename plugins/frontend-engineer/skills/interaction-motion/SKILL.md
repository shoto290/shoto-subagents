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

## Route And View Transitions

Cross-route motion carries continuity between two screens. Keep it under 300ms, never block the new route on it, and never animate on Back/Forward differently than the user expects.

```ts
export function withViewTransition(run: () => void): void {
  const reduced = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  if (reduced || !document.startViewTransition) {
    run();
    return;
  }

  document.startViewTransition(run);
}
```

- Give the shared element the same `view-transition-name` on both routes to get a true shared-element transition. Names must be unique per document at any instant.
- Animate the content region only. The shell — sidebar, header, navigation state — stays still; moving it costs orientation.
- Transition on the resolved route, not on click. Animating into a pending screen means animating into a spinner.
- Depth cues over travel: a fade plus 8–12px of translate reads as navigation. Full-width slides belong to native-feeling mobile stacks, nothing else.

## Lists That Change

- Stable, identity-based keys or every mutation looks like a full replacement. Index keys make motion lie about what changed.
- **Enter** — fade plus a short translate, ease-out, ~150ms. **Exit** — fade out faster than the entrance, and only when the removal was user-initiated.
- **Reorder** — animate positions with a layout/FLIP animation, never by animating `top` or `margin`.
- Do not animate the initial paint of a list. First render is not a change; it is the baseline.
- Cap stagger: `min(index, 6) * 30ms`. Beyond six items the tail is pure waiting.

```css
.row {
  animation: row-enter 150ms ease-out both;
  animation-delay: calc(min(var(--index), 6) * 30ms);
}

@keyframes row-enter {
  from {
    opacity: 0;
    transform: translateY(4px);
  }
}
```

## Async Feedback

- **Optimistic updates are instant.** The new value appears with no transition; the animation is reserved for the rollback, where a brief shake or color settle explains the reversal. Mutation and rollback mechanics live in `frontend-engineer:data-fetching`.
- **Delay the pending indicator ~200ms.** Most requests resolve first, and a spinner that flashes for 80ms is noise.
- **Hold it ~400ms once shown**, so a slightly-slower response does not produce a flicker.
- **Skeleton to content is a crossfade, never a collapse.** The skeleton must occupy the same box as the real content — if the layout jumps at the swap, the skeleton was the wrong size, and no easing fixes that.
- Background refetches never re-run the loading animation. Dim or mark stale in place.

```ts
export function useDelayedPending(isPending: boolean, delay = 200): boolean {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (!isPending) {
      setVisible(false);
      return;
    }
    const id = setTimeout(() => setVisible(true), delay);
    return () => clearTimeout(id);
  }, [isPending, delay]);

  return visible;
}
```

## Do Not Shift Layout To Animate

- Animate `transform` and `opacity`. Everything else touches layout or paint and drags the rest of the screen with it.
- Expanding regions are the exception worth naming: animate `grid-template-rows` from `0fr` to `1fr` with the child set to `overflow: hidden`. It is a layout animation, so keep it scoped to a small subtree and off screens rendering hundreds of rows.
- An element that animates while entering must already have its space reserved. Motion into unreserved space is layout shift with easing on top.
- Add `will-change` immediately before a transition and drop it after. Left on, it pins compositor layers and costs memory across a whole screen.

## Reduced Motion Is A Gate, Not A Polish Item

Honor `prefers-reduced-motion` at app scale: route transitions become instant swaps, list entrances become plain renders, skeleton crossfades stay (opacity is safe), parallax and autoplay stop entirely. Gate JS-driven motion on the same query rather than shipping a shorter version of the same movement.

## Pitfalls

- **Animating into a pending state** — the transition plays, then a spinner appears. Resolve, then transition.
- **Entrance animations on every render** — a list that re-animates on refetch, filter, or tab return. Animate changes, not renders.
- **Blocking navigation on a transition** — the route is ready and the user is watching an easing curve. Motion never gates interaction.
- **Skeleton and content differently sized** — the swap becomes a jump. The skeleton's job is the box, not the shimmer.
- **Stagger without a cap** — item 40 arrives a second late and feels broken.
- **Re-animating primitives from the screen** — duplicated, drifting timings that fight the design system's own transitions.
- **Reduced motion handled per component** — one unguarded animation makes the whole setting look ignored.
