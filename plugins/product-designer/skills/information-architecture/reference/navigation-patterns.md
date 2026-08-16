# Navigation Patterns

## Taxonomy & Labeling

- Use the users' vocabulary, not internal vocabulary. Source labels from search logs, support tickets, and the words users say unprompted in interviews — not from database table names or team names.
- **One label per concept.** The same thing is called the same thing in navigation, page title, breadcrumb, button, and empty state.
- **No synonyms competing in the same navigation.** "Reports" next to "Analytics" next to "Insights" forces a guess on every visit; pick one and retire the others.
- Avoid invented brand words for functional destinations. A clever name adds a translation step to every task.
- **Test a label** before shipping it: ask users to describe the thing unprompted (do they say your word?), then run a tree test where the task wording deliberately avoids the label — if success depends on the task echoing the label, the label is not understood, only matched.

## Navigation Types

| Type | Carries | Depth vs. breadth | Failure mode |
| :-- | :-- | :-- | :-- |
| **Global** | Top-level sections, present on every screen. The product's mental model. | Broad and shallow — 5-7 items. Every added item taxes every screen. | Grows into a dumping ground; each new feature bolts on an item until nothing is findable. |
| **Local** | Children of the current section; where depth lives. | Deeper is fine here if labels are predictable. | Duplicates global nav, or shifts between sections so position stops being learnable. |
| **Contextual** | Related, next-step, and cross-links inside the content itself. | Neither — it is lateral, cutting across the hierarchy. | Auto-generated "related" links nobody chose, or so many inline links the primary path is lost. |
| **Utility** | Account, settings, help, search, sign out. Cross-cutting, task-agnostic. | Shallow and constant; visually separated from global. | Product features smuggled into utility because global was full — users never look there. |

- Depth costs clicks; breadth costs scanning. Trade one for the other deliberately: users tolerate depth when each label predicts what is underneath, and tolerate breadth only when items are grouped. Cognitive load, Hick's Law, and Miller's Law — defer to `designer:ux-principles`.
- Search is not a substitute for structure. It is the escape hatch users take when structure failed, and its query log is your best label research.
