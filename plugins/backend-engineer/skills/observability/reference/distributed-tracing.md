# Distributed Tracing

For multi-service systems, instrument with **OpenTelemetry** and export to a tracing backend (Jaeger, Tempo, or equivalent). A trace is a tree of spans; each span shows where time was spent. Spans reveal where latency actually lives — the slow downstream call, the lock contention, the N+1 query — which logs and metrics alone cannot localize across boundaries.

Propagate trace context on every outbound call so spans from different services join into one trace.
