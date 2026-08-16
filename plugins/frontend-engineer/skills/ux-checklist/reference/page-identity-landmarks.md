# Page Identity And Landmarks

## Page Identity

- Every route sets a unique, specific `document.title`, most-specific part first: `Invoice 1042 — Billing — Acme`.
- Exactly one `<h1>` per screen, and it names the same thing the title does.
- Heading levels descend without gaps. A card's `<h3>` under a section `<h2>` under the page `<h1>`.
- Headings describe content, never styling. Never pick a level for its font size.
- Breadcrumbs, when present, match the route hierarchy and the last item is not a link.

## Landmarks

- One `<main>` per screen, containing everything that changes between routes.
- `<nav>`, `<aside>`, `<header>`, `<footer>` used once each, or labelled with `aria-label` when repeated (primary nav vs. pagination nav).
- Skip link is the first focusable element and moves focus into `<main>`.
- No interactive content outside a landmark.
