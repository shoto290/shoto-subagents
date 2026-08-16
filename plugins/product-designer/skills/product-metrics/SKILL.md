---
name: product-metrics
description: Outcome metrics and success criteria before design.
---

# Product Metrics

Measurement is not a phase after launch — it is the constraint that makes a design decidable. The whole discipline reduces to one rule: **define the outcome before the solution.** A design with no success criterion cannot be wrong, and therefore cannot be right; it can only be argued about. Seiden (*Outcomes Over Output*) supplies the unit of value — a changed human behavior. Torres (*Continuous Discovery Habits*) supplies the structure that connects that outcome to what you actually build. Google's HEART framework supplies the vocabulary for turning a fuzzy goal into a signal and a number.

## Non-Negotiables

A shipped feature is not a changed behavior. "Launch the new onboarding flow" is an output — it is true the day it merges, regardless of whether anyone onboards better.

- Write the behavior change you expect **in one sentence**, before anything is designed: *who* does *what* differently, *how much more* than today.
- Test the sentence: if it can be satisfied by the feature existing, it is an output. Rewrite it.
- Output: "ship receipt scanning." Outcome: "expense submitters capture a receipt within 2 days of the transaction instead of batching at month end."
- Outputs belong in the roadmap. Outcomes belong in the brief, and they are what the design is judged against.
- Pick two or three HEART dimensions, not all five; a scorecard with five equal priorities has none.
- One north star metric per product surface, phrased as a rate or a ratio, with its guardrail defined at the same moment.
- Attach every design idea to exactly one opportunity, and that opportunity to exactly one outcome.
- No criterion without a threshold, a window, a pre-committed consequence, and a named owner.
- Name the events at definition time and verify they fire in staging before the design ships. No PII in properties.

## Pitfalls

- **Vanity metrics** — totals that only go up (cumulative signups, all-time pageviews). They cannot fall, so they cannot inform a decision. Use rates and ratios over a window.
- **Measuring the output** — "flow shipped", "adoption of the new screen". The screen being used says nothing about the behavior it was built to change.
- **Moving the goalpost** — reading the result, then deciding which number counted. The threshold and the consequence are both fixed before launch or neither is real.
- **No counter-metric** — a north star with no guardrail will be optimized into damage, and the damage lands in a number nobody is watching.
- **A metric no one owns** — an unowned dashboard is not measurement. One named person reports the number at the end of the window and states what happens next.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/heart-framework.md](./reference/heart-framework.md) | Turning a fuzzy goal into a signal and a number, or choosing which HEART dimensions to score |
| [reference/north-star-and-guardrails.md](./reference/north-star-and-guardrails.md) | Setting a north star for a surface, or checking how a candidate metric could be gamed |
| [reference/opportunity-solution-tree.md](./reference/opportunity-solution-tree.md) | Connecting an outcome to opportunities, solutions, and experiments, or triaging an unattached idea |
| [reference/success-criteria.md](./reference/success-criteria.md) | Writing the criteria block into a brief before design starts — threshold, window, counter, if-missed |
| [reference/instrumentation.md](./reference/instrumentation.md) | Naming the events and properties that make the metric readable, before handoff |
