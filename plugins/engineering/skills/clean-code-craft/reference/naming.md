# Naming

Names reveal intent. The reader should never decode them.

- Verbs for functions (`fetchUser`, `isExpired`), nouns for values (`user`, `retryCount`).
- Booleans as predicates: `isActive`, `hasAccess`, `shouldRetry`.
- No abbreviations, no single letters — except a loop index (`i`, `j`).

```ts
// Before
function d(u: User): number { return Date.now() - u.t; }
```

```ts
// After
function accountAgeMs(user: User): number {
  return Date.now() - user.createdAt;
}
```

## Scope-length rule

Name length tracks scope. A tight, short-lived scope tolerates a short name; a wide or long-lived one demands a descriptive one.

```ts
for (let i = 0; i < items.length; i++) process(items[i]);
export const MAX_LOGIN_ATTEMPTS_BEFORE_LOCKOUT = 5;
```

## Self-documenting over comments

A comment that restates the code is a smell. Extract a well-named function or constant instead.

```ts
// Before
if (user.age >= 18 && user.country === "US") allow();
```

```ts
// After
const isEligibleAdult = user.age >= LEGAL_AGE && user.country === "US";
if (isEligibleAdult) allow();
```
