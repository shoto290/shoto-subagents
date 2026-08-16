# View Transitions

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
