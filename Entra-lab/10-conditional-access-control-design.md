# 10 - Conditional Access Control Design

This page documents Conditional Access control design in my Ankkalinna Entra ID lab.

The goal is to practise how MFA and sign-in controls can reduce identity risk.

Conditional Access is not only a portal setting.

It is a security control that decides when access should be allowed, blocked or require stronger verification.

## What is Conditional Access?

Conditional Access can apply access controls based on signals such as:

- user or group
- application
- location
- device state
- sign-in risk
- user risk
- client app
- admin role or privileged access

Based on those signals, access can be allowed, blocked or protected with extra requirements such as MFA.

## Why this matters

A clean access model is not enough if sign-ins are weak.

Even if users have the correct groups, accounts can still be compromised.

Conditional Access helps reduce risks such as:

- password-only sign-ins
- compromised admin accounts
- risky sign-in attempts
- legacy authentication
- access from unexpected conditions

The goal is to protect access without creating unnecessary lockouts or support chaos.

## Policy scope

This lab focuses on three Conditional Access control areas:

| Control area | Risk addressed |
|---|---|
| Standard user sign-ins | Password-only cloud access |
| Privileged access | Compromised admin or elevated account |
| Legacy authentication | Older sign-in methods that may bypass MFA |

Each policy should answer:

- who is targeted?
- what access is protected?
- what control is required?
- who is excluded and why?
- how is the result validated?

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

This policy reduces the risk of password-only access.

A password alone is not enough protection for cloud applications.

MFA adds another verification step before access is granted.

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

Even if privileged access is temporary or eligible, the sign-in should still be protected.

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

Legacy authentication can be risky because it may not support modern security controls like MFA.

Before blocking it, sign-in logs should be checked to make sure legitimate users or applications are not still depending on it.

## Emergency access account

Conditional Access policies should not accidentally lock administrators out of the tenant.

An emergency access account should be considered before enforcing policies.

The emergency access account should be:

- cloud-only
- protected carefully
- monitored
- excluded from Conditional Access where needed
- used only for emergency access
- reviewed regularly

It should not be used for daily administration.

## Testing before enforcement

Conditional Access policies should be tested before enforcement.

A safer rollout can include:

- report-only mode
- pilot users
- one policy at a time
- sign-in log review
- admin access testing
- rollback planning
- user impact review

A badly tested policy can block legitimate users or administrators.

Security control without testing is just spicy chaos with a checkbox.

## User impact

Conditional Access affects real users.

Before enforcing a policy, I should consider:

- who will be affected?
- are users ready for MFA?
- do users have MFA methods registered?
- are there shared accounts or service accounts?
- could old applications break?
- is support ready for sign-in issues?

Good security also needs good communication.

If users are surprised by sign-in changes, support tickets can increase quickly.

## Rollback plan

A Conditional Access policy should have a rollback plan.

Before enforcement, I should know:

- how to disable the policy
- who can disable it
- what emergency account can be used
- what problem signs to look for
- how to check sign-in logs
- how to document the change

Rollback planning is part of controlled change management.

It is not a sign of weak security.

## Sign-in log validation

After testing or enabling a policy, sign-in logs should be reviewed.

Sign-in logs can show:

- which policy was applied
- whether MFA was required
- whether access was blocked
- whether the user passed or failed the control
- whether unexpected users were affected
- whether legacy authentication attempts exist

A policy should not only exist.

It should work as intended.

## Policy summary

| Policy | Target | Control | Main risk reduced |
|---|---|---|---|
| CA-Require-MFA-Standard-Users | Standard users | Require MFA | Password-only sign-in risk |
| CA-Require-MFA-Privileged-Access | Privileged users | Require MFA | Compromised admin access |
| CA-Block-Legacy-Authentication | All users | Block legacy authentication | Weak authentication methods |

Each policy should have a clear purpose.

A Conditional Access policy should not exist only because “MFA is good”.

It should be clear what risk the policy reduces.

## Common mistakes

Common Conditional Access mistakes include:

- enforcing policies without testing
- forgetting emergency access exclusions
- targeting too many controls at once
- not checking sign-in logs
- not communicating MFA changes
- not documenting policy purpose
- not having a rollback plan
- assuming one policy fits every user and risk level

Conditional Access should be planned like a control, not clicked on randomly.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Sign-ins may happen without enough verification or from risky conditions |
| What control is being practised? | Conditional Access policy design |
| Who should own the decision? | Security Owner / IAM Owner |
| What should be tested first? | Pilot users, report-only results and sign-in logs |
| What evidence would support the control? | Policy design, sign-in log results and documented test outcome |
| What should happen if the policy causes problems? | Use rollback plan and emergency access process |

## Security note

Screenshots are not included on this page yet.

Before adding screenshots to GitHub, I will review and blur tenant identifiers, user principal names, policy IDs, object IDs and any other technical details that should not be published.

Conditional Access screenshots can reveal tenant structure and security design, so they should be reviewed carefully before publishing.

## Evidence to add later

Future evidence could include:

- Conditional Access policy design table
- report-only result example
- sign-in log validation example
- MFA requirement result
- legacy authentication block result
- documented rollback plan

The evidence should show the control logic and testing approach, not expose the tenant.

## Practical takeaway

Conditional Access is not only about turning MFA on.

It is about designing sign-in controls around risk.

A good Conditional Access policy should have:

- clear purpose
- clear target users
- clear target applications
- clear control
- emergency access consideration
- testing plan
- user impact review
- rollback plan
- sign-in log validation

Security controls should be strong, but they also need to be controlled.

## What I learned

This design helped me understand Conditional Access as a security control, not only a portal feature.

MFA is important, but the design around MFA also matters.

A Conditional Access policy should answer:

- who is targeted?
- what risk is reduced?
- what control is required?
- who is excluded and why?
- how is the policy tested?
- what evidence proves it worked?
- what happens if it breaks something?

A well-planned policy reduces sign-in risk while keeping access manageable.

## Next step

The next page will focus on Microsoft Graph PowerShell validation and how identity and group data can be checked for review evidence.
