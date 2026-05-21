# 07 - Privileged Access Risk Model

This page documents a privileged access risk model in my Ankkalinna Entra ID lab.

The goal is to practise how privileged access should be limited, justified and reviewed.

Privileged access is different from normal business access because it can allow users to make changes that affect other users, systems, security settings or access rights.

The point is not only to ask:

> Who needs admin access?

The better question is:

> What exact privileged action is needed, why is it needed and how can the risk be limited?

## What is privileged access?

Privileged access means access that gives a user more power than a normal user account.

This can include the ability to:

- manage users
- reset passwords
- assign roles
- change security settings
- manage groups
- manage applications
- view sensitive admin information
- affect access for other users

In a real environment, privileged access should be treated carefully because a mistake or compromised admin account can have a much bigger impact than a normal user account.

## Lab scenario

In this lab, Mikki Hiiri works as a Security Specialist.

He belongs to:

- `SG-Security-Basic`
- `SG-Privileged-Role-Eligible`

`SG-Security-Basic` represents normal security team access.

`SG-Privileged-Role-Eligible` represents a planning example for privileged access eligibility.

The idea is not that Mikki should have permanent broad admin rights.

The idea is that some elevated access may be needed for specific tasks, but it should be controlled.

## Why permanent admin access is risky

Permanent admin access can create unnecessary risk.

If a user has admin access all the time, the access exists even when the user is not actively doing admin work.

That increases risk because:

- the account becomes a more valuable target
- mistakes can have wider impact
- old admin access may be forgotten
- access reviews become more important
- it becomes harder to prove why the access is still needed

Standing privilege should not exist only because it is convenient.

Convenience is not the same as control.

## Better privileged access thinking

A better model asks:

- what task requires elevated access?
- what role is actually needed?
- does the user need permanent access or temporary access?
- who approves the access?
- how long should the access last?
- what evidence should be captured?
- when should the access be reviewed?
- how is the access removed when no longer needed?

The goal is to avoid giving broad access when a smaller, more specific role would be enough.

## Example: Mikki Hiiri

Mikki works with security-related tasks.

That does not automatically mean he should be a Global Administrator.

A better approach would be to identify the exact task.

| Task | Possible access need | Risk |
|---|---|---|
| Review sign-in activity | Read-only security or reporting access | Lower |
| Investigate risky users | Security-related role may be needed | Medium |
| Manage user access | User or group management role may be needed | Medium / High |
| Change tenant-wide settings | Highly privileged role may be needed | High |
| Assign admin roles | Privileged role management access may be needed | High |

The role should match the task.

If the task only requires viewing information, write or admin-level access should not be granted just in case.

## Privileged group example

In this lab, `SG-Privileged-Role-Eligible` is treated as high risk.

| Group | Purpose | Risk level | Review need |
|---|---|---|---|
| SG-Privileged-Role-Eligible | Planning example for privileged access eligibility | High | Monthly |

This group should not become a storage place for users who “might need admin rights someday”.

Membership should have a clear reason.

The group should have:

- clear owner
- clear approver
- clear business or technical reason
- limited membership
- regular review
- cleanup when the need ends

## Eligibility vs active access

There is a difference between being eligible for privileged access and actively using privileged access.

Eligibility means the user may be allowed to activate elevated access when needed.

Active access means the elevated access is currently in use.

Even eligibility should be controlled because it can still create risk.

In a stronger privileged access model, elevated access should be:

- justified
- time-limited
- approved when needed
- logged
- reviewed regularly

The goal is to reduce standing privilege.

## Example risk: broad admin access

If Mikki was given permanent broad admin access, the issue would not only be that he has “too much access”.

The issue would be that the access model does not clearly prove:

- why the access is needed
- what task it supports
- who approved it
- whether a smaller role would be enough
- whether the access is still needed
- when it was last reviewed

Broad admin access may be easy to grant, but hard to justify later.

## Review logic

A privileged access review should ask more than:

> Is this user trusted?

Trust is not enough.

The review should ask:

> Does this user still need this privileged access for current work?

Example review logic:

| User | Access | Review question |
|---|---|---|
| Mikki Hiiri | SG-Privileged-Role-Eligible | Does Mikki still need eligibility for privileged access? |
| Aku Ankka | No privileged access | Does Aku need admin access or only normal IT support access? |
| Minni Hiiri | Application owner access | Does Minni need application owner access but not tenant admin access? |

This keeps the review focused on actual need and scope.

A user can be responsible and still not need broad admin rights.

## Least privilege

Least privilege is especially important for privileged access.

The user should only receive the access needed for the task.

For example:

- do not give Global Administrator if a more limited role is enough
- do not give permanent access if temporary access is enough
- do not give write access if read-only access is enough
- do not keep privileged access after the need has ended

Privileged access should be narrow, justified and reviewed.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Users may have unnecessary or permanent privileged access |
| What control is being practised? | Limiting privileged access through justification, scope and review |
| Who should own the decision? | Security Owner / IAM Owner |
| What evidence would support the control? | Group membership, approval reason, review decision and cleanup evidence |
| What should happen if access is no longer needed? | Remove the user from privileged access eligibility |

## Security note

Screenshots are not included on this page yet.

Before adding screenshots to GitHub, I will review and blur tenant identifiers, user principal names, group object identifiers, role identifiers and any other technical details that should not be published.

## Evidence to add later

When screenshots are added, they should support the privileged access model without exposing unnecessary technical identifiers.

Planned evidence:

- `SG-Privileged-Role-Eligible` group overview
- example membership for Mikki Hiiri
- review of privileged access eligibility
- cleanup evidence if privileged access is removed later

The evidence should show the access control logic, not expose the tenant.

## Practical takeaway

Privileged access should not be treated like normal access.

The stronger the access, the stronger the justification, ownership and review process should be.

Admin access should not be granted only because it is convenient.

It should be limited to what is needed, reviewed regularly and removed when the reason no longer exists.

## What I learned

This case helped me practise privileged access as a risk model.

The important part is not only whether someone has admin access.

The important part is whether the access is:

- justified
- scoped correctly
- approved by the right owner
- reviewed regularly
- removed when no longer needed

Privileged access is not only about trust.

It is about control.

## Next step

The next page will focus on leaver cleanup, blocking sign-in and reducing orphaned identity risk after employment ends.
