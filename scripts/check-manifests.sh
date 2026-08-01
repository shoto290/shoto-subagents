#!/usr/bin/env bash
set -euo pipefail

ROOT=$(git rev-parse --show-toplevel 2>/dev/null || true)
[ -z "$ROOT" ] && ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT"

MARKETPLACE=".claude-plugin/marketplace.json"

FAILED=0
PLUGIN_COUNT=0
ENTRY_COUNT=0
SOURCES=""

fail() {
  printf '%s\n' "$1"
  FAILED=1
}

manifest_name() {
  jq -r '.name // empty' "$1" 2>/dev/null || true
}

manifest_dependencies() {
  jq -r '.dependencies // [] | .[] | if type == "object" then .name // empty else . end' "$1"
}

normalize_source() {
  local source="${1#./}"
  printf '%s' "${source%/}"
}

for dir in plugins/*/; do
  plugin=$(basename "$dir")
  manifest="${dir}.claude-plugin/plugin.json"
  PLUGIN_COUNT=$((PLUGIN_COUNT + 1))

  if [ ! -f "$manifest" ]; then
    fail "$manifest: manifest is missing"
    continue
  fi

  if ! jq empty "$manifest" 2>/dev/null; then
    fail "$manifest: invalid JSON"
    continue
  fi

  name=$(manifest_name "$manifest")
  [ "$name" = "$plugin" ] || fail "$manifest: name '$name' does not match directory '$plugin'"

  version=$(jq -r '.version // empty' "$manifest")
  printf '%s' "$version" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$' ||
    fail "$manifest: version '$version' is not semver (MAJOR.MINOR.PATCH)"

  while IFS= read -r dependency; do
    [ -z "$dependency" ] && continue
    [ -d "plugins/$dependency" ] ||
      fail "$manifest: dependency '$dependency' has no plugins/$dependency directory"
  done <<< "$(manifest_dependencies "$manifest")"
done

if [ ! -f "$MARKETPLACE" ]; then
  fail "$MARKETPLACE: marketplace manifest is missing"
elif ! jq empty "$MARKETPLACE" 2>/dev/null; then
  fail "$MARKETPLACE: invalid JSON"
else
  ENTRY_COUNT=$(jq '.plugins | length' "$MARKETPLACE")

  while IFS=$'\t' read -r entry_name entry_source; do
    [ -z "$entry_name$entry_source" ] && continue
    source=$(normalize_source "$entry_source")
    SOURCES="${SOURCES}${source}"$'\n'

    if [ ! -d "$source" ]; then
      fail "$MARKETPLACE: entry '$entry_name' points at missing directory '$entry_source'"
      continue
    fi

    entry_manifest="$source/.claude-plugin/plugin.json"

    if [ ! -f "$entry_manifest" ]; then
      fail "$MARKETPLACE: entry '$entry_name' has no manifest at $entry_manifest"
      continue
    fi

    name=$(manifest_name "$entry_manifest")
    [ "$entry_name" = "$name" ] ||
      fail "$MARKETPLACE: entry '$entry_name' does not match name '$name' in $entry_manifest"
  done <<< "$(jq -r '.plugins[]? | "\(.name // "")\t\(.source // "")"' "$MARKETPLACE")"

  for dir in plugins/*/; do
    path="plugins/$(basename "$dir")"
    matches=$(printf '%s' "$SOURCES" | grep -cxF "$path" || true)
    [ "$matches" -eq 1 ] ||
      fail "$path: has $matches entries in $MARKETPLACE, expected exactly 1"
  done
fi

[ "$FAILED" -eq 1 ] && exit 1

printf 'manifests: %d plugin manifests and %d marketplace entries verified\n' "$PLUGIN_COUNT" "$ENTRY_COUNT"
exit 0
