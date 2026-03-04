# Product Feedback Packet 01

## Title
Improve webhook retry transparency for debugging failed deliveries

## Context
While running event ingestion workflows, failed webhook retries are difficult to inspect quickly from an operator perspective.

## Observed Friction
- Limited visibility into retry progression and last failure reason in one place.

## Impact
- Slows incident triage.
- Increases time-to-recovery for analytics pipelines.

## Suggested Direction
Provide a compact retry timeline per webhook delivery with:
- attempt timestamps
- response code summary
- latest failure reason
- next retry ETA

## Priority
High for teams using automated growth/reporting loops.
