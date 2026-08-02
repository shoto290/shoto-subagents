---
name: product-metrics
description: Outcome metrics and success criteria before design.
---

# Product Metrics

Measurement is not a phase after launch — it is the constraint that makes a design decidable. The whole discipline reduces to one rule: **define the outcome before the solution.** A design with no success criterion cannot be wrong, and therefore cannot be right; it can only be argued about. Seiden (*Outcomes Over Output*) supplies the unit of value — a changed human behavior. Torres (*Continuous Discovery Habits*) supplies the structure that connects that outcome to what you actually build. Google's HEART framework supplies the vocabulary for turning a fuzzy goal into a signal and a number.

## Outcomes vs Outputs

A shipped feature is not a changed behavior. "Launch the new onboarding flow" is an output — it is true the day it merges, regardless of whether anyone onboards better.

- Write the behavior change you expect **in one sentence**, before anything is designed: *who* does *what* differently, *how much more* than today.
- Test the sentence: if it can be satisfied by the feature existing, it is an output. Rewrite it.
- Output: "ship receipt scanning." Outcome: "expense submitters capture a receipt within 2 days of the transaction instead of batching at month end."
- Outputs belong in the roadmap. Outcomes belong in the brief, and they are what the design is judged against.

## HEART

Every metric descends the same ladder — **goal** (what better looks like) → **signal** (the observable behavior that moves when the goal is met) → **metric** (the number, with a denominator). Pick two or three dimensions, not all five; a scorecard with five equal priorities has none.

| Dimension | Goal | Signal | Metric |
| :-- | :-- | :-- | :-- |
| **Happiness** | Submitters trust the tool with a receipt | Post-submit rating; tickets about lost receipts | CSAT ≥ 4.2/5 on submit; < 2% of submissions raise a ticket |
| **Engagement** | Receipts captured as spend happens, not batched | Lag between transaction and capture | Median transaction → capture lag < 2 days |
| **Adoption** | New hires file their first report unaided | First report submitted without a support contact | 70% of new hires submit within 7 days of account creation |
| **Retention** | Occasional travelers return next cycle | Repeat submission in the following quarter | 60% of Q1 submitters also submit in Q2 |
| **Task success** | A report is right the first time | Rejections and post-submit edits | First-pass approval rate ≥ 85%; median submit time < 4 min |

Task success measured **inside a usability session** — task completion rate, time on task, error rate — is study protocol, not product telemetry; for running and scoring those sessions defer to `product-designer:prototyping-validation`.

## North Star & Counter-Metrics

One north star metric per product surface. It must be a leading indicator of delivered value, phrased as a rate or a ratio so it cannot be inflated by growth alone. Every north star ships with at least one **guardrail** that goes bad when the north star is gamed.

| North star | Gamed by | Guardrail |
| :-- | :-- | :-- |
| Tickets resolved per agent per day | Closing tickets without solving them | 7-day reopen rate; resolution CSAT |
| Pageviews per session | Splitting articles across paginated slides | Scroll completion; return visitors in 7 days |
| Weekly active users | Notification blasts that drive a bounce | Session depth; notification opt-out rate |

Worked failure: a support org set **tickets resolved per agent per day** as its north star, and resolution volume rose 30% in a quarter. Nothing was fixed — agents were closing tickets on first reply and letting users reopen them. The guardrail that would have caught it on week one is the **7-day reopen rate**, which rose in lockstep and was not on the dashboard. Define the guardrail at the same moment as the north star, never after the number moves.

## Opportunity Solution Tree

Torres's structure keeps the connection between what you build and why:

```
Outcome        median transaction → capture lag < 2 days
  ├─ Opportunity  "I lose paper receipts before I get back to my desk"
  │    ├─ Solution     capture from the phone camera at the point of sale
  │    │    └─ Experiment  fake-door on the mobile home screen — target > 15% tap rate
  │    └─ Solution     forward receipt emails to a per-user inbox address
  │         └─ Experiment  concierge test with 10 travelers for 2 weeks
  └─ Opportunity  "I do not know which expenses still need a receipt"
       └─ Solution     pending-receipt digest
```

- Opportunities are **discovered, not invented** — they come from interviews and observed behavior; for gathering that qualitative evidence defer to `product-designer:user-research`.
- An opportunity is a user need or friction stated in the user's words, never a solution in disguise ("needs a bulk upload button" is a solution).
- Attach every design idea to exactly one opportunity, and that opportunity to exactly one outcome. **An idea that attaches to no opportunity does not get built** — it goes back to discovery or it is dropped.
- Compare solutions *within* one opportunity, not across the whole backlog; that is the only comparison where the outcome is held constant.

## Success Criteria

Written into the brief **before design starts**, not reconstructed after launch. A criterion is incomplete without a threshold, a window, and a stated consequence.

```
Outcome:     expense submitters capture receipts within 2 days of the transaction
Metric:      median transaction → capture lag (baseline: 11 days)
Threshold:   < 2 days
Window:      4 weeks post-rollout, minimum 500 submissions
Counter:     duplicate-submission rate stays < 1.5%
If missed:   one iteration on the capture flow, then revert — decided now, not later
```

- **Threshold** is an absolute number against a stated baseline. "Improve engagement" is not a threshold.
- **Window** carries a minimum sample; a threshold hit on 12 events is noise.
- **If missed** is pre-committed — revert, iterate once, or kill. Writing it before the result is what stops the goalpost from moving.
- Name an **owner** on the line. A metric with no owner is a chart, not a criterion.

## Instrumentation Handoff

The metric is unreadable if the events do not exist. Name them at definition time, in the brief, alongside the criterion — not in a rush the week after launch.

| Event | Properties | Serves |
| :-- | :-- | :-- |
| `receipt_captured` | `source` (camera \| email \| upload), `transaction_at`, `captured_at` | Engagement — lag metric |
| `report_submitted` | `line_count`, `has_missing_receipt`, `duration_ms` | Task success; submit time |
| `report_rejected` | `reason`, `submitted_at` | First-pass approval rate; counter-metric |

- Every metric in the criteria block traces to at least one named event, and every event names its denominator population.
- Specify the property values, not just the property names — an unbounded `source` string becomes uncountable within a month.
- No PII in properties. Identify users by a stable pseudonymous id.
- Verify the events fire in staging **before** the design ships; a metric first checked at launch is a metric measured from zero.

## Pitfalls

- **Vanity metrics** — totals that only go up (cumulative signups, all-time pageviews). They cannot fall, so they cannot inform a decision. Use rates and ratios over a window.
- **Measuring the output** — "flow shipped", "adoption of the new screen". The screen being used says nothing about the behavior it was built to change.
- **Moving the goalpost** — reading the result, then deciding which number counted. The threshold and the consequence are both fixed before launch or neither is real.
- **No counter-metric** — a north star with no guardrail will be optimized into damage, and the damage lands in a number nobody is watching.
- **A metric no one owns** — an unowned dashboard is not measurement. One named person reports the number at the end of the window and states what happens next.
