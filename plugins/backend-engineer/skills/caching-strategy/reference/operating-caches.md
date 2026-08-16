# Operating Caches

- Set an explicit **memory limit** so the cache evicts predictably instead of being OOM-killed.
- **Warm** critical caches at startup so the first users after a deploy or restart do not all miss at once.
- Monitor the **hit/miss ratio**. A hit rate below ~80% signals a bad strategy, a wrong TTL, or a cache that is not earning its cost — investigate, do not just grow it.
- **Never cache error responses** — a transient 500 cached for the TTL turns one failure into a sustained outage.

For the deeper judgment of measuring the bottleneck before scaling — whether a cache is even the right fix — defer to `scalable-architecture`.
