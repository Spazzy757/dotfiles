# Managing incidents

Source: https://sre.google/sre-book/managing-incidents/

## Unmanaged-incident failure modes

- Tunnel vision on the technical problem; nobody sees the bigger mitigation picture.
- Poor communication: nobody knows who does what; leaders and customers get no updates.
- Freelancing: uncoordinated production changes that make things worse.
- Unclear ownership; executives escalating directly with no single status source.

## Process (Incident Command System)

- **Recursive separation of responsibilities:** each person keeps to their role, delegates, and may spin off subincidents. This gives autonomy without second-guessing.
- **Incident Commander:** holds high-level state, assigns roles, owns every undelegated role.
- **Operations:** the only people who change the system during an incident.
- **Communications:** public face; periodic updates to responders and stakeholders.
- **Planning:** longer-term work (file bugs, handoffs, logistics, track divergence from normal so it can be reverted).
- **One command post** (war room or chat channel) with logging; **one live incident state doc** (template, key info at top, kept for postmortem).
- **Explicit handoff:** outgoing commander briefs and stays until the incoming one acknowledges; announce who leads.

## When to declare

Declare early; closing it quickly is cheap. Treat as an incident if any: a second team is needed, customers see the outage, or it is unsolved after an hour of focused work. Set criteria in advance.

## Practices

Prioritize: stop the bleeding, restore service, preserve evidence. Prepare procedures beforehand. Trust role autonomy. Notice panic and ask for help. Re-check the approach periodically. Practice the process regularly (including non-incident cross-team changes, DR tests, role-play). Rotate roles.

## Monitoring implication

Alerts should carry enough context (dashboard, runbook, severity) to decide quickly whether to declare an incident, and alert output should be loggable into the incident channel for the postmortem timeline.
