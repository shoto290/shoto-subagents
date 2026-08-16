# Accessible Errors

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
