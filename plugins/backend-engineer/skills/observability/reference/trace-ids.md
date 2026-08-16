# Correlation / Trace IDs

A `trace_id` on **every log line** is non-negotiable. Generate it at the edge (ingress, API gateway) and propagate it through every downstream call (HTTP headers, message metadata). Without it, reconstructing one request across services is impossible — you are guessing from interleaved, unrelated lines.

With a `trace_id` you filter the entire fleet's logs to a single request and read its story in order, no matter how many services it crossed.
