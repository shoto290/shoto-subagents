# Zustand Stores

## 5. Global Store — Last Resort

A store earns its place only for client state that unrelated screens genuinely share and that has no business in the URL: a command palette, a wizard spanning routes, an undo stack, a toast queue.

```tsx
import { create } from "zustand";

type CommandPaletteStore = {
  open: boolean;
  query: string;
  setOpen: (open: boolean) => void;
  setQuery: (query: string) => void;
};

export const useCommandPalette = create<CommandPaletteStore>()((set) => ({
  open: false,
  query: "",
  setOpen: (open) => set({ open }),
  setQuery: (query) => set({ query }),
}));
```

## Split Stores, Select Narrow Slices

One store per domain, never one store for the app. Separate stores let unrelated features change without waking each other's subscribers, and each can be deleted on its own.

Subscribe to the smallest value you actually use. A selector returning the whole store re-renders on every unrelated write:

```tsx
const open = useCommandPalette((state) => state.open);
```

When a component needs several values, wrap the selector so a fresh object literal is not mistaken for a change on every render:

```tsx
import { useShallow } from "zustand/react/shallow";

const { open, query } = useCommandPalette(
  useShallow((state) => ({ open: state.open, query: state.query })),
);
```

Keep actions on the store. They are stable references, so a component that only dispatches never re-renders when state changes.
