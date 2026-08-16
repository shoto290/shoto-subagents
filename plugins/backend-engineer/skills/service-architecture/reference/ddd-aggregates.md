# DDD Aggregates

An **aggregate** is a cluster of objects treated as one unit, fronted by an **aggregate root**. The root is:

- The **unit of persistence** — repositories load and save whole aggregates, never child entities on their own.
- The **invariant guard** — all changes go through root methods, which enforce the rules that must always hold (an order's total matches its lines; a cart cannot exceed its limit).

Outside code never mutates a child entity directly. It calls a method on the root, and the root decides what changes. This keeps invariants in one place instead of smeared across callers.
