# REST vs GraphQL

- **REST** — default for stable, simple, **cacheable** contracts and resource-oriented domains. HTTP caching, proxies, and tooling work out of the box.
- **GraphQL** — reach for it when **many clients have heterogeneous data needs**, or to kill **over-fetching and under-fetching** (each client asks for exactly the fields it needs in one round trip). The cost: you must **enforce query depth and complexity limits**, or a single nested query can exhaust the server.

Pick REST unless the heterogeneity pain is real and present. Do not adopt GraphQL for a single, stable client.
