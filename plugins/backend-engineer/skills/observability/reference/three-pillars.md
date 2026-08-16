# The Three Pillars

All three are required. Each answers a different question; none substitutes for another.

| Pillar | What it is | Answers |
| :-- | :-- | :-- |
| **Logs** | Discrete events with context, one per occurrence | "What happened at this exact point?" |
| **Metrics** | Quantitative measurements aggregated over time | "How much / how often / how fast, as a trend?" |
| **Traces** | One request's path across every service it touches | "Where did the time go and where did it fail?" |

Logs explain a single event. Metrics show trends and trigger alerts. Traces stitch a request across service boundaries. A system with only logs cannot trend; with only metrics cannot explain; with neither trace cannot follow a distributed request.
