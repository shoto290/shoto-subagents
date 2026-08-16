# Auto Layout

Auto layout encodes intent: it tells a reader (and a code generator) how a frame is meant to respond, not just how it looks at one size.

| Sizing | Meaning | Use for |
| :-- | :-- | :-- |
| **Fill** | Grow/shrink to the parent's available space | Flexible columns, stretched buttons, responsive content |
| **Hug** | Shrink to fit children | Labels, chips, icon buttons, anything sized by content |
| **Fixed** | Locked width/height | Avatars, icons, fixed-width sidebars |

- Set **direction** (horizontal/vertical), **padding**, and **gap** explicitly — they map directly to flex/grid and spacing tokens in code.
- Set **alignment** (start/center/end, space-between) on the container instead of nudging children.
- Use **min/max width** to keep fluid frames readable across breakpoints.
- Build frames so they resize correctly when content or viewport changes — never hand-place children that should be laid out automatically.
