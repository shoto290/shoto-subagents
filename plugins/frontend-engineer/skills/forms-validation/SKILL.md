---
name: forms-validation
description: Type-safe accessible forms with react-hook-form and zod.
---

# Forms and Validation

A form is a contract with two halves: a schema that defines what valid data is, and DOM inputs that collect it. Write the schema first, let react-hook-form drive the DOM, and types, messages, and error rendering all fall out of those two decisions.

## Non-Negotiable Rules

- One zod schema per form; derive the type with `z.infer`, never hand-write a parallel interface.
- Cross-field rules go in `.refine`/`.superRefine` with an explicit `path`.
- Always pass `defaultValues` to `useForm`; use `mode: "onTouched"` for validation timing.
- Prefer `register` (uncontrolled); reach for `Controller` only when a field can't be driven by ref + native events.
- Every input needs a real `<label htmlFor>` and `aria-describedby` pointing at its error node.
- Disable submit during `isSubmitting`; never gate it on `!isValid`; put `noValidate` on the form.
- Re-enforce every schema rule on the server — client validation is UX, not security.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/schema-first.md](./reference/schema-first.md) | Writing or refining the zod schema, cross-field `.refine`/`.superRefine` rules, or deriving the type |
| [reference/rhf-wiring.md](./reference/rhf-wiring.md) | Wiring `useForm`/`zodResolver`, choosing `register` vs `Controller`, validation timing, or submit state |
| [reference/accessible-errors.md](./reference/accessible-errors.md) | Rendering error messages, labels, `aria-*` attributes, or focus-on-error |
| [reference/server-errors.md](./reference/server-errors.md) | Mapping server-side field errors onto the form, or reasoning about client-vs-server validation |
| [reference/multi-step-forms.md](./reference/multi-step-forms.md) | Building a multi-step form or fields that depend on each other's values |

## Pitfalls

- **Duplicating the schema** — a hand-written type beside the zod schema drifts silently. Derive it with `z.infer`.
- **Validating on every keystroke** — `mode: "onChange"` shouts at users mid-typing. Use `onTouched`.
- **Controlled by reflex** — wrapping a plain `<input>` in `Controller` re-renders the form on every keystroke for nothing.
- **Patching the design system** — editing a shared input to bolt on an error slot. Escalate the gap instead.
- **Color-only errors** — a red border with no text and no `aria-invalid` is invisible to screen readers and to color-blind users.
- **Silent failed submits** — validation fails below the fold and nothing moves. Focus the first invalid field.
- **Double submit** — no pending state, so an impatient second click charges the card twice.
- **Trusting the client** — treating the schema as an integrity or authorization guarantee.
