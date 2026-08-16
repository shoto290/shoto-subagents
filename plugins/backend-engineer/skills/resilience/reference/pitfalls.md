# Pitfalls

- **No timeouts** — the dependency does not fail, it hangs, holds connections, and exhausts the pool under load.
- **Retrying non-idempotent calls** — replaying a payment double-charges. Use an idempotency key or do not retry.
- **Retry storms** — retries with no backoff, no jitter, or no cap turn a brief blip into a self-inflicted DDoS as aligned clients hammer a recovering service.
- **One dependency taking down the whole service** — no bulkhead means a single slow downstream starves every worker and your healthy paths die too.
- **Untested resilience** — assuming the breaker opens or the timeout aborts without a test that proves it. Almost always misconfigured until verified.
