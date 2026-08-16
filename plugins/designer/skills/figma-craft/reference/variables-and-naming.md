# Variables & Naming

## Variants & Properties

- Organize variants in a clean **matrix** — one property per axis (e.g. rows = size, columns = state) so every combination is reachable and named consistently.
- Use **component properties** to expose API rather than multiplying components:
  - **Boolean** — toggle a layer (show/hide icon, badge).
  - **Variant** — pick a discrete option (size, tone, state).
  - **Instance swap** — substitute a nested instance (leading icon).
  - **Text** — expose editable label content.
- **Avoid combinatorial explosion** — prefer a boolean or instance-swap property over adding another variant axis whenever the change is a toggle or a swap, not a distinct design.

## Variables & Tokens

- Use **modes** for theming — define `light` / `dark` (and density or brand) modes inside a collection so one variable resolves per context.
- **Semantic naming** — name by role, not by raw value: `color/bg/surface`, `color/text/muted`, `space/md`. Semantic names survive a value change; literal ones (`blue-500`) do not.
- **Collections and aliases** — keep a primitive collection (raw scales) and alias semantic variables to it, so a palette change propagates everywhere.
- **Scoping** — restrict where a variable applies (color-only, corner-radius-only) so the right options surface in the right fields.
- **Map to design tokens** — mirror the variable structure to the codebase's token names so MCP-generated code references the same scale developers use.

## Naming Conventions

Semantic names are what let Figma AI, the MCP, and developers reason about the design.

- **Slash-separated component names** — `Button/Primary/Large`, `Input/Text/Error`. Slashes build the assets-panel hierarchy and read as a path.
- **Descriptive layer names** — `icon-leading`, `label`, `badge-count`; never leave `Frame 427` or `Rectangle 12`.
- **Assets-panel hygiene** — publish only intentional components; keep the panel a curated library, not a dumping ground.
- Apply the same naming to variables and styles so every surface tells the same story.

## Handoff Hooks

Keep names, variables, and Code Connect mappings clean so the design hands off without translation:

- Stable slash-separated component names and semantic variables let developers map Figma to code 1:1.
- Maintain Code Connect mappings so generated code points at real components.
- Clean output feeds the `design-handoff` skill and the `design-engineer` pickup with no rework.
