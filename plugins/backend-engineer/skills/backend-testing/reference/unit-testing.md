# Unit Testing

## Test Behavior, Not Implementation

Assert the **observable outcome and the enforced rule**, not the mechanics that produced it.

- Good: "an order over the credit limit is rejected with `LimitExceeded`."
- Bad: "`creditService.check()` was called once with `(orderId, amount)`."

The second test fails the moment you refactor internals even though behavior is unchanged — so it punishes exactly the work tests should protect. Verify the return value, the persisted state, the emitted event, or the error type. Reserve "was this called" assertions for genuine side effects you cannot observe any other way (an email was sent, a payment was charged).

## Mock at Boundaries

In **unit tests**, mock at the unit's boundaries — repositories, external service clients, clocks, queues — and drive logic through fakes. Keep real DB connections out of unit tests: they are slow, order-dependent, and flaky, which is the opposite of what a unit test must be. A unit test runs in milliseconds, in any order, in isolation.

Mock the boundary, never the thing under test. If a test mocks so much that it only re-asserts the mock setup, it tests nothing — see Pitfalls.

## Worked Snippet — Service Unit Test With a Mocked Repository

A service unit test asserts a business rule against a mocked repository — no DB, no network, deterministic (language-agnostic pseudocode):

```
test "transfer rejected when balance is insufficient":
  accounts = MockAccountRepository()
  accounts.find("A").returns(Account(id: "A", balance: 50))
  service = TransferService(accounts)

  result = service.transfer(from: "A", to: "B", amount: 100)

  assert result.isError()
  assert result.error == "InsufficientFunds"
  assert accounts.save.wasNotCalled()   # side effect we cannot otherwise observe
```

The test names a rule, drives it through a mocked boundary, and asserts the observable outcome (error type) plus the one side effect that has no return value (nothing was persisted). It says nothing about *how* the balance was checked — a refactor of the internals keeps it green.
