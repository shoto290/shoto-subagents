---
name: database-craft
description: Schema modeling, indexing, and query tuning.
---

# Database Craft

Treat the database as the source of truth, not a dumb store. Most data problems are decided at design time — the schema, the constraints, the indexes — long before the first slow query shows up. Make those decisions deliberately.

## Rules

- Design to **3NF**; denormalize **only on profiling evidence**, never speculatively.
- Index the columns the query planner actually walks; **confirm with `EXPLAIN` before adding an index**.
- Enforce invariants where the data lives — primary keys, foreign keys, unique and check constraints — not only in application code.
- Pick the **lowest isolation level that is correct** for the operation.
- Fix N+1 queries with eager loading / batch loading or a single `JOIN` — never one round trip per element.
- Reuse a **bounded** connection pool; never open one per request.
- Scale in order — vertical, then read replicas, then sharding — stopping as soon as the load is handled.
- Choose SQL vs NoSQL by access pattern and consistency need, not by hype.
- Use **expand / contract** for migrations; **never lock a large table** in a single migration.
- Watch for the recurring pitfalls: denormalizing without evidence, missing foreign keys, N+1 in production, over-indexing, table-locking migrations, reading writes off a lagging replica, sharding with no key strategy.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/normalization.md](./reference/normalization.md) | Deciding how far to normalize a new schema, or weighing whether a denormalization is justified. |
| [reference/indexing.md](./reference/indexing.md) | Choosing which columns to index, ordering a composite index, or checking a query plan. |
| [reference/integrity-constraints.md](./reference/integrity-constraints.md) | Adding foreign keys, cascade policy, or check/unique constraints to a table. |
| [reference/transactions-isolation.md](./reference/transactions-isolation.md) | Picking an isolation level or diagnosing dirty reads, non-repeatable reads, or phantoms. |
| [reference/n-plus-one.md](./reference/n-plus-one.md) | Spotting a repeated per-row query pattern in an ORM query log. |
| [reference/connection-pooling.md](./reference/connection-pooling.md) | Sizing a connection pool or debugging pool exhaustion. |
| [reference/scaling-order.md](./reference/scaling-order.md) | Deciding whether to scale vertically, add read replicas, or shard. |
| [reference/sql-vs-nosql.md](./reference/sql-vs-nosql.md) | Choosing between a relational and a document/key-value store for new data. |
| [reference/zero-downtime-migrations.md](./reference/zero-downtime-migrations.md) | Adding a column to a large hot table without taking a lock, or writing a batched backfill. |
| [reference/pitfalls.md](./reference/pitfalls.md) | Doing a final pre-merge check for common database design and migration mistakes. |
