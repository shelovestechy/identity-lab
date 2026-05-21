# 08 - Leaver Cleanup Simulation

This page documents a leaver cleanup simulation in my Ankkalinna Entra ID lab.

The goal is to practise what should happen when a user leaves the company and no longer needs access.

Leaver cleanup is an important IAM process because an active account or leftover access can create unnecessary security risk after the employment or business relationship has ended.

The point is not only to block sign-in.

The point is to make sure the identity and access are handled in a controlled way.

## What is leaver cleanup?

Leaver cleanup means removing or disabling access when a user leaves the organization.

This can include:

- blocking sign-in
- removing group memberships
- removing application access
- removing privileged access
- handling licenses
- documenting the cleanup
- keeping evidence that access was removed

A leaver process should make it clear what happens to the account and who is responsible for each step.

## Lab scenario

In this simulation, Hannu Hanhi leaves Ankkalinna Identity Lab Oy.

Before leaving, Hannu works as a Sales Representative.

His normal access is:

- `SG-Sales-Basic`
- `SG-App-CRM-Users`

In earlier cases, Hannu was also used to demonstrate role creep and temporary Finance access.

For this leaver simulation, the goal is to make sure Hannu no longer has active access after leaving.

## Why leaver cleanup matters

A leaver account can become a risk if it stays active after the user has left.

The risk is not only that the former user might sign in.

The risk is also that the account could be compromised and used by someone else.

If the account still has access to groups, applications or sensitive data, the impact can be larger.

Old accounts should not stay active only because nobody remembered to clean them up.

## Before cleanup

Before cleanup, Hannu has normal Sales-related access.

| User | Status | Current role | Groups |
|---|---|---|---|
| Hannu Hanhi | Active | Sales Representative | SG-Sales-Basic, SG-App-CRM-Users |

The access is valid while Hannu works in Sales.

After Hannu leaves, the same access should no longer remain active.

## Leaver cleanup checklist

For this simulation, the cleanup should include:

| Step | Action | Reason |
|---|---|---|
| 1 | Confirm leaver event | Cleanup should be based on a valid HR or manager trigger |
| 2 | Block sign-in | Prevent future account access |
| 3 | Remove group memberships | Remove business and application access |
| 4 | Review privileged access | Confirm the user has no privileged eligibility or admin roles |
| 5 | Review application access | Confirm the user no longer has CRM access |
| 6 | Document cleanup | Keep evidence of what was removed |
| 7 | Confirm final state | Make sure the account is no longer usable for access |

The exact process can vary by organization, but the logic should be clear.

A leaver process should not depend on memory.

## Cleanup decision

Hannu no longer works for Ankkalinna Identity Lab Oy.

The correct cleanup action is to:

- block sign-in
- remove him from `SG-Sales-Basic`
- remove him from `SG-App-CRM-Users`
- confirm he is not a member of privileged access groups
- document the final access state

The goal is not to delete things randomly.

The goal is to prevent access after the business relationship has ended.

## After cleanup

After cleanup, Hannu should no longer have active access.

| User | Account status | Groups after cleanup |
|---|---|---|
| Hannu Hanhi | Sign-in blocked | No active access groups |

This is a cleaner leaver state.

The account is no longer usable for sign-in and the user no longer has business or application access through groups.

## Orphaned identity risk

A weak leaver process can create orphaned identity risk.

An orphaned identity is an account that remains active or accessible even though the user no longer has a valid business relationship with the organization.

This can happen when:

- HR does not notify IT
- the manager forgets to request removal
- access is removed from one system but not another
- group memberships are not reviewed
- application access is not connected to the leaver process
- privileged access is forgotten

Orphaned identities are dangerous because they can remain unnoticed for a long time.

## Group cleanup

Removing group memberships is important because groups often grant access to systems, applications or data.

If Hannu’s account is blocked but group memberships are left behind, the immediate sign-in risk is reduced, but the access model is still messy.

Group cleanup makes the final state easier to understand and review.

It also reduces confusion if the account is ever reviewed later.

## Privileged access check

Even if Hannu is not expected to have privileged access, it should still be checked.

For leaver cleanup, the question is:

> Does this user have any access that could affect users, systems, security settings or access rights?

If the user has privileged role eligibility, admin roles or privileged group membership, those should be removed as part of leaver cleanup.

Privileged access should never remain behind after a user leaves.

## Application access check

Hannu has CRM access through:

- `SG-App-CRM-Users`

Because Hannu is leaving, he no longer needs CRM access.

CRM access should be removed as part of the leaver cleanup.

This matters because application access can contain business data, customer information or reporting access.

## Evidence captured

For this simulation, useful evidence would include:

| Evidence | Purpose |
|---|---|
| Account status before cleanup | Shows the user was active before the leaver action |
| Group memberships before cleanup | Shows what access existed before removal |
| Cleanup decision | Shows why access was removed |
| Account status after cleanup | Shows sign-in was blocked |
| Group memberships after cleanup | Shows access was removed |

The evidence should make it possible to understand what was changed and why.

## Security note

Screenshots are not included on this page yet.

Before adding screenshots to GitHub, I will review and blur tenant identifiers, user principal names, group object identifiers, role identifiers and any other technical details that should not be published.

## Evidence to add later

When screenshots are added, they should support the leaver cleanup without exposing unnecessary technical identifiers.

Planned evidence:

- Hannu’s account status before cleanup
- Hannu’s group memberships before cleanup
- sign-in blocked after cleanup
- group memberships removed after cleanup

The evidence should prove the cleanup, not expose the tenant.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | A user may keep access after leaving the organization |
| What control is being practised? | Leaver cleanup through sign-in blocking and access removal |
| Who should trigger the process? | HR or the user’s manager |
| Who should perform the cleanup? | IT / IAM responsible team |
| What evidence would support the control? | Before and after account status, group memberships and cleanup decision |
| What should happen if access is no longer valid? | Block sign-in and remove access groups |

## Practical takeaway

Leaver cleanup is not only a technical task.

It is an access control process.

A good leaver process should make sure the user no longer has active access after the business relationship ends.

Blocking sign-in is important, but it should not be the only step.

Group memberships, application access and privileged access should also be reviewed and cleaned up.

## What I learned

This simulation helped me practise leaver cleanup as part of the identity lifecycle.

The important part is not only disabling an account.

The important part is understanding what access the identity had and making sure it is no longer usable.

A good leaver cleanup should answer:

- who triggered the leaver process?
- what access did the user have?
- what access was removed?
- was sign-in blocked?
- was privileged access checked?
- was application access removed?
- what evidence proves the cleanup?

Leaver cleanup should be structured, documented and reviewable.

## Next step

The next page will focus on mover access changes, role changes and preventing access accumulation when users move between roles.
