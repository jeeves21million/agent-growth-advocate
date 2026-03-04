# Agent Stack Validation

## Scope

Validation ensures the repository has a runnable baseline for skill delegation and handoff loops.

## Required checks

1. Presence of core docs and scripts.
2. Presence of required skill directories and metadata files.
3. Executability of shell entrypoints.
4. Fast structural validation via `scripts/skills/quick-validate.sh`.
5. Full gate via `scripts/ci/full-gate.sh` for CI use.

## Operational sequence

```bash
./scripts/skills/quick-validate.sh
./scripts/ci/full-gate.sh
```

## Pass criteria

- No missing required files.
- `validate-agent-stack.mjs` exits 0.
- API/UI test wrappers execute without configuration errors.
- UI coverage map validator has a declared map or explicit placeholder.

## Placeholders

This scaffold intentionally supports placeholder test targets. Teams should replace no-op branches with project-specific commands once frameworks are selected.
