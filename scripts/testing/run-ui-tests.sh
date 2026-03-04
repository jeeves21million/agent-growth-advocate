#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT_DIR}"

if [[ -x "./scripts/testing/ui-tests-local.sh" ]]; then
  ./scripts/testing/ui-tests-local.sh
  exit 0
fi

if [[ -f "package.json" ]] && command -v npm >/dev/null 2>&1; then
  if npm run | grep -q "test:ui"; then
    npm run test:ui
    exit 0
  fi
fi

if [[ -d "tests/ui" ]] && command -v pytest >/dev/null 2>&1; then
  pytest tests/ui
  exit 0
fi

echo "No UI test target configured; placeholder pass"
