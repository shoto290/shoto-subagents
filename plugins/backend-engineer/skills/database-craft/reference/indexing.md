# Indexing

Index the columns the query planner actually walks:

- Columns in `WHERE`, `JOIN`, and `ORDER BY` clauses.
- Composite indexes ordered by selectivity and matched to the query's leftmost-prefix usage.

Guardrails:

- **Confirm with `EXPLAIN` before adding an index.** A sequential scan on a hot path is the signal; the plan tells you the truth, guesses do not.
- **Avoid over-indexing.** Every index is write amplification — each `INSERT`/`UPDATE`/`DELETE` maintains it. Drop indexes no query uses.
- **Beware low-selectivity columns** (booleans, status enums with two values). An index that matches half the rows is rarely worth using; the planner will skip it anyway.
