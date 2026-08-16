# Mockup Flow

## Why Paper Is Different

- **The canvas is the product.** Artboards are real HTML/CSS/DOM, not vector shapes that approximate a UI. What you see is what ships.
- **No abstraction gap.** There is no mockup→code translation step where intent gets lost. The design and the implementation are the same artifact, so there is no mockup→code mismatch to reconcile later.
- **Agents work in the native medium.** Agents are trained on web standards (HTML, CSS, the DOM), so they operate directly in Paper instead of guessing at a proprietary design format.
- **Live data, not static mockups.** Sections render with real data and real components, so the canvas reflects production reality instead of placeholder lorem ipsum.

## Spatial Design

- **Lay multiple futures side by side.** Place design variants next to each other on the canvas and compare them in one view instead of toggling between files.
- **Humans own spatial reasoning.** Comparison, judgment, taste, and the final decision stay with the person — the parts that need a human eye.
- **Agents own execution.** Boilerplate, repetitive refactors across variants, and pulling live data are delegated to the agent so the human stays focused on the decisions.

## Code-to-Design

Pull a live section of an app onto the canvas, iterate, then push the real change back.

1. Pull a live section (React or HTML/CSS) of the running app onto the canvas as an editable artboard.
2. Iterate spatially — adjust layout, styles, and structure, branching into variants as needed.
3. Push the actual change back as production code — not a screenshot or a redline of the change, the change itself.

## Design-to-Code

Start on the canvas and export real implementation.

- Iterate on the canvas with HTML/CSS-native artboards.
- Export real **React / Tailwind / HTML**, not a spec sheet or a handoff document the developer must re-implement.

## The Four Passes

Never build high-fidelity first. Every mockup task runs detect → draft → checkpoint → refine.

### Detect The Mode (seconds, not minutes)

Run BEFORE drafting:

1. If a Figma MCP server is connected, call `get_libraries` / `search_design_system` (tool detail in `designer:figma-craft`) — components or variables found means design-system mode sourced from Figma.
2. Else check the repo for Storybook — a `.storybook/` directory or `*.stories.(tsx|ts|jsx|js|mdx)` files — found means design-system mode sourced from Storybook.
3. Neither found, or the user asked for quick/rough/wireframes — wireframe mode.

Then confirm in ONE line with a single yes/no question, e.g. "Found your design system in Storybook — I'll draft low-fi first, then refine with your real components. OK, or pure wireframes?" One question, then go; never a long interview.

### Draft Pass (low-fi, all screens)

Identical in both modes:

- One artboard per screen.
- Grayscale boxes with simple borders, system font, placeholder text ("Heading", "Body copy", "CTA") — no brand colors, imagery, or polish.
- One `write_html` per screen capturing layout structure and hierarchy only.
- Draft ALL requested screens before refining any.

### Checkpoint (feedback before fidelity)

After the draft pass, `get_screenshot` every artboard, show the user, and ask 2-3 focused questions (layout right? anything missing? which screen to refine first?). Do NOT start refining without the user's direction. If direction is ambiguous, lay at most two variants side by side (per Spatial Design) rather than guessing.

### Refine Pass (targeted edits, never rewrites)

- Apply feedback screen by screen in the user's priority order.
- Iterate on EXISTING nodes — prefer `update_styles`, `set_text_content`, `duplicate_nodes`, `move_nodes`.
- Rewrite a subtree with `write_html` only when the structure fundamentally changes.
- After each round, screenshot → confirm → next; `finish_working_on_nodes` per completed screen.

## Mockup Modes

| Mode | Behavior |
| :-- | :-- |
| **Wireframe mode** | Stays low-fi end to end; refinement means layout, flow, and content-structure changes, never visual polish. |
| **Design-system mode** | Drafts low-fi exactly like wireframe mode, then the refine pass applies the product's REAL tokens and components: Figma source — `get_variable_defs` + `get_design_context` via `designer:figma-craft`; Storybook source — read story files for component names, props, and states, and pull token values from the repo (CSS variables, Tailwind config, theme files); map names 1:1 (Figma `Button/Primary` or Storybook `Button` story → the mockup's button styles). |

The draft pass is always low-fi; the mode only changes what the refine pass reaches for.
