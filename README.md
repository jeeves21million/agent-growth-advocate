# agent-growth-advocate

Codex-native scaffold for skill delegation and agent handoff workflows across design -> build -> test loops.

## Architecture

- `skills/`: Agent skills used for modular delegation.
- `docs/agents/`: Registry, routing matrix, and validation policy.
- `scripts/skills/`: Local setup and fast repository checks.
- `scripts/testing/`: API/UI test entrypoints and UI coverage validation.
- `scripts/ci/`: Composite gate for CI-like execution.

### Delegation model

1. Intake and framing: `prototype-intake`
2. System planning and sequencing: `solution-architect`
3. UX direction: `ui-designer`
4. Frontend implementation: `ui-dev`
5. Backend implementation: `api-dev`
6. Verification and defect triage: `qa-tester`
7. Cross-agent orchestration and escalation: `codex-orchestrator`

## Quickstart

```bash
# 1) Initialize local Python tooling (optional)
./scripts/skills/setup-venv.sh

# 2) Run fast structural validation
./scripts/skills/quick-validate.sh

# 3) Run full gate (structure + tests)
./scripts/ci/full-gate.sh
```

## Notes

- Scripts are generic and self-contained with placeholders where project-specific frameworks are unknown.
- Update `docs/agents/skills-registry.yaml` as you evolve skill ownership or handoff contracts.
