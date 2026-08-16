---
name: paper-craft
description: 'Designing on the Paper.design canvas via the Paper MCP.'
---

# Paper Craft

Design in Paper.design — a spatial canvas built on real HTML/CSS/DOM — and drive its MCP server so an agent reads and edits the canvas directly. The core shift: the canvas IS the product, not a picture of it.

## Non-Negotiable Rules

- Call `get_guide` first — never write to the canvas before reading the guide.
- Orient with `get_tree_summary` and/or `get_screenshot` before the first edit.
- Call `finish_working_on_nodes` when done, and per completed screen.
- Never build high-fidelity first — every mockup task runs detect → draft → checkpoint → refine.
- Iterate on EXISTING nodes; reserve full `write_html` rewrites for structural changes.
- Detect and confirm the mockup mode in one line before drafting — never guess the design system.
- If the Paper MCP is not connected, say so and ask the user to open the Paper desktop app and a design file — do not block on it.

## Round-Trip

- **Code-to-design** — pull a live section of the running app onto the canvas, iterate spatially, push the real change back as production code.
- **Design-to-code** — iterate on HTML/CSS-native artboards, export real React / Tailwind / HTML.

## Pitfalls

- **Treating Paper like a static mockup tool** — it is live HTML/CSS, not a flat picture. Design with real structure and data.
- **Ignoring the live-code round-trip** — code-to-design only pays off when you push the real change back, not a redline.
- **Editing blindly** — never write to the canvas before reading the tree and the guide. Orient with `get_guide` + `get_tree_summary` / `get_screenshot` first.
- **Going high-fidelity on the first pass** — draft low-fi and checkpoint before investing in polish; cheap drafts make feedback cheap.
- **Rewriting artboards to apply small feedback** — use `update_styles` / `set_text_content` / `duplicate_nodes` on existing nodes; full `write_html` rewrites are for structural changes only.
- **Guessing the design system** — detect (Figma MCP, then Storybook in the repo) and confirm the mode in one line before drafting.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/mcp-tools.md](./reference/mcp-tools.md) | Before calling any Paper MCP tool — server wiring, the read/write/workflow tool catalog, and the orient → edit → finalize approach. |
| [reference/mockup-flow.md](./reference/mockup-flow.md) | When a mockup, wireframe, or screen-design task starts — why Paper is different, spatial design, the code-to-design and design-to-code round-trips, the four passes, and the mockup modes. |
