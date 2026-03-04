#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT_DIR}"

MAP_FILE="docs/agents/ui-coverage-map.md"

if [[ ! -f "${MAP_FILE}" ]]; then
  cat > "${MAP_FILE}" <<'MAP'
# UI Coverage Map (Placeholder)

| Surface | Owner | Test Type | Status |
|---|---|---|---|
| Placeholder route | ui-dev | smoke | todo |

Replace this placeholder with concrete UI coverage mapping.
MAP
  echo "Created placeholder ${MAP_FILE}"
fi

if ! grep -q "| Surface | Owner | Test Type | Status |" "${MAP_FILE}"; then
  echo "Coverage map missing required table header in ${MAP_FILE}" >&2
  exit 1
fi

echo "UI coverage map validation passed"
