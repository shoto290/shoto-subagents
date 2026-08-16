---
name: storybook
description: Authoring CSF3 Storybook stories for a design system.
---

# Storybook
Author Storybook stories in React + TypeScript using Component Story Format 3 (CSF3). Stories are the living documentation of the design system: every meaningful visual state is a story, every prop is a control.

## Story Authoring (CSF3)
Use a default-exported typed `Meta` and named `StoryObj` exports. Drive variants through `args`; expose props with `argTypes`; use `render` only when composition is needed. Full template: [reference/csf3-template.md](./reference/csf3-template.md).

## Coverage Discipline
Write one story per meaningful state, not one per component:

- Default plus every variant, size, and tone.
- States: `disabled`, `loading`, `error`, `selected`, `focused`.
- Edge content: long text, empty, overflow, truncation, RTL.
- Interaction: use a `play` function (`@storybook/test`) to drive and assert behavior — click, type, expect — so stories double as interaction tests.

## Documentation
- Enable autodocs via `tags: ["autodocs"]`; let `argTypes` generate the controls table.
- Add a component description (JSDoc on the component or `parameters.docs.description.component`) and per-story descriptions for usage notes.
- Controls give live prop editing — keep `args`/`argTypes` accurate so the docs page is the canonical reference for the component's API.

## Organization
- `title` hierarchy mirrors the design system: `Components/Button`, `Forms/Input`, `Layout/Stack`.
- Co-locate `*.stories.tsx` next to the component it documents.
- Keep titles stable — they are the design-system navigation and deep-link targets.

## A11y & Visual
- Run the a11y addon (`@storybook/addon-a11y`) per story; fix contrast, roles, and label violations at the story level.
- Treat stories as the visual-regression surface: each distinct state should be a separate snapshot target (Chromatic or your VRT tool).

## Reference
| File | Read when |
| :-- | :-- |
| [reference/csf3-template.md](./reference/csf3-template.md) | Scaffolding a new `*.stories.tsx` file and you need the exact `Meta` / `StoryObj` / `argTypes` shape to copy. |
| [reference/storybook-mcp.md](./reference/storybook-mcp.md) | A Storybook MCP server may be configured and you need the introspect-first workflow plus the graceful-degradation fallback. |
