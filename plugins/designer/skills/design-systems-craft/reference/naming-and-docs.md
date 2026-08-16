# Naming & Documentation

## Naming Conventions

Names are the system's API. Consistency here makes the library searchable and the handoff clean.

- **Slash-separated component names** group related variants: `Button/Primary/Large`, `Icon/Chevron/Right`. The slashes build a folder tree in the assets panel automatically.
- **Consistent casing.** Pick one convention and hold it: `Title Case` for component names, `lowercase.dot` for tokens (`color.text.primary`). Do not mix.
- **Descriptive layer names.** Rename layers to their role (`label`, `icon-leading`, `container`) — never ship `Frame 427` or `Rectangle 12`. Clean layers make instances legible and code generation accurate.
- **Assets-panel organization.** Slash prefixes plus a published library give consumers a browsable, predictable catalog.
- **Match design names to code component names.** The Figma `Button/Primary` should map to the coded `<Button variant="primary">`. Aligned names are the cheapest defense against design–code drift.

## Documentation

Document next to the component, as a single source of truth — not in a separate deck that rots.

For each component, capture:

- **Usage do / don't** — a correct example beside a common misuse.
- **Props / properties** — every variant, boolean, and instance-swap option, with allowed values.
- **States** — default, hover, focus, active, disabled, loading, error.
- **Accessibility notes** — required label, focus order, contrast, keyboard behavior, ARIA role.

| Field | Captures |
| :-- | :-- |
| When to use / when not | Intent and boundaries |
| Anatomy | Named parts of the component |
| Props | Variants and options |
| States | Interactive and validation states |
| A11y | Contrast, focus, labels, keyboard |

Keep docs where the component lives (component page, or a tool like ZeroHeight bound to the library) so updating the component and its docs is one motion. Separate docs drift out of sync the moment the component changes.
