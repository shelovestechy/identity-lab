# 05 - Manual Access Review Simulation

This page documents a manual access review simulation in my Ankkalinna Entra ID lab.

This is not an automated Microsoft Entra ID Governance access review.

The purpose is to practise the review logic manually first:

- what group is reviewed
- who should review it
- what members are checked
- what decision is made
- what evidence is captured
- what cleanup is done after the review

The focus is not the portal button.

The focus is the access decision.

## Review scope

For this simulation, I reviewed the group:

| Group | Purpose | Risk level | Reviewer |
|---|---|---|---|
| SG-Finance-Basic | Basic finance access | High | Head of Finance / Finance Owner |

This group is a good review target because finance access can expose sensitive business data.

Even basic finance access should not be treated like generic office access.

## Review question

The review question is simple:

> Does each member still need this access for their current role?

This is the important part.

The review is not only checking whether the user is listed in the group.

The review should challenge whether the membership still makes sense.

Access can be valid when it is granted and invalid later when the user’s role, project or business need changes.

## Current members before review

Before the review, `SG-Finance-Basic` had the following members:

| User | Current role | Review decision | Reason |
|---|---|---|---|
| Roope Ankka | Head of Finance | Keep | Current finance leadership role |
| Hannu Hanhi | Sales Representative | Remove | Temporary finance project access is no longer needed |

## Finding

The review found that Hannu Hanhi was still a member of `SG-Finance-Basic`.

Hannu works in Sales.

He had Finance access because of a temporary reporting project, but that project is no longer active.

This means the access no longer matches his current role.

The issue is not that Hannu did anything wrong.

The issue is that the access stayed behind after the business need ended.

## Review decision

| User | Decision | Action |
|---|---|---|
| Roope Ankka | Keep access | No change |
| Hannu Hanhi | Remove access | Remove from `SG-Finance-Basic` |

The decision should be based on current need, not old history.

If there is no current business reason, the access should not stay.

## Cleanup action

After the review, Hannu Hanhi was removed from `SG-Finance-Basic`.

His normal Sales and CRM access remained unchanged.

| User | Access after cleanup |
|---|---|
| Hannu Hanhi | SG-Sales-Basic, SG-App-CRM-Users |
| Roope Ankka | SG-Finance-Basic, SG-Finance-Leadership, SG-App-CRM-Users |

Now the group membership better matches the current business need.

Roope still has Finance access because it matches his current role.

Hannu no longer has Finance access because the temporary need has ended.

## Evidence captured

For this review, useful evidence would include:

| Evidence | Purpose |
|---|---|
| Group membership before review | Shows original group membership |
| Review decision table | Shows who was reviewed and what decision was made |
| Group membership after cleanup | Shows that unnecessary access was removed |
| Written reason | Explains why access was kept or removed |

The evidence does not need to be huge.

It needs to be clear enough that someone can understand the review later.

Good evidence should show:

- what was reviewed
- who was included
- what decision was made
- what changed after the review
- why the decision was made

## Security note

Screenshots are not included on this page yet.

Before adding screenshots to GitHub, I will review and blur tenant identifiers, user principal names, group object identifiers and any other technical details that should not be published.

## Evidence to add later

When screenshots are added, they should support the review without exposing unnecessary technical identifiers.

Planned evidence:

- `SG-Finance-Basic` membership before review
- Hannu Hanhi removed from `SG-Finance-Basic`
- `SG-Finance-Basic` membership after review

The evidence should prove the cleanup, not expose the tenant.

## What this review shows

This review shows why group membership should not be trusted forever.

Access can be correct when it is granted and wrong later.

That is why reviews matter.

The real value of an access review is not that someone clicks “review complete”.

The value is that old access is found, challenged and removed when it no longer makes sense.

## Practical takeaway

A manual access review is simple, but it still needs structure.

A useful review should have:

- clear scope
- correct reviewer
- current role context
- keep or remove decision
- cleanup action
- evidence after the decision

A review without cleanup is only a list.

A review with a decision and action is control.

## What I learned

Access review is not only about confirming who is in a group.

It is about checking whether the access still matches the user’s current role and business need.

This simulation helped me practise access review as a control:

- define the review scope
- check membership against current role
- make a keep or remove decision
- remove unnecessary access
- document the reason
- keep evidence of the cleanup

The most important part is not the review table.

The most important part is whether the review leads to action when access no longer makes sense.

## Next step

The next page will focus on application access modelling and separating standard users, owners and sensitive application access.
