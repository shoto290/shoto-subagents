# Modular Monolith Vs Microservices

**Default to a modular monolith** with strong internal boundaries: one deployable, clear bounded contexts, communication through each context's public surface. You get domain separation without distributed-systems tax.

Extract a service into its own deployable only when a concrete force demands it:

- **Organizational ownership** — a separate team needs an independent release cadence.
- **Asymmetric scaling** — one context's load profile differs so sharply it must scale on its own.
- **Release-coordination pain** — deploys are blocked on unrelated parts of the system.

Do not split for fashion, résumés, or imagined future scale. Premature microservices trade in-process calls for network calls, transactions for sagas, and stack traces for distributed tracing — and the costly retreat back to a monolith is a well-worn industry path. When the split judgment is about scale and reversibility, defer to `scalable-architecture`.
