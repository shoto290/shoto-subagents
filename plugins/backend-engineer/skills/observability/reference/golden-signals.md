# The Golden Signals

Monitor these four for every service:

- **Latency** — track percentiles (**p50 / p95 / p99**), never averages. An average hides the slow tail where users actually suffer.
- **Traffic** — demand on the system (requests/sec, messages/sec).
- **Errors** — rate of failed requests, by class.
- **Saturation** — how full the system is (queue depth, connection pool, the most constrained resource).
