---
name: ux-checklist
description: Screen and flow-level UX and accessibility checklist.
---

# UX Checklist

Pass/fail checks for a whole screen and the flow it belongs to. Component-level accessibility — labels, roles, focus rings, keyboard behavior inside a widget — ships with the design system's primitives; assume it and verify the composition instead.

## Review Pass

Run per screen, before shipping:

1. Load the route cold — is the title right, is there one `<h1>`, does the skeleton match the final layout?
2. Navigate in and out — where does focus land, is the route announced, does Back restore scroll and state?
3. Tab from the top to the primary action, then Esc out of every layer.
4. Force each state: loading, empty, error, partial, stale, success. No layout shift between them.
5. Submit the form invalid, then with a server error — is focus placed and are values preserved?
6. Trigger the destructive action — is the target named, is undo possible?
7. Leave with unsaved changes.
8. At 375px wide and 200% zoom, complete the primary task by touch.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/page-identity-landmarks.md](./reference/page-identity-landmarks.md) | Checking document title, heading hierarchy, breadcrumbs, or landmark regions (`<main>`, `<nav>`, skip links). |
| [reference/navigation-focus.md](./reference/navigation-focus.md) | Checking focus after route changes or dialog/menu close, or building the screen's keyboard path. |
| [reference/screen-states.md](./reference/screen-states.md) | Checking loading/empty/error/partial/stale states, async announcements, form or unsaved-changes flows, or responsive/touch layout. |
| [reference/destructive-actions.md](./reference/destructive-actions.md) | Checking confirmation copy or undo for an irreversible action. |
| [reference/review-pass.md](./reference/review-pass.md) | Looking up the common failure patterns each review-pass step is designed to catch. |
