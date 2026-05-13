# Security Groups

This page documents the first security groups created for my Microsoft Entra ID lab.

The lab is based on a fictional company called **Ankkalinna Oy**.

The goal is to practise group-based access management instead of giving permissions directly to individual users.

## Why security groups?

Security groups help keep access easier to manage.

Instead of giving access one user at a time, users can be added to groups based on their department, role or application need.

This makes access easier to:

- give
- remove
- review
- document
- troubleshoot later

For this first version, I used assigned membership.

Dynamic groups can be tested later, but I wanted to start with the basic model first.

## Group naming

I used a simple naming pattern: SG-[Area]-[Purpose]

example: 
SG-HR-Basic
SG-Finance-Leadership
SG-App-CRM-Users
SG-App-CRM-Owners

`SG` means security group.

The goal is that the group name should already give a basic idea of what the group is for.


## Groups created

| Group name | Purpose | Example member |
|---|---|---|
| SG-IT-Support-Basic | Basic access for IT support users | Aku Ankka |
| SG-HR-Basic | Basic access for HR users | Iines Ankka |
| SG-Finance-Basic | Basic access for finance users | Roope Ankka |
| SG-Finance-Leadership | Sensitive finance leadership access | Roope Ankka |
| SG-Security-Basic | Basic access for security users | Mikki Hiiri |
| SG-Sales-Basic | Basic access for sales users | Hannu Hanhi |
| SG-App-CRM-Users | Standard access to the fictional CRM application | Hannu Hanhi, Roope Ankka |
| SG-App-CRM-Owners | Owner-level access to the fictional CRM application | Minni Hiiri |
| SG-Privileged-Role-Eligible | Planning example for privileged access | Mikki Hiiri |


## Department groups

These groups are based on the user’s department or work area:

- `SG-IT-Support-Basic`
- `SG-HR-Basic`
- `SG-Finance-Basic`
- `SG-Security-Basic`
- `SG-Sales-Basic`

The idea is simple.

A user gets basic access based on the department where they work.

For example:

- Aku works in IT Support, so he belongs to `SG-IT-Support-Basic`
- Iines works in HR, so she belongs to `SG-HR-Basic`
- Hannu works in Sales, so he belongs to `SG-Sales-Basic`

This keeps access more structured than giving random permissions directly to each user.

## Leadership access

`SG-Finance-Leadership` is for finance leadership access.

Roope Ankka is Head of Finance, so he may need more sensitive finance access than a normal finance user.

This could mean access to finance reports, budget information or approval-related resources.

Important note:

Business leadership does not automatically mean technical admin access.

Roope can be important for finance decisions without being a Global Administrator.

That separation matters.



## Application access

I created two CRM-related groups:

- `SG-App-CRM-Users`
- `SG-App-CRM-Owners`

`SG-App-CRM-Users` is for people who use the fictional CRM application.

Example members:

- Hannu Hanhi
- Roope Ankka

`SG-App-CRM-Owners` is for the application owner.

Example member:

- Minni Hiiri

This separates normal users from application owners.

That helps later when practising access reviews, approvals and application ownership.



## Privileged access planning

`SG-Privileged-Role-Eligible` is used as a planning example for privileged access.

Mikki Hiiri works in Security, so he may need privileged access in some situations.

But privileged access should not be permanent by default.

It should be:

- controlled
- limited
- approved when needed
- reviewed afterwards

This group can be used later when learning Privileged Identity Management concepts.



## Screenshot: group membership example

Roope Ankka is Head of Finance.

He belongs to finance-related groups and CRM user access.

![Roope group membership](./Screenshots/04-roope-group-membership.png)



## What I learned

The main idea is that groups should have a clear purpose.

A group should not exist just because someone clicked “new group”.

Before creating a group, I should be able to answer:

- what is this group for?
- who should belong to it?
- what access does it represent?
- who owns or approves this access?
- how would this access be removed later?

