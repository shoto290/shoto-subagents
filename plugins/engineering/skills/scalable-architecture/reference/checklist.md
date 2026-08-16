# Pass/Fail Checklist

- [ ] Every module interface is narrower than its implementation (deep, not shallow).
- [ ] No pass-through methods that only forward a call.
- [ ] Public surface exposes the minimum; design decisions stay hidden.
- [ ] Scale, latency, and failure assumptions are stated before the design is chosen.
- [ ] The design meets today's load and has a named path to grow.
- [ ] Big, irreversible commitments are deferred until a concrete need forces them.
- [ ] Inputs are validated at the edge; errors fail loudly at boundaries.
- [ ] No shared mutable state crosses a module boundary.
