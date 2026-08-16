# Typed Accessor + Consumer

A typed accessor keeps token names honest in TS:

```ts
const tokens = {
  colorBg: "--color-bg",
  colorFg: "--color-fg",
  colorAccent: "--color-accent",
  space4: "--space-4",
  radiusMd: "--radius-md",
} as const;

type Token = keyof typeof tokens;

export const cssVar = (token: Token) => `var(${tokens[token]})`;
```

```tsx
export function Button({ children }: { children: React.ReactNode }) {
  return (
    <button
      style={{
        background: cssVar("colorAccent"),
        color: cssVar("colorBg"),
        padding: `${cssVar("space4")}`,
        borderRadius: cssVar("radiusMd"),
      }}
    >
      {children}
    </button>
  );
}
```

The component references only semantic tokens. Theme switches and primitive edits flow through untouched.
