# Eviction

When the cache hits its memory limit it evicts to make room. The policy must match the workload or it will throw out exactly the data you need under load.

- **LRU** (least recently used) — the general default. Keeps what was touched most recently.
- **LFU** (least frequently used) — better for skewed popularity where a stable hot set is read far more than the long tail.
- Match the policy to access reality: a pure-recency policy on a workload with a stable hot set evicts hot data during a burst of one-off reads.
