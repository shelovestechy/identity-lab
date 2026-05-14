# Application Access Model: Ankkalinna CRM

This page documents a simple application access model for the fictional **Ankkalinna CRM** application in my Entra lab.

The point is not only to give users access to an application.

The point is to separate access levels and understand who should use the application, who should own it and what risk appears if the wrong person gets the wrong role.

## Application

| Application | Purpose | Business owner | Technical owner |
|---|---|---|---|
| Ankkalinna CRM | Fictional customer relationship management application | Sales Owner | Application Management / Minni Hiiri |

The CRM is used for customer-related work.

In a real environment, a CRM system could contain customer data, contact history, sales notes, reporting information and sometimes personal data.

That means access should not be treated as “just another app”.

## Access groups

| Group | Access level | Purpose | Risk level |
|---|---|---|---|
| SG-App-CRM-Users | Standard user | Normal CRM access for business users | Medium |
| SG-App-CRM-Owners | Owner / admin-level access | Application owner or admin-level access | High |

The groups should not mean the same thing.

A normal CRM user should not automatically have owner-level access.

Owner-level access should be limited because it may allow wider visibility, configuration changes or access management inside the application.

## Current model

| User | Role | CRM access |
|---|---|---|
| Hannu Hanhi | Sales Representative | SG-App-CRM-Users |
| Roope Ankka | Head of Finance | SG-App-CRM-Users |
| Minni Hiiri | Application Owner | SG-App-CRM-Owners |

![CRM access groups](./Screenshots/14-crm-access-groups.png)

## Why access levels matter

Application access is not only yes or no.

The important question is:

> What can the user do inside the application?

There is a big difference between:

- viewing customer records
- editing customer records
- exporting reports
- changing application settings
- managing other users
- approving access to the application

If all of this is hidden behind one vague “CRM access” group, the access model is weak.

The group name should tell something about the access level.

The access level should match the user’s actual role.

## Owner access

`SG-App-CRM-Owners` is high risk because it represents more control over the application.

This access should be limited to users who actually own or administer the application.

In this lab, Minni Hiiri is the application owner.

That means she can be responsible for:

- understanding what CRM access means
- confirming who should get CRM access
- helping with access reviews
- identifying risky or unnecessary access
- owning the application access model

The owner role should not be handed out only because someone is “good with the system”.

Owner access should mean responsibility, not just extra power.

## Example risk: wrong owner access

If Hannu Hanhi was accidentally added to `SG-App-CRM-Owners`, the issue would not only be a group membership mistake.

It could mean that a standard Sales user has more control over the CRM application than needed.

Depending on what the owner group grants, he might be able to see more data, change settings or affect other users.

That would increase both security and data protection risk.

## Review logic

A CRM access review should not only ask:

> Does this user need CRM access?

It should ask:

> Does this user need this level of CRM access?

Example review logic:

| User | Access | Review question |
|---|---|---|
| Hannu Hanhi | SG-App-CRM-Users | Does Sales still need standard CRM access? |
| Roope Ankka | SG-App-CRM-Users | Does Finance still need CRM reporting access? |
| Minni Hiiri | SG-App-CRM-Owners | Is Minni still the application owner? |

This keeps the review focused on access level, not only application name.

## Practical takeaway

Application access should be modelled by role and responsibility.

A standard user group and an owner group should not be treated as the same risk.

The stronger the access level, the clearer the ownership and review need should be.

A vague “app access” group is easy to create, but hard to govern later.
