# 09 - HR-Driven Identity Lifecycle Concept

This page documents a HR-driven identity lifecycle concept in the Ankkalinna Entra ID lab.

The concept shows how HR data can act as the starting point for identity lifecycle changes.

In many environments, identity lifecycle does not start from the Entra admin center.

It starts from business data, usually from a HR system.

## Concept scope

| Area | Purpose |
|---|---|
| HR source | Provides employment-related identity data |
| IAM logic | Defines what access should change based on HR data |
| Entra ID | Stores users, attributes, groups and access assignments |
| Microsoft Graph | Reads and validates current Entra ID state |
| Access owners | Approve and review access decisions |

The HR system may know when a person starts, what role they have, which department they belong to, who their manager is and when their employment ends.

That data can trigger identity and access changes.

## HR data as source of truth

In this concept, the HR system is treated as the source of truth for employment-related data.

| Data | Source of truth |
|---|---|
| Employment status | HR system |
| Department | HR system |
| Job title | HR system |
| Manager | HR system |
| Start date | HR system |
| End date | HR system |
| Group membership | IAM / Entra ID |
| Application access | Application owner / IAM process |
| Privileged access | IAM / Security owner |

This separation matters.

HR can show that a person works in Finance.

IAM still needs to define what Finance access means, who can approve it, how it is reviewed and when it should be removed.

## Important identity attributes

Some identity attributes are useful for lifecycle, access decisions and validation.

| Attribute | Why it matters |
|---|---|
| employeeId | Connects the Entra ID user to the HR record |
| displayName | Human-readable user identity |
| userPrincipalName | Sign-in name and cloud identity reference |
| accountEnabled | Shows whether the account can sign in |
| department | Supports department-based access logic |
| jobTitle | Supports role-based access decisions |
| manager | Supports approval and review ownership |
| officeLocation | Supports location-based context |
| usageLocation | May affect licensing and regional configuration |
| memberOf | Shows group memberships and access assignments |

These attributes can support automation and validation.

They should not blindly grant sensitive access without approval logic.

For example, `department = Finance` may suggest that Finance access is needed.

High-risk access, application owner access and privileged access should still require stronger approval and review.

## Example HR attributes

| HR attribute | Example value | Possible IAM use |
|---|---|---|
| employeeId | 1007 | Unique employee reference |
| displayName | Hannu Hanhi | User identity |
| employmentStatus | Active | Account should be enabled |
| department | Finance | Finance access may be needed |
| jobTitle | Finance Specialist | Role-based access decision |
| manager | Roope Ankka | Approval and review context |
| startDate | 2026-06-01 | Joiner timing |
| endDate | Empty | No leaver action needed |
| location | Finland | Conditional Access or regional access context |

{IMAGE 01: Mock HR attribute table or example HR source view. Use fictional users only. No real employee data.}

## HR event to IAM action

HR-driven lifecycle connects business events to IAM actions.

| HR event | Example change | IAM action |
|---|---|---|
| New employee added | employmentStatus = Active | Create or enable account and assign starting access |
| Department changes | Sales to Finance | Add new access, review old access and remove what is no longer needed |
| Manager changes | New manager assigned | Update approval and review responsibility |
| Job title changes | Specialist to Team Lead | Review whether access level should change |
| Employment ends | employmentStatus = Terminated | Block sign-in and remove access |
| End date added | endDate is set | Prepare leaver cleanup |

The HR event is the trigger.

The IAM process decides what should happen next.

## Trigger does not always mean automatic approval

A HR event can trigger an IAM process, but it should not always mean automatic access approval.

Some low-risk access may follow standard role logic.

| HR data | Possible automatic action |
|---|---|
| department = HR | Add basic HR access if the role matches the standard model |
| employmentStatus = Terminated | Start leaver cleanup |
| manager changed | Update manager information for review context |

Higher-risk access should require approval.

| Access type | Why approval is needed |
|---|---|
| Finance leadership access | May expose sensitive financial information |
| Application owner access | May allow configuration or user management |
| Privileged access | May affect users, systems or security settings |

Automation should support IAM decisions, not blindly replace them.

## Example: Hannu moves from Sales to Finance

Hannu Hanhi moves from Sales to Finance.

In a HR-driven model, the change could come from HR data.

| Attribute | Old value | New value |
|---|---|---|
| department | Sales | Finance |
| jobTitle | Sales Representative | Finance Specialist |
| manager | Sales Owner | Head of Finance |

This HR change should trigger a mover access review.

| Access | Action | Reason |
|---|---|---|
| SG-Sales-Basic | Remove | Old department access no longer matches current role |
| SG-Finance-Basic | Add | New department access is needed |
| SG-App-CRM-Users | Review | CRM access may or may not still be needed |
| SG-Finance-Leadership | Do not add | Finance Specialist does not need leadership-level access |
| SG-Privileged-Role-Eligible | Do not add | No privileged access need |

HR data can trigger the review.

Access ownership and approval still define the final decision.

{IMAGE 02: Hannu HR data change example, such as Sales to Finance mapping table or diagram. No tenant details needed.}

## Mock HR source

This lab does not connect to a real HR system.

A mock HR source can be used to represent expected employment data before building automation.

