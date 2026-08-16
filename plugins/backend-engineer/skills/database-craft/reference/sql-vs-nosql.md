# SQL vs NoSQL

A tradeoff, not a religion:

- **Relational (SQL)** — strong consistency, joins, transactions, ad-hoc queries, schema-enforced integrity. The default for data with relationships and correctness requirements.
- **Document / key-value (NoSQL)** — high write throughput, horizontal scale, flexible schema, simple access patterns known up front. Pays for it with weaker consistency and no joins.

Choose by access pattern and consistency need, not by hype. Mixing both (relational core + a cache or document store at the edge) is normal.
