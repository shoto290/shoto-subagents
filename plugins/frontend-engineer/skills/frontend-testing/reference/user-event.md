# userEvent, Not fireEvent

`fireEvent` dispatches a single synthetic event. `userEvent` reproduces the whole sequence a real interaction produces — pointer, focus, key events — so it catches bugs `fireEvent` walks straight past, including interactions a real user could never perform on a disabled or hidden control.

```tsx
const user = userEvent.setup();
render(<InvoiceFilters />);

await user.click(screen.getByRole("combobox", { name: "Status" }));
await user.click(screen.getByRole("option", { name: "Open" }));
```

Call `userEvent.setup()` once per test, before rendering, and `await` every interaction.

## Pitfall

**`fireEvent` for user actions** — skips focus and key events, so it passes on interactions a user cannot actually perform.

## Determinism

- Freeze time for anything date-dependent with `vi.useFakeTimers()` and `vi.setSystemTime(...)`, restored in `afterEach`. With fake timers running, hand them to userEvent: `userEvent.setup({ advanceTimers: vi.advanceTimersByTime })`.
