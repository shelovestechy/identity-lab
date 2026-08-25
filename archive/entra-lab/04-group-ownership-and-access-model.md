# 04 - Group Ownership and Access Model

This page documents ownership, approval responsibility, risk levels and review requirements for the security groups in the Ankkalinna Entra ID lab.

A security group is not only a technical object.

It represents an access decision that needs ownership, approval logic, review and cleanup.

## Ownership model

A group without ownership becomes difficult to trust.

Clear ownership defines:

- who should be a member
- who can approve new members
- who reviews the membership
- when access should be removed
- what risk the group creates
- whether the group still has a valid purpose

This is especially important for groups that provide access to sensitive data, privileged roles, application owner permissions or business-critical systems.

## Access model

| Group | Purpose | Owner | Approver | Risk level | Review need |
|---|---|---|---|---|---|
| SG-IT-Support-Basic | Basic access for IT support users | IT Support Lead | User manager / IT Support Lead | Medium | Quarterly |
| SG-HR-Basic | Basic access for HR users | HR Owner | HR Manager | High | Quarterly |
| SG-Finance-Basic | Basic access for finance users | Finance Owner | Head of Finance | High | Quarterly |
| SG-Finance-Leadership | Sensitive finance leadership access | Head of Finance | CFO / Finance Leadership | High | Monthly or quarterly |
| SG-Security-Basic | Basic access for security users | Security Owner | Security Lead | High | Quarterly |
| SG-Sales-Basic | Basic access for sales users | Sales Owner | Sales Manager | Low / Medium | Quarterly |
| SG-App-CRM-Users | Standard access to the fictional CRM application | CRM Application Owner | User manager / CRM Owner | Medium | Quarterly |
| SG-App-CRM-Owners | Owner-level access to the fictional CRM application | CRM Application Owner | Application Owner / Business Owner | High | Quarterly |
| SG-Privileged-Role-Eligible | Planning example for privileged role eligibility | Security Owner | Security Lead / IAM Owner | High | Monthly |


## Risk levels

| Risk level | Meaning |
|---|---|
| Low | Limited business impact and no sensitive or privileged access |
| Medium | May expose business data or support operational work |
| High | May expose sensitive data, privileged actions or higher business impact |

Risk level depends on what the group actually grants access to.

A normal-looking group can become high risk if it connects to sensitive data, admin functions or business-critical systems.

For example, `SG-App-CRM-Users` may sound basic, but the real risk depends on what CRM data the group can access.

## Review requirements

Review frequency should match the risk level.

| Risk level | Example review approach |
|---|---|
| Low | Periodic review |
| Medium | Regular review with business owner confirmation |
| High | More frequent review with clear owner, reason and evidence |

A review should confirm that each member still needs the access for their current role.

The reviewer must understand what the group gives access to and who should belong to it.

If the group purpose is unclear, the review becomes weak.

## High-risk example: SG-Finance-Leadership

`SG-Finance-Leadership` is high risk because it represents more than basic finance access.

It may include access to sensitive finance reports, approvals or leadership-level information.

| Control area | Requirement |
|---|---|
| Owner | Head of Finance |
| Approver | CFO / Finance Leadership |
| Business reason | Required |
| Review cycle | Monthly or quarterly |
| Cleanup trigger | Role change, leaver event or expired business need |

Membership should not be based on convenience or copied access.

If the wrong user is added to this group, the issue becomes a governance and business risk.


## High-risk example: SG-Privileged-Role-Eligible

`SG-Privileged-Role-Eligible` is high risk because it represents potential elevated access.

Even if the access is only eligibility and not permanent admin access, it still needs stricter control.

| Control area | Requirement |
|---|---|
| Owner | Security Owner |
| Approver | Security Lead / IAM Owner |
| Business reason | Required |
| Review cycle | Monthly |
| Cleanup trigger | Role change, task completion or expired access need |

This group should not become a place where users are added “just in case”.

Access that can lead to elevated permissions should have a clear reason, limited scope and regular review.


## Ownership questions

Before a group is used for access, the following questions should be answered:

| Question | Purpose |
|---|---|
| What does this group give access to? | Defines the access scope |
| Who owns the group? | Defines responsibility |
| Who can approve membership? | Defines approval authority |
| Who reviews membership? | Defines review responsibility |
| How often should it be reviewed? | Defines control frequency |
| What is the risk if the wrong user is added? | Defines impact |
| What happens when a user changes role? | Defines cleanup logic |
| Who removes access when it is no longer needed? | Defines operational responsibility |

If these questions cannot be answered, the group is not ready to be trusted as part of an access model.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Groups may exist without clear ownership, approval or review responsibility |
| What control is being practised? | Group ownership and access governance model |
| What is being defined? | Owner, approver, risk level and review need |
| Who owns the access decision? | Business owner, application owner or security owner depending on group |
| What evidence supports the model? | Group list, ownership table, membership view and review decision |
| What should happen when ownership is unclear? | Group purpose and approval responsibility should be reviewed before trusting the group |

## Security note

Published screenshots should not expose tenant identifiers, user principal names, group object IDs, role IDs or other technical identifiers.

The documentation should show access ownership and governance logic, not tenant details.

## Summary

This page defines ownership and review responsibility for the lab security groups.

A group should have a clear purpose, owner, approver, risk level and review requirement before it is trusted as part of the access model.

The next page focuses on manual access review and cleanup decisions.
