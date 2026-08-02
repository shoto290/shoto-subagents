---
name: prototyping-validation
description: Prototype fidelity and usability testing.
---

# Prototyping & Validation

A prototype exists to answer exactly one question. Write the question down in a sentence before choosing a fidelity — the fidelity is a consequence of the question, never a starting preference. Krug (*Rocket Surgery Made Easy*) reduces testing to a cheap recurring habit anyone on the team can run; Knapp (*Sprint*) gets to a testable artifact in days by faking everything not under test; the Nielsen Norman Group's sample-size work shows ~5 users per round surface the large majority of usability problems, so the discipline is many small rounds, not one large study. A prototype built without a stated question produces a demo, and a demo produces opinions instead of evidence.

## Fidelity Ladder

| Fidelity | Question it can answer | Cost | Wrong choice when |
| :-- | :-- | :-- | :-- |
| **Sketch** | Is the concept sound? Which of these three directions? | Minutes, throwaway | You need to observe navigation — nothing is clickable, so participants narrate intent instead of acting. |
| **Wireframe** | Is the content order and information hierarchy right? | Hours | The question is credibility, tone, or trust — unstyled screens make participants critique the missing design. |
| **Clickable prototype** | Can a user complete the flow unaided? Where do they hesitate? | A day or two | The flow needs real data, real input, or branching state — dead taps get read as product failure. |
| **High-fidelity prototype** | Do the visual and content decisions read as intended? | Days | The concept is still unsettled — polish suppresses honest criticism and inflates sunk cost. |
| **Coded prototype** | Does it hold up with real data, real latency, real device? | Days to weeks, and it may become production | Cheaper rungs have not answered the concept question yet — you end up debugging a build instead of a design. |

Building the artifact on a canvas — components, wiring, file hygiene — defer to `designer:figma-craft` and `designer:paper-craft`.

## Prototype Scope

- **One flow, one question.** Build only the screens the task touches; every extra screen is scope that will not be read as evidence.
- **Fake everything else.** Hard-code the happy path, use fixed data, stub the back end. If it is not under test it does not need to be real.
- **Cut the branches.** One credible path plus the one alternative you are actually comparing. Exhaustive states belong in the spec, not the prototype.
- **Disposable by construction.** Name it as throwaway at the start and keep coded prototypes out of the production repo. A prototype that drifts into the deliverable stops being cheap and starts resisting the findings.
- **State the exit.** Before testing, write what result would change the design. If no observable result would change anything, the prototype is not needed.

## Usability Test Protocol

- **Give tasks, not questions.** "Book a room in Lisbon for two nights" — not "would you use this?" Stated preference does not predict behavior.
- **Think aloud.** Ask for continuous narration. When a participant falls silent, prompt with "what are you thinking?" or "what did you expect?" — never with a hint.
- **Moderator neutrality.** Answer a question with a question: "what would you expect to happen?" These phrases break neutrality and invalidate the task: "click the button at the top", "you'd expect it there, right?", "did you notice the filter?", "exactly", "perfect", "that's the one".
- **5 users per round, then iterate.** Three rounds of 5 find far more than one round of 20, because rounds 2 and 3 test a design that has already been fixed. A 20-person batch buys precision on problems you already knew about after user 5.
- **Pilot the script first.** One throwaway session catches broken prototype links, ambiguous task wording, and tasks that run three times the estimate. Never pilot on a recruited participant.
- **Session shape.** Warm-up, 3-5 tasks in priority order, no leading debrief. Keep it under an hour; attention degrades and late tasks return noise.

Recruiting, screening, incentives, and interview technique — defer to `product-designer:user-research`.

## What To Measure

Record two layers per session: what happened, and how bad it is.

