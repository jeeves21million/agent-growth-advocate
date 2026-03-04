# agent-growth-advocate

Job-targeted execution system for RevenueCat's Agentic AI Developer & Growth Advocate role.

## Purpose

This repository operationalizes the full hiring and execution loop for the posting:

- Ingest RevenueCat docs, SDK, and API surfaces
- Publish technical and growth content
- Run weekly growth experiments
- Execute high-volume community engagement
- Submit structured product feedback
- Deliver weekly async metrics reports
- Run public application and hiring assessment workflows

## Architecture

- `skills/`: Eight role-specific skills aligned to the job responsibilities
- `docs/agents/`: Skill registry, routing matrix, and validation policy
- `docs/hiring/`: Requirement mapping, operating cadence, plan, and public application outline
- `scripts/skills/`: Fast validation tooling
- `scripts/ci/`: Full gate for local CI-style checks

## Skill System

1. `rc-docs-api-ingestion`
2. `rc-technical-content-engine`
3. `rc-growth-experiment-lab`
4. `rc-community-engagement-ops`
5. `rc-product-feedback-analyst`
6. `rc-weekly-metrics-reporter`
7. `rc-application-pipeline`
8. `rc-hiring-assessment-runner`

## Quickstart

```bash
./scripts/skills/quick-validate.sh
./scripts/ci/full-gate.sh
```

## Notes

- Scripts remain framework-agnostic with sane placeholders.
- Skill contracts are enforced by `scripts/validate-agent-stack.mjs`.
