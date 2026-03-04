# Workflow Notes: Codex Orchestrator

## Objective

Ensure consistent flow from intake through validation while minimizing blocked handoffs.

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
