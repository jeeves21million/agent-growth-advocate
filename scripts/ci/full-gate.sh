#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT_DIR}"

./scripts/skills/quick-validate.sh
./scripts/testing/run-api-tests.sh
./scripts/testing/run-ui-tests.sh

echo "Full gate passed"
