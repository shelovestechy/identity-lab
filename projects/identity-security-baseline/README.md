# Identity Security Baseline

**Current form:** design case study with lab validation planned

## Scenario

An identity environment has grown through manual administration. Standard users, administrators, applications and external identities exist, but authentication strength, privileged access and monitoring are not managed as one security baseline.

The central problem is not a single configuration setting. It is the possibility that a compromised or overprivileged identity can reach more systems than necessary without producing a clear signal for the security team.

## Goal

Design a Microsoft Entra ID identity security baseline that:

- reduces password-only sign-in risk
- applies stronger controls to privileged identities
- blocks weak legacy authentication
- avoids administrative lockout
- introduces controls safely through testing and rollback planning
- produces evidence that someone can review later

## Threat and control view

| Identity risk | Proposed control | Validation evidence |
| :--- | :--- | :--- |
| Stolen password is enough to sign in | Require MFA for standard users | Report-only and sign-in log result |
| Administrator account is compromised | Phishing-resistant MFA and time-limited privileged access | Authentication method and role activation evidence |
| Old authentication method bypasses modern controls | Block legacy authentication | Sign-in log showing detected or blocked legacy authentication |
| Conditional Access policy blocks legitimate administration | Pilot scope, report-only mode, exclusions and rollback plan | Test record and documented rollback decision |
| Emergency access account is misused | Separate cloud-only account with monitoring | Alert test and regular review record |
| Security-sensitive configuration changes go unnoticed | Monitor role, policy, consent and risky sign-in events | Alert or query result with response owner |

## Design decisions

### Standard and privileged identities need different protection

MFA for all users is a baseline, not the final control. Privileged identities require stronger authentication, limited activation time, separate administration practices and closer monitoring because their compromise has a larger impact.

### Conditional Access needs a safe rollout path

A technically correct policy can still cause operational harm when scope, exclusions or dependencies are not understood. The design therefore includes report-only testing, a pilot population, one controlled change at a time, sign-in log validation and a named rollback owner.

### Emergency access is part of resilience

Emergency access accounts reduce lockout risk, but they also create powerful standing credentials. They need a narrow purpose, secure storage, monitoring and regular review rather than becoming normal admin accounts.

### A configured control is not automatically a verified control

The project treats configuration, test result and operational evidence as separate things. A policy is not considered demonstrated until its expected and unexpected effects have been checked.

## Current evidence status

| Item | Status |
| :--- | :--- |
| Threat and control model | Documented |
| Conditional Access policy design | Documented |
| Privileged access risk model | Documented |
| Test and rollback approach | Documented |
| Sanitized report-only result | Not yet published |
| Sanitized sign-in log validation | Not yet published |
| PIM activation evidence | Not yet published; depends on lab licensing |

## Next practical milestone

Test one Conditional Access policy in report-only mode and publish a compact evidence record:

1. expected behavior
2. test user and scope using fictional data
3. observed sign-in result
4. unexpected impact check
5. enforcement or revision decision
6. rollback owner and action

## Supporting learning material

- [Original Zero Trust baseline](../../archive/iam-projects/entra-zero-trust-baseline/)
- [Conditional Access control design](../../archive/entra-lab/10-conditional-access-control-design.md)
- [Privileged access risk model](../../archive/entra-lab/07-privileged-access-risk-model.md)

## What this project demonstrates

This case demonstrates how I currently reason about identity as a security boundary: protect authentication, reduce standing privilege, plan for failure, validate behavior and make control ownership visible.
