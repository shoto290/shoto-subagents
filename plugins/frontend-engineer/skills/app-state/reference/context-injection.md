# Context Injection

## Context Is Injection, Not State

Context passes things that are fixed for a subtree: a query client, a theme, a feature-flag reader, the current tenant. Every consumer re-renders when the context value changes, so it is the wrong home for anything high-churn — form drafts, cursor position, scroll offset. Those stay local or go in a store.

Context is also how you scope a store: when two instances of the same feature can be on screen at once, create the store per subtree and provide it, instead of exporting a module-level singleton.
