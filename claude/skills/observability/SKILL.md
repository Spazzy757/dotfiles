---
name: observability
description: Use when building out monitoring for a system or service - choosing what to measure, defining SLIs/SLOs, writing alert rules, designing dashboards, deciding what pages a human, or reviewing noisy/missing monitoring. Based on the Google SRE book (monitoring, SLOs, practical alerting, troubleshooting). Triggers on Prometheus/Grafana rules, "how should we monitor X", pager fatigue, error budgets.
---

# Observability: building out monitoring for a service

Based on the Google SRE book: [Monitoring Distributed Systems](https://sre.google/sre-book/monitoring-distributed-systems/), [SLOs](https://sre.google/sre-book/service-level-objectives/), [Practical Alerting](https://sre.google/sre-book/practical-alerting/), [Effective Troubleshooting](https://sre.google/sre-book/effective-troubleshooting/), [Being On-Call](https://sre.google/sre-book/being-on-call/), [Emergency Response](https://sre.google/sre-book/emergency-response/), [Managing Incidents](https://sre.google/sre-book/managing-incidents/).

Details live in `references/`. Load only what the task needs:
- `references/slos.md` - SLI/SLO/SLA, targets, error budgets
- `references/alerting.md` - collection, recording/alert rules, routing, probes, config hygiene
- `references/troubleshooting.md` - what to expose so incidents are debuggable
- `references/on-call.md` - sustainable paging load, rotation sizing, overload fixes
- `references/incidents.md` - incident roles, command post, when to declare
- `references/emergency-response.md` - lessons from test/change/process-induced outages

## Build order (do these in sequence)

1. **Define the service and its users.** What does a user of this service do? Name the journeys. (Serving: availability, latency, throughput. Storage: latency, availability, durability. Pipeline: throughput, end-to-end latency, freshness. All: correctness.)
2. **Pick few SLIs, then SLOs.** Work backward from user needs, not from what is easy to measure. Start loose, tighten later. See `references/slos.md`.
3. **Instrument the golden signals** (below) white-box, per service, with consistent labels and a request ID that spans tiers.
4. **Add black-box probes** on the user-facing path (frontend and backends, per zone).
5. **Write alerts on symptoms** (SLO burn, error ratio, latency at the edge). Each page passes the page test. See `references/alerting.md`.
6. **Build one dashboard per service**: golden signals first, then dependencies, then resources. Deploy/config annotations on every graph.
7. **Route by severity:** page, ticket, or dashboard only. Email alerts get ignored; prefer a dashboard.
8. **Review regularly.** Delete signals no dashboard or alert uses, and alerts nobody acts on.

## Rules

- **Page on symptoms, not causes.** Causes go on dashboards for debugging. Only alert on a cause when it is definite and imminent (disk full in 4h, n+0 redundancy).
- **Every page is urgent, actionable, needs human judgement, and is novel.** Rote response means automate it. Can wait until morning means ticket.
- **White-box + black-box.** Black-box catches what users see now. White-box finds causes, imminent problems, and failures masked by retries.
- **Simple as possible, no simpler.** The path from onset to page to triage must be understandable by the whole team. No self-learning thresholds, little dependency-aware alert logic (except stable cases like drained datacenters).
- **Do not alert on single-instance failures.** Aggregate, prune outliers, tolerate dependency failure.
- **Keep monitoring separate** from profiling, crash tracking, log analysis, load testing. Loosely couple via stable APIs.
- **Nobody stares at a screen.** If something needs watching, it needs an alert or automation.
- **Monitor for the long term.** Judge total paging per shift, not each page. Trading a short-term availability hit for a root-cause fix beats heroics.

## Four golden signals

Measure all four for every user-facing system. Page when one is bad (saturation: nearly bad).

| Signal | Measure | Notes |
|--------|---------|-------|
| **Latency** | Time to serve | Split success vs error latency. A slow error is worse than a fast one; fast 500s skew averages |
| **Traffic** | Demand in a system-specific unit | HTTP req/s (static vs dynamic), sessions, txn/s |
| **Errors** | Failing request rate | Explicit (5xx), implicit (200 with wrong content, needs e2e checks), policy (slower than SLO) |
| **Saturation** | Fullness of the most constrained resource | Systems degrade before 100%; set a utilization target. Rising p99 over short windows is a leading indicator. Alert on predicted exhaustion |

## Measure the tail

- Never design around the mean. A 100 ms average can hide 1% of requests at 5 s; with several backends a backend's p99 becomes the frontend's median.
- Collect **histograms** with roughly exponential buckets (about x3: 10ms, 30ms, 100ms, 300ms...), not raw latencies or averaged percentiles.
- Use p50 for typical, p99/p99.9 for worst real experience.

## Resolution

- Match granularity to the question. For a 99.9% target, probing more than once or twice a minute is rarely needed; disk fullness every 1-2 minutes is enough.
- Per-second CPU is expensive. Sample server-side into buckets (e.g. 5% bands per second), aggregate per minute: cheap and shows short hotspots.
- A 1-minute CPU average hides spikes that drive tail latency.

## Page test (ask for every alert)

- Detects an otherwise undetected condition that is urgent, actionable, and user-visible or imminently so?
- Can I ever ignore it as benign? When, and how do I stop it firing then?
- Definitely user impact? Exclude drained traffic and test deployments.
- Can I act now? Could it be automated? Fix or workaround?
- Is someone else already paged for the same incident (dedupe/inhibit)?
- Does it link a runbook and a dashboard showing likely causes?

Any "no": downgrade to ticket or dashboard, or delete.

## Reviewing existing monitoring

1. List alerts, tag symptom vs cause. Demote cause-based pages.
2. Check golden-signal coverage per service; list gaps.
3. Find rules that rarely fire usefully (never actioned, or untouched for a quarter) and signals not on any dashboard or alert: removal candidates.
4. Check histograms/percentiles, `for:` durations, severity routing, runbook links.
5. Output: gaps, rules to delete or demote, rules to add (query, threshold rationale, runbook).

## Anti-patterns

- Paging on CPU/memory/disk percent with no user-impact link.
- Mean latency as the headline SLI; targets copied from current performance.
- Alerts that fire and get a rote response (red flag for tech debt; fix or automate it).
- Dashboards with dozens of unread graphs.
- Email alerts as a substitute for decisions.
- Alerts with no owner or runbook.
