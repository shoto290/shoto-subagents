# Structured Logging

In production, emit **JSON with a consistent schema**, never freeform strings. A machine must parse, filter, and index every line.

- Required fields on every line: `timestamp`, `level`, `service`, `trace_id`, `message`, plus a `context` object.
- One schema across all services so a single query spans the fleet.
- In development, render human-readable (pretty-printed) logs for the console — the schema stays the same, only the formatter changes.
- No `"something went wrong"`. Messages are contextual and actionable: `"Payment declined for order 7833, attempt 2 of 4"`.

## Worked Snippet

A single structured log line carrying a trace ID and actionable context:

```json
{
  "timestamp": "2026-06-03T14:22:07.481Z",
  "level": "ERROR",
  "service": "payments-api",
  "trace_id": "4bf92f3577b34da6a3ce929d0e0e4736",
  "message": "Payment declined for order 7833, attempt 2 of 4",
  "context": {
    "order_id": 7833,
    "attempt": 2,
    "max_attempts": 4,
    "gateway": "stripe",
    "decline_code": "insufficient_funds"
  }
}
```

One line: who (`service`), which request (`trace_id`), what (`message`), and everything needed to act (`context`). No secrets, no card number.
