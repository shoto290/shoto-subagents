# Server Errors

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

## Client Validation Is Not Security

Client validation is UX. Every rule the schema enforces must be re-enforced on the server: the browser is fully under the user's control and the request can be replayed without the form. Share the schema across the wire if the stack allows, but never treat "the form would not let me" as an invariant — see `engineering:secure-by-default`.