| employeeId | displayName | department | jobTitle | manager | employmentStatus |
|---|---|---|---|---|---|
| 1001 | Aku Ankka | IT Support | Support Specialist | Mikki Hiiri | Active |
| 1002 | Iines Ankka | HR | HR Specialist | Minni Hiiri | Active |
| 1003 | Roope Ankka | Finance | Head of Finance | Minni Hiiri | Active |
| 1004 | Hannu Hanhi | Finance | Finance Specialist | Roope Ankka | Active |

The mock HR source can be compared against Entra ID data.

This supports validation before automation.

Later, the same data could be moved into a separate mock CSV file or PowerShell input file.

{IMAGE 03: Mock HR source table or separate mock HR data file preview. Use fictional users only.}

## Attribute mapping

Attribute mapping defines how HR data appears in Entra ID.

| HR data | Entra ID user property | Purpose |
|---|---|---|
| displayName | Display name | User identity |
| department | Department | Access logic and reporting |
| jobTitle | Job title | Role context |
| manager | Manager | Approval and review context |
| location | Office location / usage location | Regional or license-related context |
| employmentStatus | Account enabled / disabled logic | Joiner and leaver control |

Mapping should be planned before automation.

Bad mapping can create wrong access decisions if access logic depends on those values.

## Where Microsoft Graph fits

Microsoft Graph can be used to read and validate identity data from Microsoft Entra ID.

In this concept:

| Layer | Example | Purpose |
|---|---|---|
| HR source | Mock HR table or HR system | Defines employment data |
| IAM logic | Access rules and lifecycle decisions | Defines expected action |
| Entra ID | Users, groups and attributes | Stores current identity state |
| Microsoft Graph | Query and validation layer | Reads current Entra ID data for checks and evidence |

Microsoft Graph is not the source of truth for HR data.

It is used to check what currently exists in Entra ID.

Microsoft Graph could help validate:

- whether the user exists in Entra ID
- whether the account is enabled or disabled
- what department is stored on the user object
- what job title is stored on the user object
- who is listed as the user’s manager
- what groups the user belongs to
- whether current access still matches HR data

Microsoft Graph does not replace the access model.

It helps validate whether the current Entra ID state matches the expected model.

{IMAGE 04: Simple diagram showing HR source → IAM logic → Entra ID → Microsoft Graph validation. No tenant details needed.}

## HR data quality risks

HR-driven IAM depends on accurate source data.

| HR data issue | IAM risk |
|---|---|
| Start date is wrong | Account may be created too early or too late |
| Department is wrong | User may receive wrong access |
| Manager is missing | Approval and review responsibility may be unclear |
| Employment status is not updated | Leaver account may stay active |
| Job title is outdated | Role-based access decision may be wrong |
| Duplicate employee record exists | Duplicate identity risk |

Automation does not fix bad data.

It can make bad data move faster.

Data quality, ownership and validation are part of the control.

## Integration thinking

In a real environment, HR and IAM systems may communicate through integrations.

Possible integration patterns include:

- scheduled file export
- API connection
- identity governance platform
- provisioning workflow
- Microsoft Graph-based validation
- lifecycle workflow
- access package or entitlement management process

The exact technical solution can vary.

The design questions stay mostly the same:

| Question | Reason |
|---|---|
| What system owns the data? | Defines source of truth |
| How often is the data updated? | Defines timing and delay risk |
| What event should trigger IAM action? | Defines lifecycle logic |
| What action can be automatic? | Defines low-risk automation |
| What action needs approval? | Defines control for sensitive access |
| What happens if the data is wrong? | Defines exception handling |
| How is the change logged? | Defines evidence |
| How is the final state verified? | Defines validation |

The integration is not only a technical connection.

It is also a process and control design.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Identity and access changes may not follow real employment changes |
| What control is being practised? | Using HR data as a lifecycle trigger for IAM decisions |
| What is the source of truth? | HR system for employment data |
| What role could Microsoft Graph have? | Validate current Entra ID identity and group data |
| Who owns access decisions? | Business owner, application owner or security owner depending on access type |
| What evidence supports the control? | HR event, IAM decision, before/after access state and validation output |
| What should happen if HR data changes? | Review identity attributes and update access based on current business need |

## Evidence

| Evidence | Purpose |
|---|---|
| Mock HR source | Shows expected employment data |
| Attribute mapping table | Shows how HR data connects to Entra ID fields |
| HR event table | Shows what lifecycle change occurred |
| IAM action table | Shows what access change should happen |
| Microsoft Graph validation output | Shows current Entra ID state |
| Expected vs actual comparison | Shows whether identity data and access match the model |

{IMAGE 05: Expected vs actual comparison example between mock HR data and Entra ID data. Blur all tenant identifiers and UPNs.}

## Security note

This page uses fictional users only.

No real HR data, employee data or customer data should be published.

Published screenshots or outputs should not expose tenant identifiers, user principal names, object IDs, group IDs or other technical identifiers.

## Summary

This page defines how HR data can drive identity lifecycle decisions.

The model separates HR source data, IAM decision logic, Entra ID state, Microsoft Graph validation and access ownership.

The next page focuses on Conditional Access control design and MFA/sign-in controls.
