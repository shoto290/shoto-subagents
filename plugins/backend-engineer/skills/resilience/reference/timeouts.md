# Timeout Everything

Every external or network call gets a finite, explicit timeout. No call inherits the default infinite wait of its client library. A request with no deadline does not fail — it hangs, holds a connection, and lets one slow downstream exhaust your thread pool. Fail fast instead.

- Set both a **connect** timeout and a **read/response** timeout on every client.
- The timeout budget shrinks down the call chain: if your handler must answer in 2s, a downstream call cannot be given 2s.
- A timeout is the trigger that feeds the circuit breaker and the retry policy below.
