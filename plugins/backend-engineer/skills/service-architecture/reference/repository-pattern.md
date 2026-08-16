# Repository Pattern

Code against a repository **interface**, not the ORM directly. The interface speaks the domain: `findById`, `save`, `findByEmail` — not `queryBuilder`, `createQueryRunner`, or raw rows.

This buys two things: **persistence ignorance** (the service layer never imports ORM types, so swapping Postgres for a document store touches one implementation, not every service) and **testability** (a service takes the interface and gets a fake in tests, no database needed). The ORM is an implementation detail confined to the concrete repository class.
