---
name: personas-journeys
description: Personas, empathy maps, and journey mapping.
---

# Personas & Journeys

Models of who the user is and what path they take. Every model below is judged by one rule: **an artifact that changes no decision is decoration** — each one must name the decision it unblocks, or it should not be made. Ground the mapping craft in the Nielsen Norman Group journey-mapping literature (journey vs experience map vs service blueprint, the line of visibility) and the facilitation formats in Gray, Brown & Macanufo's *Gamestorming*. For motivation and demand framing — why the user hires the product at all — defer to `product-designer:jobs-to-be-done`. For gathering the evidence these artifacts are built from, defer to `product-designer:user-research`.

## Personas

A persona is a decision-making tool, not a biography. It exists to settle arguments about who wins when two needs conflict.

- **Evidence-backed, never invented** — every attribute traces to a source: interview transcripts, support tickets, session recordings, analytics segments. A persona assembled from assumption is the team's bias with a face on it, and it defends itself against contradicting data.
- **Behavioral segments over demographics** — "34, urban, marketing manager" predicts nothing about the interface. "Renews manually because she does not trust auto-renew" predicts the flow, the copy, and the default. Segment on behavior, motivation, and tool fluency.
- **Four mandatory contents** — a persona is unusable without all four: **goals** (what success looks like to them), **context** (where, when, on what device, under what pressure), **constraints** (budget, permissions, skill, time, approval chain), and **current workaround** (the spreadsheet, the competitor, the colleague they ask — the thing you must actually beat).
- **Name the decision** — each persona states what it resolves: which flow gets the default, what gets cut, whose vocabulary the copy adopts. A persona that has never settled a disagreement is not earning its cost.
- **Keep the set small and ranked** — 3-5 personas, exactly one primary per product surface. If satisfying the primary conflicts with a secondary, the primary wins by definition; that ranking is the whole point of having more than one.
- **The anti-persona** — explicitly name who you are **not** designing for, and why. This is the sharpest part of the artifact: it is the only part that can reject a feature request. A team with personas but no anti-persona has no scope, so every request is in scope and the roadmap is decided by whoever asked last.

## Empathy Map

A four-quadrant snapshot of one persona at one moment (*Gamestorming*). Build it after research and before the journey map, when the evidence is raw and has no structure yet.

| Quadrant | What it captures | Typical evidence |
| :-- | :-- | :-- |
| **Says** | Verbatim quotes, the words they use for the domain | Interview transcript, support ticket, sales call |
| **Thinks** | Beliefs held but not spoken — doubt, suspicion, status concern | Hesitation in recordings, indirect answers, diary study |
| **Does** | Observed behavior, actual sequence, workarounds | Session recording, analytics funnel, contextual inquiry |
| **Feels** | Emotional state and its intensity: anxiety, relief, frustration | Tone, body language, unprompted complaints |

**The contradictions between quadrants are the finding, not a defect.** Says "I want more options" / Does "picks the default every time" is a design instruction, not noise to reconcile. Says "security matters most" / Thinks "this will slow me down" tells you exactly where the flow will be bypassed. Record the gap verbatim and carry it into the journey map as a pain point; smoothing it into a consistent story deletes the only insight the exercise produced.

## Journey Map

**One persona, one scenario, one map.** A map that averages personas or spans several scenarios describes nobody. Scope it with an explicit start trigger and end trigger, and map the **current** state before designing a future one.

| Column | Contents | Cost of omitting it |
| :-- | :-- | :-- |
| **Phases** | 4-7 named stages, in the user's language, not the funnel's | Map reverts to an internal process diagram |
| **Actions** | What the user actually does in each phase, including workarounds | Steps get idealized into what you wish they did |
| **Touchpoints** | Every surface hit: app, email, invoice, phone, third party | Ownership gaps between teams stay invisible |
| **Emotion curve** | Sentiment per phase, plotted as a line, with the reason for each move | Nothing tells you which pain to fix first |
| **Pain points** | The specific friction, quoted where possible | Findings degrade into generic "improve UX" |
| **Opportunities** | Candidate intervention per pain, with owner | Insight never converts into backlog |
| **Evidence** | Source per row: participant ID, ticket number, analytics event | The map becomes unfalsifiable fiction nobody can challenge |

- The **evidence column is not optional**. Any row without a source is a hypothesis and must be visibly marked as one.
- **Map the failure paths**, not just the success path: the abandoned checkout, the rejected upload, the password reset, the support call. That is where the emotion curve actually bottoms out.
- The **low point of the curve is the prioritization handle** — combined with the peak-end effect, the trough and the final phase carry disproportionate weight in how the whole experience is remembered.
- Mark **handoffs between teams** on the map. Most severe pain sits in the seams, where no single team owns the touchpoint.

## Experience Map & Service Blueprint

Three related artifacts with different scopes. Pick by what you need to change, and escalate only when the current one cannot explain the pain.

| Artifact | Scope | Stage covered | Escalate to it when |
| :-- | :-- | :-- | :-- |
| **Journey map** | One persona, one scenario, your product | Front-stage only | Default starting point — you know your user and want to fix their path |
| **Experience map** | Generic human behavior across the whole problem space, product-agnostic, no single persona | Front-stage across every provider, yours included | You do not yet know your users or your product's role; map the territory before claiming a position in it |
| **Service blueprint** | One journey plus everything behind the line of visibility: frontline staff, backstage actions, support processes, systems | Front-stage **and** backstage **and** support | The pain is operational, not interface-level: handoffs, staffing, latency, systems that cannot deliver what the UI promises |

- The **line of interaction** separates the user from the service; the **line of visibility** separates what the user sees from what happens behind it. A blueprint is worth the cost only when you intend to change something below that line.
- Do not open a blueprint to fix a button. Do not try to fix a broken fulfilment process with a journey map.

## Storyboard

Narrative frames of a flow, drawn **before any screen is designed**. The sequence and the context are decided first; layout comes after and is constrained by them.

- **6-8 frames**, each carrying one moment: trigger, context, action, consequence. If it needs 20 frames, the scenario is too broad.
- **Deliberately low fidelity** — stick figures and boxes. High-fidelity frames move the critique to visual polish and away from whether the sequence makes sense.
- **Include the frame before and the frame after the product.** Flows fail at entry and exit — the interruption, the notification that never arrived, the return two weeks later — far more often than in the middle.
- Draw the **failure branch** as its own strip. A storyboard with no recovery frame will ship a flow with no recovery path.
- Build these artifacts on a shared canvas rather than in a document; for the canvas mechanics defer to `designer:figma-craft` and `designer:paper-craft`.

## Pitfalls

- **Persona theater** — stock photos, invented names, fabricated hobbies, zero traceable evidence. It looks like research, immunizes the team against real users, and cannot be challenged because there is nothing to check.
- **Journey maps with no evidence column** — an unsourced map is a group opinion in an authoritative format, and it will outlive the data that never supported it.
- **Mapping only the happy path** — the phases where the emotion curve collapses are precisely the ones left off the map, so the map validates the product instead of interrogating it.
- **One map serving every persona** — averaging personas or scenarios produces a path no real user takes, and every finding it yields is too generic to act on.
- **Artifacts never revisited after the workshop** — a persona or map that is not re-checked against new evidence each cycle becomes a stale constraint the team obeys long after the users have moved.
