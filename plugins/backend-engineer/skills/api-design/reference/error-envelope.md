# Consistent Error Envelope

Every error response — across every endpoint — shares **one schema**:

- `status` — the HTTP status code.
- `code` — a stable, machine-readable error code (`VALIDATION_FAILED`, not a prose string).
- `message` — a human-readable summary.
- `errors` — optional field-level validation details.
- `request_id` — a request/correlation id for tracing and support.

Rules:

- **Return all validation errors at once**, not one at a time — clients fix the whole form in one round trip.
- **Never leak stack traces, SQL, or internal file paths** to clients. Log those server-side; return the stable `code` and `request_id`.

## Worked Snippet — Error Envelope

A language-agnostic error response for a failed `POST /users` with two invalid fields:

```json
{
  "status": 422,
  "code": "VALIDATION_FAILED",
  "message": "The request could not be processed.",
  "errors": [
    { "field": "email", "code": "INVALID_FORMAT", "message": "Email is not a valid address." },
    { "field": "age", "code": "OUT_OF_RANGE", "message": "Age must be 18 or older." }
  ],
  "request_id": "req_01HZX9F3KQ2"
}
```

Every endpoint returns this exact shape on error — clients write one parser, not one per route.
