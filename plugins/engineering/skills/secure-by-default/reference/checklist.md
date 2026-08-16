# Pass/Fail Checklist

- [ ] Every external input is validated at the edge with an allowlist.
- [ ] All database access uses parameterized queries.
- [ ] No untrusted input reaches a shell, `eval`, or dynamic template.
- [ ] Output is encoded for its specific sink.
- [ ] Permissions, tokens, and roles follow least privilege and deny-by-default.
- [ ] Errors fail closed and never leak internals to the client.
- [ ] HTTPS, secure cookies, and an explicit CORS allowlist are in place.
- [ ] No secret is hardcoded, logged, or committed; secrets load from env/store.
- [ ] Authorization is checked server-side on every protected request.
- [ ] Passwords are hashed with a strong salted KDF and dependencies are patched.
