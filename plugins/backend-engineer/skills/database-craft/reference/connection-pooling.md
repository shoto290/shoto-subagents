# Connection Pooling

Opening a connection is expensive; never open one per request. Reuse a **bounded pool**:

- **Max size** tuned to the database's connection ceiling and the app's concurrency — bigger is not better; it just moves the queue from app to database.
- **Acquire timeout** so a starved request fails fast instead of hanging.
- **Idle eviction** to release connections the pool no longer needs.

Watch for **pool exhaustion**: requests blocking on connection acquisition usually means a leaked connection (not returned to the pool) or a transaction held open too long — not a pool that is too small.
