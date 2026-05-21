# 03 - Role Creep Case: Hannu Hanhi

This page documents a role creep scenario in the Ankkalinna Entra ID lab.

The case shows how temporary access can remain active after the original business need has ended.

## Scenario

Hannu Hanhi works as a Sales Representative.

His normal access is:

- `SG-Sales-Basic`
- `SG-App-CRM-Users`

Later, Hannu helps the Finance team with a short reporting project.

For that project, he is added to:

- `SG-Finance-Basic`

The finance access is temporary.

The project ends, but Hannu is not removed from the finance group.

At this point, Hannu still has Finance access even though his current role is Sales.

That is role creep.

{IMAGE 01: Hannu group membership before cleanup, showing Sales, CRM and Finance access. Blur UPN, object IDs and tenant details.}

## What role creep means

Role creep means that a user slowly collects more access than they currently need.

This can happen when a user:

- changes department
- joins a temporary project
- helps another team
- covers for another employee
- receives urgent access
- keeps access that is never reviewed or removed later

The problem is usually not one single dramatic mistake.

It is often a chain of reasonable access decisions that become risky when nobody owns the cleanup.

## Risk

| Risk area | Why it matters |
|---|---|
| Least privilege | Hannu has Finance access even though his current role is Sales |
| Audit readiness | The organization may not be able to prove why the access still exists |
| Access review quality | Reviewers may approve old access if they do not understand the original reason |
| Incident impact | A compromised account could expose more data than the user currently needs |
| Data protection | Finance access may expose sensitive business information |

## Before cleanup

At the start of the review, Hannu has one unnecessary Finance group membership.

| User | Current role | Current groups |
|---|---|---|
| Hannu Hanhi | Sales Representative | SG-Sales-Basic, SG-App-CRM-Users, SG-Finance-Basic |

Problematic access:

| Group | Issue |
|---|---|
| SG-Finance-Basic | Temporary finance project access was not removed after the project ended |

## Review questions

Before keeping or removing the access, the reviewer should be able to answer:

| Question | Purpose |
|---|---|
| Does Hannu still work in Sales? | Confirms current role |
| Why does Hannu have Finance access? | Checks original business reason |
| Is the finance project still active? | Confirms whether the access is still needed |
| Who approved the access? | Checks approval evidence |
| Was the access temporary? | Checks whether an end date should have existed |
| Who owns `SG-Finance-Basic`? | Identifies review responsibility |
| Would this access make sense in an audit? | Tests whether the access can be justified |

If the current business reason cannot be explained, the access should not remain.

## Cleanup decision

Hannu no longer needs access to `SG-Finance-Basic`.

Cleanup action:

| Access | Decision | Reason |
|---|---|---|
| SG-Finance-Basic | Remove | Temporary finance project access is no longer needed |
| SG-Sales-Basic | Keep | Current Sales role |
| SG-App-CRM-Users | Keep | Current CRM access for Sales work |

{IMAGE 02: Removal of Hannu from SG-Finance-Basic or group membership update view. Blur UPN, object IDs and tenant details.}

## After cleanup

After cleanup, Hannu’s access matches his current Sales role.

| User | Current role | Groups after cleanup |
|---|---|---|
| Hannu Hanhi | Sales Representative | SG-Sales-Basic, SG-App-CRM-Users |

{IMAGE 03: Hannu group membership after cleanup, showing only Sales and CRM access. Blur UPN, object IDs and tenant details.}

## Better process

Temporary access should have a clear lifecycle.

| Requirement | Purpose |
|---|---|
| Business reason | Explains why the access is needed |
| Requester | Shows who requested the access |
| Approver or owner | Shows who accepted the risk |
| Expected end date | Prevents temporary access from becoming permanent |
| Review date | Creates a cleanup checkpoint |
| Cleanup responsibility | Defines who removes access when the need ends |

For project-based access, the request should answer two questions:

| Question | Reason |
|---|---|
| Who needs access? | Defines the access target |
| When should this access end? | Defines the cleanup point |

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Temporary access may remain after the business need ends |
| What control is being practised? | Access review and cleanup |
| What access was reviewed? | Hannu’s membership in `SG-Finance-Basic` |
| Who should own the decision? | Finance Owner / group owner |
| What evidence supports the control? | Before membership, cleanup decision and after membership |
| What should happen if access is no longer valid? | Remove the user from the group |

## Security note

Published screenshots should not expose tenant identifiers, user principal names, group object IDs or other technical identifiers.

The evidence should show the access change, not tenant details.

## Summary

This case shows how role creep can appear when temporary access is not removed.

The cleanup restores least privilege by removing Finance access that no longer matches Hannu’s current Sales role.

The next page focuses on group ownership, approvers, risk levels and review requirements.
