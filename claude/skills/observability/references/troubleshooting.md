# Troubleshooting: what monitoring must enable

Source: https://sre.google/sre-book/effective-troubleshooting/

## Loop

Problem report -> examine telemetry/logs -> hypothesize from system knowledge -> test (compare observation to theory, or change the system in a controlled way) -> repeat until cause found -> fix -> postmortem. Mitigating the proximate cause need not wait for root cause.

## Pitfalls

Irrelevant symptoms or misread metrics; unsafe tests; improbable theories or assuming past cause recurs; spurious correlation (inevitable at scale). Prefer probable causes and simple explanations, but several small problems can beat one rare fault.

## Triage

- Match response to severity and impact.
- In a major outage, first make the system work as well as possible (divert or shed traffic, disable subsystems), not find root cause. Preserve logs and evidence.

## Examine: what to expose

- **Metrics**: time series to find onset and correlations.
- **Logs**: text for live debugging, structured for retrospective analysis. Verbosity adjustable at runtime without restart, sampling for high traffic (e.g. 1 in 1,000), a query language to filter (slow ops, calls to a function).
- **Tracing**: distributed traces follow a request across tiers.
- **Current state endpoints**: recent sample RPCs, per-RPC error and latency histograms, current config, traceability from derived metric to source metrics.
- **Request ID** consistent across tiers; a response header (e.g. `X-Request-Trace`) listing backends that served the request.
- **Deploy and config change log**; annotate dashboards with push start/end.

## Diagnose

- Simplify: well-defined interfaces, inspect data between components, inject known test data. Divide and conquer, bisect large systems.
- Ask what is it doing, why, where do resources go, where does output go (e.g. CPU saturated -> profile -> regex backtracking; fix or use linear-time RE2).
- What touched it last: recent deploys and config/load changes.
- Build service-specific diagnostic tools; share across teams.

## Test and treat

- Prefer mutually exclusive hypotheses; test in decreasing order of likelihood weighted by risk.
- Watch confounders and side effects (verbose logging adds latency; more CPU can expose races).
- Keep timestamped notes in a shared doc/chat. Make active changes systematically and log them so you can restore the prior state.
- **Negative results are results**: do not discard them; keep repeatable experiment scripts.

## Cure

Proving causation in production is hard; expect probable causal factors. Write a postmortem: what went wrong, how found, how fixed, how to prevent recurrence.

## Make it easier up front

Build white-box metrics and structured logs into every component from the start, use observable well-understood interfaces, consistent identifiers, and simplify/log environment changes.
