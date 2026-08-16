# Integration Tests With Testcontainers

Wiring bugs — SQL dialect quirks, transaction boundaries, serialization, migrations — only surface against the real engine. Use **testcontainers** to spin up real PostgreSQL/Redis/Kafka in Docker for integration tests.

Prefer real dependencies over **in-memory fakes** (H2, SQLite) unless the fake *is* your production engine. Fakes pass on behavior production rejects: an H2 query that fails on real Postgres ships green. Stub only the things you do not own and cannot run cheaply (third-party HTTP APIs) with a contract-faithful stub.

Isolate test state so tests stay independent: a fresh schema per run plus a transaction rollback or truncation per test. Shared mutable state across tests is a top cause of flakiness.
