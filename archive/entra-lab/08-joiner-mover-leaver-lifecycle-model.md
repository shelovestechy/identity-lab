# 08 - Joiner-Mover-Leaver Lifecycle Model

This page documents a Joiner-Mover-Leaver lifecycle model in the Ankkalinna Entra ID lab.

The model shows how identity and access should change when a user joins the company, changes role or leaves the organization.

Joiner-Mover-Leaver is often shortened to **JML**.

## JML scope

| Lifecycle event | Meaning | Main risk |
|---|---|---|
| Joiner | A new user joins the organization | User receives wrong or missing access |
| Mover | A user changes role, department, manager or responsibility | Old access remains and creates role creep |
| Leaver | A user leaves the organization | Account or access remains active after departure |

Each lifecycle event should trigger a controlled access change.

The access state should match the user’s current role, status and business need.

## Lifecycle model

| Event | Trigger | IAM action | Risk if missed |
|---|---|---|---|
| Joiner | New user starts work | Create or enable identity, assign base access and application access | User cannot work or receives wrong access |
| Mover | User changes role or department | Add new access, remove old access and review application access | Role creep and unnecessary access |
| Leaver | User leaves the organization | Block sign-in, remove access and check privileged/application access | Orphaned identity and leftover access |


## Lab users

This lifecycle model uses fictional lab users from Ankkalinna Identity Lab Oy.

| User | Starting role | Example lifecycle event |
|---|---|---|
| Iines Ankka | HR Specialist | Joiner example |
| Hannu Hanhi | Sales Representative | Mover example |
| Aku Ankka | IT Support Specialist | Leaver example |

## Joiner example: Iines Ankka

Iines Ankka joins the company as an HR Specialist.

Expected starting access:

- `SG-HR-Basic`

## Joiner decision

| User | Role | Access decision | Reason |
|---|---|---|---|
| Iines Ankka | HR Specialist | Add to `SG-HR-Basic` | Needs basic HR access for current role |
| Iines Ankka | HR Specialist | Do not add to Finance or Sales groups | No current business need |
| Iines Ankka | HR Specialist | Do not add to privileged groups | No privileged access need |

A joiner process should not copy access from another user without checking why that access exists.

Copied access can bring old or excessive permissions into a new account.


## Mover example: Hannu Hanhi

Hannu Hanhi moves from Sales to Finance.

Before the move, Hannu has:

- `SG-Sales-Basic`
- `SG-App-CRM-Users`

After the move, his access should be updated to match the new Finance role.

## Mover decision

| Access | Decision | Reason |
|---|---|---|
| `SG-Sales-Basic` | Remove | Hannu no longer works in Sales |
| `SG-App-CRM-Users` | Review | CRM access may or may not be needed in the new Finance role |
| `SG-Finance-Basic` | Add | Hannu now works in Finance |
| `SG-Finance-Leadership` | Do not add | Finance Specialist does not need leadership-level access |
| `SG-Privileged-Role-Eligible` | Do not add | New role does not require privileged access |

The mover event is a role creep risk point.

If new access is added but old access is not removed, the user starts collecting access from previous roles.



## Leaver example: Aku Ankka

Aku Ankka leaves the company.

Before leaving, Aku works as an IT Support Specialist.

His access may include:

- `SG-IT-Support-Basic`

The leaver process should make sure the account and access are no longer usable.

## Leaver decision

| Action | Decision | Reason |
|---|---|---|
| Block sign-in | Required | User no longer needs account access |
| Remove `SG-IT-Support-Basic` | Required | User no longer needs IT support access |
| Check application access | Required | Application access may exist outside basic groups |
| Check privileged access | Required | Privileged access must not remain after leaving |
| Document final state | Required | Cleanup should be reviewable later |

A leaver process should be triggered by a clear HR or manager event.

It should not depend on memory or manual guesswork.



## Common failure points

| Failure point | Risk |
|---|---|
| Access copied from another employee | New user may receive old or excessive access |
| Temporary access has no end date | Project access may become permanent |
| Mover access only adds new groups | Old role access remains |
| Application access is not checked | App-level access may remain outside department groups |
| Privileged access is not reviewed | Elevated access may remain without current need |
| HR, manager and IT data do not match | IAM actions may be late, wrong or incomplete |
| Cleanup evidence is missing | The final access state cannot be proven later |

## Ownership model

| Area | Possible owner |
|---|---|
| Employment status | HR |
| Role and department | Manager / HR |
| Business access approval | Business owner |
| Application access approval | Application owner |
| Technical access changes | IT / IAM team |
| Access review | Group owner / business owner |
| Privileged access | Security owner / IAM owner |

IT or IAM can make the technical changes.

The access decision should still have business, application or security ownership depending on the access type.

## Evidence

| Evidence | Purpose |
|---|---|
| Joiner access decision | Shows why initial access was granted |
| Mover access decision | Shows what was added, removed or reviewed |
| Leaver cleanup decision | Shows why access was removed |
| Group membership before and after change | Shows the actual access change |
| Written business reason | Explains why the access decision was made |
| Final access state | Shows that access matches the lifecycle event |

Evidence should show what changed, why it changed and who owned the decision.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Users may receive wrong access, keep old access or stay active after leaving |
| What control is being practised? | Lifecycle-based access change and cleanup |
| What events are included? | Joiner, mover and leaver |
| Who should trigger the process? | HR or manager |
| Who should approve access? | Business owner, application owner or security owner depending on access type |
| What evidence supports the control? | Access decision, before/after membership and final account state |
| What should happen when access is no longer valid? | Remove access and document the cleanup |

## Security note

Published screenshots should not expose tenant identifiers, user principal names, group object IDs, role IDs or other technical identifiers.

The documentation should show lifecycle control logic, not tenant details.

## Summary

This page defines the Joiner-Mover-Leaver lifecycle model for the lab.

The model keeps access aligned with the user’s current role and status by granting access during joiner events, updating access during mover events and removing access during leaver events.

The next page focuses on HR-driven identity lifecycle thinking and how HR data could trigger identity and access changes.
