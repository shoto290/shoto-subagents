# Forms and Input

## Forms

- Every field has a programmatically associated `<label>` (not placeholder-as-label).
- Errors link to their field with `aria-describedby` and set `aria-invalid` on the input.
- Validate on blur or submit, not on every keystroke; show success/error inline near the field.
- Distinguish disabled (not yet actionable) from error (needs correction) — never use one to mean the other.
- Set `type`, `inputmode`, `autocomplete` correctly (e.g. `email`, `tel`, `one-time-code`).
- Never block paste on any input, including password and OTP fields.

## Touch & Pointer

- Tap targets are at least ~44×44px with adequate spacing between adjacent targets.
- No hover-only affordances — anything revealed on hover is also reachable by focus/tap.
- Set `touch-action` to prevent unwanted scroll/zoom on interactive gestures.
- Avoid the 300ms tap delay (viewport meta `width=device-width`); do not disable zoom.
