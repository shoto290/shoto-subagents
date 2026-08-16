# Input Validation

## Never trust external input

Anything crossing a trust boundary is untrusted: request bodies, query and path params, headers, cookies, environment variables, files on disk, and third-party API responses.

- Validate at the edge, the moment data enters — not deep inside business logic.
- Allowlist what is valid; never try to denylist what is bad. You cannot enumerate every attack.
- Normalize before validating (decode, trim, canonicalize) so a check cannot be bypassed by encoding.

```ts
const Body = z.object({ email: z.string().email(), age: z.number().int().min(0).max(120) });
const input = Body.parse(req.body); // reject anything that does not match the shape
```
