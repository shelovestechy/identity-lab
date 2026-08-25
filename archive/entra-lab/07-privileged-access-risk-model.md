# 07 - Privileged Access Risk Model

This page documents a privileged access risk model in the Ankkalinna Entra ID lab.

The model focuses on limiting elevated access through task-based need, approval, scope and review.

Privileged access is higher risk than normal business access because it can affect users, groups, applications, security settings and access rights.

## Privileged access scope

Privileged access can include the ability to:

- manage users
- reset passwords
- assign roles
- change security settings
- manage groups
- manage applications
- view sensitive admin information
- affect access for other users

A mistake or compromised privileged account can have a much larger impact than a normal user account.

## Lab scenario

Mikki Hiiri works as a Security Specialist.

He belongs to:

- `SG-Security-Basic`
- `SG-Privileged-Role-Eligible`

`SG-Security-Basic` represents normal security team access.

`SG-Privileged-Role-Eligible` represents a planning example for privileged access eligibility.

This does not mean Mikki should have permanent broad admin rights.

The access should be limited to the task, justified and reviewed.


## Standing privilege risk

Standing privilege means privileged access that remains available even when the user is not actively performing an admin task.

| Risk area | Impact |
|---|---|
| Account compromise | The account becomes a higher-value target |
| Human error | Mistakes can affect more users or systems |
| Forgotten access | Old privileged access may remain active |
| Audit readiness | It may be difficult to prove why access is still needed |
| Least privilege | The user may have more access than the task requires |

Standing privilege should not exist only because it is convenient.

## Task-based access model

Privileged access should be mapped to the actual task.

| Task | Possible access need | Risk |
|---|---|---|
| Review sign-in activity | Read-only security or reporting access | Lower |
| Investigate risky users | Security-related role may be needed | Medium |
| Manage user access | User or group management role may be needed | Medium / High |
| Change tenant-wide settings | Highly privileged role may be needed | High |
| Assign admin roles | Privileged role management access may be needed | High |

The role should match the task.

If the task only requires viewing information, write or admin-level access should not be granted.

## Privileged group example

`SG-Privileged-Role-Eligible` is treated as a high-risk group in this lab.

| Group | Purpose | Risk level | Review need |
|---|---|---|---|
| SG-Privileged-Role-Eligible | Planning example for privileged access eligibility | High | Monthly |

Membership should have:

- clear owner
- clear approver
- clear business or technical reason
- limited scope
- regular review
- cleanup when the need ends

This group should not become a storage place for users who might need admin access someday.


## Eligibility vs active access

| Access state | Meaning | Control need |
|---|---|---|
| Eligible access | User may be allowed to activate privileged access when needed | Approval, justification and review |
| Active access | Privileged access is currently in use | Time limit, logging and monitoring |

Eligibility is lower risk than permanent active access, but it still needs control.

The goal is to reduce standing privilege and avoid unnecessary permanent admin access.

## Example risk: broad admin access

If Mikki received permanent broad admin access, the access model would need to prove:

| Question | Purpose |
|---|---|
| What task requires the access? | Confirms business or technical need |
| What role is actually required? | Prevents over-permissioning |
| Who approved the access? | Confirms ownership and risk acceptance |
| Is a smaller role enough? | Supports least privilege |
| Is the access still needed? | Supports review and cleanup |
| When was it last reviewed? | Supports audit evidence |

Broad admin access is easy to grant and hard to justify later.

## Review logic

A privileged access review should focus on need, scope and current responsibility.

| User | Access | Review question |
|---|---|---|
| Mikki Hiiri | SG-Privileged-Role-Eligible | Does Mikki still need eligibility for privileged access? |
| Aku Ankka | No privileged access | Does Aku need admin access or only normal IT support access? |
| Minni Hiiri | Application owner access | Does Minni need application owner access but not tenant admin access? |

Trust is not enough reason for privileged access.

A user can be responsible and still not need broad admin rights.

## Least privilege rules

Privileged access should follow least privilege.

| Rule | Reason |
|---|---|
| Do not grant Global Administrator if a limited role is enough | Reduces tenant-wide risk |
| Do not grant permanent access if temporary access is enough | Reduces standing privilege |
| Do not grant write access if read-only access is enough | Reduces accidental or malicious changes |
| Do not keep privileged access after the need ends | Reduces leftover access risk |

Privileged access should be narrow, justified and reviewed.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Users may have unnecessary, broad or permanent privileged access |
| What control is being practised? | Privileged access limitation through task-based need, scope and review |
| What access is being reviewed? | `SG-Privileged-Role-Eligible` membership |
| Who should own the decision? | Security Owner / IAM Owner |
| What evidence supports the control? | Group membership, approval reason, review decision and cleanup evidence |
| What should happen if access is no longer needed? | Remove the user from privileged access eligibility |

## Security note

Published screenshots should not expose tenant identifiers, user principal names, group object IDs, role IDs or other technical identifiers.

Privileged access evidence should show the control logic, not tenant details.

## Summary

This page defines privileged access as a high-risk access area that needs stronger justification, ownership and review.

The model reduces standing privilege by mapping elevated access to task-based need, limiting scope and reviewing privileged eligibility regularly.

The next page focuses on the Joiner-Mover-Leaver lifecycle model.
