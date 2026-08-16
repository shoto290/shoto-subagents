---
name: observability
description: 'Logs, metrics, and traces with SLO-driven alerting.'
---

# Observability

Observability is the ability to answer "what is the system doing and why" from its outputs alone, without shipping new code. Build it in from the start — bolted-on observability is always incomplete. The discipline reduces to one rule: **every signal must carry enough context to reconstruct a single request end-to-end.**

## Rules

- All three are required. Each answers a different question; none substitutes for another.
- In production, emit **JSON with a consistent schema**, never freeform strings.
- A `trace_id` on **every log line** is non-negotiable.
- Run at INFO and above in production.
- Monitor latency, traffic, errors, and saturation for every service.
- Alert on **business and user impact**, expressed as SLOs — not raw infrastructure metrics.
- For multi-service systems, instrument with **OpenTelemetry** and export to a tracing backend (Jaeger, Tempo, or equivalent).
- Retain by **risk and cost, not "just in case"**.
- **Never log secrets, tokens, passwords, or PII.**
- Avoid the recurring failure modes: unstructured logs, missing trace IDs, alerting on infra instead of impact, hot-loop logging, missing SLOs, and missing timestamp/service.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/three-pillars.md](./reference/three-pillars.md) | Deciding whether logs, metrics, or traces alone are enough for a design |
| [reference/structured-logging.md](./reference/structured-logging.md) | Defining the log schema or writing a log line, including a worked JSON example |
| [reference/trace-ids.md](./reference/trace-ids.md) | Wiring trace ID generation and propagation across services |
| [reference/log-levels.md](./reference/log-levels.md) | Choosing a log level or deciding what runs in production |
| [reference/golden-signals.md](./reference/golden-signals.md) | Picking which metrics to monitor for a service |
| [reference/slo-alerting.md](./reference/slo-alerting.md) | Deciding what should page an on-call engineer versus sit on a dashboard |
| [reference/distributed-tracing.md](./reference/distributed-tracing.md) | Instrumenting a multi-service system with tracing |
| [reference/retention.md](./reference/retention.md) | Setting retention windows per signal class |
| [reference/secrets-and-pii.md](./reference/secrets-and-pii.md) | Reviewing logs for leaked secrets or PII before shipping |
| [reference/pitfalls.md](./reference/pitfalls.md) | Auditing an observability setup for common mistakes |
