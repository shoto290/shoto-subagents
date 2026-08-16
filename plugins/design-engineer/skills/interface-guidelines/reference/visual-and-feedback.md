# Visual and Feedback

## Visual

- Text meets WCAG AA contrast (4.5:1 body, 3:1 large text and UI/icon boundaries).
- Never rely on color alone to convey state — pair with icon, text, or shape.
- Body line length ~45–75 characters; line-height ~1.4–1.6 for readable blocks.
- Consistent spacing rhythm from a scale; align to a shared baseline grid.

## Stability & Feedback

- Reserve space for async/media content (set dimensions, `aspect-ratio`) to avoid layout shift (CLS).
- Show skeletons or spinners for loading; prefer optimistic UI for fast mutations.
- Every async surface handles all four states explicitly: loading, empty, error, success.
- Keep the layout stable when content swaps — no jumping when errors or banners appear.
