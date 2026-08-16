# Eliminate N+1 Queries

The classic killer: load N parents, then fire one query per parent for its children.

- **Detect** it in the ORM query log — the same parameterized statement repeated once per row is the tell.
- **Fix** with eager loading / batch loading (`IN (...)` over the collected keys) or a single `JOIN`. Fetch the set in one round trip, not one round trip per element.
