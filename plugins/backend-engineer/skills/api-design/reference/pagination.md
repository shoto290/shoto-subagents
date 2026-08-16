# Pagination

Always paginate list endpoints, and **always return pagination metadata** (e.g. `next_cursor`, `has_more`, optionally a count) so the client knows how to continue.

Prefer **cursor-based** pagination over offset/page-number **at scale**:

- Offset (`?page=3&size=20` → `OFFSET 40`) breaks under concurrent writes: a row inserted or deleted between page loads shifts the window, so the client skips or repeats records.
- Cursors encode a stable position (e.g. the last seen sorted id/timestamp): `?limit=20&cursor=eyJpZCI6MTQwfQ`. New writes do not shift earlier pages.
- Offset is acceptable only for small, slow-changing datasets where a page jump UI is required.
