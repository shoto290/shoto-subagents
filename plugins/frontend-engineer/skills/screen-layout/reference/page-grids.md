# Page Grids

Give the page one grid with named lines; children opt into a column instead of carrying their own `max-width` and `margin: auto`.

```css
.page {
  display: grid;
  grid-template-columns:
    [full-start] minmax(var(--space-4), 1fr)
    [content-start] min(72rem, 100%) [content-end]
    minmax(var(--space-4), 1fr) [full-end];
  row-gap: var(--space-6);
}

.page > * {
  grid-column: content;
}

.page > .bleed {
  grid-column: full;
}
```

Full-bleed banners, sticky toolbars, and tables that need the whole width become a one-class opt-in instead of negative margins.
