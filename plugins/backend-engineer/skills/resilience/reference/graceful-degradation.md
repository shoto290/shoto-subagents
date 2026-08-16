# Graceful Degradation

When a **non-critical** dependency fails, return a reduced response, not a `500`. A product page whose recommendations service is down should still render the product — drop the recommendations carousel. Partial functionality beats total failure. Decide per dependency which are load-bearing for the response and which are optional; the optional ones get a fallback, not an exception that bubbles to the client.
