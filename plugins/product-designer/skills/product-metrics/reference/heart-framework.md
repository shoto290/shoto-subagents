# HEART Framework

Google's HEART framework supplies the vocabulary for turning a fuzzy goal into a signal and a number.

Every metric descends the same ladder — **goal** (what better looks like) → **signal** (the observable behavior that moves when the goal is met) → **metric** (the number, with a denominator). Pick two or three dimensions, not all five; a scorecard with five equal priorities has none.

| Dimension | Goal | Signal | Metric |
| :-- | :-- | :-- | :-- |
| **Happiness** | Submitters trust the tool with a receipt | Post-submit rating; tickets about lost receipts | CSAT ≥ 4.2/5 on submit; < 2% of submissions raise a ticket |
| **Engagement** | Receipts captured as spend happens, not batched | Lag between transaction and capture | Median transaction → capture lag < 2 days |
| **Adoption** | New hires file their first report unaided | First report submitted without a support contact | 70% of new hires submit within 7 days of account creation |
| **Retention** | Occasional travelers return next cycle | Repeat submission in the following quarter | 60% of Q1 submitters also submit in Q2 |
| **Task success** | A report is right the first time | Rejections and post-submit edits | First-pass approval rate ≥ 85%; median submit time < 4 min |

Task success measured **inside a usability session** — task completion rate, time on task, error rate — is study protocol, not product telemetry; for running and scoring those sessions defer to `product-designer:prototyping-validation`.
