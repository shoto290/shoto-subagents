---
name: secure-by-default
description: Secure-by-default coding - validate input, least privilege, safe defaults.
---

# Secure by Default

Treat security as a property you build in while writing code, not a review you bolt on later. Every input is hostile until proven otherwise; every permission is denied until explicitly granted. The rules below are framework-agnostic — apply them in any language.

## Non-negotiables

- Validate at the edge with an allowlist; normalize (decode, trim, canonicalize) before validating.
- Use parameterized queries / prepared statements for every database call.
- Never pass untrusted input to a shell, `eval`, or a dynamic template.
- Encode output for the specific sink it lands in (HTML, attribute, URL, shell).
- Grant least privilege and deny by default — new routes, files, and resources start inaccessible.
- Fail closed on error and never leak internals — no stack traces, SQL, or paths to the client.
- Enforce HTTPS, `Secure` + `HttpOnly` + `SameSite` cookies, and an explicit CORS allowlist, not `*`.
- Load secrets from environment variables or a secret store; never hardcode, log, or commit them.
- Authenticate first, then authorize, re-checking client-supplied identifiers server-side.
- Hash passwords with a strong salted KDF (argon2, scrypt, bcrypt) and keep dependencies patched.

## Trust boundaries

- Untrusted input is anything crossing a boundary: request bodies, query and path params, headers, cookies, environment variables, files on disk, third-party API responses.
- Enforce authorization on the server for every protected action, on every request. A hidden UI button is not a control.
- Minimize sensitive data retained — collect only what you need, delete it when its purpose ends.
- Protected files are off-limits: `.env`, `.env.*`, `*.pem`, `*.key`, `*.cert`, `secrets/` (see AGENTS.md).

## Reference

| File | Read when |
| :-- | :-- |
| [reference/input-validation.md](./reference/input-validation.md) | Writing or reviewing the code that accepts external input, to get the edge-validation rules and the schema example. |
| [reference/injection-defense.md](./reference/injection-defense.md) | Building a database query, a shell call, a template, or any output sink, to get the escaping and parameterization rules. |
| [reference/secrets-and-config.md](./reference/secrets-and-config.md) | Handling credentials, tokens, permissions, error responses, cookies, or CORS configuration. |
| [reference/authn-authz.md](./reference/authn-authz.md) | Adding or changing a login flow, a permission check, a password hash, or a dependency. |
| [reference/checklist.md](./reference/checklist.md) | Verifying a change before returning it, to run the full pass/fail security checklist. |
