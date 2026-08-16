# Typographic Scale

Pick a ratio, generate a small set of sizes, and never improvise a size in between.

- **Modular scale** — multiply a base (16px) by a fixed ratio. 1.2 (minor third) for dense UI; 1.25 (major third) for marketing or airier screens. Round to clean pixels.
- **Limit the set** — 5 to 7 sizes total covers an entire product. More sizes read as noise, not hierarchy.
- **Line-height by role** — tight for headings (1.1–1.25), roomy for body (~1.5). Line-height shrinks as size grows.
- **Measure** — keep body line length at 45–75 characters. Cap with `max-width` (~65ch), don't let prose run the full container.
- **Weight over size** — separate a label from its value with weight (500 vs 400) or color before reaching for a larger size. Most hierarchy is achievable inside two or three sizes.

| Role | Size (1.25 from 16) | Line-height | Weight |
| :-- | :-- | :-- | :-- |
| Display | 39px | 1.1 | 700 |
| H1 | 31px | 1.15 | 700 |
| H2 | 25px | 1.2 | 600 |
| H3 | 20px | 1.3 | 600 |
| Body | 16px | 1.5 | 400 |
| Small / caption | 13px | 1.45 | 400 |
