# Entra Lab

This folder documents my Microsoft Entra ID lab work.

The lab is not meant to be a basic portal tutorial.

The goal is to build small but realistic IAM scenarios around users, groups, access ownership, role creep, access reviews, lifecycle changes, privileged access and audit evidence.

The lab starts with simple objects, but the focus is on how access should be structured, owned, reviewed and cleaned up.

## Lab environment

The lab is built around a fictional company called **Ankkalinna Identity Lab Oy**.

The fictional setup makes it easier to practise realistic access scenarios without using real customer data, real users or production environments.

The lab includes users from different business areas such as IT Support, HR, Finance, Security, Application Management and Sales.

## Lab path

| Page | Focus |
|---|---|
| [01 - The Setup](./01-the-setup.md) | Lab environment, fictional company, users and safe documentation boundaries |
| [02 - Security Groups and Memberships](./02-security-groups-and-memberships.md) | Designing a basic group-based access model |
| [03 - Role Creep Case: Hannu Hanhi](./03-role-creep-hannu.md) | Analysing access that no longer matches current business need |
| [04 - Group Ownership and Access Model](./04-group-ownership-and-access-model.md) | Defining ownership, approval responsibility, risk levels and review requirements |
| [05 - Manual Access Review Simulation](./05-manual-access-review-simulation.md) | Using review decisions and cleanup as an access control |
| [06 - Application Access Model](./06-application-access-model.md) | Separating standard access, owner access and application responsibility |
| [07 - Privileged Access Risk Model](./07-privileged-access-risk-model.md) | Reducing standing privilege through justification, scope and review |
| [08 - Leaver Cleanup Simulation](./08-leaver-cleanup-simulation.md) | Removing access and reducing orphaned identity risk after employment ends |
| [09 - Mover Access Change Simulation](./09-mover-access-change-simulation.md) | Managing role-based access changes and preventing access accumulation |
| [10 - Conditional Access Design Note](./10-conditional-access-design-note.md) | Designing sign-in controls around user risk, admin access and business impact |
| [11 - Microsoft Graph PowerShell Check](./11-microsoft-graph-powershell-check.md) | Validating identity and group data with PowerShell for review evidence |


## Lab style

Each lab page focuses on one practical IAM idea.

The goal is not to document every portal click.

The goal is to show the access logic behind the lab:

- what was created
- why it was created
- what risk it represents
- who should own it
- how it should be reviewed
- what evidence was captured
- what should be improved

## Current focus

The current focus is on manual access modelling in Microsoft Entra ID.

This gives a clear base before moving toward automation, Microsoft Graph PowerShell, access packages, lifecycle workflows and privileged access features.
