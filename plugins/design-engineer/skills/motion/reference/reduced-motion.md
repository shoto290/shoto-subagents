# Reduced Motion

## Accessibility — Always Honor Reduced Motion

Wrap non-essential motion so it collapses when the user opts out. This is mandatory, not optional.

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

For JS-driven motion, gate on the matching hook and fall back to an instant or fade-only change:

```ts
import { useSyncExternalStore } from "react";

const query = "(prefers-reduced-motion: reduce)";

export function usePrefersReducedMotion(): boolean {
  return useSyncExternalStore(
    (cb) => {
      const mql = window.matchMedia(query);
      mql.addEventListener("change", cb);
      return () => mql.removeEventListener("change", cb);
    },
    () => window.matchMedia(query).matches,
    () => false,
  );
}
```

Use it to skip or shorten animation: `const duration = usePrefersReducedMotion() ? 0 : 200;`.
