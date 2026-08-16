---
name: figma-craft
description: Working in Figma and driving the Figma MCP.
---

# Figma Craft

Build Figma files that humans, Figma AI, and the MCP server can all understand. The discipline below — auto layout, variants, variables, and semantic naming — is what makes a design legible to a code generator and frictionless at developer handoff.

## Non-Negotiables

- Separate pages by purpose, name them consistently, and branch for major reorganizations.
- Lay out every frame with auto layout — fill, hug, or fixed; never hand-place children.
- Bind every color, space, and radius to a semantic variable, aliased to a primitive collection.
- Name components slash-separated (`Button/Primary/Large`) and every layer descriptively.
- Expose component API through boolean, instance-swap, and text properties before adding a variant axis.
- Read `get_design_context` + `get_variable_defs` + `get_screenshot` before generating any code, and reuse existing components and variables over reinventing.
- MCP setup is the user's responsibility — if no server is connected, say so and work from links or screenshots.

## Pitfalls

- Absolute positioning — use auto layout so intent and responsiveness are explicit.
- Ungrouped / unnamed layers (`Frame 427`) — name every layer descriptively.
- Raw hex (`#3B82F6`) — bind to a semantic variable.
- Variant explosion — use boolean / instance-swap properties for toggles and swaps.
- Detached instances — keep instances linked to the master component.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/file-organization.md](./reference/file-organization.md) | Setting up or reorganizing a file's pages, sections, covers, or branches |
| [reference/auto-layout.md](./reference/auto-layout.md) | Choosing fill/hug/fixed sizing, or making a frame respond to content and viewport |
| [reference/variables-and-naming.md](./reference/variables-and-naming.md) | Building variants, modes, tokens, naming, or preparing developer handoff |
| [reference/mcp-tools.md](./reference/mcp-tools.md) | Driving the Figma MCP servers or picking a tool for the current selection |
