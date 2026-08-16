# From Job To Requirement

A job that never reaches the backlog changes nothing. Translate it in one pass:

| Layer | Output |
| :-- | :-- |
| **Job story** | When a project wraps, bill the client fast enough that cash arrives before my own bills |
| **Force targeted** | Anxiety — "I will have to retype every line" |
| **Acceptance criterion** | From a finished project, a sendable invoice exists in under 60 seconds with no manual line-item entry |
| **Design constraint** | Line items derive from tracked work; manual entry is the escape hatch, not the path |
| **Measure** | Time from project-complete to invoice-sent, p50 and p90 |

The criterion must be **falsifiable** (a number, a time, a count), the constraint must **forbid** something (otherwise it is a preference), and the measure must be observable in production. Carry the job story into the ticket verbatim — the moment it is paraphrased into a feature title, the circumstance is lost and the next reviewer optimizes the artifact.
