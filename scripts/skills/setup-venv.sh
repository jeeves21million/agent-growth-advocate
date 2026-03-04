#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VENV_DIR="${ROOT_DIR}/.venv"

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 not found; skipping venv setup" >&2
  exit 0
fi

if [[ ! -d "${VENV_DIR}" ]]; then
  python3 -m venv "${VENV_DIR}"
  echo "Created virtual environment at ${VENV_DIR}"
else
  echo "Virtual environment already exists at ${VENV_DIR}"
fi

# shellcheck disable=SC1091
source "${VENV_DIR}/bin/activate"
python -m pip install --upgrade pip >/dev/null

if [[ -f "${ROOT_DIR}/requirements.txt" ]]; then
  pip install -r "${ROOT_DIR}/requirements.txt"
  echo "Installed dependencies from requirements.txt"
else
  echo "No requirements.txt found; setup complete"
fi
