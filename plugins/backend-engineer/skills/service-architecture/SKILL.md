---
name: service-architecture
description: 'Layered backend structure: repository/service/controller, DI.'
---

# Service Architecture

Concrete backend layering for where code goes and how modules split. This skill applies the patterns; the generic boundary, interface-depth, and scale judgment lives elsewhere. For deep-vs-shallow interfaces and evolutionary/scale tradeoffs defer to `scalable-architecture`. For SOLID/DRY/KISS/YAGNI defer to `solid-dry-kiss-yagni`.

## Rules

- Business logic NEVER leaks into a controller.
- Code against a repository **interface**, not the ORM directly.
- Inject dependencies as **interfaces through the constructor**.
- Top-level structure follows **business domains** (bounded contexts), not technical layers.
- Outside code never mutates a child entity directly.
- **Default to a modular monolith** with strong internal boundaries.
- Apply these patterns where they **cut** complexity, not reflexively.
- Controller → service → repository, wired by constructor injection.
- Watch for the pitfalls that erode this structure over time.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/layered-separation.md](./reference/layered-separation.md) | Deciding what belongs in a controller vs a service vs a repository. |
| [reference/repository-pattern.md](./reference/repository-pattern.md) | Wiring a service to persistence and deciding whether to expose an ORM type. |
| [reference/dependency-injection.md](./reference/dependency-injection.md) | Wiring a service's dependencies or spotting a `new` call hardcoding an implementation. |
| [reference/domain-organization.md](./reference/domain-organization.md) | Choosing top-level folder structure or drawing a bounded-context boundary. |
| [reference/ddd-aggregates.md](./reference/ddd-aggregates.md) | Modeling a cluster of entities that must change together under one invariant. |
| [reference/monolith-vs-microservices.md](./reference/monolith-vs-microservices.md) | Deciding whether a bounded context should become its own deployable. |
| [reference/thin-abstractions.md](./reference/thin-abstractions.md) | Judging whether a repository interface or factory is earning its keep. |
| [reference/worked-example.md](./reference/worked-example.md) | Needing a full controller/service/repository code listing to model new code on. |
| [reference/pitfalls.md](./reference/pitfalls.md) | Reviewing code for anemic services, leaking ORM types, or premature splits. |
