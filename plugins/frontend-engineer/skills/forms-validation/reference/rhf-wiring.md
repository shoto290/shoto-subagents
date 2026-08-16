# RHF Wiring

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

## Submit States

```tsx
<form onSubmit={form.handleSubmit(onSubmit)} noValidate>
  <Button type="submit" disabled={form.formState.isSubmitting}>Create account</Button>
</form>
```

`handleSubmit` already ignores concurrent submits while its promise is pending, but disable the button too so the state is visible. Put `noValidate` on the form — you own the messages; browser bubbles are neither styleable nor translatable. Never gate submit on `!isValid`: a disabled button gives the user no reason. After success, `form.reset(values)` rather than unmounting.
