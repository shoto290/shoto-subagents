# Pass/fail checklist

- **SRP** — Does this unit have exactly one reason to change?
- **OCP** — Can I add a new variant without editing existing branching?
- **LSP** — Can every subtype stand in for its base without surprising the caller?
- **ISP** — Does each consumer depend only on the methods it calls?
- **DIP** — Do high-level modules depend on interfaces, not concrete classes?
- **DRY** — Is each piece of knowledge expressed in exactly one place?
- **KISS** — Does this read correctly on a first pass, with no cleverness that needs decoding?
- **YAGNI** — Does every parameter, flag, and branch serve a requirement that exists today?
- **Abstraction** — Did I add an abstraction without a second real caller?
