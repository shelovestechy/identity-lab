# 11 - Microsoft Graph PowerShell Validation

This page documents how Microsoft Graph PowerShell can be used to validate identity and group data in the Ankkalinna Entra ID lab.

The goal is to compare the expected access model against the current Microsoft Entra ID state.

## Validation scope

| Area | Validation goal |
|---|---|
| User attributes | Check department, job title, account status and manager data |
| Group memberships | Check which access groups users belong to |
| Expected access | Compare actual group membership against the planned access model |
| Review evidence | Capture clean output that can support access review decisions |

## Expected access model

| User | Expected role | Expected access |
|---|---|---|
| Iines Ankka | HR Specialist | SG-HR-Basic |
| Roope Ankka | Head of Finance | SG-Finance-Basic, SG-Finance-Leadership, SG-App-CRM-Users |
| Hannu Hanhi | Finance Specialist | SG-Finance-Basic |
| Minni Hiiri | Application Owner | SG-App-CRM-Owners |
| Mikki Hiiri | Security Specialist | SG-Security-Basic, SG-Privileged-Role-Eligible |

The expected access model gives the validation a clear target.

A group membership list alone only shows current access.

An expected access model shows whether the current access is correct.

## Validation questions

| Question | Why it matters |
|---|---|
| Does the user exist in Entra ID? | Confirms the identity is present |
| Is the account enabled? | Shows whether the user can sign in |
| Is the department correct? | Supports department-based access decisions |
| Is the job title correct? | Supports role-based access decisions |
| Is the manager set correctly? | Supports approval and review ownership |
| What groups is the user a member of? | Shows actual access assignments |
| Does actual access match expected access? | Finds missing or unnecessary access |

## Microsoft Graph PowerShell areas

| Area | Purpose |
|---|---|
| Connect to Microsoft Graph | Start an authenticated Graph PowerShell session |
| Get users | Read user identity attributes |
| Get groups | Read group information |
| Get group members | Review access group membership |
| Get user memberships | Check what access a specific user has |
| Export results | Save evidence for access review or cleanup |


## Example: Hannu Hanhi validation

Hannu Hanhi moved from Sales to Finance.

Expected final access:

| User | Expected access |
|---|---|
| Hannu Hanhi | SG-Finance-Basic |

Validation should check whether Hannu still has old Sales access or unnecessary application access.

| Group | Expected result |
|---|---|
| SG-Sales-Basic | Hannu should not be a member |
| SG-App-CRM-Users | Review needed depending on current business need |
| SG-Finance-Basic | Hannu should be a member |
| SG-Finance-Leadership | Hannu should not be a member |
| SG-Privileged-Role-Eligible | Hannu should not be a member |


## Expected output format

A useful validation output should connect technical data to an access decision.

| User | Department | Job title | Group | Expected? | Decision |
|---|---|---|---|---|---|
| Hannu Hanhi | Finance | Finance Specialist | SG-Finance-Basic | Yes | Keep |
| Hannu Hanhi | Finance | Finance Specialist | SG-Sales-Basic | No | Remove |
| Roope Ankka | Finance | Head of Finance | SG-Finance-Leadership | Yes | Keep |
| Mikki Hiiri | Security | Security Specialist | SG-Privileged-Role-Eligible | Yes | Review monthly |


## HR data comparison

Microsoft Graph can also support comparison between mock HR data and current Entra ID data.

| HR data | Entra ID data | Validation question |
|---|---|---|
| department = Finance | Entra department = Finance | Does the department match? |
| jobTitle = Finance Specialist | Entra job title = Finance Specialist | Does the role context match? |
| employmentStatus = Terminated | accountEnabled = true | Should the account be disabled? |
| manager = Roope Ankka | Entra manager = Empty | Is manager data missing? |

This comparison helps identify data quality issues before automation is trusted.

If the HR source and Entra ID state do not match, access decisions may also become unreliable.


## Evidence

| Evidence | Purpose |
|---|---|
| User attribute output | Shows current identity data |
| Group membership output | Shows current access assignments |
| Expected vs actual table | Shows whether access matches the model |
| Before and after comparison | Shows cleanup result |
| Exception list | Shows access that needs review |
| Exported review result | Supports access review documentation |

Evidence should be readable without exposing unnecessary identity or tenant details.

Raw output should be cleaned before publishing.

## Exception handling

Validation may find access or identity data that does not match the expected model.

| Finding | Possible action |
|---|---|
| User has old department access | Remove access or confirm exception |
| User is missing expected access | Add access after approval |
| User has high-risk access without clear role need | Review with owner |
| User account is enabled after termination | Block sign-in and remove access |
| Manager is missing | Fix identity attribute data |
| Department or job title is wrong | Correct source data or Entra attribute |

The result should lead to a decision, not only a report.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Actual access may not match the expected access model |
| What control is being practised? | Microsoft Graph PowerShell validation |
| What is being validated? | User attributes, group memberships and expected access |
| Who uses the result? | IAM, IT, security owner, business owner or application owner |
| What evidence supports the control? | Exported validation output and documented review decision |
| What happens if access does not match the model? | Investigate, approve, correct or remove the access |

## Security note

Published screenshots and command outputs should not expose tenant identifiers, user principal names, object IDs, group IDs or other technical identifiers.

PowerShell output can expose identity data, so it should be reviewed and cleaned before publishing.

## Summary

This page defines how Microsoft Graph PowerShell can support IAM validation.

The validation compares expected access against the current Entra ID state and turns identity data into review evidence.

The output should support clear decisions: keep access, remove access, review access, fix identity data or investigate an exception.
