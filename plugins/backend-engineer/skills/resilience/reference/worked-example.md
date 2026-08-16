# Worked Example

A call wrapped with timeout, per-dependency circuit breaker, and bounded backoff retry (pseudocode):

```
function callPricing(req):
    if breaker.isOpen():
        return cachedPriceOr(default)          # fail fast, degrade

    for attempt in 0..MAX_RETRIES:             # MAX_RETRIES capped, e.g. 3
        try:
            res = http.get(pricingUrl, req,
                           connectTimeout=200ms,
                           readTimeout=800ms)   # timeout everything
            breaker.recordSuccess()
            return res
        catch (Timeout | ServerError) as e:    # transient only
            breaker.recordFailure()            # opens after N consecutive
            if breaker.isOpen():
                break
            sleep(min(BASE * 2^attempt, MAX_DELAY) + random_jitter())
        catch ClientError:
            throw                              # 4xx: do not retry

    return cachedPriceOr(default)              # graceful degradation
```

Note the call runs on the pricing dependency's own bounded pool (bulkhead) and the request is a read, so retrying is safe; a charge would carry an idempotency key instead.
