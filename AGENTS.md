# AGENTS.md

## Purpose
This repository is a job-targeted execution system for RevenueCat's Agentic AI Developer & Growth Advocate role.

## First Priorities (every run)
1. Read `README.md`.
2. Read `docs/agents/skills-registry.yaml` and `docs/agents/task-routing-matrix.md`.
3. Read `docs/hiring/job-requirements-matrix.md`.
4. Validate structure with `./scripts/skills/quick-validate.sh` before major edits.

## Skill Routing (required)
Use the role-aligned skills in `skills/`:
- rc-docs-api-ingestion
- rc-technical-content-engine
- rc-growth-experiment-lab
- rc-community-engagement-ops
- rc-product-feedback-analyst
- rc-weekly-metrics-reporter
- rc-application-pipeline
- rc-hiring-assessment-runner

Do not invent alternate skill names unless explicitly requested.

## Editing Rules
- Keep outputs directly tied to job requirements and measurable weekly cadence.
- Preserve references and deep links in `docs/hiring/public-application-letter.md`.
- For architecture changes, update both:
  - `docs/architecture/runtime-and-data-stack.md`
  - `docs/architecture/dashboard-spec.md`
- If the system diagram changes, update:
  - `docs/architecture/system-diagram.mmd`
  - `docs/architecture/assets/system-diagram.svg`
  - `docs/architecture/assets/system-diagram.png`

## Validation Gates
Run after meaningful changes:
```bash
./scripts/skills/quick-validate.sh
./scripts/ci/full-gate.sh
```

## Commit Standards
- Use clear commit messages tied to outcome (e.g., "Align application letter to model routing strategy").
- Keep commits focused and reviewable.

## Non-Goals
- Do not add unrelated product/app code.
- Do not dilute the repo into a generic framework; keep it RevenueCat-role specific.
