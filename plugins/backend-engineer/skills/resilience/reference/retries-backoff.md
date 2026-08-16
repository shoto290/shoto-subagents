# Idempotent Retries With Backoff

Retry **only idempotent operations** (GET, PUT, DELETE, naturally repeatable reads). For non-idempotent operations (a payment, a charge, an order submission), a blind retry double-applies — send an **idempotency key** so the server deduplicates a replay instead.

Rules for every retry:

- **Exponential backoff + jitter** — `delay = base * 2^attempt`, plus random jitter so retries from many clients do not align into a synchronized thundering herd.
- **Cap the attempts** (e.g. 3) and cap the max delay. Unbounded retries are a self-inflicted denial of service.
- Do not retry on `4xx` client errors — they will fail identically. Retry only transient faults (timeout, `503`, connection reset).
