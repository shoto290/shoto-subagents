# Screen Archetypes

- **List / detail** — container-queried two-column above the threshold, stacked below. On narrow screens make the detail a real route, not a hidden sibling, so Back works.
- **Dashboard** — `grid-template-columns: repeat(auto-fit, minmax(min(20rem, 100%), 1fr))` and let widgets claim `grid-column: span 2` when they need it. No breakpoints, no per-widget media queries.
- **Table screen** — page header sticky at `inset-block-start: 0`, table head sticky beneath it, horizontal scroll on the table wrapper only.
- **Focused form** — single content column capped near `40rem`; the form owns vertical rhythm through `row-gap`, never through margins on the fields.
