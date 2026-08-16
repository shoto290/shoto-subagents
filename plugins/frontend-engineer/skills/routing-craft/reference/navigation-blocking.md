# Navigation Blocking

```tsx
const { status, proceed, reset } = useBlocker({
  shouldBlockFn: () => form.formState.isDirty,
  withResolver: true,
});
```

Render your own dialog while `status === "blocked"`: `proceed()` discards, `reset()` stays. Add `enableBeforeUnload` to cover reload and tab close, which no in-app dialog can intercept. Block only on genuinely unsaved input — a blocker that fires on a pristine form trains users to click through it.
