# Joiner, Mover and Leaver Risks

This note documents what I have practised and thought through around Joiner, Mover and Leaver processes.

The idea sounds simple on paper:

- a user joins the organization
- a user changes role
- a user leaves the organization

In real environments, it is rarely that clean.

User lifecycle management touches HR data, managers, access owners, system owners, automation, Service Desk, identity systems, security and the user’s ability to actually do their work.

The technical action may be simple.

Create the account.  
Add the group.  
Remove the access.  
Disable the user.

But the risk is usually not only in the button click.

The risk is in whether the organization actually knows what should happen, who owns the decision and how the result is verified afterwards.

## What I practised

In this learning area, I practised thinking through common user lifecycle risks:

- what can go wrong when a new user is created
- why copying access from another user can be risky
- how old access stays behind when a user changes role
- why temporary access needs an end point
- what can happen if a leaver account is not disabled correctly
- what can happen if an account is disabled too early
- how internal role changes can create duplicate or confusing identities
- why name changes and naming rules matter
- why access reviews need real context, not only approval clicks

The goal was not only to understand the terms Joiner, Mover and Leaver.

The goal was to understand where the process can break in a real working environment.

## Why JML matters

A good Joiner, Mover and Leaver process helps users get the right access at the right time.

It should also remove access when the user no longer needs it.

That second part is just as important as granting access.

If the process is weak, the result can be messy:

- new users may receive too much access
- users may miss access they need for work
- old access may stay behind after role changes
- temporary access may become permanent by accident
- leaver accounts may stay active
- accounts may be disabled too early
- duplicate accounts may be created
- managers may approve access without understanding the impact
- Service Desk may be left to fix problems without having the business context

JML is not only about account creation and account closure.

It is the digital lifecycle of a worker.

If that lifecycle does not follow the real employment lifecycle, access starts to drift away from reality.

## Ownership is often the hardest part

One of the biggest risks I see in JML processes is unclear ownership.

HR may own employment data.  
The manager may understand the user’s actual work.  
The system owner may understand what the application roles mean.  
IT may perform the technical change.  
Service Desk may handle the ticket.  
The user only sees whether they can work or not.

If these parts do not connect, the process becomes fragile.

Service Desk can create an account or add a group membership, but Service Desk does not always know what access the user truly needs.

A manager may approve access, but the manager may not understand what the group actually gives.

A system owner may understand the application, but may not be included in the approval flow.

This is where access problems start.

Not always because somebody did something careless.

Often because the responsibility is split across many people, but nobody owns the whole chain.

## Joiner risk: copying access from another user

A new user joins Ankkalinna Oy.

For example, Hupu Ankka starts in production.

The request may say:

> Give Hupu the same access as Aku. Aku does the same work.

This sounds practical.

It is also risky.

Aku may have worked in the organization for years. He may have changed roles, helped in different projects, covered for another person or received temporary access that was never removed.

If Aku’s access is copied directly to Hupu, the new user may inherit all of that history.

Not only the access needed for the current job, but also old permissions that no longer make sense.

The risk is that the new user starts with too much access from day one.

The better question is not:

> Who looks similar enough to copy?

The better question is:

> What access does this role actually require?

Copying access from another user may be fast, but it can also copy old mistakes.

## Mover risk: new access is added, old access is forgotten

Mover cases are often more difficult than joiner or leaver cases.

The user does not leave the organization.

They move inside it.

That makes the situation easy to underestimate.

When someone changes role, the focus often goes to the new access:

- what systems do they need now?
- what groups should be added?
- what tools are needed in the new team?

But the more difficult question is:

> What should be removed?

For example, Iines Ankka used to work in administration and had access to sensitive documents, reports and HR-related information.

Later, she moves to production.

Production access is added, but administration access is not removed.

Now Iines can do her new work, but she may also still have access from her old role.

That is where role creep starts.

The move was handled halfway.

The new access was added, but the old access was not reviewed.

A mover process should not only add what is missing.

It should also check what no longer belongs.

## Temporary access that becomes permanent

Temporary access is one of the easiest ways to create long-term access risk.

Hannu Hanhi covers for a manager during summer vacation.

He gets access to approval folders and reports.

The reason is valid.

The access is needed.

The problem starts when the cover period ends and nobody removes the access.

Six months later, Hannu may still have access to information he only needed for two weeks.

That does not mean Hannu did anything wrong.

It means the process had no cleanup point.

Temporary access should have one of these:

- an end date
- an access review date
- an owner who is responsible for removal
- an automated lifecycle rule
- a ticket or process step that confirms cleanup

If temporary access has no end point, it is not really temporary.

It is just permanent access with a temporary story.

## Leaver risk: account stays active

Leaver processes should be reliable.

When a user leaves, access should be removed at the correct time.

But this can fail.

For example, Roope Ankka leaves Ankkalinna Oy.

HR has the end date, but the automation does not run correctly.

The account stays active.

If nobody notices, Roope may still have access to email, files or business systems after leaving.

That is a serious risk.

