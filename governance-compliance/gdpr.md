# GDPR - Practical View

GDPR stands for General Data Protection Regulation.

It is the EU regulation for protecting personal data.

In plain words, GDPR is about making sure that personal data is handled lawfully, fairly and carefully.

Personal data means information related to an identified or identifiable person.

Examples:

- name
- email address
- phone number
- employee record
- customer data
- patient-related data
- user account
- support ticket
- log data, if it can be linked to a person

## What GDPR is for

GDPR exists to protect people’s personal data.

For organizations, it means personal data cannot be handled casually.

There should be a valid reason for collecting, viewing, storing, sharing or using personal data.

The organization should understand:

- what personal data it has
- why it is used
- who can access it
- how it is protected
- how long it is kept
- what happens if something goes wrong

## What it contains

At a high level, GDPR includes topics like:

| Topic | Practical meaning |
|---|---|
| Processing principles | Personal data should be handled fairly and carefully |
| Lawful basis | There must be a valid reason to process personal data |
| Data subject rights | People have rights over their own data |
| Controller and processor roles | Responsibilities must be clear |
| Data protection by design | Privacy should be considered from the start |
| Security of processing | Personal data needs proper protection |
| Breach handling | Personal data incidents need clear handling |
| Accountability | The organization should be able to show what it has done and why |

For IAM work, the most interesting parts are access, minimization, confidentiality, logging, accountability and unnecessary exposure.

## What it means in access work

GDPR becomes practical when someone asks for access to personal data.

For example:

- HR data
- payroll data
- customer data
- patient-related data
- employee records
- support tickets
- audit logs
- user profile data
- reports that contain personal information

The access question should not only be:

> Can we technically give this access?

The better question is:

> Does this user need this personal data for their current work?

That is the important shift.

## My practical interpretation

For me, the practical GDPR question in IAM is:

> Who can see personal data, and can we justify why?

A person may work in the organization and still not need access to all personal data.

A manager may need information about their own team, not the whole company.

Service Desk may need enough access to support users, not unlimited visibility into sensitive data.

Healthcare staff may need fast access for care work, but that access still needs proper control and logging.

The point is not to block real work.

The point is to avoid unnecessary exposure.

## What I would check

When looking at access from a GDPR point of view, I would check:

- does the system contain personal data?
- what type of personal data is involved?
- is the data sensitive or high-risk?
- who needs access for actual work?
- is read access enough?
- does the user need export rights?
- does the user need edit rights?
- is access based on role or copied from another user?
- are old accesses removed when the role changes?
- are external users reviewed?
- is access logged?
- can access decisions be explained later?

## Example: customer reporting access

Aku Ankka asks for access to a customer reporting system.

I would not only ask which group he needs.

I would ask what customer data the system contains and what Aku needs to do with it.

| Question | Why it matters |
|---|---|
| Does Aku need reports for his own team only? | Access could be limited |
| Does Aku need all customer records? | Broader access means higher risk |
| Does Aku need export rights? | Export increases data leakage risk |
| Does Aku need edit rights? | Edit access creates more impact |
| Is this permanent or temporary? | Temporary need should not become permanent |

“Access to customer reports” is too vague if the reports contain personal data.

The request should be specific enough that access can be limited to the actual need.

## What can go wrong

If GDPR-related access is handled badly, the organization may end up with:

- users seeing personal data they do not need
- old access from previous roles
- temporary access that was never removed
- external users with forgotten access
- broad export rights
- weak logging
- unclear approval evidence
- difficulty explaining why someone had access
- higher impact if an account is compromised

Most of these problems do not start as dramatic incidents.

They start as normal access decisions that were too broad, too vague or never cleaned up.

## Related portfolio notes

- [Access Request Is Not Just a Ticket](../iam-thinking/access-request-is-not-just-a-ticket.md)
- [Joiner, Mover and Leaver Risks](../iam-thinking/joiner-mover-leaver-risks.md)
- [Access Creep and Ownership](../iam-thinking/access-creep-and-ownership.md)
- [Name Change and Identity Continuity](../iam-thinking/name-change-identity-risks.md)
