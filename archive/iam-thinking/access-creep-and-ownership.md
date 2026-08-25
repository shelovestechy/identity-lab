# Access Creep and Ownership

I started thinking about access creep while building my Entra ID lab.

In the lab, the example is simple: Hannu Hanhi works in Sales, but he also has temporary Finance access that should have been removed after a short project.

Related lab case: [Role Creep Case: Hannu Hanhi](../entra-lab/03-role-creep-hannu.md)

The lab case is fictional, but the problem itself feels very real.

I have seen versions of this in different customer environments, both in business settings and in healthcare-related environments. The systems, users and urgency may look different, but the pattern is often familiar: access is added for a valid reason, but nobody clearly owns the moment when it should be removed.

That is the part that interests me.

Not only the technical action of adding or removing a group membership, but the messy human and process side around it.

## Access does not usually become messy all at once

Access creep rarely starts as one big obvious mistake.

Most of the time, the beginning looks completely reasonable.

Someone needs access quickly.  
Someone is covering another person.  
A team is short-staffed.  
A project needs extra help.  
A manager approves the request because it makes sense at that moment.  
Service Desk adds the user to the requested group because the request is approved.

Nothing about that sounds strange.

In many cases, the access really is needed.

The problem starts later, when the original reason disappears but the access stays.

That is what makes access creep so easy to miss. It does not always look like a problem when it happens. It becomes a problem when nobody comes back to clean it up.

## Visibility changes what people notice

One thing I have noticed when working with older Azure AD views is that access can feel strangely hidden.

Groups and memberships are there, but they often feel like they are behind a wall. You need to open the right “room” before you really see who is inside.

That matters more than people may think.

If access relationships are not easy to see, wrong memberships do not stand out. They just sit there quietly.

A user can belong to a group they no longer need, but unless someone knows where to look, it is easy to miss.

In Microsoft Entra, the experience feels more open to me. It feels easier to move between users, groups and memberships and notice when something looks off.

That kind of visibility matters in daily work.

Not because the portal magically fixes bad processes. It does not.

But if the view is clearer, it is easier to ask better questions.

Why is this user in this group?  
Does this still match their current role?  
Is this access still needed?  
Who would know?

Those questions are harder to ask when the access model feels like it is hidden in small rooms behind several doors.

## A ticket can be approved and still miss context

This is one of the parts I keep coming back to.

In many access processes, Service Desk is the team that performs the technical action.

A ticket comes in.  
The approval looks correct.  
The requested group is added.  
The ticket is closed.

From the ticket point of view, everything may look fine.

But that does not mean the access is well understood.

Service Desk may see that Hannu needs access to `SG-Finance-Basic`, but they do not necessarily know why he needs it, how long he needs it or whether the reason still exists next month.

That context usually lives somewhere else.

It may live with the manager, the project owner, the application owner or the team that requested the access in the first place.

This is where the process can become weak.

Not because Service Desk did something wrong.

They may have followed the request exactly.

The weakness is that the technical action is clear, but the business context is not.

And if nobody owns the business context, temporary access can become permanent without anyone really deciding that it should.

## “Leave it just in case” is where the mess starts to feel normal

I have also seen the “leave it just in case” mindset.

It is easy to understand why it happens.

Maybe the user needs the access again later.  
Maybe removing it creates extra work.  
Maybe nobody wants another ticket.  
Maybe people are afraid something will break.

In busy environments, removing access can feel like extra friction.

Especially if there is pressure to keep work moving.

But “just in case” is a dangerous reason to keep access.

It turns current access need into future guessing.

And future guessing is a weak base for permissions.

Over time, those small “just in case” decisions become normal. Nobody questions them anymore because the access has been there for a long time.

That is how the mess gets comfortable.

## Managers are part of the control, even when they are not trained for it

I have noticed in different customer environments that managers are not always trained to understand how important their role is in access decisions.

They may approve access because the employee needs to work.

That is understandable.

But they may not know what kind of data or system the group actually gives access to.

They may not know whether the access should be temporary.

They may not know that approving access also creates a responsibility to review it later.

And honestly, if nobody explains this to them, why would they automatically think about it?

Many managers probably see access approval as an administrative step.

Click approve, employee can work, done.

But from what I have seen, that is where a lot of access creep begins.

The approval happens, but the follow-up does not.

The access goes in easily.

The access does not come out as easily.

And then later everyone wonders why the access model looks like a storage closet nobody has cleaned since 2017.

## Healthcare makes the problem more complicated, not less important

In healthcare-related environments, I understand why access sometimes has to move fast.

People change shifts.  
Someone gets sick.  
Another person covers.  
Staff may need access quickly because the work cannot wait.

I do not think access processes should be designed like a slow bureaucratic wall when the environment needs speed.

That would be unrealistic.

But speed does not remove the need for cleanup.

Actually, in sensitive and high-pressure environments, cleanup matters even more.

If access is granted quickly because the situation requires it, there should still be some kind of trail and review point afterwards.

Who requested it?  
Why was it needed?  
Was it temporary?  
When should it be checked again?

The answer is not to make access painful.

The answer is to make access fast enough for real work, but still traceable enough that it does not turn into silent long-term risk.

## Business environments have the same pattern in a different outfit

In sales, finance or other business environments, the urgency may look different, but the same pattern can happen.

A person helps another team for a while.  
A project needs extra visibility.  
Someone needs access to reports.  
A group is added because it solves the immediate problem.

Then the work changes, but the access stays.

The risk may not feel as urgent as in healthcare, but it is still real.

Finance data, customer data, internal reports and business systems all matter.

A user does not need to have bad intentions for old access to be a problem.

The access itself is enough to increase exposure.

## Audit asks for proof, not vibes

Old access may not look dramatic in daily work.

If Hannu has Finance access, someone might assume there is probably a reason.

Maybe he helped Finance before.  
Maybe he still needs it sometimes.  
Maybe removing it would cause trouble.

But “probably” is not a strong answer when someone asks for evidence.

If a user has access, the organization should be able to explain why.

Who approved it?  
What was the business reason?  
Is that reason still valid?  
When was it reviewed?  
Who owns the group or application?

If nobody can answer, the problem is bigger than one wrong group membership.

The problem is that the access model does not have enough evidence behind it.

That is where old access becomes more than a cleanup task.

It becomes a governance weakness.

And if access reviews are done without context, people may just approve what already exists because they do not know enough to challenge it.

At that point, the review is not really a control anymore.

It is just a ritual.

## Old access makes incidents bigger

There is also an incident angle.

If Hannu’s account is compromised, the attacker does not care what Hannu’s current job title is.

The attacker gets whatever access Hannu’s account has.

If Hannu still has old Finance access, the impact is bigger than it should be.

This is why unnecessary access matters even when the user is trustworthy.

The risk is not only:

> Will Hannu misuse this?

The risk is also:

> What happens if Hannu’s account is misused?

Old access quietly increases damage potential.

That is why cleanup is not just housekeeping.

It is part of reducing risk.

## What I am taking from this

The more I look at access problems, the more I see that granting access is only one part of the story.

The harder part is keeping access connected to reality.

Does the user still work in that role?  
Does the project still exist?  
Is the temporary cover still ongoing?  
Does the manager still stand behind the need?  
Does the application owner know who has access?

If nobody checks those questions, access starts to drift.

Not loudly.

Quietly.

One temporary group at a time.

This is why I find access creep such an interesting problem.

It shows how technical permissions, human habits, business ownership and audit evidence all meet in the same place.

The system can show who has access.

But people still need to understand why that access exists, who owns it and when it should end.
