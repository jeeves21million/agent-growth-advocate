# Workflow Notes: API Developer

## Objective

Implement reliable backend capabilities and communicate contract changes to dependent roles.

## Inputs

- Current task context
- Prior agent output artifacts
- Known constraints and acceptance criteria

## Outputs

- Updated artifact(s) for this role
- Decision log with assumptions
- Next-owner handoff note

## Guardrails

- Keep scope bounded to this role.
- Avoid rewriting unrelated artifacts.
- Escalate dependency conflicts to codex-orchestrator.
