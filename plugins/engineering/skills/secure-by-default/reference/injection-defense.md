# Injection Defense

- Use parameterized queries / prepared statements for every database call. Never string-concatenate SQL, NoSQL, or LDAP filters.
- Encode output for the specific sink it lands in (HTML, attribute, URL, shell). The right escape depends on the destination.
- Never pass untrusted input to a shell, `eval`, or a dynamic template. Prefer argument arrays over a shell string.

```ts
db.query('SELECT * FROM users WHERE id = $1', [userId]); // never `... WHERE id = ${userId}`
```
