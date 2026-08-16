# Instrumentation Handoff

The metric is unreadable if the events do not exist. Name them at definition time, in the brief, alongside the criterion — not in a rush the week after launch.

| Event | Properties | Serves |
| :-- | :-- | :-- |
| `receipt_captured` | `source` (camera \| email \| upload), `transaction_at`, `captured_at` | Engagement — lag metric |
| `report_submitted` | `line_count`, `has_missing_receipt`, `duration_ms` | Task success; submit time |
| `report_rejected` | `reason`, `submitted_at` | First-pass approval rate; counter-metric |

- Every metric in the criteria block traces to at least one named event, and every event names its denominator population.
- Specify the property values, not just the property names — an unbounded `source` string becomes uncountable within a month.
- No PII in properties. Identify users by a stable pseudonymous id.
- Verify the events fire in staging **before** the design ships; a metric first checked at launch is a metric measured from zero.
