#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT_DIR}"

required_files=(
  "README.md"
  "docs/agents/skills-registry.yaml"
  "docs/agents/task-routing-matrix.md"
  "docs/agents/validation.md"
  "scripts/validate-agent-stack.mjs"
  "skills/README.md"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "${file}" ]]; then
    echo "Missing required file: ${file}" >&2
    exit 1
  fi
done

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required for validate-agent-stack.mjs" >&2
  exit 1
fi

node scripts/validate-agent-stack.mjs
./scripts/testing/validate-ui-coverage-map.sh

echo "Quick validation passed"
