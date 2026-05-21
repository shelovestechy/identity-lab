# 11 - Microsoft Graph PowerShell Validation

This page documents how Microsoft Graph PowerShell can be used to validate identity and group data in the Ankkalinna Entra ID lab.

The goal is to compare the expected access model against the current Entra ID state.

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

Hannu moved from Sales to Finance.

Expected final access:

| User | Expected access |
|---|---|
| Hannu Hanhi | SG-Finance-Basic |

Validation result should check:

| Group | Expected result |
|---|---|
| SG-Sales-Basic | Hannu should not be a member |
| SG-App-CRM-Users | Review needed depending on current business need |
| SG-Finance-Basic | Hannu should be a member |
| SG-Finance-Leadership | Hannu should not be a member |
| SG-Privileged-Role-Eligible | Hannu should not be a member |

## Expected output format

| User | Department | Job title | Group | Expected? | Decision |
|---|---|---|---|---|---|
| Hannu Hanhi | Finance | Finance Specialist | SG-Finance-Basic | Yes | Keep |
| Hannu Hanhi | Finance | Finance Specialist | SG-Sales-Basic | No | Remove |
| Roope Ankka | Finance | Head of Finance | SG-Finance-Leadership | Yes | Keep |
| Mikki Hiiri | Security | Security Specialist | SG-Privileged-Role-Eligible | Yes | Review monthly |

## HR data comparison

Microsoft Graph can also help compare Entra ID data against the mock HR source.

| HR data | Entra ID data | Validation question |
|---|---|---|
| department = Finance | Entra department = Finance | Does the department match? |
| jobTitle = Finance Specialist | Entra job title = Finance Specialist | Does the role context match? |
| employmentStatus = Terminated | accountEnabled = true | Should the account be disabled? |
| manager = Roope Ankka | Entra manager = Empty | Is manager data missing? |

## Evidence value

| Evidence | Purpose |
|---|---|
| User attribute output | Shows current identity data |
| Group membership output | Shows current access assignments |
| Expected vs actual table | Shows whether access matches the model |
| Before and after comparison | Shows cleanup result |
| Exception list | Shows access that needs review |

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Actual access may not match the expected access model |
| What control is being practised? | Graph PowerShell validation |
| What is being validated? | User attributes, group memberships and expected access |
| What evidence supports the control? | Exported validation output and documented review decision |
| What happens if access does not match the model? | Investigate, approve or remove the access |

## Security note

Screenshots and command outputs are not included on this page yet.

Before publishing outputs, tenant identifiers, user principal names, object IDs, group IDs and other technical identifiers should be removed or blurred.

PowerShell output can expose identity data, so it should be cleaned before publishing.

## Evidence to add later

Future evidence could include:

- cleaned user attribute output
- cleaned group membership output
- expected vs actual access table
- exported review evidence
- before and after cleanup comparison

## Practical takeaway

Microsoft Graph PowerShell can be used to validate whether Entra ID data matches the planned access model.

The useful part is not only collecting data.

The useful part is connecting the output to a decision:

- keep access
- remove access
- review access
- fix identity data
- investigate an exception
