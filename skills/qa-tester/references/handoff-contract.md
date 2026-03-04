# Handoff Contract: QA Tester

## Required fields

- from: qa-tester
- to: target role
- artifact_paths: changed files or docs
- decisions: key design/build/test decisions
- open_risks: unresolved issues
- validation_state: checks passed/failed

## Acceptance check

Report identifies severity, reproduction steps, and next owner for each failing condition.

## Example skeleton

from: qa-tester
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
