# Core Web Vitals

- **LCP** — prioritize the hero element: preload it, mark the hero image `priority`, and keep the critical path short.
- **CLS** — reserve space for anything that loads late. Always set explicit dimensions or aspect ratios on images, embeds, and ad/widget slots. Layout and intrinsic sizing belong to the `css-craft` skill — delegate there for the layout mechanics.
- **INP** — keep the main thread free: break up long tasks, debounce high-frequency handlers, and use `useDeferredValue` / `startTransition` to keep input responsive during expensive updates.
