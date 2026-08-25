# Identity Architecture After Acquisition

## Case

A company acquires another company.

On paper, this is a business decision.

The acquired company brings new employees, systems, data, devices, vendors, customers and ways of working into the organization.

From an identity architecture point of view, this is not just an organizational change.

It is a major transition that affects how people authenticate, how systems trust users, how data remains available and how business operations continue during the change.

The acquiring company now needs to decide how people from the acquired company will access systems, how their identities will be managed, how old accounts will be handled and how business continuity will be protected during the transition.

If this is planned poorly, the impact is not only technical.

People may lose access to the tools they need.  
Data may become difficult to reach.  
Old accounts may stay active for too long.  
Support tickets may increase heavily.  
Users may become confused about which account to use.  
Security teams may lose visibility.  
The business may slow down during the migration.

This is where identity becomes a business-critical topic.

## What this shows

An acquisition is not only about moving users from one environment to another.

It is about deciding how trust, accounts, authentication, data ownership, access paths, user experience and operational support will work after the companies become connected.

There are many practical questions:

- Will the acquired company keep its own tenant for a while?
- Will users be migrated into the acquiring company’s tenant?
- Will both environments exist side by side during a transition period?
- How will email, Teams, SharePoint and business applications work?
- Which accounts should remain active?
- Which old accounts should be disabled and when?
- How will MFA and Conditional Access be handled?
- How will Service Desk support users during the change?
- Who owns communication to end users?
- How will access to old data be preserved safely?

These are not small details.

They affect whether the business can keep operating during the change.

## Why this matters for the business

A badly planned identity transition can create real business disruption.

If users lose access too early, they cannot do their work.

If old accounts are disabled before data and applications are migrated, important information may become difficult or impossible to reach.

If users receive new accounts without clear instructions, they may not know which credentials to use for email, Teams, files or business systems.

If the old environment stays open without clear control, it may create security risk.

If support teams are not prepared, Service Desk becomes the place where all confusion lands.

The business may experience this as:

- lost productivity
- delayed customer work
- confused employees
- increased support costs
- data access problems
- poor communication
- security gaps
- frustration toward IT

This is why identity architecture must be part of acquisition planning early.

It should not be treated as a technical cleanup task after the business deal is already done.

## Why this matters at the practical level

At the ground level, acquisition-related identity problems often show up as simple user issues.

A user cannot log in.  
A user has two accounts and does not know which one to use.  
A user cannot access old files.  
A mailbox has changed.  
Teams access is broken.  
A shared folder is missing.  
MFA prompts behave differently than before.  
The user’s old domain no longer works.  
A business application still expects the old identity.

For the user, this feels like “IT broke everything.”

For Service Desk, this becomes a flood of tickets.

But the root cause may be higher up in the design.

If the identity transition was not clearly planned, documented and communicated, support teams are left cleaning up the consequences one ticket at a time.

That is not efficient.

It is also unfair to the people handling the support.

Service Desk can help users through change, but Service Desk cannot fix a missing identity architecture.

## Example situation

Ankkalinna Oy acquires Muumimaailma Oy.

The business goal is to bring Muumimaailma employees into Ankkalinna’s Microsoft 365 environment.

Muumimaailma users already have their own accounts, mailboxes, Teams data, SharePoint files and access to several business applications.

Ankkalinna wants users to start using new Ankkalinna accounts.

The technical change sounds simple at first:

Create new accounts.  
Assign licenses.  
Move users to the new environment.  
Close old access later.

But in real life, the details matter.

Some users still need access to old Muumimaailma files.  
Some business applications still use old accounts.  
Some email history is still needed.  
Some users are involved in customer work that cannot stop during the migration.  
Some managers need to know when their teams must switch accounts.  
Service Desk needs clear instructions before users start calling.

If the old Muumimaailma domain is closed too early, users may suddenly lose access to important data.

If both old and new accounts stay active for too long without control, the organization may create unnecessary risk.

If communication is weak, users will guess what to do.

And users guessing during a migration is how chaos gets a cute little hat and starts tap dancing on the Service Desk queue.

## Architecture perspective

The question is not only:

“How do we create accounts for the acquired users?”

A better question is:

“How do we design a safe identity transition that protects business continuity, security and user experience?”

This means looking at the whole identity lifecycle during the acquisition.

Important areas include:

- account creation
- account migration
- authentication
- MFA
- Conditional Access
- licenses
- email access
- collaboration tools
- application access
- legacy systems
- data access
- guest access
- admin access
- support model
- communication
- old account decommissioning
- audit evidence

