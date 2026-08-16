# Variants & Properties

Prefer **one component with properties** over many near-identical components. Figma exposes four property types:

| Property type | Use for | Example |
| :-- | :-- | :-- |
| Variant | Mutually exclusive visual states | `Type = Primary / Secondary`, `Size = SM / MD / LG` |
| Boolean | Optional, independent elements | `Has Icon`, `Disabled` |
| Instance swap | Replaceable nested instance | `Icon = ChevronRight` |
| Text | Editable copy | `Label = "Save"` |

**Single component vs separate components.** Keep one component when items share structure and differ only by property (a button's type and size). Split into separate components when structure differs fundamentally (a Button vs a Checkbox) — forcing them together creates a tangled variant set nobody can navigate.

**Organize variants in a matrix.** Lay variant properties on two axes so every combination is visible and gaps are obvious.

| | Default | Hover | Disabled |
| :-- | :-- | :-- | :-- |
| **Primary** | ✓ | ✓ | ✓ |
| **Secondary** | ✓ | ✓ | ✓ |

**Default + states.** Mark one variant as the default (the first, cleanest combination). Model interaction states (hover, focus, active, disabled) as variant values so designs can show real states instead of redrawing them.
