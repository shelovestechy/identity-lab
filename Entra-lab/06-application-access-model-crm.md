# 06 - Application Access Model: Ankkalinna CRM

This page documents the application access model for the fictional **Ankkalinna CRM** application in the Ankkalinna Entra ID lab.

The model separates standard user access, owner-level access, business ownership and technical ownership.

## Application overview

| Application | Purpose | Business owner | Technical owner |
|---|---|---|---|
| Ankkalinna CRM | Fictional customer relationship management application | Sales Owner | Application Management / Minni Hiiri |

The CRM is used for customer-related work.

In a real environment, a CRM system could contain customer data, contact history, sales notes, reporting information and personal data.

Application access should therefore have a clear business reason, owner and review process.

## Access groups

| Group | Access level | Purpose | Risk level |
|---|---|---|---|
| SG-App-CRM-Users | Standard user | Normal CRM access for business users | Medium |
| SG-App-CRM-Owners | Owner-level access | Application owner or admin-level access | High |

The groups represent different access levels.

A standard CRM user should not automatically have owner-level access.

Owner-level access is higher risk because it may allow wider visibility, configuration changes or access management inside the application.

{IMAGE 01: CRM access groups overview showing SG-App-CRM-Users and SG-App-CRM-Owners. Blur object IDs, tenant details and technical identifiers.}

## Current access model

| User | Role | CRM access | Reason |
|---|---|---|---|
| Hannu Hanhi | Sales Representative | SG-App-CRM-Users | Customer-related sales work |
| Roope Ankka | Head of Finance | SG-App-CRM-Users | CRM visibility for business reporting |
| Minni Hiiri | Application Owner | SG-App-CRM-Owners | Application ownership |

This model separates application users from application owners.

Using an application and owning an application are different responsibilities.

{IMAGE 02: CRM user group membership showing Hannu and Roope. Blur UPNs, object IDs and tenant details.}

{IMAGE 03: CRM owner group membership showing Minni. Blur UPNs, object IDs and tenant details.}

## Access level difference

Application access is not only yes or no.

The access level should define what the user can do inside the application.

| Access capability | Standard user | Owner-level access |
|---|---|---|
| View customer records | Possible | Possible |
| Edit customer records | Possible depending on role | Possible |
| Export reports | Possible depending on role | Possible |
| Change application settings | No | Possible |
| Manage application users | No | Possible |
| Approve CRM access | No | Possible depending on process |

If all access is hidden behind one vague “CRM access” group, the access model becomes difficult to govern.

The group name should show the access level.

The access level should match the user’s actual responsibility.

## Standard user access

`SG-App-CRM-Users` represents standard CRM user access.

Example members:

- Hannu Hanhi
- Roope Ankka

Hannu needs CRM access because he works in Sales.

Roope may need CRM visibility for finance-related reporting.

Neither user should receive owner-level access unless there is a separate business reason and approval.

## Owner-level access

`SG-App-CRM-Owners` represents owner-level CRM access.

Example member:

- Minni Hiiri

Owner-level access should be limited to users who actually own or administer the application.

The application owner may be responsible for:

- confirming who should receive CRM access
- helping with access reviews
- understanding what each CRM access level means
- identifying risky or unnecessary access
- maintaining the application access model

Owner access should represent responsibility, not just extra permissions.

## Example risk: wrong owner access

If Hannu Hanhi was accidentally added to `SG-App-CRM-Owners`, the issue would not only be a group membership mistake.

It would mean that a standard Sales user may have more control over the CRM application than needed.

| Risk area | Impact |
|---|---|
| Least privilege | Hannu would have more access than his role requires |
| Data protection | He could potentially access wider customer or reporting data |
| Governance | Owner-level access would no longer match business responsibility |
| Application control | He might be able to affect settings, users or access depending on what the group grants |

The problem is not Hannu as a person.

The problem is that the access model would allow the wrong level of access for his role.

## Review logic

A CRM access review should check both application need and access level.

| User | Access | Review question |
|---|---|---|
| Hannu Hanhi | SG-App-CRM-Users | Does Sales still need standard CRM access? |
| Roope Ankka | SG-App-CRM-Users | Does Finance still need CRM reporting visibility? |
| Minni Hiiri | SG-App-CRM-Owners | Is Minni still the CRM application owner? |

The review should not only ask:

> Does this user need CRM access?

It should also ask:

> Does this user need this level of CRM access?

## Ownership questions

Before application access is granted, these questions should be answered:

| Question | Purpose |
|---|---|
| Who owns the application? | Defines business responsibility |
| Who can approve standard user access? | Defines normal access approval |
| Who can approve owner-level access? | Defines high-risk access approval |
| What data does the application contain? | Defines sensitivity |
| What can each access level do? | Defines access impact |
| How often should access be reviewed? | Defines review cycle |
| Who removes access when a user changes role? | Defines cleanup responsibility |
| What evidence should be kept? | Defines audit and review support |

If these questions are unclear, the application access model is not ready to be trusted.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Users may receive the wrong level of application access |
| What control is being practised? | Application access modelling by role and responsibility |
| What access is being separated? | Standard CRM user access and owner-level CRM access |
| Who owns the access decision? | Sales Owner / CRM Application Owner |
| What evidence supports the model? | Access group list, membership view and documented access reason |
| What should happen if access is no longer valid? | Remove or adjust the application access group membership |

## Security note

Published screenshots should not expose tenant identifiers, user principal names, group object IDs, application IDs or other technical identifiers.

The documentation should show application access logic, not tenant details.

## Summary

This page defines a simple CRM access model with separate standard user and owner-level access.

The model supports clearer ownership, review and risk handling because each access level has a defined purpose.

The next page focuses on privileged access risk and why elevated access should be limited, justified and reviewed.
