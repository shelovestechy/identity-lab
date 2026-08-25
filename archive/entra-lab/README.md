# Entra ID Access Governance Lab

This learning path uses a fictional organization to connect small Microsoft Entra ID exercises with IAM controls, ownership and risk.

It is not a portal tutorial or a production implementation. Some pages describe tenant exercises, while others are simulations or control designs. The status column makes that distinction visible.

## Environment

- fictional organization: **Ankkalinna Identity Lab Oy**
- fictional users and departments only
- no employer, customer or production data
- identifiers and tenant details excluded from public documentation

## Learning path

| Page | Focus | Status |
| :--- | :--- | :--- |
| [01 - The Setup](./01-the-setup.md) | Tenant, fictional users and documentation boundaries | Lab exercise |
| [02 - Security Groups and Memberships](./02-security-groups-and-memberships.md) | A group-based access model | Lab exercise |
| [03 - Role Creep: Hannu Hanhi](./03-role-creep-hannu.md) | Temporary access left active after its business need ends | Simulated case and cleanup |
| [04 - Group Ownership and Access Model](./04-group-ownership-and-access-model.md) | Owners, approvers, risk levels and review frequency | Control design |
| [05 - Manual Access Review](./05-manual-access-review-simulation.md) | Review decisions, access removal and evidence requirements | Simulation |
| [06 - CRM Application Access](./06-application-access-model-crm.md) | Separating standard user and owner-level application access | Access model |
| [07 - Privileged Access Risk](./07-privileged-access-risk-model.md) | Standing privilege, eligibility and time-limited activation | Control design |
| [08 - Joiner-Mover-Leaver](./08-joiner-mover-leaver-lifecycle-model.md) | Identity lifecycle decisions and failure points | Simulation |
| [09 - HR-Driven Lifecycle](./09-hr-driven-identity-lifecycle-concept.md) | Source-of-truth attributes, triggers, validation and data quality | Integration concept |
| [10 - Conditional Access](./10-conditional-access-control-design.md) | MFA, legacy authentication, emergency access, testing and rollback | Control design; not presented as deployed |
| [11 - Graph PowerShell Validation](./11-microsoft-graph-powershell-validation.md) | Expected-versus-actual access and review evidence | Validation design; script and output still to be added |

## Evidence status

The scenarios document access logic, risks and decisions, but sanitized screenshots and command output are not currently published. The next technical milestone is a small Graph PowerShell validation artifact with fictional input data and cleaned output.

## What I am practising

Each case tries to answer the same control questions:

- What business need justifies the access?
- Who owns the decision and the risk?
- What changes during the identity lifecycle?
- How is least privilege restored when the need ends?
- What evidence would allow another person to review the result?
