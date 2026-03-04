#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

if [[ ! -d skills ]]; then
  echo "skills directory not found" >&2
  exit 1
fi

echo "Synchronizing skill metadata snapshot..."
{
  echo "# Generated skill snapshot"
  echo "generated_at: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  echo "skills:"
  for dir in skills/*; do
    [[ -d "${dir}" ]] || continue
    [[ -f "${dir}/SKILL.md" ]] || continue
    name="$(basename "${dir}")"
    echo "  - ${name}"
  done
} > docs/agents/skills-snapshot.yaml

echo "Wrote docs/agents/skills-snapshot.yaml"
