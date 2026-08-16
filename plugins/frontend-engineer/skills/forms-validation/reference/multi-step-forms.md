# Multi-Step Forms

- Keep one `useForm` across all steps so values survive navigation; render only the current step's fields.
- Compose one schema per step into the whole, and gate advancing on `form.trigger([...stepFields])`.
- Read dependent values with `useWatch({ control, name })` inside the subtree that cares — `watch()` in the parent re-renders the whole form on every change — and `resetField` a branch once it becomes irrelevant, so hidden values are never submitted.
