# WCAG Thresholds

## Contrast

WCAG AA thresholds. Measure every text and UI combination against the surface behind it.

| Element | AA minimum | AAA |
| :-- | :-- | :-- |
| Normal text (< 24px, or < 18.66px bold) | 4.5:1 | 7:1 |
| Large text (>= 24px, or >= 18.66px bold) | 3:1 | 4.5:1 |
| UI components, icons, focus indicators, meaningful graphics | 3:1 | — |

Never rely on color alone to convey meaning. Pair every color signal with text, an icon, or shape so it survives color blindness and grayscale.

## Focus & Keyboard

| Rule | Threshold / expectation |
| :-- | :-- |
| Focus order | Logical, matches visual reading order (top-to-bottom, left-to-right per language) |
| Focus indicator | Always visible; contrast >= 3:1 against adjacent colors; not removed by `outline: none` alone |
| Skip links | Provide "skip to main content" before repeated nav |
| Keyboard traps | None — every interactive element is reachable and escapable with keyboard only |

Document the intended tab order directly in the design (numbered overlay) so developers don't guess.

## Target Sizes

| Standard | Minimum target |
| :-- | :-- |
| Comfortable mobile touch | ~44 x 44px |
| WCAG 2.2 (2.5.8 Target Size, minimum) | 24 x 24px with adequate spacing |

Add spacing between adjacent targets so a 24px control still has a comfortable hit area. Prefer larger touch targets for primary mobile actions.

## Accessible Palettes

Build palettes that pass contrast across every role they appear in, not just one pairing.

- Test text-on-surface for each surface tier (background, card, raised).
- Test text and icons on brand/accent colors — brand color is often the weakest pairing.
- Provide non-color status cues: success/warning/error/info each get an icon + text label, never color alone.
- Verify the palette in both light and dark themes; contrast that passes in one can fail in the other.
