# Pitfalls

- **Business logic in controllers** — branching on domain state or computing results in the HTTP layer. Move it into a service.
- **Anemic pass-through services** — a service whose every method just forwards one repository call adds a layer without adding behavior. Either it should hold real logic or it should not exist.
- **Cross-domain repository calls** — the `billing` service reaching into the `catalog` repository. Go through the other context's service surface, never its persistence.
- **ORM types leaking into the service layer** — entities decorated with ORM annotations, query builders, or row shapes flowing upward. The service should see domain objects only.
- **Factories that only wrap `new`** — abstraction with no decision inside it. Delete it; call the constructor.
- **Premature microservices** — splitting before ownership, scaling, or release pain forces it. Stay a modular monolith until a concrete force appears.
- **God services** — one service accumulating logic from many contexts. Split along bounded-context lines.
