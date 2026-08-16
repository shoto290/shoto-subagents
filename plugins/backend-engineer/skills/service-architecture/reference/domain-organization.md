# Organize By Domain, Not By Layer

Top-level structure follows **business domains** (bounded contexts), not technical layers. Prefer `billing/`, `catalog/`, `shipping/` — each owning its model, repositories, and services — over global `controllers/`, `services/`, `repositories/` folders that scatter one feature across the tree.

Technical layering happens **within** a context, not across the whole codebase. A bounded context is a consistency and ownership boundary: its model means one specific thing inside it, and it exposes a deliberate surface to other contexts rather than letting them reach into its internals.
