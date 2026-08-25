# 10 - Conditional Access Control Design

This page documents Conditional Access control design in the Ankkalinna Entra ID lab.

The model focuses on MFA, privileged access protection, legacy authentication blocking, testing, rollback planning and sign-in log validation.

## Conditional Access scope

Conditional Access applies access controls based on sign-in signals.

| Signal | Example use |
|---|---|
| User or group | Target standard users or privileged users |
| Application | Protect Microsoft cloud apps or admin portals |
| Location | Apply controls based on trusted or untrusted locations |
| Device state | Require compliant or managed devices |
| Sign-in risk | Add controls for risky sign-ins |
| User risk | Add controls for risky users |
| Client app | Block older authentication methods |
| Admin role | Apply stronger controls for elevated access |

Conditional Access can allow access, block access or require stronger verification such as MFA.

## Risk focus

A clean group model is not enough if sign-ins are weak.

| Risk area | Impact |
|---|---|
| Password-only access | A stolen password may be enough to access cloud services |
| Compromised admin account | Elevated access could be used to change users, groups or security settings |
| Legacy authentication | Older authentication methods may bypass modern controls such as MFA |
| Poor testing | A policy may block legitimate users or administrators |
| Missing rollback plan | Recovery may be slow if a policy causes access issues |

## Policy scope

This lab focuses on three Conditional Access control areas:

| Control area | Risk addressed |
|---|---|
| Standard user sign-ins | Password-only cloud access |
| Privileged access | Compromised admin or elevated account |
| Legacy authentication | Older sign-in methods that may bypass MFA |

Each policy should define:

- target users
- protected applications
- required control
- exclusions
- testing method
- validation evidence

## Policy 1: Require MFA for standard users

| Design area | Decision |
|---|---|
| Policy name | CA-Require-MFA-Standard-Users |
| Target users | Standard lab users |
| Target apps | Microsoft cloud apps |
| Control | Require multifactor authentication |
| Risk addressed | Password-only sign-in risk |
| Testing method | Pilot group or report-only mode |
| Exclusion | Emergency access account |

This policy reduces the risk of password-only access to cloud applications.


## Policy 2: Require MFA for privileged access

| Design area | Decision |
|---|---|
| Policy name | CA-Require-MFA-Privileged-Access |
| Target users | Privileged users or privileged role eligible users |
| Target apps | Admin portals and Microsoft cloud apps |
| Control | Require multifactor authentication |
| Risk addressed | Compromised admin or elevated account |
| Testing method | Test with one privileged test user first |
| Exclusion | Emergency access account |

Privileged users need stronger protection than standard users.

Admin or elevated access can affect users, groups, applications, security settings and access rights.


## Policy 3: Block legacy authentication

| Design area | Decision |
|---|---|
| Policy name | CA-Block-Legacy-Authentication |
| Target users | All users |
| Target apps | All cloud apps |
| Condition | Legacy authentication clients |
| Control | Block access |
| Risk addressed | Older authentication methods that may bypass MFA |
| Testing method | Check sign-in logs before enforcement |
| Exclusion | Emergency access account if needed |

Legacy authentication can be risky because it may not support modern security controls such as MFA.

Sign-in logs should be reviewed before enforcement to confirm whether any users or applications still depend on legacy authentication.


## Emergency access account

Conditional Access policies should not accidentally lock administrators out of the tenant.

An emergency access account should be considered before enforcement.

| Requirement | Purpose |
|---|---|
| Cloud-only account | Keeps access available if hybrid identity has issues |
| Carefully protected | Reduces misuse risk |
| Monitored | Detects unexpected use |
| Excluded from selected Conditional Access policies | Prevents tenant lockout |
| Used only for emergencies | Keeps normal administration separate |
| Reviewed regularly | Confirms the account remains controlled |

The emergency access account should not be used for daily administration.


## Testing before enforcement

Conditional Access policies should be tested before they are enforced.

| Testing step | Purpose |
|---|---|
| Report-only mode | Shows expected policy impact without blocking access |
| Pilot group | Limits impact during testing |
| One policy at a time | Makes troubleshooting easier |
| Sign-in log review | Confirms policy result |
| Admin access testing | Reduces lockout risk |
| Rollback planning | Defines recovery steps |
| User impact review | Identifies support and communication needs |

