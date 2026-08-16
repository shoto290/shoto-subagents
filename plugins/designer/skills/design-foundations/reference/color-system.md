# Color System

Build a palette from a few roles, not a swatch grab-bag.

- **60-30-10** — ~60% dominant (a near-white or near-black surface), ~30% secondary, ~10% accent. The accent is the smallest slice and carries the eye.
- **Neutral ramp + 1–2 accents** — most of a UI is grays. Define a 9–10 step neutral ramp (slightly tinted toward the brand hue, never pure gray) plus one brand accent. Add a second accent only if the product truly needs it.
- **Semantic roles** — map colors to intent, not hue: `surface`, `text`, `text-muted`, `border`, `brand`, `success`, `warning`, `danger`. Components consume roles so a re-theme is one remap.
- **Tints & shades from a base** — derive hover/active/subtle-background variants by adjusting lightness (and nudging saturation) of one base hue, so a color family stays coherent.
- **Never pure black on pure white** — `#000` on `#fff` vibrates. Use a very dark desaturated ink (e.g. `#1a1a1a`) on an off-white surface; reserve true extremes for nothing.
- **Contrast is a hard gate** — text must pass WCAG AA (4.5:1 body, 3:1 large). Treat this as pass/fail, not taste. Detailed contrast checking and remediation defer to `accessibility-craft`.
