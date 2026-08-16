# Handoff Checklist

## Align on Scope

Agree what is in and out before anything is annotated. Misaligned scope is the most expensive handoff defect — it surfaces mid-build.

- **In / out** — list the screens, flows, and components this handoff covers, and explicitly name what it does not.
- **Breakpoints** — name the breakpoints you designed for (e.g. mobile / tablet / desktop) and which is the source of truth.
- **Platforms** — web, iOS, Android, or all; each has different conventions for navigation, gestures, and system states.
- **Shared language** — use the same names design and engineering already use for components and tokens, so a "card" means one thing on both sides.

## Invisible & Edge States

The happy path is the easy 20%. Design and annotate the states that are easy to forget — they are where builds stall and bugs ship.

- **Empty** — first-run, no data, cleared filters.
- **Loading** — skeletons, spinners, optimistic UI; what shows while data is in flight.
- **Error** — failed request, validation failure, offline; the message, recovery action, and tone.
- **Success** — confirmation, toast, post-submit state.
- **Disabled** — why an action is unavailable and how it reads.
- **Long-content** — long names, long lists, many tags; how the layout absorbs overflow.
- **Zero / overflow** — `0`, `999+`, counts that exceed their container.

## Dev-Ready Gate

A concrete pass/fail gate. Every item must be true before the handoff is dev-ready.

- [ ] Scope agreed — in/out, breakpoints, and platforms confirmed with engineering.
- [ ] All states designed — empty, loading, error, success, disabled, long-content, zero/overflow.
- [ ] Responsive behavior specified — reflow and per-breakpoint rules, not just fixed frames.
- [ ] Components & styles named — real components, auto layout, predictable page structure.
- [ ] Tokens/variables applied — colors, type, spacing bound to named styles/variables.
- [ ] Accessibility annotated — focus order, alt text, ARIA intent, contrast, reduced motion.
- [ ] Prototype linked — interactive flows reachable from the handoff.
- [ ] Assets exportable — icons and images set up for export at the right scales/formats.

## Handoff to design-engineer

This skill produces clean *specs*, not application code. Production React/TypeScript implementation is owned by the `design-engineer` agent. The designer's job is to deliver a handoff that passes the checklist above; the design-engineer turns it into shipped components. Do not write app code from this skill — hand off the spec and let the implementation owner build it.
