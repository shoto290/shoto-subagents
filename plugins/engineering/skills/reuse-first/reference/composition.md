# Composition and Design-System Reuse

## Composition over inheritance

Compose small units — children, wrappers, hooks — instead of reaching for deep class hierarchies. Composition keeps each piece independently testable and reusable; inheritance couples them.

```ts
function ConfirmButton(props: ButtonProps) {
  return <Button variant="danger" {...props} />;
}
```

The wrapper reuses `Button` and adds intent, rather than subclassing a base button to override behavior.

## Design-system reuse

Reach for existing tokens and components before anything bespoke. Use the design system's spacing, color, and typography primitives instead of hardcoded values, and its components instead of one-off markup.
