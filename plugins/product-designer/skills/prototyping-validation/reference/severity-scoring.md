# Severity Scoring

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
