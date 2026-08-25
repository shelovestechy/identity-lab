# Identity Continuity and Architecture

## What I wanted to understand

A person can change their name, email address, role, department or employer. The identity system still needs to understand that this is the same person.

This sounds obvious until several applications use the email address as a permanent identifier.

For me, identity continuity means keeping the person, account, access history and audit trail connected when visible information changes.

## The Ankkalinna name change

Iines Ankka changes her surname and becomes Iines Hanhi.

The visible request may sound simple: “Please change the name.” Behind that request there may be several different changes:

- display name
- email address and old aliases
- UPN and sign-in instructions
- Microsoft 365 and Teams information
- synchronized attributes
- application user matching
- historical audit searches

Creating a completely new account would make the screen look tidy, but it could break mailbox continuity, access history and the connection to the original identity.

## What I would check first

### Is the user cloud-only or synchronized?

If the identity is synchronized, the change should normally start from the correct source system. Editing the cloud value directly may only create a short-lived improvement before synchronization changes it back.

### Does the UPN really need to change?

A surname change does not automatically mean the sign-in name must change. UPN changes can affect saved credentials, applications, SSO and user instructions.

### What should stay stable?

Applications should prefer stable identifiers instead of treating display name, email or UPN as an unchangeable person ID.

Names change. The account should not become a new person because of it.

## The larger Ankkalinna case: an acquisition

An acquisition creates the same continuity problem on a much larger scale.

Two companies may have different:

- HR and identity source systems
- domains and naming rules
- MFA methods
- user accounts and duplicate identities
- application integrations
- privileged access models
- support processes

The question is not only how to move accounts. It is how to keep access secure and the business running while the identity architecture changes.

## Questions I would ask

| Area | Question |
| :--- | :--- |
| Source of authority | Which system owns each identity attribute during the transition? |
| Duplicate identities | How do we know that two accounts belong to the same person? |
| Access | Which old permissions should move to the new environment? |
| Authentication | How do users reach critical systems during the change? |
| Privileged access | Where are the admin accounts and who still needs them? |
| Applications | Do applications use stable IDs or changeable email addresses? |
| Service Desk | Can support see what stage each user is in? |
| Decommissioning | What evidence is needed before the old account or directory is removed? |

## What surprised me

The more I studied name changes, the less they looked like a small profile update. The same questions appear in integrations and acquisitions: source of truth, identity matching, continuity and ownership.

Service Desk often sees the user-facing problems first. That practical view is one reason this topic interests me.

## Where I am now

I have documented the technical checks and architecture questions. I have not carried out an enterprise identity migration, and I do not present this project as one.

A useful next exercise would be fictional identity matching with two CSV files: which accounts are clear matches, which are duplicates and which need a human decision.

## Supporting notes

- [Name change technical notes](../../archive/practical-notes/name-change-technical.md)
- [Name change and identity continuity](../../archive/iam-thinking/name-change-identity-risks.md)
- [Identity architecture after an acquisition](../../archive/iam-thinking/identity-architecture-after-acquisition.md)

## My takeaway

Identity data is not only profile information. It affects authentication, application access, support, audit history and business continuity.
