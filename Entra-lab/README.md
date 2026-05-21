# Entra Lab

This folder documents my Microsoft Entra ID lab work.

The goal is to build small but realistic IAM scenarios around users, groups, access ownership, role creep, access reviews, lifecycle changes, privileged access and audit evidence.

This is not a basic portal tutorial. The focus is on access logic, risk, ownership and validation.

## Lab Environment

The lab is built around a fictional company called **Ankkalinna Identity Lab Oy**.

The fictional setup makes it possible to practise realistic IAM scenarios without using real customer data, real users or production environments.

## Lab Path

| Page | Focus |
| :--- | :--- |
| [01 - The Setup](./01-the-setup.md) | Lab environment, fictional users and safe documentation boundaries |
| [02 - Security Groups and Memberships](./02-security-groups-and-memberships.md) | Basic group-based access model |
| [03 - Role Creep Case: Hannu Hanhi](./03-role-creep-hannu.md) | Access that no longer matches business need |
| [04 - Group Ownership and Access Model](./04-group-ownership-and-access-model.md) | Ownership, approval responsibility and review requirements |
| [05 - Manual Access Review Simulation](./05-manual-access-review-simulation.md) | Review decisions and access cleanup |
| [06 - Application Access Model: Ankkalinna CRM](./06-application-access-model-crm.md) | Standard access, owner access and application responsibility |
| [07 - Privileged Access Risk Model](./07-privileged-access-risk-model.md) | Reducing standing privileged access |
| [08 - Joiner-Mover-Leaver Lifecycle Model](./08-joiner-mover-leaver-lifecycle-model.md) | Identity lifecycle access changes |
| [09 - HR-Driven Identity Lifecycle Concept](./09-hr-driven-identity-lifecycle-concept.md) | HR data, access logic and validation |
| [10 - Conditional Access Control Design](./10-conditional-access-control-design.md) | Sign-in controls, admin access and business impact |
| [11 - Microsoft Graph PowerShell Validation](./11-microsoft-graph-powershell-validation.md) | PowerShell validation for review evidence |

## Lab Style

Each page focuses on one practical IAM idea.

The goal is to show:

- what was created
- why it matters
- what risk it represents
- who should own it
- how it should be reviewed
- what evidence was captured