- **Task success** — scored by observation, not self-report: completed unaided / completed with help / failed. Participants routinely call a failed task a success.
- **Time on task** — completed tasks only. Compare the same task before and after a fix; never compare across different tasks.
- **Error rate** — count wrong-path actions and recoveries per task. *Where* someone goes wrong explains more than how long they took.
- **Severity** — rate every observed issue so triage is not a debate. Severity = frequency x impact x persistence.

| Rating | Meaning | Action |
| :-- | :-- | :-- |
| **4 — Catastrophic** | Blocks the task; the user cannot recover | Fix before ship |
| **3 — Major** | Completed only with difficulty or help; recurs across participants | Fix this cycle |
| **2 — Minor** | Wrong turn or delay, self-recovered | Queue |
| **1 — Cosmetic** | Noticed, no effect on the task | Fix if cheap |
| **0 — Not a problem** | One participant's preference | Discard |

## Iterate

The RITE method (Rapid Iterative Testing and Evaluation): change the prototype between sessions instead of waiting for the end of the round.

- **Fix between sessions when the defect is unambiguous** — a wrong label, a missing affordance, a broken link, a button two participants both misread. Cause is known and the fix is obvious; watching three more people hit a known defect buys nothing.
- **Batch to the end of the round when it is not** — anything needing a design decision, a tradeoff, or a guess at cause. Changing a contested design mid-round destroys the comparison: you cannot tell whether participant 4 reacted to the fix or to something else.
- **Version every mid-round change** against the session number, so each finding is read against the build that was actually tested.
- **A fix is a hypothesis** until a participant clears the task on the changed design. Re-test it in the next round.

## Beyond Usability

A usability session answers "can they use it?" It does not answer "do they want it?" or "which one performs better?"

| Instrument | Reach for it when | It answers |
| :-- | :-- | :-- |
| **A/B test** | Live traffic, two viable variants, enough volume for significance | Which variant moves one pre-declared metric — without a hypothesis fixed in advance it is dredging |
| **Fake-door test** | Demand is unproven and building is expensive | Whether anyone wants it, before any of it exists — honor the click with an honest "not ready yet" or it costs trust |
| **Concierge test** | The value proposition is unproven and can be delivered by hand | Whether the value is real, and what delivering it actually takes |
| **Wizard of Oz** | The experience must feel automated but the engine is unbuilt or costly | Whether the interaction works when a human is the intelligence behind it |

## Motion In Prototypes

This section covers **intent only** — what a transition must communicate. Every timing value, easing curve, spring config, and implementation detail defers to `design-engineer:motion`.

Apply the 12 principles of animation as questions about meaning:

- **State** — did something change, and is the change attributable? Follow-through and secondary action tie the result back to the act that caused it.
- **Spatial relationship** — where did this come from, where did it go? Arcs and staging give an element an origin, so a panel reads as coming *from* the control that opened it.
- **Continuity** — same object or new one? Shared-element movement preserves identity across screens; a hard cut asserts a new context.
- **Emphasis** — what should be looked at first? Staging and sequence order attention; anticipation signals that something is about to happen.
- **Physicality** — squash, stretch, slow in and out, and weight tell the user whether a thing is heavy, dismissible, or bounded. A rubber-band scroll edge means "no more content", not decoration.

Motion that must actually be judged requires a high-fidelity or coded prototype. Click-through prototypes approximate it, and participants react to the approximation.

## Pitfalls

- **Demoing instead of testing** — narrating screens, explaining controls, or answering "where do I click?" turns a session into a pitch. If you spoke more than the participant, you collected nothing.
- **Testing the prototype's own bugs** — a dead link or a missing screen is your defect, not a finding. Log it separately and pilot the script to catch it first.
- **Over-polishing before validating** — high fidelity on an unvalidated concept costs the most, suppresses criticism, and is the hardest to abandon.
- **Leading the participant** — hints, confirmations, tag questions, and pointing rewrite the result. Silence is the moderator's primary tool.
- **Treating one session as evidence** — one participant is an anecdote. A finding needs recurrence across participants, or severity high enough to justify acting on n=1.
