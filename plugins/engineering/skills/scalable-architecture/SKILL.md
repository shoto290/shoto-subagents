---
name: scalable-architecture
description: Architecture for scale - deep interfaces and evolutionary design.
---

# Scalable Architecture

Design boundaries that stay simple as the system grows. Choose interface depth and the right amount of upfront structure deliberately — most scale problems are boundary problems, not throughput problems.

## Rules

- **Deep vs shallow interfaces** — prefer deep modules: a simple interface that hides a substantial implementation. Reject shallow modules and pass-through methods.
- **Hide complexity** — expose the minimum surface a caller needs; keep design decisions inside the module.
- **Evolutionary architecture** — Design for **change**, not for an imagined final scale. You cannot predict the real load shape — so make the architecture cheap to evolve instead of betting on a blueprint.
  - Make decisions **reversible**: prefer choices you can undo over ones that lock the system in.
  - **Defer big commitments** (sharding, a message bus, a new datastore) until a concrete need forces them.
  - Do not build for hypothetical scale — see `avoid-over-engineering` (YAGNI). The cost of a wrong abstraction outlives the cost of adding one later.
- **System-design judgment** — **State your assumptions before choosing**: expected scale, latency budget, and failure modes. A design is only "right" relative to those numbers.
  - Pick the **simplest design that meets today's load** while leaving a path to grow.
  - **Find the bottleneck before scaling it** — measure, don't guess. Scaling the wrong component adds cost without moving the limit.
  - Keep modules orthogonal and decoupled so one can change without the others — see `pragmatic-principles`.
- **Robustness**
  - **Fail loudly at boundaries.** Surface errors where they occur; never swallow them into a silent bad state.
  - **Validate inputs at the edge** so the core operates on trusted data — see `secure-by-default`.
  - **Isolate failures** so one module's fault does not cascade.
  - **No shared mutable state across modules** — communicate through interfaces, not through reaching into each other's data.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/interface-depth.md](./reference/interface-depth.md) | Sizing a module's public API, judging whether an interface is deep or shallow, or removing pass-through methods and leaked internals. |
| [reference/checklist.md](./reference/checklist.md) | Verifying an architecture or module boundary before returning it. |
