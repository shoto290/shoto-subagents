# Pitfalls

- **Denormalizing without evidence** — duplicated data you now have to keep in sync, solving a problem you never measured.
- **No foreign keys** — orphaned rows and silent referential rot; the database stops protecting you.
- **N+1 in production** — fine on 10 dev rows, a meltdown on 100k. Always check the ORM query log.
- **Over-indexing** — write throughput dies under index maintenance for indexes no query uses.
- **Table-locking migrations** — a single `ALTER` or one-shot backfill that locks a hot table is an outage.
- **Reading your own writes off a lagging replica** — the user updates something and sees the old value. Route read-after-write to the primary.
- **Sharding with no key strategy** — a bad shard key forces cross-shard fan-out on every query and cannot be undone without a full re-shard.
