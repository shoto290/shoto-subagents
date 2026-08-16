# Mock at the Network Boundary

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

## Pitfall

**Mocking modules instead of the network** — the test passes while the real request shape is wrong.

## Determinism

- Fresh query cache and fresh MSW handlers per test. No state crosses a test boundary.
