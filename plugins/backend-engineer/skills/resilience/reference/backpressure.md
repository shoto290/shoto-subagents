# Backpressure And Load Shedding

When inbound load exceeds capacity, reject excess work rather than collapse. An unbounded queue under overload grows until memory dies and latency goes to infinity for everyone.

- **Bound every queue.** A full bounded queue is a signal, not a problem.
- **Shed load** at the edge — reject or `429` excess requests fast so accepted requests still meet their latency budget.
- Apply backpressure upstream (pause consuming) so producers slow down instead of overflowing.
