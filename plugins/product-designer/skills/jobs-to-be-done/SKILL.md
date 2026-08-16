---
name: jobs-to-be-done
description: Framing demand with JTBD and job stories.
---

# Jobs To Be Done

Nobody wants a product; they hire one to make progress in a circumstance. One rule governs everything below: **the job is stable, the solution is disposable.** The milkshake never changed — the commute did (Christensen, *Competing Against Luck*). Design against the progress a person is trying to make, not the artifact they currently use, and the roadmap survives the next technology shift. Alan Klement sharpened this into demand-side thinking: study why people switch, not what they say they like. The Intercom job-stories practice turned it into a writing form a backlog can actually carry.

## Rules

- A job is a **verb phrase describing progress in a circumstance**. Never a persona attribute, a demographic, a role, or a feature.
- Write all three dimensions — functional, emotional, social — or you will optimize the functional one and lose the switch.
- Write demand as `When <situation>, I want to <motivation>, so I can <expected outcome>.` — the situation carries the design weight.
- **For every design decision, name the force it moves.** A change that moves no force is decoration.
- Reconstruct the timeline of an **actual switch**, anchored on one real purchase: ask what they did, never what they would do.
- The acceptance criterion must be **falsifiable**, the constraint must **forbid** something, the measure must be observable in production.

## Pitfalls

- **Jobs written as features** — "user wants bulk export" is a solution wearing a job's clothes. Ask what the export is *for* and write that instead.
- **Over-segmenting into micro-jobs** — forty jobs is a task list, not a demand model. At that grain you are describing UI steps, not progress.
- **Treating a persona as a job** — "the busy manager" is not something anyone is trying to accomplish. Demographics predict almost nothing about the circumstance.
- **Inventing jobs with no interview behind them** — a workshop-generated job is the team's assumptions with better formatting. Every job traces to a switch someone actually made.
- **Solution-shaped job statements** — if the job can only be satisfied by the thing you already built, you wrote the answer and reverse-engineered the question.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/job-statements.md](./reference/job-statements.md) | Writing or reviewing a job statement, or separating a job from a persona |
| [reference/job-stories.md](./reference/job-stories.md) | Turning demand into backlog-ready job stories, or replacing `As a <role>` user stories |
| [reference/forces-of-progress.md](./reference/forces-of-progress.md) | Diagnosing why people do or do not switch, or naming the force a design decision moves |
| [reference/switch-interviews.md](./reference/switch-interviews.md) | Planning or running an interview that reconstructs a real switch timeline |
| [reference/job-to-requirement.md](./reference/job-to-requirement.md) | Translating a job into acceptance criteria, design constraints, and a measure |
