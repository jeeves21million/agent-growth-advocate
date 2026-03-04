#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

required_skills=(
  "rc-docs-api-ingestion"
  "rc-technical-content-engine"
  "rc-growth-experiment-lab"
  "rc-community-engagement-ops"
  "rc-product-feedback-analyst"
  "rc-weekly-metrics-reporter"
  "rc-application-pipeline"
  "rc-hiring-assessment-runner"
)

for skill in "${required_skills[@]}"; do
  if [[ ! -f "skills/${skill}/SKILL.md" ]]; then
    echo "Missing skill metadata for ${skill}" >&2
    exit 1
  fi

done

echo "Synchronizing RevenueCat skill metadata snapshot..."
{
  echo "# Generated skill snapshot"
  echo "generated_at: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  echo "profile: revenuecat-agentic-ai-developer-growth-advocate"
  echo "skills:"
  for skill in "${required_skills[@]}"; do
    echo "  - ${skill}"
  done
} > docs/agents/skills-snapshot.yaml

echo "Wrote docs/agents/skills-snapshot.yaml"
