# SLO-Driven Alerting

Alert on **business and user impact**, expressed as SLOs — not raw infrastructure metrics.

- Alert on: error rate breaching budget, p99 latency exceeding the SLO, availability dropping below target.
- Do **not** page on `CPU > 80%` or `memory > 70%`. High CPU with healthy latency and error rate is not a user problem — paging on it is alert fatigue, and fatigue gets real alerts ignored.
- Define an SLO per service (e.g. "99.9% of requests succeed under 300ms p99"), derive the error budget, and alert when the budget burns too fast.

Infra metrics belong on dashboards for diagnosis, not in your pager.
