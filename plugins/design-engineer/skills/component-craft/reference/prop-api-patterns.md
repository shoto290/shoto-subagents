# Prop API Patterns

## Prop API design

- Minimal required props; sensible defaults for the rest.
- Model mutually exclusive variants as a discriminated union, not loose optional props — the compiler then rejects invalid combinations.
- Forward refs on any component that wraps a real DOM node; spread remaining props onto the root element so consumers reach native attributes.
- Reach for `asChild` / polymorphism only when consumers genuinely need to swap the rendered element. It is not free — skip it by default.

```tsx
type ButtonProps = ComponentPropsWithoutRef<"button"> & {
  variant?: "solid" | "outline" | "ghost";
  size?: "sm" | "md";
  loading?: boolean;
};
```

## Composition over configuration

When a component starts growing booleans like `showHeader`, `showFooter`, `withIcon`, that is the signal to expose compound subcomponents instead:

```tsx
<Card>
  <Card.Header>Title</Card.Header>
  <Card.Body>…</Card.Body>
</Card>
```

Compound components let consumers compose what they need without you predicting every layout. Use a boolean prop only for a genuine binary toggle.

## Typed variants

Keep variant logic in one typed map keyed by the prop union. cva works; a small typed record is enough and dependency-free:

```tsx
const styles: Record<NonNullable<ButtonProps["variant"]>, string> = {
  solid: "bg-blue-600 text-white hover:bg-blue-700",
  outline: "border border-blue-600 text-blue-600 hover:bg-blue-50",
  ghost: "text-blue-600 hover:bg-blue-50",
};
```

The `Record` over the union forces every variant to be handled — adding a variant to the union and forgetting its style becomes a compile error.

## TypeScript

- Type props precisely; extend native props with `ComponentPropsWithoutRef<"button">` so consumers get the full native surface.
- Use `ComponentPropsWithoutRef` together with `forwardRef` for ref-forwarding components.
- Add generics only when they carry real type information (e.g. a `Select<T>` whose `value`/`onChange` track the option type). Do not add generics gratuitously.
- Do not reach for `useEffect` to derive state from props — compute during render. Use it only for genuine external synchronization (subscriptions, focus management, non-React DOM).