Not because the user will automatically misuse the access, but because the organization no longer has control over who can access its systems.

A leaver process should not depend only on hope that automation worked.

There should be evidence, logging or some kind of verification that the account was actually disabled and access was removed.

## Leaver risk: account is disabled too early

The opposite problem can also happen.

Aku Ankka’s contract is extended, but the extension is not updated in time.

From the system’s point of view, Aku is still leaving.

The account is disabled automatically.

Aku comes to work the next day and cannot sign in.

Now the problem becomes operational:

- work stops
- the user is frustrated
- Service Desk gets a ticket
- the manager has to explain the contract extension
- access may need to be restored quickly

This is also a JML risk.

Security is important, but so is continuity of work.

A good leaver process needs exception handling.

If contract extensions, internal transfers or delayed HR updates are common, the process needs a way to catch them before access is cut off too early.

## Internal changes can create identity confusion

Not every change is a clean joiner, mover or leaver.

Sometimes the same person continues around the organization, but their relationship changes.

For example:

- an hourly worker becomes an office employee
- an intern becomes a permanent employee
- an external consultant becomes an internal employee
- an internal employee leaves and returns later as a consultant
- a fixed-term employee continues in a new role

These cases can become messy because HR, identity systems and access processes may not interpret the change the same way.

One system may treat the person as a new worker.

Another system may still see the old identity.

The result can be confusing:

- a new account is created
- the old account stays active
- the user has both internal and external identities
- email addresses become unclear
- permissions stay attached to the wrong account
- access history becomes harder to follow
- reporting and audit trails become messy

The person is the same human being, but the systems may not agree what identity they should use.

That is why internal changes need careful handling.

The goal should be identity continuity where appropriate, but also correct access based on the new relationship.

A consultant should not automatically keep the same access they had as an internal employee.

Same person does not always mean same access need.

## Name changes and identity data

Name changes are another good example of how a small human change can touch many technical layers.

For example, Iines Ankka gets married and becomes Iines Hanhi.

The request sounds simple:

> Update the name.

But the actual change may involve several things:

- display name
- login name
- primary email address
- old email alias
- HR data
- AD attributes
- Entra ID values
- Exchange attributes
- application profiles
- reporting data

If the name is changed from the wrong place, the change may be overwritten later.

If the email address is changed badly, mail flow may break.

If the UPN is changed without checking dependencies, sign-in or application matching may be affected.

If a new account is created instead of updating the existing identity, the organization may create an identity split.

This is why I treat name changes as small identity changes, not only cosmetic edits.

Related note: [Name Change and Identity Continuity](./name-change-identity-risks.md)

## Naming conflicts and naming rules

Duplicate names can also create identity problems.

If Ankkalinna Oy already has one Aku Ankka and another Aku Ankka joins, the organization cannot use the same username or email address for both.

Without a clear naming rule, every case becomes a manual exception.

That makes the environment harder to understand later.

A naming convention does not need to be perfect, but it should be consistent enough that accounts are predictable and supportable.

The problem is not only that two people have the same name.

The problem is what happens if the organization has no clean way to create and manage their digital identities.

## Access reviews should not become a clicking exercise

Access reviews are supposed to help clean up access.

But they only work if the reviewer understands what they are reviewing.

For example, Roope Ankka receives a list of users who have access to a finance system.

He is busy.

He does not know every user.

He does not fully understand why each person has access.

So he approves everything.

On paper, the review is complete.

In reality, very little was reviewed.

This creates a false sense of control.

The organization can say that access reviews are being done, but the quality of the review is weak.

A useful review needs context:

- what does this access allow?
- why does this user have it?
- does the user still need it?
- who owns the system?
- who can challenge the access if it looks wrong?

Without context, access review becomes a ritual.

It may satisfy a process requirement, but it does not actually reduce risk.

## What a good JML process should consider

A good JML process should not rely on memory, assumptions or random tickets.

It should answer questions like:

- where does the user data come from?
- who owns the user’s employment status?
- who approves access?
- who owns the system or application?
- who removes old access?
- how are role changes detected?
- how is temporary access ended?
- how are leaver actions verified?
- how are automation failures noticed?
- how is audit evidence preserved?
- how is the user informed about changes?
- what does Service Desk need in order to act correctly?

The process does not need to be heavy for the sake of being heavy.

But it needs enough structure that access follows the user’s real work.

## My current thinking

The biggest challenge in JML is not only technical.

The hardest part is that responsibility is often spread across different people and systems.

HR knows the employment status.  
Managers know the work need.  
System owners know the application roles.  
IT performs the technical changes.  
Service Desk handles the tickets.  
The user experiences the result.

If these parts do not connect, access becomes a layer of old decisions, assumptions and forgotten exceptions.

That is where risk grows.

A good JML process should keep the digital identity aligned with the user’s real situation.

When the user starts, they should get the access they need.

When the user changes role, old access should be reviewed.

When the user leaves, access should end at the right time.

And when something changes in between, the process should be able to handle it without creating duplicate identities, missing access or old permissions that nobody owns anymore.
