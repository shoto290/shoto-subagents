# Zero-Downtime Migrations

Use **expand / contract** so old and new code run side by side:

1. **Expand** — add the new column as nullable or with a default. Adding a nullable column is cheap; it does not rewrite the table.
2. **Backfill in batches** — fill the new column in bounded chunks (e.g. 1,000 rows), each its own transaction. **Never** one giant transaction — it locks the table, bloats the log, and blocks writes.
3. **Switch reads** — point the application at the new column once it is fully populated.
4. **Contract** — drop the old column after a release confirms nothing reads it.

**Never lock a large table** in a single migration. Add constraints and indexes concurrently where the engine supports it.

```sql
-- Parameterized query: never interpolate user input into SQL.
-- (For injection-safe construction, defer to the secure-by-default skill.)
SELECT id, email FROM users WHERE org_id = $1 AND status = $2;

-- Batched backfill sketch: bounded chunks, one transaction each, loop until done.
UPDATE users
SET region = legacy_region
WHERE region IS NULL
  AND id IN (
    SELECT id FROM users WHERE region IS NULL ORDER BY id LIMIT 1000
  );
-- Repeat until 0 rows affected. Sleep briefly between batches to spare replication.
```
