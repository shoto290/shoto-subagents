# App Shell

One shell, owned by the layout route, mounted once. Routes swap the content region only. A shell that remounts per navigation loses scroll position, refetches, and flashes — see `frontend-engineer:routing-craft` for where the layout route belongs.

```css
.app-shell {
  display: grid;
  grid-template-areas:
    "sidebar header"
    "sidebar content";
  grid-template-columns: auto 1fr;
  grid-template-rows: auto 1fr;
  block-size: 100dvh;
}

.app-shell > .content {
  grid-area: content;
  min-block-size: 0;
  overflow-y: auto;
  overscroll-behavior: contain;
}
```

`100dvh`, not `100vh` — the dynamic unit follows mobile browser chrome. `min-block-size: 0` is mandatory: a grid item's default `min-content` floor refuses to shrink, so the scrollbar escapes to the document and your sticky header scrolls away.

## Pitfalls

- **Missing `min-block-size: 0`** — the inner region never shrinks, the scrollbar jumps to the document, and the sticky header scrolls out of view.
- **Shell inside the page component** — every navigation remounts the sidebar and header. Put it in a layout route.
