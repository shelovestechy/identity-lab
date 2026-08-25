# Identity Continuity and Architecture

**Current form:** technical operations and architecture case study

## Central idea

A person's name, email address, role, organization or source system can change. The identity must remain understandable and controllable through those changes.

Identity continuity means preserving the relationship between the person, the account, access history and audit trail instead of accidentally creating a second identity or losing the first one.

## Case 1: Name change

A user changes their surname. What looks like a simple profile update can affect:

- display name
- primary email address and aliases
- user principal name and sign-in instructions
- cached client information
- application matching and SSO
- hybrid identity synchronization
- audit searches and historical records

### Design principles

| Principle | Practical meaning |
| :--- | :--- |
| Confirm the source of authority | Change cloud-only identities in the cloud and synchronized identities in the correct source system |
| Prefer stable identifiers | Applications should not treat display name, email or UPN as an immutable person ID |
| Preserve communication continuity | Keep the old email address as an alias when appropriate |
| Assess UPN impact separately | A legal name change does not automatically require a sign-in name change |
| Communicate user impact | Explain sign-in, application and propagation effects before the change |
| Preserve the audit chain | The same account should remain traceable before and after the change |

## Case 2: Identity architecture after an acquisition

An acquisition creates a larger version of the same continuity problem. Two organizations may have different directories, naming rules, MFA methods, applications, lifecycle processes and support models.

The question is not only how to migrate accounts. It is how to maintain secure access and business continuity while identity sources and trust relationships change.

### Architecture risk view

| Risk area | Example question |
| :--- | :--- |
| Source of authority | Which HR or identity system owns each attribute during transition? |
| Duplicate identities | How are existing accounts matched to the same person? |
| Access inheritance | Which old entitlements remain valid in the new organization? |
| Authentication continuity | How do users reach critical systems while domains or sign-in methods change? |
| Privileged access | How are admin accounts discovered, separated and reviewed? |
| Application integration | Do applications use stable IDs or changeable values such as email? |
| Support readiness | Can Service Desk identify the correct identity and known transition state? |
| Decommissioning | When can an old directory, account or trust relationship be safely removed? |

## Recommended transition approach

1. discover identity sources, accounts, applications and ownership
2. define target identity principles and matching rules
3. identify critical access and continuity dependencies
4. pilot with a controlled population
5. communicate changes and prepare support
6. validate authentication, access and audit history
7. remove old identities and integrations only after evidence supports decommissioning

## Evidence status

This project currently documents technical decision points and architecture risks. It does not claim that I have executed an enterprise identity migration. A future practical extension could model fictional source data and demonstrate deterministic identity matching and exception handling.

## Supporting learning material

- [Name change technical notes](../../archive/practical-notes/name-change-technical.md)
- [Name change and identity continuity](../../archive/iam-thinking/name-change-identity-risks.md)
- [Identity architecture after an acquisition](../../archive/iam-thinking/identity-architecture-after-acquisition.md)

## What this project demonstrates

This case demonstrates how I connect user-facing support impact with identity data, integration design, security risk and architecture-level continuity.
