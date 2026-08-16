# Pitfalls & Anti-Patterns

- **Verb endpoints** — `/getUser`, `/deleteOrder`. The method already carries the verb; keep paths as nouns.
- **`POST` for everything with no idempotency** — every retried request risks a duplicate. Use the right verb; add an idempotency key for unsafe retries.
- **Offset pagination at scale** — windows shift under concurrent writes, skipping or repeating rows. Use cursors.
- **`200` for errors** — clients and proxies treat it as success; failures vanish into the body. Use the right status code.
- **Inconsistent error shapes** — a different error body per endpoint forces N parsers and brittle clients. One envelope, everywhere.
- **Removing or retyping fields** — silently breaks live consumers. Add optional fields only; break only behind a new version.
- **Undocumented versioning** — consumers can't plan migrations against a version with no sunset date. Publish the deprecation timeline.
