# Container Queries

Container queries over viewport breakpoints.

Components should respond to *their own* available width, not the viewport. A card in a sidebar and the same card full-width should adapt independently. This is the default for component-level responsiveness.

```css
.card-list {
  container-type: inline-size;
}

.card {
  display: grid;
  gap: 1rem;
}

@container (min-width: 24rem) {
  .card {
    grid-template-columns: auto 1fr;
  }
}
```

Reserve viewport media queries for true page-level shifts (e.g. collapsing the whole app shell).

## Worked Example

**Container-query card adapting to its slot** — see the example above: the card switches from stacked to side-by-side based on its container, so it works identically in a sidebar or a full-width region.
