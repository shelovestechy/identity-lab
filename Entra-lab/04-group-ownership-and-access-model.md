# 04 - Group Ownership and Access Model

This page documents the ownership and access model for the security groups in my Ankkalinna Entra ID lab.

The point is not only to create groups.

The point is to understand what each group represents, who should own it, who can approve access and what risk the group creates if the wrong user is added.

A security group is not only a technical container.

It is also an access decision that needs ownership, review and cleanup.

## Why ownership matters

A group without ownership becomes hard to trust.

If nobody owns the group, nobody is clearly responsible for:

- who should be a member
- who can approve new members
- when access should be reviewed
- when access should be removed
- what risk the group creates
- whether the group still has a valid purpose

This matters especially when groups give access to sensitive systems, privileged roles, finance data, HR data or application owner permissions.

Without clear ownership, access can slowly become something that exists only because nobody knows who is allowed to remove it.

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
| SG-Privileged-Role-Eligible | Example group for privileged role eligibility | Security Owner | Security Lead / IAM Owner | High | Monthly |

## Risk levels

| Risk level | Meaning |
|---|---|
| Low | Access has limited impact and does not expose sensitive data or privileged functions |
| Medium | Access may expose business data or support operational work |
| High | Access may expose sensitive data, privileged actions or higher business impact |

Risk level is not only about the group name.

It depends on what the group actually gives access to.

A normal-looking group can become high risk if it connects to sensitive data, admin functions or business-critical systems.

For example, a group called `SG-App-CRM-Users` may sound basic, but the real risk depends on what CRM data the group can access.

## Review need

Review frequency should match the risk.

Low-risk access may be reviewed less often.

High-risk access should be reviewed more carefully.

Privileged or sensitive access should not sit untouched for a long time.

The review should confirm whether the user still needs the access for their current work.

A review is only useful if the reviewer understands what the group gives access to and who should belong to it.

If the group purpose is unclear, the review becomes weak.

## Example: SG-Finance-Leadership

`SG-Finance-Leadership` is high risk because it represents more than basic finance access.

This group could include access to sensitive finance reports, approvals or leadership-level information.

That means membership should not be based on convenience or copied access.

The access should have:

- a clear owner
- a clear approver
- a clear business reason
- a regular review cycle
- cleanup when the user changes role

If the wrong user is added to this group, the issue is not only technical.

It becomes a governance and business risk.

## Example: SG-Privileged-Role-Eligible

`SG-Privileged-Role-Eligible` is high risk because it represents privileged access thinking.

Even if the access is only eligibility and not permanent admin access, it should still be treated carefully.

Privileged access should have stricter review and clearer ownership than normal business access.

This kind of group should not become a place where users are added “just in case”.

Access that can lead to elevated permissions should always have a clear reason, limited scope and regular review.

## Ownership questions

Before a group is used for access, I should be able to answer:

- what does this group give access to?
- who owns the group?
- who can approve membership?
- who should review the membership?
- how often should it be reviewed?
- what is the risk if the wrong user is added?
- what should happen when a user changes role?
- who is responsible for removing access when it is no longer needed?

If these questions cannot be answered, the group is not ready to be trusted as part of an access model.

## Practical takeaway

Good access management is not only about whether a group exists.

It is about whether the group has a clear purpose, owner, approver, risk level and review need.

If nobody can explain why a group exists or who should be in it, the group is already becoming a risk.

A clean access model needs more than groups.

It needs ownership.
