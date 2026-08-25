# Access Governance and Audit

**Current form:** simulated access governance case with technical validation planned

## Scenario

Hannu Hanhi works in Sales and normally needs Sales and CRM access. He receives temporary Finance access for a reporting project. The project ends, but the Finance group membership remains.

Every individual action may have looked reasonable when it happened. The governance failure is that nobody owned the end of the temporary access.

## Central question

How can an organization answer all three questions with evidence?

1. Who has access?
2. Why do they have it?
3. Is it still needed?

## Risk analysis

| Risk | Why it matters |
| :--- | :--- |
| Role creep | Access accumulates while the user's actual role changes |
| Weak ownership | Service Desk or IAM is forced to guess whether access is valid |
| Permanent temporary access | A short business need becomes an indefinite entitlement |
| Poor segregation of duties | Individually valid permissions can form a risky combination |
| Weak audit trail | The organization cannot reconstruct the request, approval, review and removal decision |
| Larger incident impact | A compromised account exposes data beyond the user's current need |

## Governance model

Access should have:

- a business purpose
- a requester
- a decision owner
- a defined scope
- an end or review date when appropriate
- a risk level
- evidence of approval, review and removal

Technical administrators can execute a change, but the business or system owner should decide whether the access is justified.

## Review decision

| Access | Decision | Reason |
| :--- | :--- | :--- |
| Sales basic access | Keep | Matches Hannu's current role |
| CRM user access | Keep | Needed for current Sales work |
| Finance basic access | Remove | Temporary reporting project has ended |

## Evidence model

| Evidence | Question it answers |
| :--- | :--- |
| Access request and business reason | Why was access originally granted? |
| Named approver or owner | Who accepted the decision? |
| Membership before review | What access existed at review time? |
| Review decision | Who decided to keep or remove it, and why? |
| Membership after remediation | Was the decision actually completed? |
| Exception record | Why was non-standard access retained? |

## Technical validation plan

Microsoft Graph PowerShell can provide the technical side of the evidence by comparing an expected access model with current group membership.

The planned output uses explicit decisions:

- `Keep` — access exists and is expected
- `Remove` — access exists but is not expected
- `Missing` — expected access is not present
- `Review` — the model cannot make a safe automatic decision

The script and sanitized example output are not yet published. This limitation is kept visible instead of presenting a validation design as a completed automation.

## Supporting learning material

- [Role creep case](../../archive/entra-lab/03-role-creep-hannu.md)
- [Group ownership and access model](../../archive/entra-lab/04-group-ownership-and-access-model.md)
- [Manual access review simulation](../../archive/entra-lab/05-manual-access-review-simulation.md)
- [Graph PowerShell validation design](../../archive/entra-lab/11-microsoft-graph-powershell-validation.md)
- [Access creep and ownership](../../archive/iam-thinking/access-creep-and-ownership.md)
- [Segregation of duties as business logic](../../archive/iam-thinking/segregation-of-duties-as-business-logic.md)
- [Audit evidence](../../archive/governance-compliance/audit-evidence.md)

## What this project demonstrates

This case demonstrates that access governance is not only group administration. It connects business ownership, least privilege, review decisions, remediation and evidence that another person can independently understand.
