# 08 - Joiner-Mover-Leaver Lifecycle Model

This page documents a Joiner-Mover-Leaver lifecycle model in my Ankkalinna Entra ID lab.

The goal is to practise how identity and access should change when a user joins the company, changes role or leaves the organization.

Joiner-Mover-Leaver is often shortened to **JML**.

The point is not only to create, update or disable user accounts.

The point is to make sure access follows the user’s current business need during the whole identity lifecycle.

## What JML means

JML describes three common identity lifecycle events:

| Lifecycle event | Meaning |
|---|---|
| Joiner | A new user joins the organization |
| Mover | A user changes role, department, manager or responsibility |
| Leaver | A user leaves the organization |

Each event should trigger a controlled access change.

If the process is weak, users may get the wrong access, keep old access or stay active after leaving.

## Why lifecycle matters

Access should not be static.

A user’s access should change when their role changes.

A clean lifecycle process helps make sure that:

- new users get the access they need
- users do not keep old access after role changes
- leaving users no longer have active access
- managers and owners understand their approval responsibility
- access changes can be explained later
- evidence exists if the process is reviewed

The lifecycle process is one of the most important parts of IAM because it connects people, roles, access and business need.

## Lab users

This lifecycle model uses the same fictional users from the Ankkalinna lab.

| User | Starting role | Example lifecycle event |
|---|---|---|
| Iines Ankka | HR Specialist | Joiner example |
| Hannu Hanhi | Sales Representative | Mover example |
| Aku Ankka | IT Support Specialist | Leaver example |

These examples are simple on purpose.

The goal is to practise the logic before adding automation or HR-driven provisioning.

## Lifecycle model

| Event | Trigger | IAM action | Risk if missed |
|---|---|---|---|
| Joiner | New user starts work | Create or enable identity, assign base access and application access | User cannot work or receives wrong access |
| Mover | User changes role or department | Add new access, remove old access and review application access | Role creep and unnecessary access |
| Leaver | User leaves the organization | Block sign-in, remove access and check privileged/application access | Orphaned identity and leftover access |

This model shows that IAM is not only about granting access.

It is about keeping access aligned with the user’s current status.

## Joiner example

In the joiner example, Iines Ankka joins the company as an HR Specialist.

Her expected access is:

- `SG-HR-Basic`

The joiner process should answer:

- what is the user’s role?
- what department does the user belong to?
- what basic access is needed?
- does the user need application access?
- who approved the access?
- when should the access be reviewed?

The goal is to give enough access for the user to work, but not extra access just in case.

## Joiner decision

| User | Role | Access decision | Reason |
|---|---|---|---|
| Iines Ankka | HR Specialist | Add to `SG-HR-Basic` | Needs basic HR access for current role |
| Iines Ankka | HR Specialist | Do not add to Finance or Sales groups | No current business need |
| Iines Ankka | HR Specialist | Do not add to privileged groups | No privileged access need |

A joiner process should not copy access from another user without understanding why.

Copied access can create unnecessary risk if the reference user has old or excessive permissions.

## Mover example

In the mover example, Hannu Hanhi moves from Sales to Finance.

Before the move, Hannu has:

- `SG-Sales-Basic`
- `SG-App-CRM-Users`

After the move, his access should be reviewed.

The mover process should not only ask:

> What new access does Hannu need?

It should also ask:

> What old access should be removed?

## Mover decision

| Access | Decision | Reason |
|---|---|---|
| `SG-Sales-Basic` | Remove | Hannu no longer works in Sales |
| `SG-App-CRM-Users` | Review | CRM access may or may not be needed in the new Finance role |
| `SG-Finance-Basic` | Add | Hannu now works in Finance |
| `SG-Finance-Leadership` | Do not add | Finance Specialist does not need leadership-level access |
| `SG-Privileged-Role-Eligible` | Do not add | New role does not require privileged access |

The key risk in mover events is access accumulation.

If new access is added but old access is not removed, the user slowly collects access from previous roles.

That is how role creep starts.

## Leaver example

