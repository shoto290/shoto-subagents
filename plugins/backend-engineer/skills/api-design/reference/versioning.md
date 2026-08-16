# Versioning & Contract Stability

Treat the published contract as a long-term commitment:

- **Never remove a field.** **Never change a field's type or meaning.** Both silently break live consumers.
- **Add only optional fields** with safe defaults, so old clients keep working unchanged. This is the only non-breaking evolution.
- A genuine **breaking change requires a new version** (`/v2/...` or `Accept: application/vnd.api+json;version=2`).
- Keep only **2–3 active versions** at once, with a **documented deprecation timeline** (announce date, sunset date, migration notes). More than that is an unbounded maintenance tax.
