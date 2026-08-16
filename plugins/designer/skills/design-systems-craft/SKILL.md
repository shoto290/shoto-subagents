---
name: design-systems-craft
description: Building, structuring, and scaling a design system.
---

# Design Systems Craft

How a designer builds and scales a design system. One rule underpins all of it: **favor the smallest token, variant, and component set that solves the problem.** Every layer below earns its place only when reuse demands it — never speculatively.

## Rules

- Components consume semantic tokens, never raw values — primitives feed semantics, semantics feed components.
- Theme by remapping semantics to primitives, not by editing components.
- Prefer one component with properties over many near-identical components.
- Compose molecules from existing atom instances; never redraw an atom.
- Names are the system's API — one casing convention, slash-grouped components, design names matching code names.
- Document next to the component, as a single source of truth.
- Govern the system like a product: small core team, broad contribution, deliberate versioning, measured adoption.

## Pitfalls

- **Token sprawl** — a token per component instead of reusing semantics. Reuse first; add a component token only on real divergence.
- **Premature abstraction** — building an organism for something used once. Abstract on the *second* real use, not the first guess.
- **One-off components** — a bespoke component that should have been a variant of an existing one. Check the matrix before creating new.
- **Undocumented variants** — a variant nobody knows exists gets recreated from scratch. Every variant needs a name and a usage note.
- **Drift between design and code** — mismatched names, missing states, divergent tokens. Aligned naming and a single source of truth keep design and code in lockstep.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/token-layers.md](./reference/token-layers.md) | Defining primitive, semantic, or component tokens, or wiring light/dark theming |
| [reference/variants-and-properties.md](./reference/variants-and-properties.md) | Deciding between variants and separate components, or laying out a variant matrix |
| [reference/atomic-design.md](./reference/atomic-design.md) | Mapping atoms, molecules, and organisms onto a component library |
| [reference/naming-and-docs.md](./reference/naming-and-docs.md) | Naming components, tokens, or layers, or writing component documentation |
| [reference/governance.md](./reference/governance.md) | Setting up contribution, versioning, deprecation, or adoption metrics |
