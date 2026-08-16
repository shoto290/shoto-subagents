# Integrity At The Database

Enforce invariants where the data lives, not only in application code:

- **Primary keys** on every table; **foreign keys** for every reference, with an intentional cascade policy (`RESTRICT`, `CASCADE`, or `SET NULL` — chosen, not defaulted).
- **Unique** constraints for natural keys; **check** constraints for value rules (`price >= 0`, valid enum membership).

Application validation is the second line of defense — fast feedback and good messages — never the only one. Two services, a script, or a future migration will all hit the same table; the database is the one gate they all pass through.