A policy should not be enforced until the expected impact is understood.


## User impact

Conditional Access affects real users and support teams.

Before enforcement, the following should be checked:

| Question | Reason |
|---|---|
| Who will be affected? | Defines scope |
| Are users ready for MFA? | Reduces sign-in disruption |
| Do users have MFA methods registered? | Prevents failed sign-ins |
| Are shared accounts or service accounts affected? | Identifies exceptions |
| Could old applications break? | Identifies compatibility risk |
| Is support ready for sign-in issues? | Reduces operational impact |

Security controls need communication and support planning.

## Rollback plan

A Conditional Access policy should have a rollback plan before enforcement.

| Rollback question | Purpose |
|---|---|
| How can the policy be disabled? | Defines recovery action |
| Who can disable it? | Defines responsibility |
| What emergency account can be used? | Prevents lockout |
| What problem signs should be monitored? | Defines failure indicators |
| Where are sign-in logs checked? | Supports troubleshooting |
| How is the change documented? | Supports review and audit evidence |

Rollback planning is part of controlled change management.

It does not weaken the security control.

## Sign-in log validation

After testing or enabling a policy, sign-in logs should be reviewed.

| Validation item | Purpose |
|---|---|
| Applied policy | Confirms which Conditional Access policy affected the sign-in |
| MFA requirement | Confirms whether MFA was required |
| Access result | Shows whether access was allowed or blocked |
| User result | Shows whether the user passed or failed the control |
| Unexpected impact | Identifies users affected incorrectly |
| Legacy authentication attempts | Confirms whether legacy authentication is still used |

A policy should be validated against real sign-in results.


## Policy summary

| Policy | Target | Control | Main risk reduced |
|---|---|---|---|
| CA-Require-MFA-Standard-Users | Standard users | Require MFA | Password-only sign-in risk |
| CA-Require-MFA-Privileged-Access | Privileged users | Require MFA | Compromised admin access |
| CA-Block-Legacy-Authentication | All users | Block legacy authentication | Weak authentication methods |

Each policy should have a clear purpose, target, control and validation method.

## Common mistakes

| Mistake | Risk |
|---|---|
| Enforcing policies without testing | Legitimate users or admins may be blocked |
| Forgetting emergency access exclusions | Tenant lockout risk |
| Targeting too many controls at once | Troubleshooting becomes difficult |
| Not checking sign-in logs | Policy impact is not verified |
| Not communicating MFA changes | Support tickets may increase |
| Not documenting policy purpose | Future review becomes unclear |
| No rollback plan | Recovery may be slow |
| One policy for every risk level | Sensitive access may not receive stronger protection |

Conditional Access should be planned as a control, not applied randomly.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Sign-ins may happen without enough verification or from risky conditions |
| What control is being practised? | Conditional Access policy design |
| What is being protected? | Standard user access, privileged access and authentication flow |
| Who should own the decision? | Security Owner / IAM Owner |
| What should be tested first? | Pilot users, report-only results and sign-in logs |
| What evidence supports the control? | Policy design, sign-in log results and documented test outcome |
| What should happen if the policy causes problems? | Use rollback plan and emergency access process |

## Evidence

| Evidence | Purpose |
|---|---|
| Policy design table | Shows target, control, exclusion and risk |
| Report-only result | Shows expected impact before enforcement |
| Sign-in log result | Confirms policy behavior |
| MFA requirement result | Shows stronger verification was required |
| Legacy authentication result | Shows weak authentication was blocked or detected |
| Rollback plan | Shows recovery process |

## Security note

Published screenshots should not expose tenant identifiers, user principal names, policy IDs, object IDs, IP addresses or other technical identifiers.

Conditional Access screenshots can reveal tenant structure and security design, so they should be reviewed carefully before publishing.

## Summary

This page defines Conditional Access controls for standard users, privileged access and legacy authentication.

The model reduces sign-in risk through MFA, policy testing, emergency access planning, rollback preparation and sign-in log validation.

The next page focuses on Microsoft Graph PowerShell validation and how identity and group data can be checked for review evidence.
