# Cascade Layers

Cascade, specificity, and scoping.

- `:where(...)` wraps selectors at **zero specificity** — ideal for resets, defaults, and library styles that consumers must override effortlessly. `:is(...)` is the same grouping but takes the specificity of its strongest argument.
- `@layer` (cascade layers) orders override priority explicitly, independent of source order or specificity. Define the order once, then later layers always win:

```css
@layer reset, base, components, utilities;

@layer components {
  .btn { background: var(--accent); }
}
```

Layers end specificity wars: a `utilities` rule beats a `components` rule even with lower specificity, because the layer order decides.
