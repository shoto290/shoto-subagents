---
name: jobs-to-be-done
description: Framing demand with JTBD and job stories.
---

# Jobs To Be Done

Nobody wants a product; they hire one to make progress in a circumstance. One rule governs everything below: **the job is stable, the solution is disposable.** The milkshake never changed — the commute did (Christensen, *Competing Against Luck*). Design against the progress a person is trying to make, not the artifact they currently use, and the roadmap survives the next technology shift. Alan Klement sharpened this into demand-side thinking: study why people switch, not what they say they like. The Intercom job-stories practice turned it into a writing form a backlog can actually carry.

## Job Statement

A job is a **verb phrase describing progress in a circumstance**. Never a persona attribute, a demographic, a role, or a feature. If the sentence stops being true when the technology changes, it was not a job.

| Dimension | Question it answers | Example |
| :-- | :-- | :-- |
| **Functional** | What task must get done? | Get a client invoiced without rebuilding it by hand |
| **Emotional** | How does the person want to feel? | Confident nothing was missed before hitting send |
| **Social** | How do they want to be seen? | Seen as the organized freelancer, not the one who chases payment |

Write all three or you will optimize the functional one and lose the switch — people switch for the emotional and social dimensions far more often than the spec suggests.

- Bad — *"Millennial freelancers want a modern invoicing dashboard."* Persona + demographic + solution. Nothing to design against.
- Good — *"When a project wraps, bill the client fast enough that cash arrives before my own bills, without looking sloppy."* Circumstance, progress, and a felt stake.

Personas, empathy maps, and journey artifacts are a different instrument — defer to `product-designer:personas-journeys`. A persona describes who someone is; a job describes what they are trying to accomplish. Neither substitutes for the other.

## Job Stories

```
When <situation>, I want to <motivation>, so I can <expected outcome>.
```

The situation carries the design weight: the trigger, the constraint, the time pressure, the emotional state — everything that makes this moment different from every other moment the same person opens the product.

| | User story | Job story |
| :-- | :-- | :-- |
| Form | As a `<role>`, I want `<feature>`, so that `<benefit>` | When `<situation>`, I want to `<motivation>`, so I can `<outcome>` |
| Encodes | A persona and an already-chosen solution | A circumstance and the desired progress |
| Leaves open | Nothing — you ship the named feature | Every implementation that satisfies the outcome |

`As a <role>` smuggles in two assumptions before design starts: that the role predicts the behavior, and that the named feature is the answer. Replace the role with the situation and the solution space reopens.

- *When a Slack alert tells me the build broke and I am away from my desk, I want to see which commit caused it, so I can decide whether it waits until morning.* → designs for a mobile-legible cause, not a full dashboard.
- *When a teammate joins mid-sprint, I want to hand them one link that explains what we are shipping, so I can stop repeating the same context all week.* → designs for a shareable snapshot, not an onboarding checklist.

Note what neither story names: a screen, a component, or a role.

## Forces Of Progress

Four forces act on every switch. Two push toward the new solution, two hold the person in place.

| Force | Direction | What it is |
| :-- | :-- | :-- |
| **Push** of the situation | → switch | The problem with today that made the person start looking |
| **Pull** of the new solution | → switch | The specific better outcome the new thing promises |
| **Habit** of the present | ← stay | Sunk investment, muscle memory, "it mostly works" |
| **Anxiety** about the new | ← stay | Migration cost, fear of losing data, fear of looking foolish |

**For every design decision, name the force it moves.** A change that moves no force is decoration. Teams over-invest in pull — more features, louder value prop — while habit and anxiety are what actually block the switch. Removing anxiety (import existing data, undo everything, no card required) converts more than adding pull.

## Switch Interviews

Reconstruct the timeline of an **actual switch**, in order, anchored on one real purchase the person already made. Hypotheticals produce fiction: ask what they did, never what they would do.

| Moment | What to recover |
| :-- | :-- |
| **First thought** | What happened the day they first thought "there has to be something better"? |
| **Passive looking** | What did they notice but not act on, and for how long? |
| **Active looking** | What did they search, trial, or ask? Who did they talk to? |
| **Deciding event** | What forced the decision that week rather than the next one? |
| **First use** | What did they do in the first hour, and what almost sent them back? |

Anchor every answer to an artifact — the receipt, the calendar entry, the thread — so the timeline is memory rather than narrative. The purchase date is the spine; walk backward from it.

Interview mechanics, recruiting, and synthesis are a separate craft — defer to `product-designer:user-research`.

## From Job To Requirement

A job that never reaches the backlog changes nothing. Translate it in one pass:

| Layer | Output |
| :-- | :-- |
| **Job story** | When a project wraps, bill the client fast enough that cash arrives before my own bills |
| **Force targeted** | Anxiety — "I will have to retype every line" |
| **Acceptance criterion** | From a finished project, a sendable invoice exists in under 60 seconds with no manual line-item entry |
| **Design constraint** | Line items derive from tracked work; manual entry is the escape hatch, not the path |
| **Measure** | Time from project-complete to invoice-sent, p50 and p90 |

The criterion must be **falsifiable** (a number, a time, a count), the constraint must **forbid** something (otherwise it is a preference), and the measure must be observable in production. Carry the job story into the ticket verbatim — the moment it is paraphrased into a feature title, the circumstance is lost and the next reviewer optimizes the artifact.

## Pitfalls

- **Jobs written as features** — "user wants bulk export" is a solution wearing a job's clothes. Ask what the export is *for* and write that instead.
- **Over-segmenting into micro-jobs** — forty jobs is a task list, not a demand model. At that grain you are describing UI steps, not progress.
- **Treating a persona as a job** — "the busy manager" is not something anyone is trying to accomplish. Demographics predict almost nothing about the circumstance.
- **Inventing jobs with no interview behind them** — a workshop-generated job is the team's assumptions with better formatting. Every job traces to a switch someone actually made.
- **Solution-shaped job statements** — if the job can only be satisfied by the thing you already built, you wrote the answer and reverse-engineered the question.
