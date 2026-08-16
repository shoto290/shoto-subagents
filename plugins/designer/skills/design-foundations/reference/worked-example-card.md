# Worked Example — Card

## Visual Hierarchy

Rank information so the eye lands in the right order.

- **Levers** — size, weight, color/contrast, and spacing. Combine two or three; relying on size alone forces large, clumsy jumps.
- **Demote, don't only promote** — to make the primary thing stand out, mute the secondary (gray it, shrink it, thin it) rather than enlarging everything.
- **One primary action per view** — a single high-emphasis button. Secondary actions are lower-contrast (outline/ghost); destructive actions read as `danger` but stay visually quiet until needed.
- **Scannability** — clear headings, short groups, aligned starts. A user should grasp the structure before reading a word.

## Card Promoted from Wireframe to High Fidelity

Wireframe state: title, price, and description all 16px/400, equal 16px gaps, a black "Buy" button and a black "Save" button side by side. Everything competes; nothing leads.

Applied foundations:
- **Type** — title to 20px/600, price to 16px/600, description stays 16px/400 `text-muted`. Three levels from two sizes plus weight and color.
- **Color** — surface off-white, ink `#1a1a1a`, one brand accent on the single primary button. "Save" becomes a ghost button in neutral.
- **Spacing** — 8px base: 8px title-to-price, 16px price-to-description, 24px description-to-actions. Rhythm now signals grouping.
- **Hierarchy** — one accent "Buy" (primary), one quiet "Save" (secondary). The eye goes title → price → action.

Result: same content, but it reads top-to-bottom with an obvious next step — the wireframe-to-high-fidelity jump done with system decisions, not decoration.
