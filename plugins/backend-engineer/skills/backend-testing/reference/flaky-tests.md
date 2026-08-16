# Triage Flaky Tests Immediately

A flaky test erodes trust in the whole suite — once people ignore red, real bugs hide behind the noise. Fixing flakes outranks writing new tests. Common causes and fixes:

| Cause | Fix |
| :-- | :-- |
| `sleep`/timing assumptions | Explicit waits / poll-until-condition |
| Real external calls | Stub the boundary |
| Shared mutable state | Per-test isolation (fresh state, rollback) |
| Unordered collections | Assert on sets, not positions |

Quarantine a flake only as a stopgap with a tracking ticket — never as the resolution.
