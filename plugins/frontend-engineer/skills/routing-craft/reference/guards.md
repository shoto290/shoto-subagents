# Guards

`beforeLoad` runs before the loader, top-down, and is the only correct place for an auth gate. A redirect fired from a component runs after the protected screen has already mounted and fetched.

```tsx
export const Route = createFileRoute("/_authenticated")({
  beforeLoad: ({ context, location }) => {
    if (!context.auth.isAuthenticated) {
      throw redirect({ to: "/login", search: { redirect: location.href } });
    }
  },
});
```

- **Throw** the `redirect()`; returning it does nothing. Guard once on a pathless layout route, not on every child.
- Carry the attempted URL in search so login returns the user where they were.
- What `beforeLoad` returns merges into `context` for descendants — resolve the session once there instead of re-reading it per child.

## Layout Routes

- A **pathless** layout route (`_authenticated.tsx`) adds a wrapper, a guard, and shared context without adding a URL segment.
- A **path** layout route (`orders.tsx` above `orders/index.tsx` and `orders/$orderId.tsx`) renders the shell once; its `<Outlet />` swaps only the child, so the shell keeps its scroll position and its data across child navigations.
- Mount the app shell in the root or a top layout route so navigation never remounts the sidebar — see `frontend-engineer:screen-layout`. Nest to share layout, guards, or data; nesting that only mirrors the file system buys matched routes and no behavior.

## Pitfall

- **Auth checks inside components** — the protected screen mounts and fetches before the redirect lands. Guard in `beforeLoad`.
