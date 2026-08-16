# Invalidation

Invalidation is the hard part — design it before you cache a single key. Three mechanisms:

- **TTL** — entries expire after a fixed time. Simple, self-healing, tolerates bounded staleness. The right default for most data.
- **Event-driven** — a write explicitly deletes or rewrites the affected keys. Accurate, but complex: every write path must know every key it touches, or you leak stale data.
- **Key versioning** — embed a version in the key (`user:42:v7`); bump the version to make all old keys unreachable. Good for bulk invalidation without scanning.

Tune the TTL to the data's tolerance for staleness. Too long and readers see stale values long after a change; too short and the hit rate collapses — the cache fills, expires, and refetches before it ever earns its keep, so it becomes pure overhead. When in doubt, start with a TTL and layer event-driven invalidation only on the keys that demand accuracy.
