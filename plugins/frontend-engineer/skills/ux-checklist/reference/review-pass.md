# Review Pass Pitfalls

## Pitfalls

- **Focus stuck on the old screen** — a SPA navigation that changes everything visually and nothing for a screen reader.
- **Silent route changes** — no title update, no announcement. Keyboard users cannot tell the page moved.
- **The three-state screen** — loading, success, and nothing for empty, error, partial, or stale.
- **Global spinner for one region** — the whole screen blanks because a sidebar widget is refetching.
- **Skeleton-sized-wrong** — content lands and the screen jumps, undoing the reason for the skeleton.
- **Toast-only errors** — the failure disappears in 4 seconds and the user never learns which field caused it.
- **Confirmations that name nothing** — "Are you sure?" trains reflexive confirmation and deletes the wrong record.
- **Hover-only row actions** — invisible to touch and keyboard, the most common a11y regression in table screens.
