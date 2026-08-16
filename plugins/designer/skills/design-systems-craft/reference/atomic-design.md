# Atomic Design

Brad Frost's five-stage mental model for composing an interface from the smallest parts up.

| Stage | What it is | Library example |
| :-- | :-- | :-- |
| Atoms | Smallest indivisible UI | Button, Input, Label, Icon |
| Molecules | A few atoms bonded into a unit | Search field (Input + Button) |
| Organisms | Molecules + atoms into a section | Header, Card, Form |
| Templates | Page-level structure, no real content | Dashboard layout, article skeleton |
| Pages | Templates with real content | Settings page, signed-in home |

**Mapping to a component library.** Atoms and molecules are your reusable components. Organisms are composed patterns. Templates and pages live closer to product work. The boundaries are a thinking aid, not a filing law — do not agonize over whether something is a molecule or an organism.

**Composition over duplication.** Build a molecule by nesting existing atom instances, not by redrawing them. When an atom changes, every molecule and organism that nests it inherits the change. Duplication is the thing atomic design exists to prevent.
