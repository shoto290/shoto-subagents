---
name: personas-journeys
description: Personas, empathy maps, and journey mapping.
---

# Personas & Journeys

Models of who the user is and what path they take. Every model below is judged by one rule: **an artifact that changes no decision is decoration** — each one must name the decision it unblocks, or it should not be made. Ground the mapping craft in the Nielsen Norman Group journey-mapping literature (journey vs experience map vs service blueprint, the line of visibility) and the facilitation formats in Gray, Brown & Macanufo's *Gamestorming*. For motivation and demand framing — why the user hires the product at all — defer to `product-designer:jobs-to-be-done`. For gathering the evidence these artifacts are built from, defer to `product-designer:user-research`.

## Non-Negotiables

- A persona is a decision-making tool, not a biography — evidence-backed, segmented on behavior, and unusable without goals, context, constraints, and current workaround.
- Keep 3-5 personas, exactly one primary per surface, and one named anti-persona — the only part of the artifact that can reject a feature request.
- Contradictions between empathy-map quadrants are the finding, not a defect — record the gap verbatim and carry it into the journey map.
- One persona, one scenario, one map — explicit start and end trigger, current state mapped before any future state.
- The evidence column is not optional — an unsourced row is a hypothesis and must be marked as one; map the failure paths and the team handoffs, not just the success path.
- Storyboard the sequence before any screen is designed — 6-8 low-fidelity frames, including the failure branch and the frames before and after the product.

## Choose the Artifact

| Artifact | Scope | Escalate to it when |
| :-- | :-- | :-- |
| **Journey map** | One persona, one scenario, your product — front-stage only | Default starting point — you know your user and want to fix their path |
| **Experience map** | Generic human behavior across the whole problem space, product-agnostic | You do not yet know your users or your product's role |
| **Service blueprint** | One journey plus everything behind the line of visibility | The pain is operational, not interface-level |

## Pitfalls

- **Persona theater** — stock photos, invented names, fabricated hobbies, zero traceable evidence. It looks like research, immunizes the team against real users, and cannot be challenged because there is nothing to check.
- **Artifacts never revisited after the workshop** — a persona or map that is not re-checked against new evidence each cycle becomes a stale constraint the team obeys long after the users have moved.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/personas.md](./reference/personas.md) | Building, ranking, or challenging a persona set — evidence rules, the four mandatory contents, the anti-persona |
| [reference/empathy-map.md](./reference/empathy-map.md) | Turning raw research into a Says / Thinks / Does / Feels snapshot before the journey map exists |
| [reference/journey-map.md](./reference/journey-map.md) | Scoping or filling a journey map — the seven columns, failure paths, emotion curve, journey pitfalls |
| [reference/map-types.md](./reference/map-types.md) | Choosing between journey map, experience map, and service blueprint, or crossing the line of visibility |
| [reference/storyboard.md](./reference/storyboard.md) | Sequencing a flow in frames before any screen is designed, including the failure branch |