The goal is not just to move identities.

The goal is to make sure people can continue working safely during and after the change.

## Architecture considerations

A stronger identity architecture would define the transition clearly.

For example:

- which identity system is the future source of truth
- whether the acquired tenant will be kept temporarily
- how long old accounts remain active
- which users need access to both environments
- how MFA and Conditional Access are aligned
- which applications must be migrated first
- which data must remain accessible after account changes
- how users are informed before each phase
- what Service Desk should check when users report problems
- when old domains, accounts and access paths can be safely retired

This should be planned in phases.

A rushed cutover may look efficient, but it can create unnecessary business damage if users are not ready.

A long transition may feel safer, but it can create security and management problems if old access is not controlled.

The better approach is controlled transition.

Not panic migration.  
Not eternal coexistence.  
Controlled transition.

## Risk areas

Several risks should be considered during an acquisition-related identity change.

### Business continuity risk

Users may lose access to tools, files or applications they still need.

This can delay customer work, internal operations and management tasks.

### Security risk

Old accounts may remain active without proper monitoring.

Users may have access in both old and new environments.

Admin accounts, service accounts or legacy access paths may be forgotten.

### Data access risk

Important data may be tied to old accounts, old groups or old domains.

If access is removed too early, the organization may lose practical access to needed information.

### User experience risk

Users may not understand when to use old credentials and when to use new credentials.

Confusing login behavior creates frustration and avoidable support tickets.

### Support risk

Service Desk may receive a large number of tickets without having enough documentation, known issue lists or escalation paths.

This makes the support experience worse for both users and IT.

### Compliance and audit risk

If the organization cannot explain who had access during the transition, why old accounts stayed active or when access was removed, the migration may create audit problems later.

## What I would look for

In this kind of case, I would not only look at whether the new accounts were created.

I would look at the whole transition model.

Questions I would ask:

- What is the target identity architecture after the acquisition?
- Are users moving to a new tenant, or will there be coexistence?
- Which systems still depend on old identities?
- Which old accounts must remain active temporarily?
- Who approves continued access to the old environment?
- How is MFA handled across both environments?
- Are Conditional Access policies aligned or completely different?
- What happens to email, Teams, SharePoint and OneDrive data?
- Are users clearly informed before changes happen?
- Does Service Desk have migration-specific support instructions?
- Are old admin accounts, service accounts and guest accounts reviewed?
- Is there a clear decommissioning plan for old access?
- Can the organization explain the access model during the transition?

These questions are not only technical.

They connect identity design to business continuity, security, communication and operational support.

## Better outcome

A better outcome would be a planned identity transition with clear phases.

### 1. Discovery

Map users, domains, applications, groups, admin accounts, service accounts, data locations and critical business processes.

### 2. Design

Decide the target identity architecture, coexistence model, authentication requirements and migration order.

### 3. Communication

Inform users, managers and support teams about what will change, when it will happen and what actions are required.

### 4. Controlled migration

Move users, data and applications in a planned order instead of cutting everything at once.

### 5. Support readiness

Prepare Service Desk with known issues, troubleshooting steps, escalation paths and clear ownership information.

### 6. Security control

Monitor old and new accounts, apply MFA, review admin access and avoid leaving unmanaged legacy access behind.

### 7. Decommissioning

Disable or remove old accounts, domains and access paths only after business need, data access and application dependencies have been handled.

This kind of approach reduces chaos.

It also makes the change easier to defend later.

## Practical observation

An acquisition can expose how mature an organization’s identity architecture really is.

If identity is treated as an afterthought, the migration becomes reactive.

Accounts are created quickly.  
Users are confused.  
Old access stays open.  
Support gets overloaded.  
Business units complain.  
Security starts asking questions after the damage is already visible.

But if identity is included early, IAM can support the business change instead of becoming a bottleneck.

This is the difference between account administration and identity architecture.

Account administration asks:

“How do we create the users?”

Identity architecture asks:

“How do we make sure the organization can trust, support and secure these users during the whole transition?”

That is a much better question.

## Summary

This case shows that identity is not only about managing accounts or granting access.

In an acquisition, identity becomes part of business continuity, security, communication, user experience and operational stability.

A weak identity transition can slow down the business and create unnecessary risk.

A strong identity architecture helps the organization move through change in a controlled way.

The goal is not only to get users into the new environment.

The goal is to make sure people can keep working, data remains protected and old access is retired safely when it is no longer needed.
