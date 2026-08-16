# Container Queries

## Regions Respond To Themselves

A region adapts to its own inline size, not the viewport. The same detail panel sits in a wide route today and a drawer tomorrow; a viewport query hardcodes today.

```css
.list-detail {
  container-type: inline-size;
  display: grid;
  gap: var(--space-6);
}

@container (min-width: 60rem) {
  .list-detail {
    grid-template-columns: minmax(18rem, 26rem) 1fr;
  }
}
```

Reserve viewport media queries for genuine shell-level shifts: collapsing the sidebar to a drawer, switching a table screen to cards.

## Pitfalls

- **Viewport queries for regions** — couples a panel to the page it happens to live in today. Use container queries.
