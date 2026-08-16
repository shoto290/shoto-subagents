# Async Without Arbitrary Waits

Wait for a condition, never for a duration. A fixed sleep is slow when the test passes and flaky when it does not — it encodes a machine's speed, not the app's behavior.

```tsx
expect(await screen.findByRole("heading", { name: "Invoice 42" })).toBeInTheDocument();
await waitFor(() => expect(screen.queryByRole("progressbar")).not.toBeInTheDocument());
```

Prefer `findBy*` for "it appeared". Reserve `waitFor` for assertions that are not a single query, and keep its callback side-effect free — it runs repeatedly until it passes.

```tsx
await user.click(screen.getByRole("button", { name: "Archive" }));
expect(await screen.findByText("Invoice archived")).toBeInTheDocument();
```

## Pitfall

**Arbitrary waits** — `setTimeout` in a test is slow when green and flaky when red.
