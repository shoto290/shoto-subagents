# Scroll Containers

## Pick The Scroll Container Deliberately

Decide, per screen, which single element scrolls. Ambiguity here produces nested scrollbars and lost keyboard position.

- **Document scrolls** — marketing, docs, long-form reads. Simplest; sticky headers and scroll restoration work for free.
- **Content region scrolls** — app shells with a fixed sidebar and header. Every ancestor of the scroller needs `min-block-size: 0`.
- Set `overscroll-behavior: contain` on inner scrollers so wheel momentum does not chain to the page.
- Set `scroll-padding-block-start` to the sticky header height on the scroll container, so anchor jumps and `:focus-visible` never land underneath it.
- Restore scroll per route, not per mount. Nested scrollers each need their own restoration or they silently reset.
