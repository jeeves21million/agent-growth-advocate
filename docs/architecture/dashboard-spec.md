# Agent Operations Dashboard Spec

## Purpose
Provide real-time visibility into what the system is doing, what is blocked, and whether weekly role KPIs are on track.

## Primary Users
- Operator (day-to-day execution)
- Reviewer (quality and policy oversight)
- Stakeholder (weekly performance visibility)

## Core Views

### 1) Live Activity View
- Active tasks by skill
- Current stage (`queued`, `running`, `blocked`, `review`, `done`, `failed`)
- Runtime, model in use, last heartbeat
- Direct links to artifacts/logs

### 2) Queue & SLA View
- Backlog by priority and owner skill
- Aging tasks and SLA risk
- Blocked reasons and dependency chains

### 3) Weekly KPI Scoreboard
Track role commitments:
- content pieces published (target >=2)
- growth experiments run (target >=1)
- meaningful interactions (target >=50)
- structured product feedback items (target >=3)
- weekly report delivery (target =1)

### 4) Quality and Validation View
- Gate pass/fail rates
- Citation/source coverage rate
- Common rejection reasons
- Rework loop frequency

### 5) Model Cost & Performance View
- Cost by skill/task type/model
- Median/95p latency
- Quality vs cost trend
- Escalation rate (fast model -> high-reasoning model)

### 6) Incident View
- Recent failures and retries
- Dead-letter queue items
- Escalations requiring human action

## Event Model
Every task emits lifecycle events:
- `task.created`
- `task.assigned`
- `task.started`
- `task.blocked`
- `task.awaiting_review`
- `task.completed`
- `task.failed`

Each event includes:
- task_id, run_id
- skill_name
- model_name
- timestamps
- artifact pointers
- error metadata (if any)

## Implementation Notes

### Backend
- API service (FastAPI or Node) over Postgres + queue + object store metadata
- WebSocket/SSE for realtime updates

### Frontend
- React/Next.js dashboard
- Role-based pages and filters
- Deep links to logs/artifacts

### Access Control
- RBAC roles: operator, reviewer, viewer
- Immutable audit trail for action history

## Definition of Done
Dashboard is production-ready when:
- stakeholders can see current system state within 5 seconds
- KPI scoreboard updates automatically from run data
- blocked/failed tasks are visible with clear next-owner actions
- model cost/performance tradeoffs are reviewable weekly
