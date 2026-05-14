# Finnish Cybersecurity Regulation - Practical View

Finland’s Cybersecurity Act came into force on 8 April 2025.

The law implements the EU NIS2 directive in Finland.

In plain words, this means that cybersecurity risk management is no longer only a nice internal best practice for many organizations.

For organizations under the law, it becomes a regulated responsibility.

The practical point is simple:

important organizations need to manage cyber risks, prepare for incidents and be able to show that cybersecurity is handled in a controlled way.

## What the law is for

The Finnish Cybersecurity Act is about cybersecurity risk management and incident reporting.

It is meant to strengthen the cybersecurity level of important and critical sectors.

The law does not mean that every organization suddenly needs the same technical setup.

The point is that organizations covered by the law need to understand their own cyber risks and manage them properly.

That includes both technical and organizational measures.

So this is not only:

> do we have security tools?

It is also:

> do we have responsibility, process, ownership and evidence?

That is where this becomes interesting from an IAM point of view.

## What it contains

At a high level, the Finnish cybersecurity regulation connects to topics like:

| Area | Plain meaning |
|---|---|
| Risk management | Organizations need to identify and manage cybersecurity risks |
| Incident reporting | Significant incidents need to be reported to the correct authority |
| Management responsibility | Cybersecurity cannot be left only to technical teams |
| Critical services | Important services need stronger protection |
| Supply chain | Vendors and service providers can create risk |
| Supervision | Authorities can monitor compliance |
| Documentation | Risk management and incident handling need evidence |
| Continuity | Organizations should prepare for disruptions |

For IAM work, the most relevant parts are access control, privileged access, external users, supplier access, leaver processes, logging, monitoring and incident investigation.

## What it requires in simple words

The law pushes organizations to treat cybersecurity as managed risk.

That means the organization should not rely on:

- informal habits
- undocumented access
- “someone knows”
- old accounts nobody owns
- external users nobody reviews
- admin rights that are handed out too casually
- incident handling that starts from panic

The organization needs a clearer way to manage cyber risk before something happens.

That includes knowing what systems matter, who can access them, how incidents are detected and who is responsible when something goes wrong.

## How I connect this to IAM

From an IAM point of view, Finnish cybersecurity regulation makes access management more serious.

If an organization needs to show that it manages cyber risk, it should also be able to show that access is controlled.

That means things like:

- leaver accounts are disabled on time
- privileged access is limited and reviewed
- external users are not forgotten
- supplier access has an owner
- critical systems have stronger access control
- access changes leave evidence
- logs can support incident investigation
- risky access can be found quickly

This is where access work connects directly to cyber risk.

A forgotten account is not only a messy directory problem.

A broad admin right is not only a convenience problem.

An external user without review is not only a lifecycle problem.

All of these can become incident impact problems.

## My practical interpretation

The important part for me is that cybersecurity regulation makes informal security harder to defend.

A company may have skilled people.

A company may have good tools.

A company may have people who “usually know what to do”.

But if responsibilities, access decisions and incident processes are not clear, the control is weak.

That matters especially when something goes wrong.

During an incident, nobody wants to start asking:

- who owns this system?
- why does this account still exist?
- who approved this external access?
- why does this user have privileged rights?
- where are the logs?
- who reports this?
- what actually happened?

Those questions should not be a surprise.

Good governance means the organization has thought about them before the incident.

## What I would check

When looking at access work through a Finnish cybersecurity regulation lens, I would check:

- are critical systems identified?
- are system owners known?
- are privileged accounts limited?
- are privileged actions logged?
- are leaver accounts disabled on time?
- are external users reviewed?
- are supplier accounts controlled?
- are shared accounts avoided or tightly managed?
- are access changes documented?
- can incident investigation use identity logs?
- does management understand the access-related cyber risk?

This is not about making every process slow.

It is about making important access controlled enough that the organization is not blind when something goes wrong.

## Example: supplier access

Ankkalinna Oy uses an external vendor to maintain a critical business system.

The vendor needs access.

That may be completely valid.

But the access should not be invisible.

A better process would clarify:

| Question | Why it matters |
|---|---|
| Who owns the vendor relationship? | Someone must be responsible |
| What system does the vendor access? | Criticality matters |
| What level of access is needed? | Admin access has higher risk |
| Is the access personal or shared? | Traceability matters |
| How long is access needed? | Supplier access should not live forever |
| Is activity logged? | Incidents need evidence |
| Who reviews the access? | External access needs ownership |

The vendor may need access to do the work.

But that access still needs a clear owner, clear scope and clear review point.

## Practical takeaway

Finnish cybersecurity regulation makes cyber risk management more concrete.

For IAM work, the lesson is clear:

access control is part of cyber resilience.

If users, admins, suppliers and external accounts are not controlled, the organization carries more risk than it may realize.

The painful part is that this risk can stay quiet for a long time.

Until an incident happens.

Then every old account, broad permission and missing owner suddenly matters.

## Related portfolio notes

These notes show how this thinking connects to practical access scenarios:

- [NIS2 - Practical View](./nis2.md)
- [Joiner, Mover and Leaver Risks](../iam-thinking/joiner-mover-leaver-risks.md)
- [Access Creep and Ownership](../iam-thinking/access-creep-and-ownership.md)
- [Access Request Is Not Just a Ticket](../iam-thinking/access-request-is-not-just-a-ticket.md)
- [Role Creep Case: Hannu Hanhi](../entra-lab/03-role-creep-hannu.md)
