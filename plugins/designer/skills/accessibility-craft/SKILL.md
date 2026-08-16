---
name: accessibility-craft
description: Designing accessible, WCAG-compliant interfaces.
---

# Accessibility Craft

Design interfaces that everyone can use, and document them so developers implement them correctly. This skill owns the contrast and keyboard detail that other designer skills defer to. Ground decisions in Stéphanie Walter's "A Designer's Guide to Documenting Accessibility & User Interactions", the W3C WAI "Designing for Web Accessibility" tips, and the WCAG practical guide for UI/UX designers.

## Non-Negotiables

- Normal text meets 4.5:1; large text, UI components, icons, and focus indicators meet 3:1.
- Never rely on color alone — pair every color signal with text, an icon, or a shape.
- Focus order is logical and every focus indicator is visible at >= 3:1.
- Every interactive element is reachable and escapable with the keyboard alone.
- Targets meet 24 x 24px (WCAG 2.2) with spacing; aim for ~44 x 44px on mobile.
- Labels are always visible — never placeholder-only.
- Annotate tab order, alt text intent, ARIA landmarks, and every interactive state.

## Pitfalls

- Gray-on-gray text below 4.5:1 — raise contrast to the AA threshold.
- Color-only status — add an icon plus a text label.
- Invisible focus — provide a visible 3:1 focus indicator.
- Tiny targets — meet 24px (WCAG 2.2), aim for 44px on mobile.
- Placeholder-as-label — add a persistent visible label.
- Undocumented states — annotate every state in the design.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/wcag-thresholds.md](./reference/wcag-thresholds.md) | Checking an exact contrast ratio, focus and keyboard expectation, or target size, or building a palette that must pass in light and dark. |
| [reference/forms-and-annotation.md](./reference/forms-and-annotation.md) | Designing a form label, required marker, or error, or annotating a design for developer handoff. |
