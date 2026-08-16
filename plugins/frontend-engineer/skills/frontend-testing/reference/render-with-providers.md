# Render With Providers

A screen needs its query client and its router. Wrap that once in a helper and re-export it, so no test hand-assembles providers.

```tsx
export function renderWithProviders(ui: ReactElement, options?: RenderOptions) {
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false } } });
  const wrapper = ({ children }: { children: ReactNode }) => <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>;
  return { queryClient, ...render(ui, { wrapper, ...options }) };
}
```

A fresh `QueryClient` per test keeps caches isolated, and `retry: false` makes a failing request fail once instead of after a retry chain. For a routed screen, drive the real router with a memory history rather than mocking navigation:

```tsx
const history = createMemoryHistory({ initialEntries: ["/invoices/42"] });
render(<RouterProvider router={createRouter({ routeTree, history })} />);
```

## Pitfall

**Shared `QueryClient`** — one test's cache satisfies the next test's query and the fetch under test never runs.
