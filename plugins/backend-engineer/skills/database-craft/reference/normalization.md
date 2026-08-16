# Normalize By Default

Design to **3NF**: every non-key column depends on the key, the whole key, and nothing but the key. No repeating groups, no derived columns that can drift from their source, no values that belong in their own table.

Denormalize **only on profiling evidence** that reads are blocked by joins or aggregations a normalized model cannot serve fast enough. Never denormalize speculatively — every duplicated value is a future consistency bug you now own. When you do denormalize, document the source of truth and how the copy stays in sync.
