# SLIs, SLOs, SLAs, error budgets

Source: https://sre.google/sre-book/service-level-objectives/

## Terms

- **SLI**: a quantitative measure of service level (latency, error rate, throughput, availability, durability).
- **SLO**: target or range for an SLI (`SLI <= target`, or `lower <= SLI <= upper`).
- **SLA**: contract with consequences for missing SLOs. No explicit consequence means it is an SLO. SLAs are business/legal decisions; SRE helps avoid triggering them.
- **Availability**: fraction of well-formed requests that succeed (yield). Nines: 99% = 2 nines, 99.999% = 5 nines.

## What to measure

| System | SLIs |
|--------|------|
| User-facing serving | availability, latency, throughput |
| Storage | latency, availability, durability |
| Pipeline / big data | throughput, end-to-end latency (per stage too) |
| All | correctness (often a data property, not infra) |

Server-side collection is the default. Add client-side measurement when server metrics miss user-visible problems (e.g. time until page usable in browser).

## Aggregation

- Aggregate over a window into rate, average, or percentile. Window choice matters: 200 req/s on even seconds and 0 on odd has the same average as steady 100 req/s but double instantaneous load.
- Averages hide the tail; treat metrics as distributions. Typical 50 ms with 5% of requests 20x slower is invisible in the mean.
- Use p99/p99.9 for worst case, p50 for typical. Queueing makes tails worse under load.
- Latency is skewed and bounded below by 0 (and above by timeouts): do not assume mean = median or normal distribution.

## Standardize indicators

Use an SLI template so each spec states only non-default parts: aggregation interval, region, measurement frequency, included requests, where measured (server/client), latency definition (e.g. time to last byte).

## Writing objectives

- Example: "99% (averaged over 1 minute) of Get RPCs complete in < 100 ms, across all backend servers."
- Several tiers capture the curve: 90% < 1 ms, 99% < 10 ms, 99.9% < 100 ms.
- Separate objectives per workload class (throughput clients vs latency-sensitive clients).
- Work backward from user needs; do not start from what is easy to measure.

## Choosing targets

- Do not pick from current performance (locks in heroics).
- Keep it simple; complicated aggregation obscures changes.
- Avoid absolutes ("always available", "infinitely scalable").
- Few SLOs. Drop any that never wins a priority argument.
- Perfection can wait: start loose and tighten; relaxing later is worse.
- Keep an internal SLO tighter than the published one (safety margin).
- Do not overachieve: users depend on actual performance. Throttle, or schedule controlled outages, so dependencies stay honest (Chubby example).

## Error budget

- 100% is unrealistic and undesirable. The budget is the allowed miss rate (track daily/weekly, review monthly/quarterly): "an SLO for meeting other SLOs".
- Budget consumption drives release pace: budget left, ship; budget burned, slow down and fix reliability.
- Spare headroom is capacity for tech debt, features, experiments.

## Control loop

1. Measure SLIs. 2. Compare to SLOs. 3. Decide what must change. 4. Act (e.g. latency trending to a miss in hours: test CPU-bound hypothesis, add servers).

## Publishing

Publishing SLOs sets expectations and cuts unfounded complaints. Be conservative in what an SLA advertises; broad audiences make it hard to change later.
