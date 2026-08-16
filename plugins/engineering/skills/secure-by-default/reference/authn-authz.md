# Authn, Authz, Dependencies and Data

## Authn/authz

- Authenticate first (who is this), then authorize (may they do this) — they are separate checks.
- Enforce authorization on the server for every protected action, on every request. A hidden UI button is not a control.
- Never trust a client-supplied identifier (role, `userId`, tenant) without re-checking it against the session server-side.

## Dependencies & data

- Keep dependencies patched; track and remediate known vulnerabilities promptly.
- Minimize sensitive data retained — collect only what you need, delete it when its purpose ends.
- Hash passwords with a strong, salted KDF (argon2, scrypt, or bcrypt). Never store them reversibly or hash with plain SHA/MD5.
