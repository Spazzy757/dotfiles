# Practical alerting

Source: https://sre.google/sre-book/practical-alerting/ (Borgmon model; Prometheus translations below are illustrative, not from the book)

## Collection

- Targets **expose** internal state over HTTP (`/metrics`); the monitor scrapes. One fetch per target, no per-check scripts. Targets come from service discovery; spread scrapes across the interval.
- Monitor collection itself: failed scrape, name not resolving, failed health check (`up`) are alertable signals.
- Prefer **counters** over gauges: gauges miss activity between samples. Use range windows (`[10m]`) so a couple of failed scrapes leave no holes.
- Every series carries labels: job, service, zone/cluster, instance, plus breakdowns (e.g. `code`).
- Keep ~12h of fast in-memory data for incident debugging; archive older data to long-term storage.

## Rules

- Rules are algebra over time series: along time (rate) and across labels (sum).
- **Sum of rates, not rate of sums** (robust to counter resets and missing data).
- Name recording rules `level:metric:operations` (`task:`, `dc:`).

```yaml
- record: task:http_requests:rate10m
  expr: rate(http_requests_total[10m])
- record: dc:http_requests:rate10m
  expr: sum without (instance) (task:http_requests:rate10m)
- record: dc:http_errors:ratio_rate10m
  expr: sum(rate(http_responses_total{code!~"2.."}[10m])) / sum(rate(http_responses_total[10m]))
```

## Alert rules

- Boolean, and must hold for a minimum duration (at least two evaluation cycles) to avoid flapping: `for:`.
- Gate ratio alerts with a minimum rate so low traffic does not page.

```yaml
- alert: ErrorRatioTooHigh
  expr: dc:http_errors:ratio_rate10m > 0.01 and dc:http_errors:rate10m > 1
  for: 2m
  labels:
    severity: page
  annotations:
    summary: "error ratio {{ $value }}"
```

- Alert on high-level objectives at the service level; keep labels so responders can drill into components.
- Do not alert on single-machine failures. Build systems that tolerate dependency failures.

## Routing (Alertmanager)

- Deduplicate identical label sets from multiple evaluators; inhibit dependents when a parent alert fires; group by labels.
- Policy: page-worthy to on-call; important-but-subcritical to ticket queue; everything else informational on dashboards.

## Scaling and hierarchy

- Do not collect every task globally (bottleneck, single point of failure).
- Per-cluster/datacenter tier scrapes locally; a small global tier (replicated across zones) pulls only filtered aggregates. Drill down on demand. Prometheus: federation with `match[]`, or remote-write.

## Black-box probing

- White-box misses what users see (DNS failures never reach the target; crashed servers cannot report) and only covers failures you anticipated.
- Prober runs protocol-level checks, can validate response payloads, and exports latency histograms by operation. Prometheus: blackbox_exporter (`probe_success`).
- Probe both the load-balanced frontend and the backends in each zone, to localize failures and suppress redundant alerts. Record what the prober actually received.

## Config hygiene

- Define rules separately from targets so one rule set covers many targets.
- Templates/libraries: schemas for common exports (HTTP server, RPC, storage client), plus aggregation templates from task to global.
- Unit-test rules against synthesized series; run in CI; validate before loading.
- Model topology by shared fate (config file -> job/shard -> datacenter -> network).
- Monitor the monitoring (rule evaluation time, scrape health).
- Maintenance cost should grow sublinearly with service size.
