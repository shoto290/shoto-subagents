# Figma MCP

Two MCP servers are wired in this plugin:

| Server | Endpoint | Requires |
| :-- | :-- | :-- |
| **figma-desktop** | `http://127.0.0.1:3845/mcp` | Figma desktop app open with **Dev Mode MCP** enabled |
| **figma-remote** | `https://mcp.figma.com/mcp` | OAuth on first use; **Figma Professional+** plan |

Key tools to use when present:

| Tool | Purpose |
| :-- | :-- |
| `get_design_context` | Structured React + Tailwind for the current selection |
| `get_variable_defs` | Color, spacing, and type variables in scope |
| `get_metadata` | Node structure of the selection |
| `get_screenshot` | Visual reference image of the selection |
| `get_code_connect_map` | Existing Figma-node → code-component mappings |
| `get_code_connect_suggestions` | Proposed mappings to review |
| `add_code_connect_map` | Persist a node → component mapping |
| `search_design_system` / `get_libraries` | Find existing components and tokens before creating |
| `create_new_file` / `generate_figma_design` / `upload_assets` | Write operations — **remote-only** |

**Read before you generate.** Pull `get_design_context` + `get_variable_defs` + `get_screenshot` before producing any code, and **respect existing components and variables** — search the design system and reuse over reinventing.

**Detect, then degrade gracefully.** If neither MCP server is connected, say so plainly and proceed from the shared file links or screenshots the user provides — do not block on the MCP.

**Setup is out of scope.** Installing or configuring the MCP servers is the user's responsibility — say so and proceed. This skill documents how to USE the servers once they exist.
