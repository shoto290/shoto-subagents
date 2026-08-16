# Thin Abstractions Only

Apply these patterns where they **cut** complexity, not reflexively. One persistence path and no tests asking for a seam? A repository interface is ceremony — use the ORM directly until a second implementation or a test forces the abstraction. A factory that only wraps `new` adds a layer and hides nothing. Add the seam when a real need arrives (per YAGNI; defer to `solid-dry-kiss-yagni`).
