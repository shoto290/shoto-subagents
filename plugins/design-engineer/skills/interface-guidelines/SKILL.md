---
name: interface-guidelines
description: Checklist for UI/UX polish and accessibility.
---

# Interface Guidelines

A high-signal checklist for shipping accessible, polished UI. Each item is pass/fail — apply when building, and run the Review Pass before shipping.

## Motion

- Respect `prefers-reduced-motion`: reduce or remove non-essential animation. For motion design, easing, and transition specifics, see the `/design-engineer:motion` skill.

## Review Pass

Run over a component before shipping:

1. Tab through it — is every action reachable and is focus always visible?
2. Operate it with the keyboard only (open, submit, dismiss, Esc).
3. Inspect names — does each control announce a meaningful label?
4. Trigger each state — loading, empty, error, success — without layout shift.
5. Check contrast and confirm no state is conveyed by color alone.
6. Resize to mobile — tap targets ≥44px, no hover-only paths, no blocked zoom.
7. Toggle `prefers-reduced-motion` — does motion calm down appropriately?

## Reference

| File | Read when |
| :-- | :-- |
| [reference/keyboard-and-semantics.md](./reference/keyboard-and-semantics.md) | Wiring keyboard operability, tab order, focus rings, focus traps, or picking native elements, ARIA roles, accessible names, and live regions. |
| [reference/forms-and-input.md](./reference/forms-and-input.md) | Building a form field, its labels, validation and error wiring, or sizing tap targets and handling touch and pointer gestures. |
| [reference/visual-and-feedback.md](./reference/visual-and-feedback.md) | Checking contrast, typography and spacing rhythm, or handling loading, empty, error and success states without layout shift. |
