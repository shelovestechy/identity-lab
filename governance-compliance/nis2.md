# NIS2 - Practical View

NIS2 is the EU directive for cybersecurity risk management and incident reporting.

The directive entered into force at EU level on 16 January 2023. EU Member States had to transpose it into national law by 17 October 2024. In Finland, the NIS2 obligations entered into force on 8 April 2025 through national cybersecurity legislation. 

In plain words, NIS2 is about making sure important organizations do not treat cybersecurity as optional background noise.

It focuses on cyber resilience, risk management, management responsibility, supply chain security and incident handling.

For identity and access work, NIS2 matters because messy access can make cyber incidents worse.

If an account is compromised, the attacker gets whatever access that account has.

That is where access control becomes very real.

## What NIS2 is for

NIS2 is meant to improve the overall level of cybersecurity across the EU.

It applies to many essential and important sectors, such as energy, transport, healthcare, digital infrastructure, public administration and other critical services.

The basic idea is simple:

important services need stronger cybersecurity management.

Organizations should not only react when something breaks.

They should manage cyber risk before incidents happen and be ready to respond when they do.

## What it contains

At a high level, NIS2 includes topics like:

| Topic | Plain meaning |
|---|---|
| Cybersecurity risk management | Organizations need to identify and manage cyber risks |
| Incident reporting | Significant incidents need to be reported |
| Management responsibility | Leadership is responsible for cybersecurity, not only IT |
| Business continuity | Important services should survive disruption |
| Supply chain security | Suppliers and service providers can create cyber risk |
| Technical and organizational measures | Security needs both tools and process |
| Supervision | Authorities can monitor and enforce requirements |
| Cooperation | EU countries and authorities work more closely together |

For IAM work, the most relevant areas are access control, privileged access, external users, supplier access, logging, monitoring, incident response and leaver processes.

## What it requires in simple words

NIS2 expects cybersecurity to be managed as a real business risk.

That means organizations need to think about:

- what systems and services are critical
- what cyber risks could affect them
- how incidents are detected
- how incidents are reported
- who is responsible for cybersecurity
- how suppliers and external access are controlled
- how continuity is protected if something goes wrong

The important point is responsibility.

Cybersecurity cannot be only “IT will handle it somehow”.

Management, system owners, security teams, IT teams and service providers all have a role.

## How I connect this to IAM

NIS2 connects to IAM through incident impact.

Access does not only matter before an incident.

It also matters during an incident.

If access is too broad, the damage can be bigger.

If old accounts are still active, they can be abused.

If privileged access is not controlled, attackers may get more power.

If external users are forgotten, the attack surface grows.

If leaver processes fail, the organization may not know who can still access systems.

This is why identity and access are not separate from cyber resilience.

They are part of it.

## My practical interpretation

The most useful NIS2 idea for me is that cybersecurity risk is not only about preventing incidents.

It is also about limiting how bad an incident can become.

That connects directly to identity and access.

A weak access process can increase the blast radius of an incident.

For example:

- a user keeps access from an old role
- an external consultant account is not disabled
- a privileged account is used too broadly
- a shared admin account has poor traceability
- logs do not clearly show who did what
- access reviews exist but do not remove risky access

None of these may look dramatic on a normal day.

But during an incident, they matter a lot.

The attacker does not care what the user’s job title is.

The attacker cares what the account can reach.

That is the NIS2 connection I care about.

## What I would check

When looking at access work through a NIS2 lens, I would check:

- are critical systems identified?
- are privileged accounts limited and monitored?
- are old accounts disabled properly?
- are leaver processes reliable?
- are external users reviewed?
- are supplier accounts controlled?
- are shared accounts avoided or tightly managed?
- are logs useful for incident investigation?
- can risky access be found quickly?
- does management understand the access risk?

This is not about making every account process painfully slow.

It is about reducing the damage if something goes wrong.

## Example: compromised account

Hannu Hanhi works in Sales.

His account is compromised.

If Hannu only has current Sales access, the incident is still serious, but the damage is more limited.

If Hannu also has old Finance access, temporary approval rights and forgotten project access, the situation is worse.

The attacker does not care what Hannu’s current job title is.

The attacker cares what Hannu’s account can reach.

That is why old access matters.

Not only for audits.

For real incident impact.
