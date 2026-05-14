# Audit Evidence - Practical View

Audit evidence sounds boring until someone needs to prove what happened.

In access work, it is not enough that access “probably made sense”.

Later, someone may ask:

- who had access?
- why did they have it?
- who approved it?
- when was it granted?
- was it still needed?
- when was it reviewed?
- when was it removed?

If the answer is only:

> I think it was added at some point

then the access process is weak.

The problem is not only the access itself.

The problem is that the organization cannot prove control.

## What audit evidence is

Audit evidence means information that shows what happened and why.

In access management, that evidence can come from things like:

| Evidence | What it can show |
|---|---|
| Access request ticket | Who requested access and why |
| Approval record | Who approved the access |
| Group membership history | When access was added or removed |
| Access review result | Whether access was checked |
| System owner decision | Who confirmed the access was valid |
| Logs | What the user or account did |
| Change record | What was changed and by whom |
| Leaver record | When access should have ended |

The point is not to collect random screenshots forever.

The point is to keep enough useful evidence that access decisions can be explained later.

## Why it matters

Audit evidence matters because memory is not a control.

People forget.

Managers change.

Service Desk people move to other roles.

Projects end.

System owners leave.

Old tickets get closed and nobody remembers the background anymore.

But access may still remain.

Without evidence, the organization is left guessing.

That is a bad place to be when someone asks why a user had access to sensitive data, finance reports, HR records, admin tools or customer information.

## Access without evidence is hard to defend

A user may have valid access.

The access may have been approved correctly.

The business reason may have been completely reasonable.

But if there is no record of it, it becomes difficult to prove later.

That is the annoying part.

Good access can look suspicious if the evidence is missing.

Bad access can look normal if nobody checks the history.

This is why documentation matters.

Not because paperwork is fun.

Because access decisions need a trail.

## What good evidence should answer

Good audit evidence should help answer:

- who requested the access?
- what access was requested?
- why was it needed?
- who approved it?
- who owns the system or data?
- when was access granted?
- who performed the change?
- was the access temporary or permanent?
- when should it be reviewed?
- when was it removed?

A ticket does not need to be a novel.

But it should include enough context that someone can understand the decision later.

## Weak evidence example

A weak access request might look like this:

> Give Aku access to reporting.

That does not explain much.

It does not say which reporting system.  
It does not say what access level.  
It does not say why access is needed.  
It does not say who approved it.  
It does not say whether the access is temporary.  
It does not say who owns the system.

The ticket may be closed, but the evidence is weak.

Later, if someone asks why Aku had access, the organization does not have a strong answer.

## Better evidence example

A better access request might look like this:

| Field | Example |
|---|---|
| User | Aku Ankka |
| System | Ankkalinna Reporting |
| Access level | Read access to production reports |
| Business reason | Weekly reporting for own team |
| Approver | Aku’s manager |
| System owner | Reporting system owner |
| Duration | Valid while Aku works in this role |
| Review | Included in next access review |

This is not heavy.

It is just clear.

Now the access decision is easier to understand, review and defend later.

## Evidence and access reviews

Access reviews also need evidence.

A review should not only show that someone clicked approve.

It should show enough context to understand whether the review was meaningful.

A weak review says:

> Reviewed.

A better review shows:

- who reviewed the access
- what access was reviewed
- what decision was made
- whether access was kept or removed
- why the decision made sense
- when the review happened

The danger is that access reviews can become theatre.

A list is sent.  
Someone approves everything.  
The process says review completed.  
Nothing actually improves.

That may create evidence that a review happened.

But it does not prove that access was properly challenged.

## Evidence and leavers

Leaver evidence is especially important.

When a user leaves, the organization should be able to show that access was removed or blocked at the right time.

Useful evidence could include:

- employment end date
- account disable date
- removed group memberships
- mailbox handling
- revoked privileged roles
- removed external access
- ticket or automation result
- logs showing the action completed

This matters because leaver mistakes can be serious.

An old account that stays active is not only a cleanup issue.

It can become a security risk.

## Evidence and incidents

During an incident, audit evidence becomes very practical.

People may need to know:

- which account was used?
- what access did the account have?
- when was access granted?
- was the access normal?
- who approved it?
- what systems were reached?
- what actions were taken?
- were old permissions involved?

If evidence is poor, incident investigation becomes harder.

The organization may lose time trying to understand basic identity and access facts.

That is not where anyone wants to be during a real incident.

## My practical interpretation

For me, audit evidence is the difference between:

> “We think this was fine.”

and:

> “We can show why this was done.”

That difference matters.

A working access process should not depend on memory, assumptions or someone being available to explain old decisions.

If access is granted, reviewed or removed, the organization should leave a useful trail.

Not endless documentation.

Useful evidence.

Enough to explain the access decision later.

## What I would check

When looking at audit evidence in access work, I would check:

- do access requests include a business reason?
- is the approver visible?
- is the system owner known?
- is the access level clear?
- is temporary access marked clearly?
- is there an end date or review date?
- are changes traceable?
- are removals documented?
- do access reviews show real decisions?
- can leaver actions be proven?
- can logs support incident investigation?

## Practical takeaway

Audit evidence is not just about passing an audit.

It is about being able to prove control.

If access exists, there should be a reason.

If access was approved, there should be a record.

If access was reviewed, the decision should make sense.

If access was removed, the removal should be visible.

Without evidence, access management becomes guesswork with a nicer interface.
