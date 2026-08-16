# Circuit Breaker

After **N consecutive failures** (timeouts or errors) to one dependency, **open** the circuit: stop calling it and immediately return a cached or default response. This stops a slow dependency from cascading — without a breaker, every request piles into the same dead call and drains the pool.

Three states:

- **Closed** — calls flow normally; count consecutive failures.
- **Open** — fail fast, return fallback, do not touch the dependency. Start a cooldown timer.
- **Half-open** — after cooldown, allow one probe request. Success closes the circuit; failure re-opens it.

Scope one breaker per dependency, never one global breaker — a dead recommendations service must not open the circuit to your database.
