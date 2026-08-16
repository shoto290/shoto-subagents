# Test Pyramid

Spend your test budget by level. Most value comes from many fast tests near the base.

Reject the **inverted pyramid** (mostly E2E, few unit). It is slow, flaky, and gives vague failures — a red E2E tells you something broke, not what. Push every assertion to the lowest level that can prove it: business rules belong in unit tests, wiring belongs in integration, and only the handful of paths where a broken flow is catastrophic earn an E2E.
