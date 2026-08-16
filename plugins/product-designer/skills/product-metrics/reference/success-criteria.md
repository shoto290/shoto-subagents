# Success Criteria

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
