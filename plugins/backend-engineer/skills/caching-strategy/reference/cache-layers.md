# Cache Layers

Caches stack, each with different latency and consistency. Use the layer closest to the consumer that can still serve correct data.

| Layer | Holds | Notes |
| :-- | :-- | :-- |
| **Browser** | Per-user responses, assets | `Cache-Control` + `ETag` for revalidation. |
| **Edge / CDN** | Static and semi-dynamic responses | Shared across users — lowest latency, weakest freshness control. |
| **Application** | Sessions, computed results | Redis or in-process; where most deliberate caching lives. |
| **Database query cache** | Repeated query results | Closest to source; smallest staleness window. |

**Never cache user-specific or sensitive data at a shared layer** (edge/CDN). A shared cache serves one user's response to another. Mark authenticated responses `Cache-Control: private` so only the user's own browser stores them.
