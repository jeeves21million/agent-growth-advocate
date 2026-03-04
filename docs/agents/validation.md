# Agent Stack Validation

## Scope

Validation confirms the repository can execute RevenueCat role-aligned workflows and hiring operations.

## Required checks

1. Required docs, scripts, and hiring artifacts exist.
2. All eight `rc-*` skills exist with full metadata and references.
3. Shell entrypoints are executable.
4. Structural checks pass via `scripts/skills/quick-validate.sh`.
5. Full workflow gate passes via `scripts/ci/full-gate.sh`.

## Operational sequence

```bash
./scripts/skills/quick-validate.sh
./scripts/ci/full-gate.sh
```

## Pass criteria

- `scripts/validate-agent-stack.mjs` exits 0.
- Required hiring docs are present and non-empty.
- Skill registry and routing matrix align to required `rc-*` skills.
- Placeholder test wrappers execute without configuration errors.
