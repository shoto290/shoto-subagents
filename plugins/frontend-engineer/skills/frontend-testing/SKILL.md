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

## Cover Every State
A test that only walks the happy path leaves untested exactly the states users complain about. For each screen assert **loading**, **error**, **empty**, and **success** — with MSW, the first three are one handler override each.

## Pitfalls
- **Testing the design system** — asserting a primitive's variants from an app test. Not your repo, not your test.
- **Snapshotting whole screens** — fails on every cosmetic change, nobody reads the diff, and it asserts nothing specific.
- **Happy path only** — no coverage for loading, error, or empty.
- **Assert on names and sets, not array positions** — unless ordering is the thing under test.
- **A flaky test is a bug in the test** — fix it or delete it; never retry it into green.

## Reference
| File | Read when |
| :-- | :-- |
| [reference/query-priority.md](./reference/query-priority.md) | Choosing which query function to reach for |
| [reference/user-event.md](./reference/user-event.md) | Simulating a user interaction |
| [reference/async-assertions.md](./reference/async-assertions.md) | Waiting on something that appears, disappears, or changes asynchronously |
| [reference/msw-setup.md](./reference/msw-setup.md) | Setting up or overriding network mocks |
| [reference/render-with-providers.md](./reference/render-with-providers.md) | Rendering a screen that needs a query client or router |
