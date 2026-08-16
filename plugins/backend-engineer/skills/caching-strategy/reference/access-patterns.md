# Access Patterns

The read/write shape dictates the pattern. Pick one per data set.

Default to cache-aside. Reach for write-through only when readers must never see a value older than the last write. Reach for write-behind only when losing the last few writes is acceptable.
