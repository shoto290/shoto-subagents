# Motion Intent

This section covers **intent only** — what a transition must communicate. Every timing value, easing curve, spring config, and implementation detail defers to `design-engineer:motion`.

Apply the 12 principles of animation as questions about meaning:

- **State** — did something change, and is the change attributable? Follow-through and secondary action tie the result back to the act that caused it.
- **Spatial relationship** — where did this come from, where did it go? Arcs and staging give an element an origin, so a panel reads as coming *from* the control that opened it.
- **Continuity** — same object or new one? Shared-element movement preserves identity across screens; a hard cut asserts a new context.
- **Emphasis** — what should be looked at first? Staging and sequence order attention; anticipation signals that something is about to happen.
- **Physicality** — squash, stretch, slow in and out, and weight tell the user whether a thing is heavy, dismissible, or bounded. A rubber-band scroll edge means "no more content", not decoration.

Motion that must actually be judged requires a high-fidelity or coded prototype. Click-through prototypes approximate it, and participants react to the approximation.
