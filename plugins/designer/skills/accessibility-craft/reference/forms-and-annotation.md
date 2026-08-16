# Forms And Annotation

## Forms

| Element | Requirement |
| :-- | :-- |
| Labels | Always visible above or beside the field — never placeholder-only |
| Required | Marked with text or a clear, documented indicator, not color alone |
| Instructions | Placed before the field, not only on error |
| Input purpose | Set autocomplete/input purpose so assistive tech and autofill work |
| Errors | Specific message tied to its field, programmatically associated, describing how to fix |

## Documenting Accessibility

Annotate the design so developers implement the right semantics:

- Contrast ratios for key text and UI pairings.
- Focus order (numbered) and which elements are focusable.
- Alt text intent for every meaningful image; mark decorative images as such.
- ARIA roles and landmark intent (header, nav, main, complementary, footer).
- All interactive states: default, hover, focus, active, disabled, error, loading.
