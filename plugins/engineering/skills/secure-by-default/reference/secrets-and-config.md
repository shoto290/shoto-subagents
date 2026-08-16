# Secrets and Config

## Least privilege

- Grant the minimum scope, permission, or role needed — nothing speculative.
- Issue narrow, short-lived tokens scoped to one job; do not reuse an admin credential for routine work.
- Deny by default. New routes, files, and resources start inaccessible and are opened deliberately.

## Safe defaults

- Ship secure configuration out of the box; the default mode is the locked-down mode.
- Fail closed: on error, deny access rather than letting the request through.
- Never leak internals in errors — no stack traces, SQL, or paths to the client. Log details server-side, return a generic message.
- Enforce HTTPS, set `Secure` + `HttpOnly` + `SameSite` cookies, and configure CORS to an explicit allowlist, not `*`.

## Secret handling

- Never hardcode secrets in source and never log them.
- Load secrets from environment variables or a secret store at runtime.
- Never commit secrets. This repo's protected files are off-limits: `.env`, `.env.*`, `*.pem`, `*.key`, `*.cert`, and `secrets/` (see AGENTS.md).
- Redact tokens, passwords, and keys before anything reaches logs or telemetry.

```ts
const apiKey = process.env.API_KEY; // not a literal in the file
logger.info('charged user', { userId }); // never log apiKey or the card number
```
