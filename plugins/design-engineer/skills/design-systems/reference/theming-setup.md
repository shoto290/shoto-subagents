# Theming Setup

Define light values on `:root`, override only the swapped semantic tokens under `[data-theme="dark"]`. Primitives stay fixed; semantics remap.

```css
:root {
  --blue-500: #3b82f6;
  --gray-50: #f9fafb;
  --gray-900: #111827;

  --color-bg: var(--gray-50);
  --color-fg: var(--gray-900);
  --color-accent: var(--blue-500);

  --space-1: 0.25rem;
  --space-4: 1rem;
  --radius-md: 0.5rem;
  --shadow-md: 0 4px 6px rgb(0 0 0 / 0.1);
}

[data-theme="dark"] {
  --color-bg: var(--gray-900);
  --color-fg: var(--gray-50);
}
```

Toggle by setting `document.documentElement.dataset.theme = "dark"`. Components read `--color-bg` and follow automatically — no per-component theme logic.
