---
name: forms-validation
description: Type-safe accessible forms with react-hook-form and zod.
---

# Forms and Validation

A form is a contract with two halves: a schema that defines what valid data is, and DOM inputs that collect it. Write the schema first, let react-hook-form drive the DOM, and types, messages, and error rendering all fall out of those two decisions.

## The Schema Is the Single Source of Truth

One zod schema per form. It defines the shape, the runtime validation, the TypeScript type, and the user-facing messages. Never restate a rule as a manual `if` in the submit handler, and never hand-write an interface next to the schema — the two will drift.

```tsx
const signupSchema = z
  .object({
    email: z.string().min(1, "Enter your email"),
    password: z.string().min(12, "Use at least 12 characters"),
    confirm: z.string(),
  })
  .refine((values) => values.password === values.confirm, {
    path: ["confirm"],
    message: "Passwords do not match",
  });

type SignupValues = z.infer<typeof signupSchema>;
```

Cross-field rules go in `.refine` / `.superRefine` with an explicit `path`, so the error lands on the field the user must fix instead of on the form root. Zod v4 prefers `error` over `message` as the custom-message key while keeping the positional string shorthand; check which major the repo is on before copying a message style.

## Wire It With zodResolver

```tsx
const form = useForm<SignupValues>({
  resolver: zodResolver(signupSchema),
  mode: "onTouched",
  defaultValues: { email: "", password: "", confirm: "" },
});
```

Always pass `defaultValues`: it keeps `isDirty` meaningful and avoids React's uncontrolled-to-controlled warning. When the schema defaults or transforms values, input and output types diverge — declare all three generics, `useForm<z.input<typeof schema>, unknown, z.output<typeof schema>>`, so the submit handler receives the parsed type.

## Uncontrolled First, Controlled Only When Forced

`register` leaves the input uncontrolled: react-hook-form subscribes to the DOM node, so the form does not re-render on every keystroke. Reach for `Controller` only when a field cannot be driven by a ref and native events — a custom select, a date picker, a rich text editor, a masked input.

You consume the design system; you never edit it to fit a form. If the primitive forwards its ref and spreads native props, `register` works untouched — `<TextField id="email" label="Email" {...register("email")} />`. If it exposes `value` / `onChange` instead, wrap it; do not patch it:

```tsx
<Controller
  control={form.control}
  name="country"
  render={({ field, fieldState }) => (
    <Select {...field} invalid={Boolean(fieldState.error)} />
  )}
/>
```

`field` carries `value`, `onChange`, `onBlur`, `name`, and `ref`; forward the ref or focus-on-error will silently skip that field. If the primitive cannot express an invalid state or render an error message, that is a design-system gap: escalate it to `design-engineer` rather than forking the component into the app.

## Validation Timing

Validating on every keystroke flags an email as invalid at the first character; validating only on submit hides problems until the end. Use `mode: "onTouched"` — a field validates on its first blur, then on every change afterwards. `reValidateMode` (default `"onChange"`) governs re-validation once the form has been submitted.

## Accessible Errors

```tsx
<label htmlFor="password">Password</label>
<input
  id="password"
  type="password"
  aria-invalid={Boolean(errors.password)}
  aria-describedby={errors.password ? "password-error" : undefined}
  {...register("password")}
/>
{errors.password ? (
  <p id="password-error" role="alert">{errors.password.message}</p>
) : null}
```

- Every input gets a real `<label htmlFor>` — a placeholder is not a label — and `aria-describedby` points at the error node, plus the hint node when one exists.
- On a failed submit, focus the first invalid field. `shouldFocusError` (default `true`) handles anything reachable by ref; attach `field.ref` on `Controller` fields or call `setFocus` yourself.
- Long forms also need an error summary above the form, listing each failing field as a link to its input, with focus moved to the summary on submit.

## Submit States

```tsx
<form onSubmit={form.handleSubmit(onSubmit)} noValidate>
  <Button type="submit" disabled={form.formState.isSubmitting}>Create account</Button>
</form>
```

`handleSubmit` already ignores concurrent submits while its promise is pending, but disable the button too so the state is visible. Put `noValidate` on the form — you own the messages; browser bubbles are neither styleable nor translatable. Never gate submit on `!isValid`: a disabled button gives the user no reason. After success, `form.reset(values)` rather than unmounting.

## Server-Side Field Errors

The server is the authority. Map its field errors back onto the fields that produced them:

```tsx
const onSubmit = async (values: SignupValues) => {
  const result = await createAccount(values);
  if (result.status !== "invalid") return navigate({ to: "/welcome" });
  for (const [field, message] of Object.entries(result.fieldErrors)) {
    form.setError(field as keyof SignupValues, { type: "server", message });
  }
};
```

Errors that belong to no single field go on `form.setError("root", { message })` and render next to the submit button. A server error set this way clears the next time that field validates, which is the behavior you want.

## Multi-Step and Dependent Fields

- Keep one `useForm` across all steps so values survive navigation; render only the current step's fields.
- Compose one schema per step into the whole, and gate advancing on `form.trigger([...stepFields])`.
- Read dependent values with `useWatch({ control, name })` inside the subtree that cares — `watch()` in the parent re-renders the whole form on every change — and `resetField` a branch once it becomes irrelevant, so hidden values are never submitted.

## Client Validation Is Not Security

Client validation is UX. Every rule the schema enforces must be re-enforced on the server: the browser is fully under the user's control and the request can be replayed without the form. Share the schema across the wire if the stack allows, but never treat "the form would not let me" as an invariant — see `engineering:secure-by-default`.

## Pitfalls

- **Duplicating the schema** — a hand-written type beside the zod schema drifts silently. Derive it with `z.infer`.
- **Validating on every keystroke** — `mode: "onChange"` shouts at users mid-typing. Use `onTouched`.
- **Controlled by reflex** — wrapping a plain `<input>` in `Controller` re-renders the form on every keystroke for nothing.
- **Patching the design system** — editing a shared input to bolt on an error slot. Escalate the gap instead.
- **Color-only errors** — a red border with no text and no `aria-invalid` is invisible to screen readers and to color-blind users.
- **Silent failed submits** — validation fails below the fold and nothing moves. Focus the first invalid field.
- **Double submit** — no pending state, so an impatient second click charges the card twice.
- **Trusting the client** — treating the schema as an integrity or authorization guarantee.
