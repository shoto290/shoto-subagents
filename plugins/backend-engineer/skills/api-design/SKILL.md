---
name: api-design
description: Design durable, versioned HTTP/GraphQL API contracts.
---

# API Design

Design API contracts as long-term commitments. A consumer integrates once and depends on your shape for years — the contract is the product, not the implementation behind it. Every rule below protects that commitment.

For authentication and authorization rules, defer to the `secure-by-default` skill — do not re-teach auth here.

## Rules

- Model endpoints around resources (nouns) addressed by the HTTP verb, not around actions.
- For any `POST` that must be retry-safe, require an idempotency key.
- Always paginate list endpoints and always return pagination metadata; prefer cursor-based pagination over offset at scale.
- Never remove a field or change a field's type or meaning; a breaking change requires a new version.
- Every error response — across every endpoint — shares one schema, and never leak stack traces, SQL, or internal file paths to clients.
- Use the status line to communicate outcome — never return `200` for a failure.
- Pick REST unless the heterogeneity pain is real and present; enforce query depth and complexity limits with GraphQL.
- Avoid verb endpoints, `POST` without idempotency, offset pagination at scale, `200` for errors, inconsistent error shapes, removing/retyping fields, and undocumented versioning.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/resource-design.md](./reference/resource-design.md) | Deciding how to name an endpoint path or choosing between a verb and a resource-noun URL. |
| [reference/idempotency.md](./reference/idempotency.md) | Designing a `POST` endpoint that must survive client retries without duplicating side effects. |
| [reference/pagination.md](./reference/pagination.md) | Choosing between offset and cursor pagination for a list endpoint. |
| [reference/versioning.md](./reference/versioning.md) | Planning a contract change and deciding whether it needs a new API version. |
| [reference/error-envelope.md](./reference/error-envelope.md) | Defining or reviewing the shape of an error response, including a worked JSON example. |
| [reference/http-status.md](./reference/http-status.md) | Picking the right HTTP status code for a response, with the full code-to-meaning table. |
| [reference/rest-vs-graphql.md](./reference/rest-vs-graphql.md) | Deciding whether an API should be REST or GraphQL. |
| [reference/pitfalls.md](./reference/pitfalls.md) | Reviewing an existing API design for common anti-patterns before shipping. |
