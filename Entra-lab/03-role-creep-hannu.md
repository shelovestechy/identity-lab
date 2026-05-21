# 03 - Role Creep Case: Hannu Hanhi

This page documents a role creep scenario in my Ankkalinna Entra ID lab.

The goal is to practise how old access can remain behind when a user changes responsibilities, receives temporary access or supports another team for a short time.

This case is simple on purpose, but the problem is realistic.

Role creep is not always caused by careless users or bad intentions. Often it is caused by unclear ownership, missing review points and temporary access that nobody remembers to remove.

## What is role creep?

Role creep means that a user slowly collects more access than they currently need.

This can happen when a user:

- changes department
- joins a temporary project
- helps another team
- covers for another employee
- receives urgent access during a busy period
- gets access that is never reviewed or removed later

The problem is not always one big mistake.

More often, it is many small access decisions that are individually understandable, but together create a weak access model.

## Scenario

Hannu Hanhi works as a Sales Representative at Ankkalinna Identity Lab Oy.

His normal access is:

- `SG-Sales-Basic`
- `SG-App-CRM-Users`

This makes sense because Hannu works in Sales and needs CRM access for customer-related work.

Later, Hannu helps the Finance team with a short reporting project.

For that project, he is added to:

- `SG-Finance-Basic`

The finance access is meant to be temporary.

The project ends, but Hannu is not removed from the finance group.

Now Hannu still has Finance access even though his current role is Sales.

That is role creep.

## Why this matters

Role creep weakens the trustworthiness of the access model.

The issue is not only that Hannu has one extra group membership.

The bigger issue is that the organization can no longer clearly prove that access follows current business need.

This affects several areas.

## Least privilege

Least privilege means users should only have the access they need for their current role.

If Hannu works in Sales but still has Finance access, the access model no longer follows least privilege.

This increases unnecessary exposure to sensitive information.

Even if Hannu never misuses the access, the access still exists.

That matters.

## Audit readiness

In an audit, it is not enough to say “we think the access is probably fine”.

The organization should be able to explain:

- why the user has the access
- who approved it
- what business need it supports
- whether the access is still needed
- when it was last reviewed
- who owns the access decision

If Hannu has Finance access but nobody can explain why, that is an audit weakness.

The problem is not only the access itself.

The problem is missing evidence and weak control.

## Access reviews

Access reviews become less useful if group ownership and membership reasons are unclear.

If a reviewer sees Hannu in `SG-Finance-Basic`, they should be able to decide whether that access is valid.

But if there is no context, the reviewer may approve it just because “it was already there”.

That turns access review into a checkbox exercise instead of a real control.

A good access review needs context.

## Incident impact

Unnecessary access can increase the impact of an incident.

If Hannu’s account is compromised, the attacker may get access to more than Hannu actually needs for his current job.

This means old access can increase the blast radius of an incident.

The more unnecessary access exists, the harder it is to contain damage.

## Data protection

Finance access may include sensitive business information.

Even basic finance access can matter depending on what systems or data are connected to the group.

If access is not removed when the business need ends, sensitive data may be exposed to users who no longer need it.

This creates risk for confidentiality, internal policy and compliance.

## Before cleanup

At this point, Hannu has his normal Sales access and one extra Finance group.

| User | Current role | Groups |
|---|---|---|
| Hannu Hanhi | Sales Representative | SG-App-CRM-Users, SG-Finance-Basic, SG-Sales-Basic |

The problematic group membership is:

- `SG-Finance-Basic`

This access was originally added for a temporary finance reporting project.

After the project ended, the access should have been reviewed and removed if no longer needed.

## Access review questions

Before removing or approving Hannu’s Finance access, I would ask:

- Does Hannu still work in Sales?
- Does Hannu still need CRM access?
- Why does Hannu have Finance access?
- Is there still a current business reason for it?
- Who approved the Finance access?
- Was the access meant to be temporary?
- Is there an end date or review date?
- Who owns the Finance group?
- Would this access make sense in an audit?

If nobody can explain the business reason, the access should not stay.

## Cleanup decision

Hannu no longer needs access to `SG-Finance-Basic`.

The correct cleanup action is to remove him from:

- `SG-Finance-Basic`

His normal access should remain:

- `SG-Sales-Basic`
- `SG-App-CRM-Users`

The goal is not to remove access randomly.

The goal is to align access with current business need.

## After cleanup

After review, Hannu’s unnecessary Finance access was removed.

| User | Current role | Groups |
|---|---|---|
| Hannu Hanhi | Sales Representative | SG-App-CRM-Users, SG-Sales-Basic |

Now Hannu’s group membership matches his current Sales role.

This is a cleaner access state.

## Better process

A better process would prevent this from becoming a long-term issue.

Temporary access should have:

- a clear business reason
- a named requester
- an approver or owner
- an expected end date
- a review date
- documented cleanup responsibility

For project-based access, the access request should not only answer “who needs access?”

It should also answer “when should this access end?”

## Security note

Screenshots are not included on this page yet.

Before adding screenshots to GitHub, I will review and blur tenant identifiers, user principal names, group object identifiers and any other technical details that should not be published.

## Evidence to add later

When screenshots are added, they should show the case clearly without exposing unnecessary technical identifiers.

Planned evidence:

- Hannu’s group memberships before cleanup
- removal of `SG-Finance-Basic`
- Hannu’s group memberships after cleanup

The evidence should support the case, not expose the tenant.

## Senior-level takeaway

The real risk in role creep is not only one user having one extra group.

The real risk is losing control over the access model.

If old access is not removed, the organization slowly loses visibility into who can access what and why.

That affects security, audit readiness, access reviews, data protection and incident response.

Good IAM is not only about granting access.

It is also about removing access when the reason no longer exists.

## What I learned

Role creep is a practical IAM problem.

It can happen even when every single access request looked reasonable at the time.

The weakness appears later if nobody owns the cleanup.

This case helped me practise thinking about access as a lifecycle:

- access is requested
- access is approved
- access is granted
- access is used
- access is reviewed
- access is removed when no longer needed

Access should not live forever just because nobody remembered to clean it up.

## Next step

The next page will continue with group ownership, approvers, risk levels and review needs.
