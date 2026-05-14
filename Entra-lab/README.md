# Entra Lab

This folder documents my Microsoft Entra ID lab work.

The lab is not meant to be a basic portal tutorial.

The goal is to build small but realistic IAM scenarios around users, groups, access ownership, role creep, reviews, lifecycle changes, privileged access and audit evidence.

The lab starts with simple objects, but the focus is on how access should be structured, reviewed and cleaned up.

## Lab environment

The lab is built around a fictional company called **Ankkalinna Identity Lab Oy**.

The fictional setup makes it easier to practise realistic access scenarios without using real customer data, real users or production environments.

The lab includes users from different business areas such as IT support, HR, Finance, Security, Application Management and Sales.

## Lab path

| Page | Focus |
|---|---|
| [01 - The Setup](./01-the-setup.md) | Tenant, lab company and test users |
| [02 - Security Groups and Memberships](./02-security-groups-and-memberships.md) | Initial group structure and memberships |
| [03 - Role Creep Case: Hannu Hanhi](./03-role-creep-hannu.md) | Old access left behind after temporary work |
| [04 - Group Ownership and Access Model](./04-group-ownership-and-access-model.md) | Group owners, approvers, risk levels and review needs |
| 05 - Manual Access Review Simulation | Reviewing group memberships and removing wrong access |
| 06 - Application Access Model | Separating user, owner and sensitive application access |
| 07 - Privileged Access Concept | Admin access, eligibility and privileged access risk |
| 08 - Leaver Cleanup Simulation | Blocking sign-in and cleaning access for leaving users |
| 09 - Mover Access Change Simulation | Changing access when the user changes role |
| 10 - Conditional Access Design Note | Security control design around sign-in and admin access |
| 11 - Microsoft Graph PowerShell Check | Validating users and groups with PowerShell |

## Lab style

Each lab page should focus on one practical IAM idea.

The goal is not to document every portal click.

The goal is to show the access logic behind the lab:

- what was created
- why it was created
- what risk it represents
- who should own it
- how it should be reviewed
- what evidence was captured

## Current focus

The current focus is on manual access modelling in Microsoft Entra ID.

This gives a clear base before moving toward automation, Microsoft Graph PowerShell, access packages, lifecycle workflows or privileged access features.
