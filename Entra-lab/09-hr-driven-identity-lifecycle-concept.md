# 09 - HR-Driven Identity Lifecycle Concept

This page documents a HR-driven identity lifecycle concept in my Ankkalinna Entra ID lab.

The goal is to understand how HR data could act as the starting point for identity and access changes.

In many real environments, identity lifecycle does not start from the Entra admin center.

It starts from business data, often from a HR system.

The HR system may know when a person starts, what role they have, which department they belong to, who their manager is and when their employment ends.

That information can be used to trigger identity and access changes.

## Why HR data matters

HR data is important because it can act as a source of truth for identity lifecycle events.

A HR system may contain information such as:

- employee name
- employee ID
- employment status
- start date
- end date
- department
- job title
- manager
- location
- employment type

This information can help decide what should happen to the user identity.

For example:

- a new active employee may need an account
- a department change may trigger access review
- a new manager may change approval responsibility
- an end date may trigger leaver cleanup
- a location may affect Conditional Access design

The quality of IAM depends heavily on the quality of identity data.

If the source data is wrong, the access decisions can also become wrong.

## Source of truth

A source of truth means the system or data source that is trusted as the main source for a certain type of information.

In this concept, the HR system is treated as the source of truth for employment-related data.

For example:

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

HR can tell that a person works in Finance.

IAM still needs to decide what Finance access means and how it should be granted, reviewed and removed.

## Important identity attributes

Some user attributes are especially useful for lifecycle and access decisions.

| Attribute | Why it matters |
|---|---|
| employeeId | Helps connect the Entra ID user to the HR record |
| displayName | Human-readable user identity |
| userPrincipalName | Sign-in name and unique cloud identity reference |
| accountEnabled | Shows whether the account can sign in |
| department | Can support department-based access decisions |
| jobTitle | Gives role context for access decisions |
| manager | Supports approval, review and ownership logic |
| officeLocation | Can support location-based context |
| usageLocation | May affect licensing and regional configuration |
| memberOf | Shows group memberships and access assignments |

These attributes should be handled carefully.

Some attributes are useful for automation or validation, but they should not automatically grant sensitive access without approval logic.

For example, a department value of `Finance` may suggest that Finance access is needed.

But high-risk access, application owner access or privileged access should still require stronger approval and review.

## Example HR attributes

The following table shows example HR attributes and how they could be used in IAM.

| HR attribute | Example value | Possible IAM use |
|---|---|---|
| employeeId | 1007 | Unique employee reference |
| displayName | Hannu Hanhi | User identity |
| employmentStatus | Active | Account should be enabled |
| department | Finance | Finance access may be needed |
| jobTitle | Finance Specialist | Role-based access decision |
| manager | Roope Ankka | Approval and access review context |
| startDate | 2026-06-01 | Joiner timing |
| endDate | Empty | No leaver action needed |
| location | Finland | Conditional Access or regional access consideration |

These attributes should not blindly grant access without control.

They should support the decision-making process.

## HR event to IAM action

A HR-driven lifecycle model can connect HR events to IAM actions.

| HR event | Example change | IAM action |
|---|---|---|
| New employee added | employmentStatus = Active | Create or enable account and assign starting access |
| Department changes | Sales to Finance | Add new access, review old access and remove what is no longer needed |
| Manager changes | New manager assigned | Update approval and review responsibility |
| Job title changes | Specialist to Team Lead | Review whether access level should change |
| Employment ends | employmentStatus = Terminated | Block sign-in and remove access |
| End date added | endDate is set | Prepare leaver cleanup |

The important part is not only detecting the HR change.

The important part is deciding what the change should trigger in IAM.

## Trigger does not always mean automatic approval

A HR event can trigger an IAM process, but it should not always mean automatic access approval.

Some access can be low-risk and based on standard role logic.

For example:

| HR data | Possible automatic action |
|---|---|
| department = HR | Add basic HR access if the role matches the standard model |
| employmentStatus = Terminated | Start leaver cleanup |
| manager changed | Update manager information for review context |

Higher-risk access should still require approval.

For example:

| Access type | Why approval is needed |
|---|---|
| Finance leadership access | May expose sensitive financial information |
| Application owner access | May allow configuration or user management |
| Privileged access | May affect users, systems or security settings |

This keeps the lifecycle process controlled.

Automation should support IAM decisions, not blindly replace them.

## Example: Hannu moves from Sales to Finance

In the previous lifecycle model, Hannu Hanhi moved from Sales to Finance.

In a HR-driven model, that change could come from HR data.

Example change:

| Attribute | Old value | New value |
|---|---|---|
| department | Sales | Finance |
| jobTitle | Sales Representative | Finance Specialist |
| manager | Sales Owner | Head of Finance |

This HR change should trigger a mover access review.

Possible IAM actions:

| Access | Action | Reason |
|---|---|---|
| SG-Sales-Basic | Remove | Old department access no longer matches current role |
| SG-Finance-Basic | Add | New department access is needed |
| SG-App-CRM-Users | Review | CRM access may or may not still be needed |
| SG-Finance-Leadership | Do not add | Finance Specialist does not need leadership-level access |
| SG-Privileged-Role-Eligible | Do not add | No privileged access need |

