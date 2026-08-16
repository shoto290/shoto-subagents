# Scaling Order

Scale in this order, stopping as soon as the load is handled:

1. **Vertical** — more CPU/RAM/IO. Simplest, no code change, buys real headroom.
2. **Read replicas** — offload read traffic. Mind **replication lag**: do not read-your-writes off a replica right after writing to the primary, or the user sees stale data. Route those reads to the primary.
3. **Sharding** — split data across nodes. Effectively **irreversible**; the **shard key** decides every future query's fan-out. Plan it before you need it. For where the scale boundary actually sits, defer to the `scalable-architecture` skill.
