# Idempotency

`GET`, `PUT`, and `DELETE` are naturally idempotent: repeating them yields the same end state. `POST` is not — retry it and you create two orders.

For any `POST` that **must be retry-safe** (payments, order creation, anything that moves money or state), require an **idempotency key**:

- The client generates a unique key per logical operation and sends it as `Idempotency-Key: <uuid>`.
- The server stores the key with the first result. A retry with the same key returns the **stored** result instead of re-applying the operation.
- This makes a request safe to retry after a network failure (where the client never saw the response) without double-charging or double-creating.

Without it, every dropped response on a `POST` is a potential duplicate.
