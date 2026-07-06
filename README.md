# 🌱 Identity Lab

This repository is my learning and portfolio space for Identity and Access Management (IAM).

It started from curiosity in Service Desk work, where access issues, permissions and user lifecycle kept repeating without fully understanding how they are designed behind the scenes.

I use this space to practise how access works in real environments, where technical actions, business decisions, user lifecycle, ownership, audit evidence and support processes all meet.

The focus is not only on tools or portal buttons. The goal is to understand why access exists, who owns the decision, how it should be reviewed and what happens when the process fails.

## Focus Areas

- Microsoft Entra ID / Azure AD
- User and group management
- Access requests
- Joiner, Mover and Leaver processes
- Role creep and access cleanup
- Identity continuity
- Access reviews
- Privileged access thinking
- Governance, risk and compliance
- IAM tools and platforms
- Practical Service Desk and IAM process thinking

## Lab Company

The practical lab work is built around a fictional company called **Ankkalinna Identity Lab Oy**.

Using fictional users and departments makes it possible to build realistic access scenarios without using real customer data, real users or production environments.

Example users include Aku Ankka, Iines Ankka, Roope Ankka, Mikki Hiiri, Minni Hiiri and Hannu Hanhi.

## Repository Structure

| Folder | Purpose |
| :--- | :--- |
| [`entra-lab/`](./entra-lab/) | Hands-on Microsoft Entra ID lab documentation and fictional access scenarios |
| [`iam-thinking/`](./iam-thinking/) | Notes about IAM risks, ownership, lifecycle and access problems |
| [`operational-notes/`](./operational-notes/) | Practical technical notes and checklists for identity-related tasks |
| [`governance-compliance/`](./governance-compliance/) | Notes about regulation, audit evidence and risk thinking |
| [`tools/`](./tools/) | Notes about IAM-related tools and platforms |

## Current Pages

### Entra Lab

- [01 - The Setup](./entra-lab/01-the-setup.md)
- [02 - Security Groups and Memberships](./entra-lab/02-security-groups-and-memberships.md)
- [03 - Role Creep Case: Hannu Hanhi](./entra-lab/03-role-creep-hannu.md)
- [04 - Group Ownership and Access Model](./entra-lab/04-group-ownership-and-access-model.md)
- [05 - Manual Access Review Simulation](./entra-lab/05-manual-access-review-simulation.md)
- [06 - Application Access Model: Ankkalinna CRM](./entra-lab/06-application-access-model-crm.md)
- [07 - Privileged Access Risk Model](./entra-lab/07-privileged-access-risk-model.md)
- [08 - Joiner-Mover-Leaver Lifecycle Model](./entra-lab/08-joiner-mover-leaver-lifecycle-model.md)
- [09 - HR-Driven Identity Lifecycle Concept](./entra-lab/09-hr-driven-identity-lifecycle-concept.md)
- [10 - Conditional Access Control Design](./entra-lab/10-conditional-access-control-design.md)
- [11 - Microsoft Graph PowerShell Validation](./entra-lab/11-microsoft-graph-powershell-validation.md)

### IAM Thinking

- [Access Creep and Ownership](./iam-thinking/access-creep-and-ownership.md)
- [Access Request Is Not Just a Ticket](./iam-thinking/access-request-is-not-just-a-ticket.md)
- [Identity Architecture After Acquisition](./iam-thinking/identity-architecture-after-acquisition.md)
- [Joiner, Mover and Leaver Risks](./iam-thinking/joiner-mover-leaver-risks.md)
- [Name Change and Identity Continuity](./iam-thinking/name-change-identity-risks.md)
- [Segregation of Duties as Business Logic](./iam-thinking/segregation-of-duties-as-business-logic.md)

### Governance and Compliance

- [ISO/IEC 27001 - Practical View](./governance-compliance/iso-27001.md)
- [GDPR - Practical View](./governance-compliance/gdpr.md)
- [NIS2 - Practical View](./governance-compliance/nis2.md)
- [Finnish Cybersecurity Regulation - Practical View](./governance-compliance/finnish-cybersecurity-regulation.md)
- [Audit Evidence - Practical View](./governance-compliance/audit-evidence.md)

### Tools

- [IAM Tools and Platforms](./tools/README.md)

### Operational Notes

- [Name Change - Technical Work Note](./operational-notes/name-change-technical.md)

## Language Note

The main language of this repository is English.

Some early notes may still be written in Finnish because some ideas are easier to capture first in my native language.

The goal is clear thinking, not perfect academic English.

## Learning Resources

- [IAM Roadmap](https://iamroadmap.com/)
  A useful overview of IAM as a whole, from technologies to compliance and career paths.

- [Microsoft Learn](https://learn.microsoft.com/)  
  Official Microsoft learning material for identity, security and cloud fundamentals.

- [Microsoft Entra documentation](https://learn.microsoft.com/en-us/entra/)  
  Reference material for Microsoft Entra ID, users, groups, roles, authentication and access management.

- [Microsoft Graph documentation](https://learn.microsoft.com/en-us/graph/)  
  Reference material for Microsoft Graph API and Microsoft Graph PowerShell.

- [Microsoft Graph PowerShell documentation](https://learn.microsoft.com/en-us/powershell/microsoftgraph/)  
  Used for practising identity management through PowerShell and Microsoft Graph commands.


## Current Direction

My current direction is toward IAM / Identity Engineering work.

I am especially interested in designing and improving identity environments, where access is based on lifecycle, ownership and clear governance instead of manual support tasks.

Long term, I want to grow into a strong IAM professional who works closer to architecture and solution design.

Right now, I am building practical understanding through Microsoft Entra ID lab work, access scenarios, technical notes and written analysis.

