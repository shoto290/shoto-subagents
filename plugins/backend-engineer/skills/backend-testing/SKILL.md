---
name: backend-testing
description: Strategic backend testing via the test pyramid.
---

# Backend Testing

Tests exist to let you change code with confidence. The whole discipline reduces to one rule: **assert observable behavior at the right level, fast and deterministically.** A suite that is slow, flaky, or coupled to implementation is a liability, not an asset.

## The Test Pyramid

| Level | Volume | Scope | Dependencies |
| :-- | :-- | :-- | :-- |
| Unit | Many | One unit of business logic | All boundaries mocked |
| Integration | Fewer | Wiring across the unit and its real infra | Real DB; external APIs stubbed |
| E2E | Few | Critical end-to-end user paths only | Full stack |

## Rules

- Reject the inverted pyramid — push every assertion to the lowest level that can prove it.
- Test behavior, not implementation — assert the observable outcome and enforced rule, not the mechanics.
- Mock at the boundary, never the thing under test; keep real DB connections out of unit tests.
- Prefer testcontainers over in-memory fakes for integration tests against real infra.
- Use TDD for intricate business logic; test-after is fine for trivial CRUD and glue.
- Triage flaky tests immediately — fixing flakes outranks writing new tests.
- Test resilience patterns explicitly — an untested pattern is a hope, not a guarantee.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/test-pyramid.md](./reference/test-pyramid.md) | You need the rationale for rejecting an inverted pyramid or how to allocate test budget across levels. |
| [reference/unit-testing.md](./reference/unit-testing.md) | Writing or reviewing a unit test and you need the behavior-vs-implementation examples, the mock-at-boundaries rule, or a worked mocked-repository snippet. |
| [reference/integration-testcontainers.md](./reference/integration-testcontainers.md) | Setting up integration tests and deciding between testcontainers, in-memory fakes, and stubs. |
| [reference/tdd-vs-test-after.md](./reference/tdd-vs-test-after.md) | Deciding whether to write the test before or after the implementation. |
| [reference/flaky-tests.md](./reference/flaky-tests.md) | A test fails intermittently and you need the cause/fix table or the quarantine policy. |
| [reference/testing-resilience.md](./reference/testing-resilience.md) | Asserting circuit breaker, timeout, or retry behavior explicitly. |
| [reference/pitfalls.md](./reference/pitfalls.md) | Reviewing a test suite for common anti-patterns before shipping it. |
