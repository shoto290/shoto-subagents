---
name: solid-dry-kiss-yagni
description: The four core design principles - SOLID, DRY, KISS, YAGNI.
---

# SOLID, DRY, KISS, YAGNI

The four principles that keep a design honest. Apply them to decide where boundaries go, when to abstract, and when to stop. For the broader discipline of cutting speculative work, defer to the `avoid-over-engineering` skill rather than re-deriving it here.

## SOLID

- **SRP — Single Responsibility.** A unit changes for one reason.
- **OCP — Open/Closed.** Extend behavior without editing the dispatcher.
- **LSP — Liskov Substitution.** A subtype must honor the base contract.
- **ISP — Interface Segregation.** Depend on the narrow interface you use.
- **DIP — Dependency Inversion.** Depend on abstractions, not concretions.

## DRY, KISS, YAGNI

- **DRY.** A single source of truth for knowledge, not for code that merely looks alike.
- **KISS.** Pick the simplest thing that works and reject cleverness that buys nothing.
- **YAGNI.** Build for today's requirement, not an imagined one — `engineering:avoid-over-engineering` carries the before/after example.

## When they conflict

Prefer a little duplication over the wrong coupling — inline the repetition until the real shared knowledge is obvious, then extract once.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/solid.md](./reference/solid.md) | You are placing a class or module boundary and want the worked code example for SRP, OCP, LSP, ISP, or DIP. |
| [reference/dry-kiss-yagni.md](./reference/dry-kiss-yagni.md) | You are deduplicating code, simplifying an expression, or cutting a speculative knob, and need the full rationale plus the DRY-vs-KISS tiebreak. |
| [reference/checklist.md](./reference/checklist.md) | You are about to return a design or diff and need to run the pass/fail checklist over it. |
