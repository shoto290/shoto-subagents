# Log Levels

| Level | Use for | In prod? |
| :-- | :-- | :-- |
| **DEBUG** | Fine-grained dev detail | No |
| **INFO** | Significant state changes (order placed, job started) | Yes |
| **WARN** | Degradation, recoverable / retried conditions | Yes |
| **ERROR** | Actionable failures needing attention | Yes |
| **FATAL** | Crash, process cannot continue | Yes |

Run at INFO and above in production. **Never log inside hot loops** — high-frequency code paths drown signal in noise and burn cost. Log the aggregate outcome, not each iteration.
