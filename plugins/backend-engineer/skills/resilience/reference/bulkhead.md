# Bulkhead

Isolate resources so one saturated dependency cannot starve the whole process. Give each downstream dependency its **own thread pool or connection pool** (the ship's-bulkhead metaphor: one flooded compartment does not sink the vessel). Without bulkheads, a single slow dependency consumes every worker and your healthy endpoints go down with the sick one.

- Separate connection pools per database / external service.
- Bounded, dedicated worker pools per dependency class.
- Cap concurrent in-flight calls to each dependency.
