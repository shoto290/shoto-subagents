# Pitfalls

- **Inverted pyramid** — leaning on E2E for logic that a unit test could prove. Slow, flaky, vague failures.
- **Mocking everything** — when mocks dominate, the test re-asserts its own setup and proves nothing.
- **Real deps with no stubbing** — hitting live external APIs makes tests slow and non-deterministic; stub the boundary.
- **In-memory fakes masking prod bugs** — H2/SQLite pass behavior real Postgres rejects. Use testcontainers.
- **Leaving flaky tests unfixed** — erodes trust and hides real bugs; triage over new tests.
- **Testing implementation details** — call-spying that breaks on every refactor instead of asserting outcomes.
- **Never testing resilience** — breakers, timeouts, and retries assumed to work but never asserted.

For the senior judgment on what is worth testing at all — coverage as a means, not a target — defer to `senior-mindset`.
