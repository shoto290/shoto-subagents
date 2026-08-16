# Paper MCP Tools

The `paper` server is wired into this plugin at `http://127.0.0.1:29979/mcp` (no secret). It runs from the **Paper desktop app** — opening a design file starts the server. If the MCP is not connected, say so and ask the user to open the Paper desktop app and a design file — do not block on it.

## Tool Catalog

| Group | Tools |
| :-- | :-- |
| Read | `get_basic_info`, `get_selection`, `get_node_info`, `get_children`, `get_tree_summary`, `get_screenshot`, `get_jsx`, `get_computed_styles`, `get_font_family_info`, `export` |
| Write | `create_artboard`, `write_html`, `set_text_content`, `rename_nodes`, `duplicate_nodes`, `move_nodes`, `update_styles`, `delete_nodes` |
| Workflow | `get_guide` (read first for agent guidance), `finish_working_on_nodes` (finalize) |

## Default Approach

1. **Orient** — call `get_guide` first, then `get_tree_summary` and/or `get_screenshot` before touching anything.
2. **Edit** — for mockup tasks, follow [mockup-flow.md](./mockup-flow.md); for direct edits to existing work, make surgical changes via `update_styles`, `set_text_content`, `write_html`.
3. **Finalize** — call `finish_working_on_nodes` when done.
