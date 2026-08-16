# Test These Explicitly

A resilience pattern you have not tested does not work. Assume it is broken until a test proves otherwise — for the full approach see `backend-testing`.

- Verify the **breaker opens** after exactly N induced failures and returns the fallback while open.
- Verify the breaker **recovers** via half-open after the cooldown.
- Verify a **timeout actually aborts** the call (inject a delay longer than the timeout and assert it fails fast, not hangs).
- Verify a retried non-idempotent call with an idempotency key applies **once**.
