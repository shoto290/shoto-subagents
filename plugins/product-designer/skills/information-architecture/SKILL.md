---
name: information-architecture
description: Structuring content, navigation, and user flows.
---

# Information Architecture

How content, navigation, and flows are organized so people can find things and finish tasks. Rosenfeld & Morville (*Information Architecture*) frame it as organization, labeling, navigation, and search systems; Abby Covert (*How to Make Sense of Any Mess*) reduces the job to making a mess intelligible by agreeing on language first. One rule governs everything below: **structure is decided by the words users already use, never by the org chart.** A menu that mirrors your teams is a diagram of your company, not a map of the product. Within-screen visual hierarchy, grid, and spacing are a different problem — defer to `designer:design-foundations`.

## Non-Negotiables

- Never restructure what you have not counted. Inventory first, judge second.
- Audit output is a decision per item: **keep, merge, rewrite, delete**. Nothing carries over unclassified.
- Use the users' vocabulary, not internal vocabulary. **One label per concept**, and no synonyms competing in the same navigation.
- Global navigation stays broad and shallow — 5-7 items. Depth costs clicks; breadth costs scanning.
- Search is not a substitute for structure. It is the escape hatch users take when structure failed.
- **Pass criterion: ≥80% first-click success on core tasks.** Below 70%, the branch is wrong: relabel or reparent it, do not add a shortcut.
- Every flow charts at least one failure path, and no screen is left without a forward action.
- The sitemap node name is the navigation label is the page title is the breadcrumb. One string, reused.
- Cognitive load, Hick's Law, and Miller's Law — defer to `designer:ux-principles`.

## Pitfalls

- **Mirroring internal team structure** — the nav shows your org chart. Users do not know your teams and should not have to learn them to find a setting.
- **A mega-menu hiding a taxonomy problem** — exposing 60 links at once is not findability, it is a flat list with a hover state. It postpones the grouping decision instead of making it.
- **Charting only the happy path** — the unmapped error, empty, and permission-denied states are where users actually abandon. Unspecified means designed by default.
- **Labels chosen by committee** — the label that offends no stakeholder is usually the one that means nothing. Labels are evidence-based, settled by tree test and search logs, not by consensus.
- **Restructuring without an inventory** — moving unknown content into a new structure migrates the duplicates and the dead pages along with it, then buries them one level deeper.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/content-audit.md](./reference/content-audit.md) | Inventorying existing content before a restructure, or classifying each item as keep, merge, rewrite, or delete. |
| [reference/navigation-patterns.md](./reference/navigation-patterns.md) | Choosing between global, local, contextual, and utility navigation, or sourcing and testing labels. |
| [reference/structure-validation.md](./reference/structure-validation.md) | Running an open or closed card sort or a tree test, or setting the pass criteria for a proposed structure. |
| [reference/flows-and-sitemap.md](./reference/flows-and-sitemap.md) | Charting task or user flows, entry points, and error paths, or laying out sitemap levels, URLs, and deep links. |
