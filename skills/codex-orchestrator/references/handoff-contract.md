# Handoff Contract: Codex Orchestrator

## Required fields

- from: codex-orchestrator
- to: target role
- artifact_paths: changed files or docs
- decisions: key design/build/test decisions
- open_risks: unresolved issues
- validation_state: checks passed/failed

## Acceptance check

Routing decision includes selected owner, required inputs, and explicit gate criteria for completion.

## Example skeleton

from: codex-orchestrator
to: next-skill
artifact_paths:
  - path/to/file
decisions:
  - decision summary
open_risks:
  - risk summary
validation_state:
  passed:
    - check name
  failed:
    - check name
