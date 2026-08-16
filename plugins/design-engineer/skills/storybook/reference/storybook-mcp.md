# Storybook MCP

When a Storybook MCP server is configured, exploit it — do not hand-author blind:

- **Introspect before building** — query the MCP for existing stories and components to discover what the design system already ships. Reuse over duplication: extend or compose an existing component instead of creating a new one.
- **Read the rendered catalog** — inspect the component catalog and each component's documented args/variants to match established API and naming conventions.
- **Verify states** — drive Storybook programmatically to confirm the stories you wrote render the intended states, then close the loop.

**Detect, then degrade gracefully.** Check whether the Storybook MCP is present and use it when it is; when it is absent, author stories normally from the source — never block on it.

**Setup is out of scope.** Configuring or installing the Storybook MCP server is the user's responsibility — say so and proceed. This skill only documents how to USE the MCP once it exists.
