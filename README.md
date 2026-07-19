# shoto-orchestrator

A Claude Code marketplace that turns Claude Code into an **orchestrated engineering team** — a coordinator agent that delegates to specialist subagents (back-end, front-end, design), senior engineering craft skills, and read-only lenses for inventorying and researching any codebase.

Everything here is markdown and JSON artifacts: no runtime, no build step.

## Install

```bash
# inside Claude Code
/plugin marketplace add shoto290/shoto-orchestrator
/plugin install <plugin>@shoto-orchestrator
```

Start with `orchestrator`, then add whichever specialists and lenses you need.

## Plugins

| Plugin | Ships | Description |
| :--- | :--- | :--- |
| [`orchestrator`](./plugins/orchestrator) | 2 agents · 4 skills | Runtime foundation: the orchestrator agent and its generalist fallback writer, plus the base, alignment, onboard, and orchestrator skills they run on. |
| [`engineering`](./plugins/engineering) | 8 skills | Senior-developer craft skills (senior-mindset, clean-code, SOLID/DRY/KISS/YAGNI, reuse-first, avoid-over-engineering, pragmatic-principles, scalable-architecture, secure-by-default) that dev subagents preload by default. |
| [`backend-engineer`](./plugins/backend-engineer) | 1 agent · 7 skills | Server-side specialist for designing APIs, modeling data, and building secure, observable, resilient services. |
| [`design-engineer`](./plugins/design-engineer) | 1 agent · 7 skills | Front-end specialist (React + TypeScript) for building, using, and refactoring design systems. |
| [`designer`](./plugins/designer) | 1 agent · 7 skills | Product/UI design specialist for design systems, Figma and Paper.design canvases, typography, accessibility, and design-to-dev handoff. |
| [`inventory`](./plugins/inventory) | 9 agents · 9 skills | Read-only codebase-inventory toolkit: nine lenses (workspace, test, components, services, repositories, conventions, feature, dependencies, context) that each return one unified anchored contract. |
| [`explore`](./plugins/explore) | 3 skills | Codebase-grounded external research: precise library docs (context7), conventions/best-practices, and focused web search tied to how this repo actually uses things. |

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

[github.com/shoto290/shoto-orchestrator](https://github.com/shoto290/shoto-orchestrator)
