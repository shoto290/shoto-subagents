#!/usr/bin/env bash
set -euo pipefail

ROOT=$(git rev-parse --show-toplevel 2>/dev/null || true)
[ -z "$ROOT" ] && ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT"

KEBAB='^[a-z0-9]+(-[a-z0-9]+)*$'
CONSUMERS="backend-engineer: design-engineer: designer: frontend-engineer:"
CROSS_REF='(engineering|designer|design-engineer|backend-engineer|frontend-engineer):[a-z-]+'

FAILED=0
NOTE_COUNT=0
REF_COUNT=0
AGENT_COUNT=0
SKILL_COUNT=0

fail() {
  printf '%s\n' "$1"
  FAILED=1
}

note() {
  printf 'note: %s\n' "$1"
  NOTE_COUNT=$((NOTE_COUNT + 1))
}

frontmatter_name() {
  grep -m1 '^name:' "$1" 2>/dev/null | sed 's/^name:[[:space:]]*//' || true
}

agent_preloads() {
  local line
  line=$(grep -m1 '^skills:' "$1" || true)
  printf '%s' "${line#skills:}" | grep -oE '[a-z0-9-]+:[a-z0-9-]+' || true
}

skill_path() {
  printf 'plugins/%s/skills/%s/SKILL.md' "${1%%:*}" "${1#*:}"
}

for agent in plugins/*/agents/*.md; do
  AGENT_COUNT=$((AGENT_COUNT + 1))
  expected=$(basename "$agent" .md)
  name=$(frontmatter_name "$agent")
  [ "$name" = "$expected" ] ||
    fail "$agent: frontmatter name '$name' does not match filename '$expected'"

  while IFS= read -r ref; do
    [ -z "$ref" ] && continue
    REF_COUNT=$((REF_COUNT + 1))
    target_path=$(skill_path "$ref")
    [ -f "$target_path" ] || fail "$agent: skills reference '$ref' has no $target_path"
  done <<< "$(agent_preloads "$agent")"
done

for skill in plugins/*/skills/*/SKILL.md; do
  SKILL_COUNT=$((SKILL_COUNT + 1))
  expected=$(basename "$(dirname "$skill")")
  name=$(frontmatter_name "$skill")
  [ "$name" = "$expected" ] ||
    fail "$skill: frontmatter name '$name' does not match directory '$expected'"
done

while IFS= read -r path; do
  base=$(basename "$path")
  [ "$base" = ".claude-plugin" ] && continue
  printf '%s' "$base" | grep -Eq "$KEBAB" || fail "$path: directory name is not kebab-case"
done <<< "$(find plugins -mindepth 1 -type d)"

while IFS= read -r path; do
  base=$(basename "$path")
  case "$base" in
    .* | SKILL.md | plugin.json) continue ;;
  esac
  printf '%s' "${base%.*}" | grep -Eq "$KEBAB" || fail "$path: file name is not kebab-case"
done <<< "$(find plugins -type f \( -name '*.md' -o -name '*.json' \))"

for consumer in $CONSUMERS; do
  while IFS= read -r path; do
    [ -z "$path" ] && continue
    fail "$path: contains '$consumer' — plugins/engineering must not reference a consumer plugin"
  done <<< "$(grep -rlF "$consumer" plugins/engineering || true)"
done

for agent in plugins/*/agents/*.md; do
  preloads=$(agent_preloads "$agent")

  while IFS= read -r ref; do
    [ -z "$ref" ] && continue
    target_path=$(skill_path "$ref")
    [ -f "$target_path" ] || continue

    while IFS= read -r target; do
      [ -z "$target" ] && continue
      if ! printf '%s\n' "$preloads" | grep -qxF "$target"; then
        note "$agent: preloaded skill '$ref' references '$target', which this agent does not preload"
      fi
    done <<< "$(grep -oE "$CROSS_REF" "$target_path" | sort -u || true)"
  done <<< "$preloads"
done

[ "$NOTE_COUNT" -gt 0 ] && printf 'note: %d cross-plugin reference(s) sit outside their agent preload set — still invocable via the Skill tool, simply absent from that agent context; an architecture judgement, not an error\n' "$NOTE_COUNT"

[ "$FAILED" -eq 1 ] && exit 1

printf 'skill refs: %d agents, %d skills, %d preload references verified; %d notes\n' "$AGENT_COUNT" "$SKILL_COUNT" "$REF_COUNT" "$NOTE_COUNT"
exit 0
