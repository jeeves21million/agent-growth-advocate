#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT_DIR}"

if [[ -x "./scripts/testing/api-tests-local.sh" ]]; then
  ./scripts/testing/api-tests-local.sh
  exit 0
fi

if [[ -f "package.json" ]] && command -v npm >/dev/null 2>&1; then
  if npm run | grep -q "test:api"; then
    npm run test:api
    exit 0
  fi
fi

if [[ -d "tests/api" ]] && command -v pytest >/dev/null 2>&1; then
  pytest tests/api
  exit 0
fi

echo "No API test target configured; placeholder pass"
