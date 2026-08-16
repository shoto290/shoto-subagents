# Async Feedback

- **Optimistic updates are instant.** The new value appears with no transition; the animation is reserved for the rollback, where a brief shake or color settle explains the reversal. Mutation and rollback mechanics live in `frontend-engineer:data-fetching`.
- **Delay the pending indicator ~200ms.** Most requests resolve first, and a spinner that flashes for 80ms is noise.
- **Hold it ~400ms once shown**, so a slightly-slower response does not produce a flicker.
- **Skeleton to content is a crossfade, never a collapse.** The skeleton must occupy the same box as the real content — if the layout jumps at the swap, the skeleton was the wrong size, and no easing fixes that.
- Background refetches never re-run the loading animation. Dim or mark stale in place.

```ts
export function useDelayedPending(isPending: boolean, delay = 200): boolean {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (!isPending) {
      setVisible(false);
      return;
    }
    const id = setTimeout(() => setVisible(true), delay);
    return () => clearTimeout(id);
  }, [isPending, delay]);

  return visible;
}
```
