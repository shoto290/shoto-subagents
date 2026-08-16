# Transactions & Isolation

Pick the **lowest isolation level that is correct** for the operation — higher levels cost concurrency and invite deadlocks.

| Level | Prevents | Still allows |
| :-- | :-- | :-- |
| `READ COMMITTED` | dirty reads | non-repeatable reads, phantoms |
| `REPEATABLE READ` | dirty + non-repeatable reads | phantoms (in standard SQL) |
| `SERIALIZABLE` | dirty, non-repeatable, phantoms | nothing — full isolation |

Reach for `SERIALIZABLE` only when an invariant spans multiple rows read then written (balance checks, inventory decrements). Keep transactions short — hold no locks across network calls or user think-time.
