# Flows And Sitemap

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
