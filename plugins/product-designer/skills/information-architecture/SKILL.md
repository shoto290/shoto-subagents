---
name: information-architecture
description: Structuring content, navigation, and user flows.
---

# Information Architecture

How content, navigation, and flows are organized so people can find things and finish tasks. Rosenfeld & Morville (*Information Architecture*) frame it as organization, labeling, navigation, and search systems; Abby Covert (*How to Make Sense of Any Mess*) reduces the job to making a mess intelligible by agreeing on language first. One rule governs everything below: **structure is decided by the words users already use, never by the org chart.** A menu that mirrors your teams is a diagram of your company, not a map of the product. Within-screen visual hierarchy, grid, and spacing are a different problem — defer to `designer:design-foundations`.

## Inventory & Audit

Never restructure what you have not counted. Inventory first, judge second — a new taxonomy laid over unknown content just relocates the mess.

- **Inventory** — every page, screen, doc, and setting: URL, title, type, owner, last updated, traffic.
- **Owner** — a piece of content with no owner will not be maintained and is a future dead end. Assign one or delete it.
- **Dead** — no traffic, stale, or describing a shipped-away feature. Delete before migrating; migration is the cheapest moment to cut.
- **Duplicated** — same concept written twice under two labels. Merge into one canonical location and redirect the loser. Duplicates split traffic, split search relevance, and drift apart.
- Audit output is a decision per item: **keep, merge, rewrite, delete**. Nothing carries over unclassified.

## Taxonomy & Labeling

- Use the users' vocabulary, not internal vocabulary. Source labels from search logs, support tickets, and the words users say unprompted in interviews — not from database table names or team names.
- **One label per concept.** The same thing is called the same thing in navigation, page title, breadcrumb, button, and empty state.
- **No synonyms competing in the same navigation.** "Reports" next to "Analytics" next to "Insights" forces a guess on every visit; pick one and retire the others.
- Avoid invented brand words for functional destinations. A clever name adds a translation step to every task.
- **Test a label** before shipping it: ask users to describe the thing unprompted (do they say your word?), then run a tree test where the task wording deliberately avoids the label — if success depends on the task echoing the label, the label is not understood, only matched.

## Navigation Patterns

| Type | Carries | Depth vs. breadth | Failure mode |
| :-- | :-- | :-- | :-- |
| **Global** | Top-level sections, present on every screen. The product's mental model. | Broad and shallow — 5-7 items. Every added item taxes every screen. | Grows into a dumping ground; each new feature bolts on an item until nothing is findable. |
| **Local** | Children of the current section; where depth lives. | Deeper is fine here if labels are predictable. | Duplicates global nav, or shifts between sections so position stops being learnable. |
| **Contextual** | Related, next-step, and cross-links inside the content itself. | Neither — it is lateral, cutting across the hierarchy. | Auto-generated "related" links nobody chose, or so many inline links the primary path is lost. |
| **Utility** | Account, settings, help, search, sign out. Cross-cutting, task-agnostic. | Shallow and constant; visually separated from global. | Product features smuggled into utility because global was full — users never look there. |

- Depth costs clicks; breadth costs scanning. Trade one for the other deliberately: users tolerate depth when each label predicts what is underneath, and tolerate breadth only when items are grouped. Cognitive load, Hick's Law, and Miller's Law — defer to `designer:ux-principles`.
- Search is not a substitute for structure. It is the escape hatch users take when structure failed, and its query log is your best label research.

## Validate The Structure

- **Open card sort** — users group and name the cards themselves. Use when the taxonomy does not exist yet or is being rebuilt; it produces candidate groupings *and* candidate labels in users' own words.
- **Closed card sort** — users sort cards into your fixed categories. Use to validate a proposed structure and to see which items are homeless or land in two places.
- **Tree testing** — text-only hierarchy, no visual design, no search. Give a task ("where would you change your billing address?") and record the path. This isolates the structure from the UI, so a failure is unambiguously an IA failure.
- **Pass criterion: ≥80% first-click success on core tasks.** The first click is the load-bearing one — users who start down the right branch finish far more often than those who must back out. Below 70%, the branch is wrong: relabel or reparent it, do not add a shortcut.
- Also track directness (path with no backtracking) and time-to-first-click; slow first clicks mean two labels look equally plausible.

## User Flows & Task Flows

- **Task flow** — one actor, one path, no branching. Use to specify a single known procedure end to end.
- **User flow** — branching by decision, state, permission, and entry point. Use when the same goal has several routes or the outcome depends on context.
- **Entry points** — flows rarely start at the home screen. Chart deep link, email, notification, and search-result entries; each must survive being someone's first screen.
- **Decision nodes** — every branch is a question the user must answer. If they lack the information to answer it there, move the node or supply the information.
- **Error and recovery paths** — every flow charts at least one failure path: what breaks, what the user sees, and how they get back to a productive state. A recovery path that ends at "try again" is not a recovery path.
- **Dead ends** — any screen with no forward action. Empty states, zero results, expired links, and permission denials all need an onward route.

## Sitemap

- **Levels** — number them from a single root and keep the depth of a section justified by its content volume, not by symmetry with its siblings. Depth is not the enemy; unpredictable labels are.
- **Naming** — the sitemap node name is the navigation label is the page title is the breadcrumb. One string, reused; divergence between them is where users lose the thread.
- **URLs** — the hierarchy is the URL path (`/settings/billing/invoices`). URLs are the most public and longest-lived expression of your IA: they get bookmarked, pasted into tickets, and indexed. Changing one is a breaking change requiring a permanent redirect.
- **Deep links** — every node worth linking to needs a stable, addressable route that works with no history and no prior state. If a screen only exists inside a modal or a wizard step, it cannot be linked, shared, or returned to.
- Keep the hierarchy shallow enough that a breadcrumb stays readable; if it wraps, the structure is over-nested.

## Pitfalls

- **Mirroring internal team structure** — the nav shows your org chart. Users do not know your teams and should not have to learn them to find a setting.
- **A mega-menu hiding a taxonomy problem** — exposing 60 links at once is not findability, it is a flat list with a hover state. It postpones the grouping decision instead of making it.
- **Charting only the happy path** — the unmapped error, empty, and permission-denied states are where users actually abandon. Unspecified means designed by default.
- **Labels chosen by committee** — the label that offends no stakeholder is usually the one that means nothing. Labels are evidence-based, settled by tree test and search logs, not by consensus.
- **Restructuring without an inventory** — moving unknown content into a new structure migrates the duplicates and the dead pages along with it, then buries them one level deeper.
</content>
</invoke>
