# Keyboard and Semantics

## Keyboard & Focus

- Every interactive element is operable by keyboard alone (Tab, Enter, Space, arrows, Esc).
- Tab order follows visual/reading order; no positive `tabindex`.
- Focus is always visible via `:focus-visible` — never `outline: none` without a replacement ring.
- Modals/dialogs trap focus while open and restore focus to the trigger on close.
- Provide a skip link to main content as the first focusable element.
- Disabled controls are not focusable; prefer `aria-disabled` when the control must stay discoverable.

## Semantics & ARIA

- Use native elements first: `<button>`, `<a href>`, `<label>`, `<input>`, `<nav>`, `<main>`. Reach for ARIA only when no native element fits.
- Every control has an accessible name (visible text, `aria-label`, or `aria-labelledby`).
- Add `role` only when semantics are missing — never a role that contradicts the element.
- Async updates announce via `aria-live` (`polite` for status, `assertive` for errors).
- Icon-only buttons carry an `aria-label`; decorative images use empty `alt=""`.