In the leaver example, Aku Ankka leaves the company.

Before leaving, Aku works as an IT Support Specialist.

His access may include:

- `SG-IT-Support-Basic`

When a user leaves, the leaver process should make sure the account and access are no longer usable.

The leaver process should include:

- confirm the leaver event
- block sign-in
- remove group memberships
- check application access
- check privileged access
- document the cleanup
- keep evidence of the final state

## Leaver decision

| Action | Decision | Reason |
|---|---|---|
| Block sign-in | Required | User no longer needs account access |
| Remove `SG-IT-Support-Basic` | Required | User no longer needs IT support access |
| Check application access | Required | Application access may exist outside basic groups |
| Check privileged access | Required | Privileged access must not remain after leaving |
| Document final state | Required | Cleanup should be reviewable later |

A leaver process should not depend on memory.

If a user leaves, the access cleanup should be triggered by a clear process.

## Common failure points

JML processes often fail because ownership is unclear.

Common problems include:

- new users receive copied access from another employee
- temporary access is granted without an end date
- role changes add new access but old access is not removed
- application access is forgotten
- privileged access is not checked
- HR, managers and IT do not share the same information
- there is no evidence that cleanup happened

These issues may look small at first, but over time they weaken the access model.

## Ownership model

A good JML process needs clear ownership.

| Area | Possible owner |
|---|---|
| Employment status | HR |
| Role and department | Manager / HR |
| Business access approval | Business owner |
| Application access approval | Application owner |
| Technical access changes | IT / IAM team |
| Access review | Group owner / business owner |
| Privileged access | Security owner / IAM owner |

IT can make the technical change, but IT should not be the only party deciding who needs business access.

Access decisions need business ownership.

## Evidence needed

For this lifecycle model, useful evidence would include:

| Evidence | Purpose |
|---|---|
| Joiner access decision | Shows why initial access was granted |
| Mover access decision | Shows what was added, removed or reviewed |
| Leaver cleanup decision | Shows why access was removed |
| Group membership before and after change | Shows the actual access change |
| Written business reason | Explains why the access decision was made |
| Final access state | Shows that the user’s access matches the lifecycle event |

Evidence does not need to be complicated.

It needs to show what changed, why it changed and who owned the decision.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Users may receive wrong access, keep old access or stay active after leaving |
| What control is being practised? | Lifecycle-based access change and cleanup |
| Who should trigger the process? | HR or manager |
| Who should approve access? | Business owner, application owner or security owner depending on access type |
| What evidence would support the control? | Access decision, before/after membership and final account state |
| What should happen when access is no longer valid? | Remove access and document the cleanup |

## Security note

Screenshots are not included on this page yet.

Before adding screenshots to GitHub, I will review and blur tenant identifiers, user principal names, group object identifiers, role identifiers and any other technical details that should not be published.

## Evidence to add later

When screenshots are added, they should support the lifecycle model without exposing unnecessary technical identifiers.

Planned evidence:

- example joiner group assignment
- example mover access change
- example leaver sign-in block
- before and after group membership where useful

The evidence should support the lifecycle logic, not expose the tenant.

## Practical takeaway

JML is the backbone of identity lifecycle management.

A clean process should not only grant access.

It should keep access aligned with the user’s current role and status.

Joiner events should give the right starting access.

Mover events should add new access and remove old access.

Leaver events should remove access and prevent the account from being used.

If JML is weak, role creep, orphaned identities and unclear access ownership become almost guaranteed.

## What I learned

This model helped me connect joiner, mover and leaver events into one lifecycle process.

The biggest lesson is that access should have a beginning, a reason and an end.

A user should not keep access forever just because it was once approved.

A good lifecycle process should answer:

- what changed?
- what access is needed now?
- what access is no longer needed?
- who owns the decision?
- what evidence proves the change?
- when should the access be reviewed again?

Good IAM is not only about granting access.

It is about keeping access accurate over time.

## Next step

The next page will focus on HR-driven identity lifecycle thinking and how HR data could trigger identity and access changes.
