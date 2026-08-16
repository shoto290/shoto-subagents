# Route Fallbacks

Each route declares its own fallbacks and the nearest one handles the failure, so a broken child renders inside its parent's shell instead of blanking the app.

- `pendingComponent` — shown once the loader exceeds `defaultPendingMs` (1s) and held at least `defaultPendingMinMs` (500ms) so fast loads never flash. Skeleton the real layout.
- `errorComponent` — receives the error and a reset handler. Always offer a retry.
- `notFoundComponent` — pair it with `throw notFound()` in the loader when the record does not exist. A missing entity is a route state, not an error toast.
- Set `defaultPendingComponent` / `defaultErrorComponent` on the router for the baseline; override per route only where the shape genuinely differs.
