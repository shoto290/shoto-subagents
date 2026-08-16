---
name: reuse-first
description: Reuse-first - extend existing code before writing anything new.
---

# Reuse First

Before writing a new component, utility, hook, or helper, prove that nothing existing already does the job. New code is the last resort, not the first move.

## The rule

Always check for existing code before writing new — even when verifying takes longer than rewriting. This is the global "Reuse existing functions/components" rule: duplication is a defect, not a shortcut. The minutes spent searching are cheaper than the long-term cost of a parallel implementation that drifts from the original.

## Search before create

Look before you build:

- Grep and glob for similar names — the capability, the domain noun, and obvious synonyms.
- Scan the design system and shared utility modules for an existing primitive.
- Check sibling modules and adjacent features for a pattern already solving this.

When unsure what already exists, grep and glob the codebase to score existing candidates for fit, and read the surrounding modules to match house style before adding anything.

## Reuse / Extend / New decision

Pick the lightest option that fits:

- **REUSE as-is** — an existing unit already covers the need. Import and use it.
- **EXTEND existing** — close but not exact. Add a prop, a variant, or a small wrapper rather than forking.
- **NEW** — only when nothing fits after a real search. Require a one-line justification naming what you searched and why each candidate failed.

If you cannot write that justification, you have not earned the right to build new.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/composition.md](./reference/composition.md) | Extending an existing unit — choosing between a wrapper and a subclass, or reaching for design-system tokens and components instead of bespoke values. |
| [reference/checklist.md](./reference/checklist.md) | Verifying a reuse decision before returning new or extended code. |
