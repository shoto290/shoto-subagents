# Layered Separation

Three layers, one direction of dependency. Each does exactly one job.

- **Controller (skinny)** — parse and validate the HTTP request, delegate to one service call, map the result to a response. Nothing else. No business rules, no transactions, no queries.
- **Service** — all business logic: orchestration, transaction boundaries, invariant enforcement, calls to repositories and other services. This is where decisions live.
- **Repository** — persistence behind an interface. Translates domain objects to and from storage. Knows the database; nothing above it does.

Business logic NEVER leaks into a controller. If a controller branches on domain state, computes a price, or opens a transaction, that code belongs in a service. The controller's body should read like a single sentence: take input, call service, return output.
