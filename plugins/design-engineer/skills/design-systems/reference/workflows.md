# Workflows

**Create from scratch**
1. Define primitives (color ramps, a base spacing unit, type scale).
2. Map semantics on `:root` (`--color-bg`, `--color-fg`, `--space-*`, …).
3. Add `[data-theme="dark"]` overrides for the semantics that change.
4. Build the typed accessor; wire the first components to semantics only.

**Extend without breaking**
1. Add the new token alongside existing ones (never repurpose a live token's meaning).
2. Provide it in every theme block so no theme is missing it.
3. Add it to the typed accessor. Existing consumers are unaffected because nothing was renamed or removed.

**Refactor hardcoded → tokens**
1. Grep for raw values (`#`, `px`, `rgb(`) in components.
2. Map each to the nearest existing semantic token; if none fits, add one (extend workflow).
3. Replace inline. Verify visually per theme.
