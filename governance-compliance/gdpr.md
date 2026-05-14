# GDPR - Practical View

GDPR stands for General Data Protection Regulation.

It is the EU regulation for protecting personal data.

In plain words, GDPR is about making sure that personal data is handled lawfully, fairly and carefully.

It applies to personal data, which means information related to an identified or identifiable person. This can include things like names, contact details, employee records, customer data, patient-related data, user accounts, support tickets and logs if they can be linked to a person. 

## What GDPR is for

GDPR exists to protect people’s personal data and give individuals rights over how their data is used.

For organizations, it means personal data cannot be collected, viewed, stored, shared or processed casually.

There must be a valid reason for processing personal data.

The organization also needs to understand what personal data it has, why it is used, who can access it and how it is protected.

## What it contains

At a high level, GDPR includes requirements around:

- personal data processing principles
- lawful basis for processing
- data subject rights
- controller and processor responsibilities
- data protection by design and by default
- security of processing
- personal data breach handling
- transfers of personal data
- supervisory authorities and penalties

For IAM work, the most interesting parts are usually around access to personal data, data minimization, confidentiality, accountability, auditability and limiting unnecessary exposure.

The Finnish Data Protection Ombudsman also describes that personal data must be processed according to data protection principles, and that processing must have a legal basis. 

## What it “requires” in simple words

GDPR does not mean nobody can access personal data.

That would be unrealistic.

It means access to personal data should have a valid reason and proper control.

The organization should be able to show things like:

- why personal data is processed
- who needs access to it
- what access is necessary for the work
- how the data is protected
- how long data is kept
- how unnecessary access is prevented
- how access is reviewed or removed
- how misuse or breach situations are handled

The important point is that personal data access should not be based on curiosity, convenience or “just in case”.

## How this connects to access work

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
- personal information inside reports

The access question should not only be:

> Can we technically give this access?

The better question is:

> Does this user need this personal data for their current work?

That changes the whole access decision.

A broad group membership can become a data protection risk if it gives access to more personal data than the user actually needs.

## My practical interpretation

For me, the practical GDPR question in IAM is:

> Who can see personal data, and can we justify why?

If the answer is unclear, the access process is weak.

A person may work in the organization and still not need access to all personal data.

A manager may need information about their own team, but not the whole company.

Service Desk may need enough access to support users, but not unlimited visibility into sensitive data.

Healthcare staff may need fast access for care work, but that access still needs proper control and logging.

The point is not to block people from doing their work.

The point is to avoid unnecessary exposure.

## What I would check in access work

When looking at access from a GDPR point of view, I would check:

- does the system contain personal data?
- what type of personal data is involved?
- is the data sensitive or high-risk?
- who needs access for actual work?
- is read access enough?
- does the user need export or edit rights?
- is access based on role or copied from another user?
- are old accesses removed when the role changes?
- are external users reviewed?
- is access logged?
- can access decisions be explained later?

## Example

If Aku Ankka asks for access to a customer reporting system, I would not only ask which group he needs.

I would ask what customer data the system contains and what Aku needs to do with it.

Does he need to view reports for his own team?

Does he need access to all customer records?

Does he need export rights?

Does he need edit rights?

These are different levels of risk.

“Access to customer reports” is too vague if the reports contain personal data.

The request should be specific enough that the access can be limited to the actual need.

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
