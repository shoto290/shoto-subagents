# Pitfalls

- **Unstructured logs** — freeform strings can't be queried or aggregated at scale. Emit JSON.
- **No trace IDs** — distributed debugging becomes guesswork. Propagate a `trace_id` everywhere.
- **Alerting on infra, not impact** — `CPU > 80%` pages are noise. Alert on SLOs and user impact.
- **Logging in hot loops** — drowns signal and burns cost. Log aggregates, not iterations.
- **No SLOs** — without them you alert on everything (fatigue) or nothing (blind). Define them.
- **Missing timestamp / service** — a log line without when and where it came from is unusable in a fleet. Make both mandatory.
