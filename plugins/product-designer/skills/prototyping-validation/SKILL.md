---
name: prototyping-validation
description: Prototype fidelity and usability testing.
---

# Prototyping & Validation

A prototype exists to answer exactly one question. Write the question down in a sentence before choosing a fidelity — the fidelity is a consequence of the question, never a starting preference. Krug (*Rocket Surgery Made Easy*) reduces testing to a cheap recurring habit anyone on the team can run; Knapp (*Sprint*) gets to a testable artifact in days by faking everything not under test; the Nielsen Norman Group's sample-size work shows ~5 users per round surface the large majority of usability problems, so the discipline is many small rounds, not one large study. A prototype built without a stated question produces a demo, and a demo produces opinions instead of evidence.

## Non-Negotiables

- **One flow, one question.** Build only the screens the task touches; every extra screen is scope that will not be read as evidence.
- **Fake everything else.** Hard-code the happy path, use fixed data, stub the back end. If it is not under test it does not need to be real.
- **Cut the branches.** One credible path plus the one alternative you are actually comparing. Exhaustive states belong in the spec, not the prototype.
- **Disposable by construction.** Name it as throwaway at the start and keep coded prototypes out of the production repo. A prototype that drifts into the deliverable stops being cheap and starts resisting the findings.
- **State the exit.** Before testing, write what result would change the design. If no observable result would change anything, the prototype is not needed.
- **Give tasks, not questions, and stay neutral.** 5 users per round, then iterate.
- **Record two layers per session:** what happened, and how bad it is.
- **A usability session answers "can they use it?"** It does not answer "do they want it?" or "which one performs better?"
- **Motion is judged for intent only.** Every timing value, easing curve, spring config, and implementation detail defers to `design-engineer:motion`.

## Pitfalls

- **Demoing instead of testing** — narrating screens, explaining controls, or answering "where do I click?" turns a session into a pitch. If you spoke more than the participant, you collected nothing.
- **Testing the prototype's own bugs** — a dead link or a missing screen is your defect, not a finding. Log it separately and pilot the script to catch it first.
- **Over-polishing before validating** — high fidelity on an unvalidated concept costs the most, suppresses criticism, and is the hardest to abandon.
- **Leading the participant** — hints, confirmations, tag questions, and pointing rewrite the result. Silence is the moderator's primary tool.
- **Treating one session as evidence** — one participant is an anecdote. A finding needs recurrence across participants, or severity high enough to justify acting on n=1.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/fidelity-ladder.md](./reference/fidelity-ladder.md) | Choosing between sketch, wireframe, clickable, high-fidelity, or coded for a stated question. |
| [reference/usability-test-protocol.md](./reference/usability-test-protocol.md) | Writing the task script, shaping the session, or moderating without leading. |
| [reference/severity-scoring.md](./reference/severity-scoring.md) | Scoring what was observed and triaging issues from catastrophic to not-a-problem. |
| [reference/rite-iteration.md](./reference/rite-iteration.md) | Deciding whether to fix between sessions or batch to the end of the round. |
| [reference/validation-instruments.md](./reference/validation-instruments.md) | The question is demand, value, or variant performance rather than usability. |
| [reference/motion-intent.md](./reference/motion-intent.md) | Judging what a transition must communicate inside a prototype. |
