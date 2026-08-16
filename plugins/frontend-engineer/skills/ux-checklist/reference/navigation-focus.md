# Navigation And Focus

## Focus On Navigation

- After a client-side route change, focus moves to the page heading or `<main>` — never left on the clicked link and never dumped at the top of the document silently.
- The new route's name is announced. A `role="status"` region holding the page title is enough.
- Focus is restored to the trigger when a dialog, drawer, or menu closes, including when it closes because of navigation.
- Back returns to the previous screen with its scroll position and its list state intact.
- Deep-linkable overlays are routes; overlays that are pure UI state close on Back.

```tsx
export function PageTitle({ title }: { title: string }) {
  const ref = useRef<HTMLHeadingElement>(null);

  useEffect(() => {
    document.title = `${title} — Acme`;
    ref.current?.focus();
  }, [title]);

  return <h1 ref={ref} tabIndex={-1}>{title}</h1>;
}
```

## Keyboard Path Through The Screen

- Tab from the top completes the screen's primary task without a mouse.
- Tab order follows visual order in every region, including sticky headers and side panels. No positive `tabindex`.
- Esc closes the topmost layer only, in the reverse order things were opened.
- App shortcuts do not fire while a text input, textarea, or contenteditable has focus.
- Focused elements are never hidden behind a sticky header — set `scroll-padding-block-start` on the scroll container to the header height.
- A focused element inside a scroll region scrolls into view when reached by keyboard.
