# Query Priority

Find elements the way a user does. Descend a level only when the one above genuinely cannot express the target.

1. `getByRole` with `{ name }` — covers most elements, and fails loudly when an accessible name is missing, which is itself a bug worth catching.
2. `getByLabelText` — form fields.
3. `getByPlaceholderText`, `getByText`, `getByDisplayValue`, then `getByAltText`, `getByTitle`.
4. `getByTestId` — last resort, for nodes with no accessible identity.

`getBy` throws when absent, `queryBy` returns `null` (use it to assert absence), `findBy` returns a promise (use it to await appearance).

## Pitfall

**`getByTestId` first** — a `data-testid` on a button that already has an accessible name hides real accessibility bugs.
