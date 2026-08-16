# Mobile Viewport

## Safe Areas And Mobile Viewport

- Pad fixed bottom bars with `env(safe-area-inset-bottom)` and add `viewport-fit=cover` to the viewport meta, or the home indicator eats your primary action.
- `100dvh` for full-height shells, `100svh` when an element must never be occluded by expanding browser chrome.
- The virtual keyboard shrinks the visual viewport, not the layout viewport. Keep the submit button in normal flow inside the scroll container rather than fixed to the bottom of a form screen.

## Pitfalls

- **`100vh` on mobile** — the bottom of the shell hides behind browser chrome. Use `dvh` / `svh`.
