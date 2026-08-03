---
name: ux-checklist
description: Screen and flow-level UX and accessibility checklist.
---

# UX Checklist

Pass/fail checks for a whole screen and the flow it belongs to. Component-level accessibility — labels, roles, focus rings, keyboard behavior inside a widget — ships with the design system's primitives; assume it and verify the composition instead.

## Page Identity

- Every route sets a unique, specific `document.title`, most-specific part first: `Invoice 1042 — Billing — Acme`.
- Exactly one `<h1>` per screen, and it names the same thing the title does.
- Heading levels descend without gaps. A card's `<h3>` under a section `<h2>` under the page `<h1>`.
- Headings describe content, never styling. Never pick a level for its font size.
- Breadcrumbs, when present, match the route hierarchy and the last item is not a link.

## Landmarks

- One `<main>` per screen, containing everything that changes between routes.
- `<nav>`, `<aside>`, `<header>`, `<footer>` used once each, or labelled with `aria-label` when repeated (primary nav vs. pagination nav).
- Skip link is the first focusable element and moves focus into `<main>`.
- No interactive content outside a landmark.

## Focus On Navigation

- After a client-side route change, focus moves to the page heading or `<main>` — never left on the clicked link and never dumped at the top of the document silently.
- The new route's name is announced. A `role="status"` region holding the page title is enough.
- Focus is restored to the trigger when a dialog, drawer, or menu closes, including when it closes because of navigation.
- Back returns to the previous screen with its scroll position and its list state intact.
- Deep-linkable overlays are routes; overlays that are pure UI state close on Back.

```tsx
export function PageTitle({ title }: { title: string }) {
  const ref = useRef<HTMLHeadingElement>(null);

  useEffect(() => {
    document.title = `${title} — Acme`;
    ref.current?.focus();
  }, [title]);

  return <h1 ref={ref} tabIndex={-1}>{title}</h1>;
}
```

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

## Destructive Actions

- Every irreversible action confirms, and the confirmation names the exact target: "Delete invoice 1042?", not "Are you sure?".
- The confirm button carries the verb ("Delete"), never "OK".
- High-blast-radius actions require typing the resource name.
- Prefer undo over confirm when the action is reversible — a 5-second undo beats a dialog on every delete.
- Destructive controls are not adjacent to the primary action, and never the default focus.

## Keyboard Path Through The Screen

- Tab from the top completes the screen's primary task without a mouse.
- Tab order follows visual order in every region, including sticky headers and side panels. No positive `tabindex`.
- Esc closes the topmost layer only, in the reverse order things were opened.
- App shortcuts do not fire while a text input, textarea, or contenteditable has focus.
- Focused elements are never hidden behind a sticky header — set `scroll-padding-block-start` on the scroll container to the header height.
- A focused element inside a scroll region scrolls into view when reached by keyboard.

## Responsive And Touch In Real Layouts

- Tap targets stay ≥44×44px in the dense places: table row actions, toolbar icon buttons, chip removals.
- No action available only on row hover — expose it persistently or in a menu reachable by keyboard and touch.
- Sticky elements do not consume more than a third of a small viewport's height.
- Bottom-anchored bars respect `env(safe-area-inset-bottom)`; layout mechanics in `frontend-engineer:screen-layout`.
- Zoom is never disabled, and the screen survives 200% browser zoom and 200% text-only zoom.

## Review Pass

Run per screen, before shipping:

1. Load the route cold — is the title right, is there one `<h1>`, does the skeleton match the final layout?
2. Navigate in and out — where does focus land, is the route announced, does Back restore scroll and state?
3. Tab from the top to the primary action, then Esc out of every layer.
4. Force each state: loading, empty, error, partial, stale, success. No layout shift between them.
5. Submit the form invalid, then with a server error — is focus placed and are values preserved?
6. Trigger the destructive action — is the target named, is undo possible?
7. Leave with unsaved changes.
8. At 375px wide and 200% zoom, complete the primary task by touch.

## Pitfalls

- **Focus stuck on the old screen** — a SPA navigation that changes everything visually and nothing for a screen reader.
- **Silent route changes** — no title update, no announcement. Keyboard users cannot tell the page moved.
- **The three-state screen** — loading, success, and nothing for empty, error, partial, or stale.
- **Global spinner for one region** — the whole screen blanks because a sidebar widget is refetching.
- **Skeleton-sized-wrong** — content lands and the screen jumps, undoing the reason for the skeleton.
- **Toast-only errors** — the failure disappears in 4 seconds and the user never learns which field caused it.
- **Confirmations that name nothing** — "Are you sure?" trains reflexive confirmation and deletes the wrong record.
- **Hover-only row actions** — invisible to touch and keyboard, the most common a11y regression in table screens.
