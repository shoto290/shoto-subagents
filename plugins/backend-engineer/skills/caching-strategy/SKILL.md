---
name: caching-strategy
description: 'Deliberate caching: strategy, invalidation, stampede defense.'
---

# Caching Strategy

A cache trades freshness for speed. Add one only when you can answer two questions up front: how does this data get read and written, and how does a stale entry get corrected. Get those wrong and a cache turns a slow system into a fast wrong system.

## Rules

- **Access pattern**: Default to cache-aside.
- **Invalidation**: Design it before you cache a single key.
- **Thundering herd**: Apply protection to hot keys specifically.
- **Eviction**: Match the policy to access reality.
- **Cache layers**: Use the layer closest to the consumer that can still serve correct data.
- **Operating**: Never cache error responses.
- **Pitfalls**: Plan invalidation first.

## Choose By Access Pattern

| Pattern | How It Works | Fits | Cost |
| :-- | :-- | :-- | :-- |
| **Cache-aside** (lazy) | App reads cache; on miss, reads DB and populates. App writes go to DB and invalidate the key. | Read-heavy, miss-tolerant data. The default. | First read after a miss is slow. |
| **Read-through** | Cache itself loads from the DB on a miss, behind one interface. | Same as cache-aside when a library/proxy owns loading. | Couples you to the cache provider's loader. |
| **Write-through** | Writes hit the cache and the DB together, synchronously. | Consistency-critical data — cache never lags the DB. | Higher write latency; every write pays cache + DB. |
| **Write-behind** | Writes hit the cache, flush to the DB asynchronously. | Write-heavy, loss-tolerant data (counters, metrics). | A crash before flush loses data. **Never for financial / transactional data.** |

## Reference

| File | Read when |
| :-- | :-- |
| [reference/access-patterns.md](./reference/access-patterns.md) | Choosing which cache-aside/read-through/write-through/write-behind pattern fits a data set's read/write shape. |
| [reference/invalidation.md](./reference/invalidation.md) | Deciding how a stale entry gets corrected, or picking between TTL, event-driven, and key-versioning invalidation. |
| [reference/thundering-herd.md](./reference/thundering-herd.md) | A hot key expires and concurrent readers stampede the database, or implementing cache-aside with stampede protection. |
| [reference/eviction.md](./reference/eviction.md) | The cache hits its memory limit and you must choose an eviction policy for the workload's access shape. |
| [reference/cache-layers.md](./reference/cache-layers.md) | Deciding which layer of the stack (browser, edge/CDN, application, DB query cache) should hold a given cache entry. |
| [reference/operating-caches.md](./reference/operating-caches.md) | Setting memory limits, warming caches at startup, or monitoring hit/miss ratio in production. |
| [reference/pitfalls.md](./reference/pitfalls.md) | Reviewing a caching design for the common failure modes before shipping it. |
