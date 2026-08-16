# Scaling & Governance

A design system is a product with internal users. Govern it like one (the *Design That Scales* mindset).

| Lever | What good looks like |
| :-- | :-- |
| Contribution model | A clear path for product teams to propose and add components |
| Versioning | Semantic versions; communicate what changed and why |
| Deprecation | Mark deprecated, give a migration path, then remove — never yank silently |
| Core team | A small, dedicated group owns quality and direction |
| Adoption metrics | Track detach rate, % screens on library components, token coverage |

- **Small core team, broad contribution.** A lean team curates; product teams contribute under review. This scales without a bottleneck and without anarchy.
- **Measure adoption.** If teams detach instances or recreate components, the system is failing them — investigate before adding more.
- **Version deliberately.** Breaking changes get a major bump and a migration note. Stability is what earns trust.
