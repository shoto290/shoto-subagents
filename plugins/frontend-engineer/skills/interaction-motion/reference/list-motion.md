# List Motion

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

## Pitfall

- **Stagger without a cap** — item 40 arrives a second late and feels broken.
