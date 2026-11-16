# Emergency response

Source: https://sre.google/sre-book/emergency-response/

## When things break

Stay calm (usually nobody is in danger and it is recoverable). Pull in more people early if overwhelmed. Follow the incident process. The person with most state (often whoever made the change) is a key resource. Schedule time afterward for cleanup and write-up.

## Lessons from three failure types

**Test-induced** (a blocking test cut off one DB and cascaded through hidden dependencies)
- Test assumptions about dependencies are incomplete; test rollback in a test environment first.
- Communicate and refine the incident process before running big tests.

**Change-induced** (global config push crash-looped the fleet; rolled back in about 5 min, incident declared in about 10)
- Worked: seconds-level alerting, out-of-band comms, CLI/alternate access, rate-limited full config updates.
- Canary every change thoroughly regardless of perceived risk; rare input + new feature escaped a light canary.
- Alert storms overwhelm on-call. Incident tooling must not depend on the failing services. Practice backup tools.

**Process-induced** (turndown automation read an empty filter as "all machines")
- Automation needs sanity checks, explicit empty-input handling, and guards on bulk destructive actions.
- Drain traffic first, freeze automation and maintenance. Recovery can take days: keep slow/fragile reinstall paths tested.

## Recommendations

- Keep an honest history of outages; publish postmortems; hold owners accountable for follow-ups.
- Ask "what if" (power loss, dark primary datacenter, compromised server): is there a plan, a contact, and could the next person execute it?
- Test proactively during working hours with the best people watching, not a surprise at 2 a.m.
- Canary everything; guard automation; keep out-of-band comms and rollbacks exercised.
- Monitoring implication: detect within seconds, avoid alert storms (group and inhibit), and keep monitoring and incident tooling independent of the production path they watch.
