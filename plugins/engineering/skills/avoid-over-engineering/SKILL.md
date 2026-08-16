---
name: avoid-over-engineering
description: Write less code; resist premature abstraction and optimization.
---

# Avoid Over-Engineering

The simplest solution that solves the problem wins: minimum content that solves the problem, nothing speculative. This skill is the concrete checklist for resisting the urge to add.

## Rules

- **Write less code — delete over add.** When a change can be made by removing code, prefer that.
- **Rule of Three.** Do not abstract until the third real occurrence; two similar blocks are a coincidence, three is a pattern.
- **No premature abstraction.** No speculative interfaces, base classes, or plugin systems for a single caller.
- **No premature optimization without a measurement.** Only optimize a path proven hot by a profiler or a real metric.
- **No golden hammer.** Pick the pattern the problem asks for, not the one you reached for last time.
- **No speculative flexibility.** Delete unused params, options, and "just-in-case" machinery.

The Rule of Three is the trigger rule; when your agent preloads `engineering:solid-dry-kiss-yagni`, it carries the DRY and YAGNI principles behind it.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/rule-of-three.md](./reference/rule-of-three.md) | You are about to extract a shared helper and must decide whether two or three occurrences justify it. |
| [reference/premature-abstraction.md](./reference/premature-abstraction.md) | You are adding an interface, base class, cache, or any optimization, and want the before/after examples. |
| [reference/speculative-flexibility.md](./reference/speculative-flexibility.md) | You are adding a param, option, flag, or a favorite pattern that no caller requires today, or deciding what to delete. |
| [reference/checklist.md](./reference/checklist.md) | You are about to return a change and need to run the pass/fail checklist over it. |
