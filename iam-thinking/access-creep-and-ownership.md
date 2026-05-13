# Access Creep and Ownership

I have been thinking about access creep while building my Entra ID lab.

The lab case itself is small on purpose: Hannu Hanhi has Sales access, CRM access and temporary Finance access that should have been removed after a short project.

Related lab case: [Role Creep Case: Hannu Hanhi](../entra-lab/03-role-creep-hannu.md)

But the real problem behind this is not small.

Access creep is not just “someone has too many groups”.

That is only what we can see on the surface.

The deeper problem is this:

> Access often lives longer than the business reason behind it.

And that is where IAM starts to get interesting.

Not flashy. Not dramatic. Just quietly messy in the background.

## Access does not usually become messy all at once

In real environments, access creep rarely starts with one huge obvious mistake.

It grows quietly.

A user needs access quickly because work cannot wait.  
Someone covers another person during sick leave.  
A team is short-staffed.  
A project needs extra hands.  
A manager approves access because the request makes sense in that moment.  
Service Desk adds the user to the requested group because the request is approved.

None of this is automatically wrong.

Actually, most of these decisions are completely reasonable when they happen.

The weakness appears later, when the reason for the access is gone but the access itself stays.

That is the uncomfortable part.

IAM is not only about who can click “add member”.

It is about whether the organization knows why that membership exists in the first place.

## Visibility matters more than people think

One thing I have noticed when working with older Azure AD views is that access can feel strangely hidden.

Groups and memberships are there, yes.

But they often feel like they are behind a wall. You need to open the right “room” before you really see who is inside.

And that matters.

If visibility is poor, wrong access does not scream.

It just sits there.

Quietly.

A user can be in a group they no longer need, but unless someone knows where to look, it is easy to miss.

In Microsoft Entra, the experience feels more open to me. It feels easier to move between users, groups and memberships and notice when something looks off.

That visual clarity matters because IAM work is not only about creating access.

It is also about spotting access that no longer makes sense.

If the system makes relationships hard to see, cleanup becomes harder.

And when cleanup is hard, people avoid it.

Classic human behaviour. Annoying, but very real.

## Service Desk can execute, but it cannot own the business reason

This is one of the most important points for me.

Service Desk can add a user to a group.  
Service Desk can remove a user from a group.  
Service Desk can follow a ticket, check approval and complete the technical action.

But Service Desk cannot always know whether the user truly needs that access from a business point of view.

If a nurse is covering another unit, who knows when that cover ends?

If a sales person helped Finance with reporting, who knows whether the reporting project is done?

If an employee changed team, who knows which old accesses are still valid and which ones should be removed?

Those are not purely technical questions.

They are business ownership questions.

This is where many access processes become weak.

The technical team is expected to “manage access”, but the actual knowledge about the access need lives somewhere else.

A support team can see the group membership.

A manager should understand the business reason.

An application owner should understand what the access means.

If those responsibilities are not clear, old access becomes nobody’s problem.

And when access becomes nobody’s problem, it becomes permanent by accident.

## “Leave it just in case” is not harmless

One pattern I have seen is the idea of leaving access in place “just in case”.

It sounds practical.

Maybe the user will need it again.  
Maybe removing it creates extra work.  
Maybe it is easier to avoid another ticket later.  
Maybe nobody wants to break anything.

I understand why people think like this.

In busy environments, removing access can feel like unnecessary friction.

But from an IAM point of view, “just in case” is a weak justification.

Access should be based on current need, not possible future convenience.

If the user needs the access again later, there should be a new request with a current reason.

Otherwise the access model slowly becomes a collection of old assumptions.

And old assumptions are dangerous because they start looking normal after a while.

Nobody questions them anymore.

That is how the mess gets comfortable.

## Managers are part of the control, whether they know it or not

I have noticed that managers are not always trained to understand how important their role is in access management.

They may approve access because the employee needs to work.

They may not know what kind of data or systems a group gives access to.

They may not know that temporary access should have an end date.

They may assume access management is mainly an IT responsibility.

But approving access is not just an administrative task.

It is a control point.

When a manager approves access, they are basically saying:

> This person has a valid business need for this access.

That means the manager also needs to understand that the need can end.

If managers are not trained to think about access lifecycle, the process becomes grant-heavy and removal-light.

Access goes in easily.

Access does not come out as easily.

And then everyone is surprised when the access model looks like a storage closet nobody has cleaned since 2017.

## Healthcare makes the problem more complicated, not less important

In healthcare environments, I understand why access has to move fast.

People change shifts.  
Someone gets sick.  
Another person covers.  
New staff may need access quickly because patient care cannot wait for a perfect access process.

That reality matters.

IAM cannot be designed like a slow bureaucratic wall when the environment needs speed.

But the need for speed does not remove the risk.

It means the process needs to be better designed.

Fast access should still have ownership.  
Temporary access should still have a review point.  
Emergency or cover access should still leave evidence.

If the environment is high-pressure and sensitive, access governance becomes more important, not less.

Because the data is sensitive, the work is critical and the consequences of wrong access can be serious.

The answer is not:

> make access difficult.

The answer is:

> make access fast, traceable and reviewable.

That is the difference.

## Audit is where weak ownership becomes visible

Role creep also creates audit problems.

In daily work, an old group membership may not look dramatic.

But in an audit, the question changes.

The question is no longer only:

> Does the user have access?

The question becomes:

> Can you prove why the user has access?

That is a very different standard.

If Hannu has Finance access, the organization should be able to explain why.

Who approved it?  
What business reason supports it?  
Is the reason still valid?  
When was it reviewed?  
Who owns that group?

If nobody can answer, the weakness is not only the access.

The weakness is lack of evidence.

That is a senior-level IAM concern.

Access without explanation is hard to defend.

And if access reviews are done without real context, they become theatre.

People approve what already exists because they do not have enough information to challenge it.

That is not governance.

That is checkbox clicking with better branding.

## Old access increases incident impact

There is also an incident response angle.

If Hannu’s account is compromised, the attacker does not care what Hannu’s current job title is.

The attacker gets whatever access Hannu’s account has.

If Hannu still has old Finance access, the blast radius is bigger than it should be.

This is why unnecessary access matters even when the user is trustworthy.

The risk is not only:

> Will Hannu misuse this?

The risk is also:

> What happens if Hannu’s account is misused?

Old access quietly increases damage potential.

That is why cleanup is security work, not just housekeeping.

## My current thinking

The more I think about IAM, the more I see that access management is really lifecycle management.

Granting access is only one moment.

The bigger picture is:
