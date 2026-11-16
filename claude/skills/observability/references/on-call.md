# Being on-call

Source: https://sre.google/sre-book/being-on-call/

## Duties

- On-call manages outages and vets production changes. Pages outrank almost everything, including project work.
- Response time follows the SLO: about 5 min for user-facing/time-critical, about 30 min for less sensitive. 99.99% per quarter allows about 13 min downtime, so reaction must be minutes.
- Acknowledge, triage, work toward resolution, escalate as needed. Non-paging events wait for business hours.
- Primary + secondary rotation; define whether secondary is fall-through for missed pages or takes non-urgent work.

## Balanced load (use as monitoring/alerting design limits)

- At least 50% of SRE time is engineering; operational work at most 50%, of which on-call at most 25%.
- Team size: single-site 8 engineers for 24/7 primary+secondary with week shifts; dual-site at least 6 (preferred when justified: no night shifts).
- **Quality:** an incident (related alerts, one root cause, one postmortem) costs about 6 h of work, so at most 2 incidents per 12 h shift. Pages should be flat with a median of 0 per day. More than 1 incident per day per component is unsustainable.
- Targets for sustainable load: under 5 tickets/day, under 2 paging events per shift.
- Compensate out-of-hours work (time off or capped cash).

## Safety and decision-making

- Stress impairs judgement; confirmation bias ("same cause as last time") is common. Slow down for complex outages and challenge assumptions.
- Reduce stress with: clear escalation paths, defined incident procedures, blameless postmortems (timeline, events not people, what went well, automate away human error).

## Overload and underload

- Common cause of overload: bad monitoring. Pages must be SLO-threatening symptoms and actionable. Hourly low-priority alerts cause fatigue.
- Group related alerts, silence duplicates during incidents, aim for 1:1 alert-to-incident ratio.
- If dev changes drive load, negotiate shared reliability goals. Last resort: "give back the pager" (devs on-call until the service meets standards).
- Underload also hurts: keep every engineer on-call once or twice a quarter; run Wheel of Misfortune and disaster-recovery drills.
