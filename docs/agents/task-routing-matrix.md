# Task Routing Matrix

| Task Type | Primary Skill | Secondary Skill | Exit Artifact | Rework Trigger |
|---|---|---|---|---|
| Problem intake and scope | prototype-intake | codex-orchestrator | Problem brief + constraints | Missing measurable success criteria |
| Architecture and decomposition | solution-architect | api-dev | Technical plan + interfaces | Undefined ownership or sequencing |
| UX direction and flows | ui-designer | prototype-intake | Wireframes/spec notes | Flow ambiguity or accessibility gaps |
| UI implementation | ui-dev | ui-designer | UI changes + contract checks | Contract mismatch, failing UI tests |
| API implementation | api-dev | solution-architect | API endpoints + schema updates | Contract mismatch, failing API tests |
| End-to-end validation | qa-tester | codex-orchestrator | Test report + defect list | Failing gates or critical regressions |
| Loop orchestration | codex-orchestrator | solution-architect | Routed backlog and owner tags | Unclear next owner or blocked handoff |

## Routing Defaults

- Prefer a single primary owner per task.
- Escalate to `codex-orchestrator` if ownership is contested.
- Return to the nearest upstream design/build skill when test failures indicate contract drift.
