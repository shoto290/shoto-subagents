---
name: frontend-testing
description: Feature tests with Vitest and Testing Library.
---

# Frontend Testing

Test a feature the way a user meets it: render the screen, act on it, assert what is visible. End-to-end tooling (Playwright and friends) is out of scope here — this skill is Vitest plus Testing Library only.

## What Earns a Test

| Test it | Skip it |
| :-- | :-- |
| A user flow through the screen: act, then see the result | Design-system primitives — tested in their own repo |
| Conditional rendering with consequences: permissions, empty vs populated | Styling, class names, layout |
| Loading, error, and empty states | Third-party library internals |
| Non-obvious logic: derivation, formatting, ordering | Trivial passthrough props |

The application tests features; the design system tests its own components. Re-asserting `Button` variants inside a checkout test buys nothing and breaks the day the design system ships a change.

## Behavior, Not Implementation

Assert what the user perceives: text on screen, a control's state, a request that went out, a route that changed. Never assert internal state, hook call counts, prop values, or component names. If a pure refactor turns a test red, that test was measuring implementation.

```tsx
await user.click(screen.getByRole("button", { name: "Archive" }));
expect(await screen.findByText("Invoice archived")).toBeInTheDocument();
```

## Query Priority

Find elements the way a user does. Descend a level only when the one above genuinely cannot express the target.

1. `getByRole` with `{ name }` — covers most elements, and fails loudly when an accessible name is missing, which is itself a bug worth catching.
2. `getByLabelText` — form fields.
3. `getByPlaceholderText`, `getByText`, `getByDisplayValue`, then `getByAltText`, `getByTitle`.
4. `getByTestId` — last resort, for nodes with no accessible identity.

`getBy` throws when absent, `queryBy` returns `null` (use it to assert absence), `findBy` returns a promise (use it to await appearance).

## userEvent, Not fireEvent

`fireEvent` dispatches a single synthetic event. `userEvent` reproduces the whole sequence a real interaction produces — pointer, focus, key events — so it catches bugs `fireEvent` walks straight past, including interactions a real user could never perform on a disabled or hidden control.

```tsx
const user = userEvent.setup();
render(<InvoiceFilters />);

await user.click(screen.getByRole("combobox", { name: "Status" }));
await user.click(screen.getByRole("option", { name: "Open" }));
```

Call `userEvent.setup()` once per test, before rendering, and `await` every interaction.

## Async Without Arbitrary Waits

Wait for a condition, never for a duration. A fixed sleep is slow when the test passes and flaky when it does not — it encodes a machine's speed, not the app's behavior.

```tsx
expect(await screen.findByRole("heading", { name: "Invoice 42" })).toBeInTheDocument();
await waitFor(() => expect(screen.queryByRole("progressbar")).not.toBeInTheDocument());
```

Prefer `findBy*` for "it appeared". Reserve `waitFor` for assertions that are not a single query, and keep its callback side-effect free — it runs repeatedly until it passes.

## Mock at the Network Boundary

Intercept HTTP with MSW. Mocking your own modules (`vi.mock("./api")`) couples tests to the file layout and lets a broken request shape ship green.

```ts
import { http, HttpResponse } from "msw";
import { setupServer } from "msw/node";

export const server = setupServer(
  http.get("/api/invoices", () => HttpResponse.json([{ id: "42", total: 120 }])),
);
```

Vitest needs a DOM environment (`environment: "jsdom"`) and a setup file that registers the matchers and the server:

```ts
import "@testing-library/jest-dom/vitest";

beforeAll(() => server.listen({ onUnhandledRequest: "error" }));
afterEach(() => server.resetHandlers());
afterAll(() => server.close());
```

`onUnhandledRequest: "error"` makes an unmocked call fail loudly instead of hanging. Override per test for the unhappy paths with `server.use(http.get("/api/invoices", () => new HttpResponse(null, { status: 500 })))`.

## Render With Providers

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

## Cover Every State

A test that only walks the happy path leaves untested exactly the states users complain about. For each screen assert **loading**, **error**, **empty**, and **success** — with MSW, the first three are one handler override each.

## Determinism

- Fresh query cache and fresh MSW handlers per test. No state crosses a test boundary.
- Freeze time for anything date-dependent with `vi.useFakeTimers()` and `vi.setSystemTime(...)`, restored in `afterEach`. With fake timers running, hand them to userEvent: `userEvent.setup({ advanceTimers: vi.advanceTimersByTime })`.
- Assert on names and sets, not array positions, unless ordering is the thing under test.
- A flaky test is a bug in the test. Fix it or delete it; never retry it into green.

## Pitfalls

- **Testing the design system** — asserting a primitive's variants from an app test. Not your repo, not your test.
- **`getByTestId` first** — a `data-testid` on a button that already has an accessible name hides real accessibility bugs.
- **`fireEvent` for user actions** — skips focus and key events, so it passes on interactions a user cannot actually perform.
- **Arbitrary waits** — `setTimeout` in a test is slow when green and flaky when red.
- **Mocking modules instead of the network** — the test passes while the real request shape is wrong.
- **Shared `QueryClient`** — one test's cache satisfies the next test's query and the fetch under test never runs.
- **Snapshotting whole screens** — fails on every cosmetic change, nobody reads the diff, and it asserts nothing specific.
- **Happy path only** — no coverage for loading, error, or empty.
