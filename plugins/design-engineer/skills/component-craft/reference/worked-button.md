# Worked Example: Button

```tsx
import { ComponentPropsWithoutRef, forwardRef } from "react";

type ButtonProps = ComponentPropsWithoutRef<"button"> & {
  variant?: "solid" | "outline" | "ghost";
  size?: "sm" | "md";
  loading?: boolean;
};

const variantStyles: Record<NonNullable<ButtonProps["variant"]>, string> = {
  solid: "bg-blue-600 text-white hover:bg-blue-700 active:bg-blue-800",
  outline: "border border-blue-600 text-blue-600 hover:bg-blue-50",
  ghost: "text-blue-600 hover:bg-blue-50",
};

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ variant = "solid", size = "md", loading = false, disabled, className, children, ...rest }, ref) => (
    <button
      ref={ref}
      disabled={disabled || loading}
      aria-busy={loading}
      className={[
        "inline-flex items-center justify-center rounded font-medium transition-colors",
        "focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500",
        "disabled:cursor-not-allowed disabled:opacity-50",
        size === "sm" ? "h-8 px-3 text-sm" : "h-10 px-4",
        variantStyles[variant],
        className,
      ]
        .filter(Boolean)
        .join(" ")}
      {...rest}
    >
      {children}
    </button>
  ),
);

Button.displayName = "Button";
```

This shows the whole pattern: native props extended, discriminated variant union, exhaustive variant map, ref forwarding, rest-prop spreading, `focus-visible` ring, and merged `disabled` + `loading` state with `aria-busy`.
