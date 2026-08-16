# TDD vs Test-After

- **TDD (contract-first)** for intricate business logic — branching rules, calculations, state machines. Writing the test first forces you to define the contract and catches edge cases before they ship.
- **Test-after is fine** for trivial CRUD and glue where the behavior is obvious. Do not perform ceremony where there is no design to discover.
