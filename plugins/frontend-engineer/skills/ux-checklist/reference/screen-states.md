# Screen States

## Every Screen State

Each async region on the screen has all of these designed, reachable, and tested:

- **Loading** — occupies the final layout's space. Skeletons match the real box; a centered spinner replacing a whole screen is a last resort.
- **Empty** — explains why it is empty and offers the action that fills it. "No results" for a filtered list is a different state from "nothing here yet".
- **Error** — states what failed, in plain language, with a retry that retries only the failed region.
- **Partial** — one region failing never blanks the screen. Render what resolved.
- **Stale / refetching** — indicated in place, without collapsing back to a skeleton.
- **Success** — the terminal state is visibly distinct from the pending one.

## Async Results Are Announced

- Results of a user-initiated action reach a live region: `role="status"` for success, `role="alert"` for failure.
- The live region exists in the DOM before the message arrives, or nothing is announced.
- Never move focus for a non-blocking result. A toast interrupts nothing; a focus jump interrupts everything.
- Long operations report progress, not just presence.

## Forms And Flows

- On failed submit, focus moves to the first invalid field, or to an error summary that links to each field.
- Field values survive a failed submit. Never clear a form on error.
- Server errors land on the field that caused them, not only in a banner.
- The submit button is disabled only while the request is in flight, and it says so (`Saving…`), never as a substitute for validation feedback.
- Multi-step flows show position and let the user go back without losing entered data.
- Full form flow, schema, and error mapping live in `frontend-engineer:forms-validation`.

## Unsaved Changes

- Leaving a dirty form warns via the router's block/leave guard for in-app navigation and `beforeunload` for tab close.
- The dialog names what will be lost and offers Save, Discard, Cancel — not just OK/Cancel.
- No warning when the form is untouched. False alarms train users to click through the real one.

## Responsive And Touch In Real Layouts

- Tap targets stay ≥44×44px in the dense places: table row actions, toolbar icon buttons, chip removals.
- No action available only on row hover — expose it persistently or in a menu reachable by keyboard and touch.
- Sticky elements do not consume more than a third of a small viewport's height.
- Bottom-anchored bars respect `env(safe-area-inset-bottom)`; layout mechanics in `frontend-engineer:screen-layout`.
- Zoom is never disabled, and the screen survives 200% browser zoom and 200% text-only zoom.
