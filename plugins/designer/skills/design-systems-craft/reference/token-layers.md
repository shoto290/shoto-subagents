# Token Layers

Three layers, each referencing the one above. Components consume the bottom layer, never raw values.

1. **Primitive** — raw, context-free values. `blue/500 = #3b82f6`, `gray/900`, `size/16`. A palette and a scale. Never applied directly to a design.
2. **Semantic** — role-based, describing intent not appearance: `color.text.primary`, `color.bg.surface`, `color.border.default`, `space.md`, `radius.lg`. Maps to primitives. This is the layer themes swap.
3. **Component** — optional, scoped overrides for one component: `button.bg = color.accent`. Add only when a component genuinely diverges.

| Layer | Example | Who consumes it |
| :-- | :-- | :-- |
| Primitive | `blue/500`, `gray/50`, `size/16` | Semantic tokens only |
| Semantic | `color.text.primary`, `space.md` | Components, designs |
| Component | `button.bg`, `card.shadow` | One component |

**Why semantic naming beats raw values.** `color.text.primary` survives a rebrand; `#111827` does not. Change a primitive once or remap a semantic per theme, and every consumer updates — no find-and-replace across files.

**Light/dark via semantic aliasing.** Primitives stay fixed; only the semantic → primitive mapping flips.

| Semantic token | Light → primitive | Dark → primitive |
| :-- | :-- | :-- |
| `color.bg.surface` | `gray/50` | `gray/900` |
| `color.text.primary` | `gray/900` | `gray/50` |
| `color.accent` | `blue/600` | `blue/400` |

In Figma, this is a variable collection with `Light` and `Dark` modes; the semantic variable points at different primitives per mode. Components bound to semantics re-theme with zero per-component work.
