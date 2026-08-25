# 02 - Security Groups and Memberships

This page documents the first security groups and user memberships in the Ankkalinna Entra ID lab.

The purpose is to build a basic group-based access model instead of assigning access directly to individual users.

## Group model

Security groups are used to represent access based on department, role or application need.

This makes access easier to:

- assign
- remove
- review
- document
- troubleshoot

For this first version, the lab uses assigned group membership.

Dynamic groups can be tested later, but the first step is to define a clear manual access model.

## Naming pattern

The lab uses a simple naming pattern:

**SG-[Area]-[Purpose]**

Examples:

- `SG-HR-Basic`
- `SG-Finance-Leadership`
- `SG-App-CRM-Users`
- `SG-App-CRM-Owners`

A useful group name should show:

- what area the group belongs to
- what access the group represents
- whether the access is basic, sensitive, application-related or privileged

## Groups created

| Group name | Purpose | Example member |
|---|---|---|
| SG-IT-Support-Basic | Basic access for IT support users | Aku Ankka |
| SG-HR-Basic | Basic access for HR users | Iines Ankka |
| SG-Finance-Basic | Basic access for finance users | Roope Ankka |
| SG-Finance-Leadership | Sensitive finance leadership access | Roope Ankka |
| SG-Security-Basic | Basic access for security users | Mikki Hiiri |
| SG-Sales-Basic | Basic access for sales users | Hannu Hanhi |
| SG-App-CRM-Users | Standard access to the fictional CRM application | Hannu Hanhi, Roope Ankka |
| SG-App-CRM-Owners | Owner-level access to the fictional CRM application | Minni Hiiri |
| SG-Privileged-Role-Eligible | Planning example for privileged access eligibility | Mikki Hiiri |


## Membership overview

| User | Role | Groups | Reason |
|---|---|---|---|
| Aku Ankka | Support Specialist | SG-IT-Support-Basic | Basic IT support access |
| Iines Ankka | HR Specialist | SG-HR-Basic | Basic HR access |
| Roope Ankka | Head of Finance | SG-Finance-Basic, SG-Finance-Leadership, SG-App-CRM-Users | Finance leadership access and CRM visibility |
| Mikki Hiiri | Security Specialist | SG-Security-Basic, SG-Privileged-Role-Eligible | Security access and privileged access planning |
| Minni Hiiri | Application Owner | SG-App-CRM-Owners | CRM application ownership |
| Hannu Hanhi | Sales Representative | SG-Sales-Basic, SG-App-CRM-Users | Sales access and CRM user access |


## Department-based access

Department-based groups provide basic access for users working in a specific business area.

Examples:

- `SG-IT-Support-Basic`
- `SG-HR-Basic`
- `SG-Finance-Basic`
- `SG-Security-Basic`
- `SG-Sales-Basic`

The group should match the user’s current department or role.

If the user changes role, old department-based access should be reviewed and removed if it is no longer needed.

## Application access

The lab includes two CRM-related groups:

| Group | Access level | Purpose |
|---|---|---|
| SG-App-CRM-Users | Standard user | Normal CRM access for business users |
| SG-App-CRM-Owners | Owner-level access | Application owner or admin-level access |

This separates standard application users from application owners.

A normal CRM user should not automatically have owner-level access.


## Example: Roope Ankka

Roope Ankka works as Head of Finance.

He belongs to:

- `SG-Finance-Basic`
- `SG-Finance-Leadership`
- `SG-App-CRM-Users`

Roope needs finance-related access and may need CRM visibility for business reporting.

Finance leadership does not mean tenant administration.

Business authority and technical admin access are separate concepts.


## Example: Mikki Hiiri

Mikki Hiiri works as a Security Specialist.

He belongs to:

- `SG-Security-Basic`
- `SG-Privileged-Role-Eligible`

This makes him useful for privileged access examples.

Security-related work may require elevated access, but elevated access should still have a clear reason, limited scope and review process.


## Example: Hannu Hanhi

Hannu Hanhi works as a Sales Representative.

He belongs to:

- `SG-Sales-Basic`
- `SG-App-CRM-Users`

Hannu is later used in role creep and mover scenarios.

If Hannu changes role or receives temporary access, his old access should be reviewed instead of left behind.


## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Access may be assigned directly, inconsistently or without clear structure |
| What control is being practised? | Group-based access modelling |
| What is being defined? | Groups, memberships and access reasons |
| Who should own the access decision? | Business owner, application owner or security owner depending on group |
| What evidence supports the model? | Group list, membership view and documented access reason |
| What should happen during role change? | Group memberships should be reviewed and updated |

## Security note

Published screenshots should not expose tenant identifiers, user principal names, group object IDs or other technical identifiers.

The documentation should show access structure and membership logic, not tenant details.

## Summary

This page defines the first group-based access model for the lab.

Each group should have a clear purpose, membership reason and future review path.

The next page focuses on group ownership, approvers, risk levels and review requirements.
