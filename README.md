# shoto-subagents

A Claude Code marketplace of **ultra-specialized subagents** — one per plugin — plus the craft skills they preload. No orchestration layer, no coordinator.

Everything here is markdown and JSON artifacts: no runtime, no build step.

## Install

```bash
# inside Claude Code
/plugin marketplace add shoto290/shoto-subagents
/plugin install <plugin>@shoto-subagents
```

`engineering` is **required** — every specialist agent preloads its skills, and each specialist plugin declares it as a dependency, so it installs automatically. Install whichever specialists you need.

## Plugins

| Plugin | Ships | Description |
| :--- | :--- | :--- |
| [`product-designer`](./plugins/product-designer) | 1 agent · 7 skills | Discovery and definition specialist for user research, jobs-to-be-done, personas and journey maps, information architecture, prototyping and usability testing, UX writing, and outcome metrics. |
| [`designer`](./plugins/designer) | 1 agent · 7 skills | Product/UI design specialist for design systems, Figma and Paper.design canvases, typography, accessibility, and design-to-dev handoff. Sits downstream of product-designer. |
| [`design-engineer`](./plugins/design-engineer) | 1 agent · 7 skills | Front-end specialist (React + TypeScript) for building, using, and refactoring design systems. |
| [`backend-engineer`](./plugins/backend-engineer) | 1 agent · 7 skills | Server-side specialist for designing APIs, modeling data, and building secure, observable, resilient services. |
| [`engineering`](./plugins/engineering) | 8 skills | Senior-developer craft skills (senior-mindset, clean-code, SOLID/DRY/KISS/YAGNI, reuse-first, avoid-over-engineering, pragmatic-principles, scalable-architecture, secure-by-default) that the three specialist agents preload by default. |

## Agent colors

Every agent declares a `color:` in its frontmatter. It encodes **what the agent does and where its output lands** — not its domain. The domain is already in the agent's name.

The scale runs cold to warm by irreversibility: cold means nothing changes, warm means you cannot undo it.

| Color | Action | Output lands in | Reversible |
| :--- | :--- | :--- | :--- |
| 🩵 cyan | Reads — analyzes, audits, reports | the conversation | nothing to undo |
| 🔵 blue | Orchestrates — drives other agents | other agents | nothing to undo |
| 🟣 purple | Produces non-executable artifacts — design, docs, specs | non-code files, Figma | trivial |
| 🟢 green | Writes code | repo sources | `git checkout` |
| 🟠 orange | Mutates shared state — commits, branches, PRs, CI | history, teammates | painful |
| 🔴 red | Acts outside the repo — deploy, prod, databases, third-party APIs | the real world | no |

Today: `product-designer` and `designer` are purple, `design-engineer` and `backend-engineer` are green. Two agents sharing a color is expected — same action, different domain.

`pink` and `yellow` are unassigned. A new agent takes the color of its action.

## Repo layout

```
plugins/<plugin>/
  .claude-plugin/plugin.json        # plugin manifest (name, version, description)
  skills/<name>/SKILL.md            # skill definitions (+ supporting files)
  agents/<name>.md                  # sub-agent definitions
.claude-plugin/marketplace.json     # marketplace entry listing every plugin
```

Contributing conventions, authoring tools, and safety rules live in [`AGENTS.md`](./AGENTS.md).

## License

[MIT](./LICENSE) © Shoto

## Repo

[github.com/shoto290/shoto-subagents](https://github.com/shoto290/shoto-subagents)
