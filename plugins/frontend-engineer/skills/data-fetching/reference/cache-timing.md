# Cache Timing

Two different clocks, and confusing them is the most common cache bug.

- **`staleTime`** — how long data counts as fresh. While fresh, mounting the query paints from cache and fires no request. Defaults to `0`, meaning a refetch on every mount, focus, and reconnect. This is the knob you tune, set from how fast the data actually changes: seconds for a live queue, minutes for a profile, `Infinity` for a reference list you invalidate by hand.
- **`gcTime`** — how long an *unused* query survives in memory after its last observer unmounts. Defaults to 5 minutes. It says nothing about freshness, only whether returning to a screen paints instantly or shows a cold skeleton. Set shorter than `staleTime`, it discards data you just declared fresh.
