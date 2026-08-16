# Test Resilience Patterns Explicitly

Resilience that is never tested is a hope, not a guarantee. Assert the behavior directly:

- **Circuit breaker** opens after N consecutive failures and short-circuits while open.
- **Timeout** aborts a slow call within the budget instead of hanging.
- **Retry** is only applied to idempotent operations, with bounded attempts and backoff.

Cross-reference the `resilience` skill for the patterns themselves; this skill covers proving they work.
