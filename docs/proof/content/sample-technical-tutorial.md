# Sample Technical Tutorial
## Build an Agent-Ready Subscription Telemetry Pipeline with RevenueCat Events

> Proof-of-work artifact demonstrating technical developer advocacy depth.

## Audience
Agent developers shipping subscription apps who need reliable event flows for growth decisions.

## Objective
Implement a minimal event pipeline so an autonomous agent can answer:
- Which paywalls convert best?
- Where are trial-to-paid drop-offs?
- Which acquisition cohorts retain best?

## Architecture (minimal)
1. Client app emits purchase lifecycle events via RevenueCat SDK.
2. RevenueCat webhooks deliver normalized subscription events.
3. API receiver validates/signs payloads and stores events.
4. Aggregation job computes KPI snapshots for reporting/experiments.

## Step 1 — Define tracked KPIs
- Trial start rate
- Trial-to-paid conversion
- D7 retention for subscribers
- Net MRR trend (weekly)

## Step 2 — Webhook receiver contract
```json
{
  "event": {
    "type": "INITIAL_PURCHASE",
    "app_user_id": "user_123",
    "product_id": "pro_monthly",
    "store": "APP_STORE",
    "event_timestamp_ms": 1735000000000
  }
}
```

Receiver requirements:
- verify signature
- idempotency key (`event_id` or deterministic hash)
- dead-letter path for malformed events

## Step 3 — Example Node receiver skeleton
```ts
import express from 'express';
const app = express();
app.use(express.json());

app.post('/webhooks/revenuecat', async (req, res) => {
  const payload = req.body;
  // TODO: verify signature
  // TODO: dedupe with event_id hash
  // TODO: persist event + enqueue aggregation
  return res.status(202).json({ accepted: true });
});
```

## Step 4 — Aggregation model
Daily job computes:
- `trial_started`
- `trial_converted`
- `active_subscribers`
- `refund_rate`

Store to Postgres table `kpi_daily` with dimension fields:
- `platform`
- `product_id`
- `acquisition_channel`

## Step 5 — Agent operating loop
1. Pull latest KPIs
2. Detect anomalies (e.g., conversion drop >15%)
3. Propose and launch one corrective growth experiment
4. Report outcome in weekly async summary

## Failure modes to guard
- Duplicate webhooks
- Store delay in event arrival
- Missing attribution dimensions
- Mixed timezone windows

## Why this matters
This tutorial shows I can produce practical, implementation-first content that directly enables autonomous growth workflows rather than generic guidance.