This shows how HR data can trigger access review, but the access decision still needs logic and ownership.

## Mock HR source idea

This lab does not connect to a real HR system.

Instead, a future version of the lab could use a mock HR source.

The mock source could be represented as a simple table first, before building any automation.

| employeeId | displayName | department | jobTitle | manager | employmentStatus |
|---|---|---|---|---|---|
| 1001 | Aku Ankka | IT Support | Support Specialist | Mikki Hiiri | Active |
| 1002 | Iines Ankka | HR | HR Specialist | Minni Hiiri | Active |
| 1003 | Roope Ankka | Finance | Head of Finance | Minni Hiiri | Active |
| 1004 | Hannu Hanhi | Finance | Finance Specialist | Roope Ankka | Active |

This mock HR source could be used to compare expected identity data against Entra ID data.

This would help practise validation before building automation.

Later, the same idea could be moved into a separate CSV file if needed.

## Attribute mapping concept

Attribute mapping means deciding how HR data should appear in Entra ID.

Example mapping:

| HR data | Entra ID user property | Purpose |
|---|---|---|
| displayName | Display name | User identity |
| department | Department | Access logic and reporting |
| jobTitle | Job title | Role context |
| manager | Manager | Approval and review context |
| location | Office location / usage location | Regional or license-related context |
| employmentStatus | Account enabled / disabled logic | Joiner and leaver control |

Mapping should be planned carefully.

Bad attribute mapping can create confusion later, especially if access logic depends on those values.

## Where Microsoft Graph fits

Microsoft Graph can be used to read and validate identity data from Microsoft Entra ID.

In this lab, Microsoft Graph is not the source of truth for HR data.

The source of truth would be the HR system or mock HR source.

Microsoft Graph would be used to check what currently exists in Entra ID.

For example, Graph could help validate:

- does the user exist in Entra ID?
- is the account enabled or disabled?
- what department is stored on the user object?
- what job title is stored on the user object?
- who is listed as the user’s manager?
- what groups is the user a member of?
- does the user still have access that no longer matches HR data?

This means Microsoft Graph can help compare expected identity data against the actual Entra ID state.

The important idea is:

| Layer | Example | Purpose |
|---|---|---|
| HR source | Mock HR file or HR system | Defines employment data |
| IAM logic | Access rules and lifecycle decisions | Decides what should happen |
| Entra ID | Users, groups and attributes | Stores the current identity state |
| Microsoft Graph | Query and validation layer | Reads identity data for checks and evidence |

Microsoft Graph does not replace the access model.

It helps validate whether the current Entra ID state matches the expected access model.

## Risks if HR data is wrong

HR-driven IAM depends on accurate HR data.

If HR data is wrong or late, IAM actions may also be wrong or late.

Example risks:

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

That is why data quality and ownership matter.

## Integration thinking

In a real environment, HR and IAM systems may communicate through integrations.

This could include:

- scheduled file export
- API connection
- identity governance platform
- provisioning workflow
- Microsoft Graph-based validation
- lifecycle workflow
- access package or entitlement management process

The exact technical solution can vary.

The important design questions are:

- what system owns the data?
- how often is the data updated?
- what event should trigger IAM action?
- what action should be automatic?
- what action needs approval?
- what happens if the data is wrong?
- how is the change logged?
- how can the final state be verified?

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
| What evidence would support the control? | HR event, IAM decision, before/after access state and validation output |
| What should happen if HR data changes? | Review identity attributes and update access based on current business need |

## Security note

This page is a concept note.

It does not include real HR data, real employee information or real customer data.

If mock HR files are added later, they will use fictional users only.

Screenshots or outputs should not expose tenant identifiers, user principal names, object IDs or any sensitive technical details.

## Evidence to add later

Future evidence could include:

- mock HR source table or file
- expected access mapping table
- comparison between HR data and Entra user attributes
- PowerShell output showing validation results
- documented access decision based on a HR event

The evidence should show how HR data supports IAM decisions, not expose real identity data.

## Practical takeaway

HR-driven identity lifecycle is about connecting business changes to identity and access changes.

A user’s access should not depend only on manual memory or random tickets.

Employment status, department, role, manager and end date should help drive the IAM process.

But HR data should not blindly grant sensitive access.

The data should trigger a controlled decision, with ownership, approval and evidence.

Microsoft Graph can support this by validating what actually exists in Entra ID.

## What I learned

This concept helped me understand IAM as more than manual user and group management.

The identity lifecycle depends on good source data.

If HR data is accurate, IAM can respond to joiner, mover and leaver events more reliably.

If HR data is wrong, IAM can grant wrong access, miss cleanup or create confusion.

Microsoft Graph can help check the current Entra ID state, but it does not decide what access should be valid.

The deeper lesson is simple:

Identity automation is only as good as the data and process behind it.

## Next step

The next page will focus on Conditional Access control design and MFA/sign-in controls around user risk, admin access and business impact.
