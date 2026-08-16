# Schema First

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
