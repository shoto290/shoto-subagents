# Spacing and Grid

## Spacing & Rhythm

One unit governs every gap on the screen.

- **Single base unit** — 4px or 8px. Everything is a multiple. 8px is the common default; 4px when a dense UI needs finer steps.
- **Spacing scale** — 4, 8, 12, 16, 24, 32, 48, 64. A fixed ladder kills the "is it 13 or 15px?" guesswork and makes spacing decisions binary.
- **Consistent padding & gap** — the same component gets the same internal padding everywhere; sibling elements share one gap value. Inconsistent gaps are the loudest signal of an unsystematic layout.
- **Vertical rhythm** — relate vertical spacing to the type scale: more space above a heading than below it, so a heading groups with the content it introduces (proximity).
- **Optical alignment** — trust the eye over the math. Icons, punctuation, and round shapes often need a nudge past their geometric box to look aligned.

## Grids & Layout

- **Columns, gutters, margins** — a 12-column grid flexes to 2/3/4/6 splits. Define gutter and outer margin in spacing-scale units.
- **8pt grid** — snap component sizes and positions to 8px (or your base). Removes a class of one-off measurements.
- **Container widths** — cap content (~1200–1280px on desktop) and center it. Full-bleed text is unreadable.
- **Breakpoints** — design a few intentional layouts (mobile / tablet / desktop) rather than fluid mush; let content, not devices, dictate where a layout breaks.
- **Alignment & proximity (Gestalt)** — related items sit close and share an edge; unrelated items get more space. Grouping by spacing beats grouping by borders and boxes.
- **Whitespace is a design element** — generous negative space signals quality and focus. Crowding to "use the space" is the most common amateur tell. Add emptiness deliberately.
