# Pitfalls

- **Caching without an invalidation plan** — the staleness bug you ship with no way to correct it. Plan invalidation first.
- **Write-behind for money** — async flush loses the last writes on a crash; never use it for financial or transactional data.
- **No stampede protection on hot keys** — a hot-key expiry stampedes and can take the DB down. Add a lock or early refresh.
- **Wrong eviction policy** — recency-only on a stable-hot-set workload evicts your hot data under load. Match policy to access pattern.
- **Caching private data at the edge** — a shared cache leaks one user's data to another. Mark authenticated responses `Cache-Control: private`.
- **Caching errors** — turns a transient failure into a TTL-long outage.
- **Flying blind** — no hit/miss metrics means you cannot tell a working cache from dead weight. Always measure.
