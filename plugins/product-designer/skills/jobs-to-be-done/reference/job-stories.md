# Job Stories

```
When <situation>, I want to <motivation>, so I can <expected outcome>.
```

The situation carries the design weight: the trigger, the constraint, the time pressure, the emotional state — everything that makes this moment different from every other moment the same person opens the product.

| | User story | Job story |
| :-- | :-- | :-- |
| Form | As a `<role>`, I want `<feature>`, so that `<benefit>` | When `<situation>`, I want to `<motivation>`, so I can `<outcome>` |
| Encodes | A persona and an already-chosen solution | A circumstance and the desired progress |
| Leaves open | Nothing — you ship the named feature | Every implementation that satisfies the outcome |

`As a <role>` smuggles in two assumptions before design starts: that the role predicts the behavior, and that the named feature is the answer. Replace the role with the situation and the solution space reopens.

- *When a Slack alert tells me the build broke and I am away from my desk, I want to see which commit caused it, so I can decide whether it waits until morning.* → designs for a mobile-legible cause, not a full dashboard.
- *When a teammate joins mid-sprint, I want to hand them one link that explains what we are shipping, so I can stop repeating the same context all week.* → designs for a shareable snapshot, not an onboarding checklist.

Note what neither story names: a screen, a component, or a role.
