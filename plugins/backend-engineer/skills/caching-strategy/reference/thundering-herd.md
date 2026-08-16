# Thundering Herd

When a hot key expires, every concurrent reader misses at once and stampedes the DB with identical queries — a cache stampede (thundering herd) that can take the database down precisely when load is highest. Two defenses:

- **Per-key lock** — the first caller to miss acquires a short-lived lock and refreshes the key; everyone else waits for the new value (or briefly serves the stale one). Only one DB query per expiry.
- **Probabilistic early refresh** — refresh the key *before* it expires, with a probability that rises as expiry nears. The herd never forms because the value is renewed while still live.

Apply protection to hot keys specifically; cold keys rarely stampede and the bookkeeping is not free.

## Worked Snippet — Cache-Aside With Stampede Protection

```text
function getUser(id):
    key = "user:" + id
    value = cache.get(key)
    if value is not null:
        return value

    lockKey = "lock:" + key
    if cache.acquireLock(lockKey, ttl=5s):
        try:
            value = db.query("SELECT * FROM users WHERE id = ?", id)
            cache.set(key, value, ttl=300s)
            return value
        finally:
            cache.releaseLock(lockKey)
    else:
        wait(50ms)
        return getUser(id)
```

The first caller on a miss holds the lock and refreshes; concurrent callers wait briefly and re-read instead of all hitting the DB. One query per expiry, not thousands.
