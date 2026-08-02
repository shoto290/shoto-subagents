#!/usr/bin/env bash
set -euo pipefail

ROOT=$(git rev-parse --show-toplevel 2>/dev/null || true)
[ -z "$ROOT" ] && ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT"

SECTIONS=("## Principles" "## Safety")
AGENTS=(
  "plugins/backend-engineer/agents/backend-engineer.md"
  "plugins/design-engineer/agents/design-engineer.md"
  "plugins/designer/agents/designer.md"
  "plugins/product-designer/agents/product-designer.md"
)
REFERENCE="${AGENTS[0]}"

FAILED=0

fail() {
  printf '%s\n' "$1"
  FAILED=1
}

extract_section() {
  awk -v heading="$2" '
    $0 == heading { inside = 1; print; next }
    inside && /^## / { inside = 0 }
    inside { print }
  ' "$1"
}

section_block() {
  extract_section "$1" "$2"
  printf 'x'
}

for agent in "${AGENTS[@]}"; do
  [ -f "$agent" ] || fail "$agent: agent file is missing"
done

[ "$FAILED" -eq 1 ] && exit 1

for section in "${SECTIONS[@]}"; do
  reference_block=$(section_block "$REFERENCE" "$section")

  if [ "$reference_block" = "x" ]; then
    fail "$REFERENCE: section '$section' is missing"
    continue
  fi

  for agent in "${AGENTS[@]:1}"; do
    block=$(section_block "$agent" "$section")

    if [ "$block" = "x" ]; then
      fail "$agent: section '$section' is missing"
    elif [ "$block" != "$reference_block" ]; then
      fail "$agent: section '$section' diverges from reference $REFERENCE"
    fi
  done
done

[ "$FAILED" -eq 1 ] && exit 1

printf 'shared blocks: %d sections byte-identical across %d agent files\n' "${#SECTIONS[@]}" "${#AGENTS[@]}"
exit 0
