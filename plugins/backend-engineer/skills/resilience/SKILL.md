---
name: resilience
description: 'Graceful failure: circuit breakers, timeouts, retries.'
---

# Resilience

Concrete stability patterns for the moment a dependency fails or slows down. Distributed systems fail partially — one slow downstream call, not a clean crash. The whole discipline reduces to one rule: **a failing or slow dependency must never take the caller down with it.** These are the mechanical patterns; for the higher-level isolate-failures and robustness judgment defer to `scalable-architecture`.

## Rules

- Every external or network call gets a finite, explicit timeout.
- After N consecutive failures to one dependency, open the circuit: stop calling it and immediately return a cached or default response.
- Give each downstream dependency its own thread pool or connection pool so one saturated dependency cannot starve the whole process.
- Retry only idempotent operations, with exponential backoff and jitter; send an idempotency key for non-idempotent operations instead.
- When a non-critical dependency fails, return a reduced response, not a `500`.
- When inbound load exceeds capacity, reject excess work rather than collapse.
- A resilience pattern you have not tested does not work — assume it is broken until a test proves otherwise.
- Compose timeout, circuit breaker, and backoff retry together per call; see the worked example for the concrete shape.
- Know the recurring failure modes before they bite: no timeouts, retrying non-idempotent calls, retry storms, no bulkhead, untested resilience.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/timeouts.md](./reference/timeouts.md) | Setting or reviewing the timeout values on an external or network call. |
| [reference/circuit-breaker.md](./reference/circuit-breaker.md) | A dependency keeps failing and calls need to stop hitting it before it drains the pool. |
| [reference/bulkhead.md](./reference/bulkhead.md) | One dependency's slowness is starving unrelated, otherwise-healthy endpoints. |
| [reference/retries-backoff.md](./reference/retries-backoff.md) | Deciding whether a failed call is safe to retry and how to back off. |
| [reference/graceful-degradation.md](./reference/graceful-degradation.md) | A non-critical dependency is down and the response needs a fallback instead of a hard error. |
| [reference/backpressure.md](./reference/backpressure.md) | Inbound load is exceeding capacity and a queue is growing unbounded. |
| [reference/testing-resilience.md](./reference/testing-resilience.md) | Writing or reviewing tests that prove a breaker, timeout, or retry actually works. |
| [reference/worked-example.md](./reference/worked-example.md) | Wiring timeout, breaker, and retry together for a real call and wanting a concrete pattern to copy. |
| [reference/pitfalls.md](./reference/pitfalls.md) | Reviewing a resilience implementation for known failure modes before shipping it. |
