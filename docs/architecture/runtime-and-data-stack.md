# Runtime and Data Stack

## Objective
Define a production-capable architecture for operating the Agentic AI Developer & Growth Advocate workflow with reliability, observability, and governance.

## Runtime Topology

### Compute
- Primary host: dedicated Linux VM (or Kubernetes workload pool)
- Packaging: Docker Compose (or Kubernetes) with isolated services

### Core Services
1. **orchestrator**
   - Routes tasks to role skills
   - Enforces handoff contracts and gate checks
2. **ingestion-worker**
   - Pulls docs, API refs, changelogs, repos, community/media sources
3. **content-worker**
   - Generates technical/growth artifacts and publication packages
4. **growth-worker**
   - Runs experiment lifecycle (hypothesis → launch → analysis)
5. **community-worker**
   - Tracks interactions, follow-ups, and channel coverage
6. **feedback-worker**
   - Synthesizes product feedback packets
7. **reporting-worker**
   - Produces weekly async KPI reports
8. **channel-adapter layer**
   - Integrates interaction surfaces (Jira, Slack/Teams, Discord/Telegram, GitHub)
   - Normalizes inbound/outbound events into shared task and telemetry schemas

## Data Layer

### 1) Postgres (source of truth)
Use relational tables for operational truth and reporting:
- tasks, runs, handoffs, incidents
- content_artifacts, experiments, interactions
- product_feedback_items
- weekly_reports
- model_usage (cost, latency, quality metadata)

### 2) Qdrant (semantic retrieval)
Use vector search for unstructured knowledge retrieval:
- docs chunks
- SDK/API reference sections
- forum/community threads
- transcripts from video/audio
- normalized summaries

Recommended metadata fields:
- source_type (`docs`, `api`, `repo`, `blog`, `video`, `forum`, `social`)
- source_url
- platform (`ios`, `android`, `flutter`, `react-native`, `web`)
- sdk_version
- published_at
- ingested_at
- confidence
- checksum

### 3) Object storage (evidence/artifacts)
Store immutable artifact objects:
- raw source pulls
- screenshots/media
- transcripts
- report exports
- generated assets

Postgres stores pointers + checksums for lineage.

## Ingestion and Knowledge Pipeline

1. **Collect**
   - Fetch from docs/API/blog/changelog/repo/media/community sources
2. **Normalize**
   - Convert HTML/Markdown/OpenAPI/transcripts/OCR output to canonical text chunks
3. **Enrich**
   - Tag metadata (source/platform/version/date/confidence)
4. **Index**
   - Embed and store in Qdrant
5. **Reconcile**
   - Write lineage and freshness records in Postgres
6. **Diff**
   - Detect source changes and trigger update tasks

## Model Routing Strategy

Use task-aware model routing:
- High-reasoning model: architecture decisions, feedback synthesis, high-stakes strategy
- Coding-specialized model: SDK examples, scripts, test harnesses
- Fast economical model: tagging, classification, formatting, first drafts
- Long-context model: large corpus ingestion/diff analysis

Escalate model tier automatically when:
- validation fails
- confidence is low
- task risk is high

Persist model usage metrics in Postgres for quality/cost optimization.

## Security and Access

- Least-privilege service accounts per integration
- Scoped credentials (read-only ingestion vs publish permissions)
- Secrets in Vault/SSM/1Password (no long-lived plaintext secrets)
- Audit log for all external actions
- Human approval gates for policy-sensitive publication actions

## Reliability and Operations

- Queue-based retries with dead-letter queue
- Idempotent workers and run deduplication
- Health checks and readiness probes
- Structured logging + tracing + alerts
- Daily backup + restore test for core stores

## Why this stack

This architecture separates concerns cleanly:
- **Postgres** for truth and workflow state
- **Qdrant** for retrieval over unstructured knowledge
- **Object storage** for raw evidence and reproducible artifacts

That combination supports speed, traceability, and rigorous weekly execution.
