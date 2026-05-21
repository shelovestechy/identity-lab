# 01 - The Setup

This page documents the starting point of my Microsoft Entra ID lab.

The lab environment is built for practising Identity and Access Management without using real company data, real users or production systems.

The fictional company used in this lab is **Ankkalinna Identity Lab Oy**.

Fictional users make the lab safe to document publicly while still allowing realistic access scenarios.

## Initial setup

For the first setup, I created:

- an Azure free account
- a Microsoft Entra tenant
- a fictional tenant display name: **Ankkalinna**
- test users for different departments
- security groups for basic access modelling
- a GitHub documentation structure for the lab

The setup is intentionally simple.

It creates a base that can later be expanded into access reviews, lifecycle scenarios, application access, privileged access, Conditional Access and validation work.

## Lab users

The first users represent different business areas and access needs.

| User | Department | Role |
|---|---|---|
| Aku Ankka | IT Support | Support Specialist |
| Iines Ankka | HR | HR Specialist |
| Roope Ankka | Finance | Head of Finance |
| Mikki Hiiri | Security | Security Specialist |
| Minni Hiiri | Application Management | Application Owner |
| Hannu Hanhi | Sales | Sales Representative |

These users give the lab a small company structure.

Roope needs finance-related access, but that does not mean he should have technical admin rights.

Mikki is useful for privileged access examples because security-related work may require controlled elevated access.

Hannu is useful for role creep examples because he can be used to show how access can accumulate over time if role changes are not reviewed properly.

## Setup actions

| Step | Action | Purpose |
|---|---|---|
| 1 | Created an Azure free account | Lab subscription base |
| 2 | Opened Microsoft Entra admin center | Tenant administration |
| 3 | Checked tenant overview | Confirmed tenant context |
| 4 | Changed tenant display name to Ankkalinna | Fictional lab identity |
| 5 | Created fictional test users | User base for IAM scenarios |
| 6 | Created first security groups | Base for group-based access modelling |
| 7 | Started GitHub documentation | Public portfolio documentation |
| 8 | Planned the lab path | Structure for practical IAM scenarios |

{IMAGE 01: Azure budget alert with subscription identifiers blurred}

{IMAGE 02: Microsoft Entra tenant overview with tenant ID and technical identifiers blurred}

{IMAGE 03: Test user creation example with UPN, domain and password fields blurred}

{IMAGE 04: Users overview showing fictional lab users, with user principal names blurred}

## Safe documentation boundaries

Real tenant identifiers, subscription identifiers, object IDs, user principal names and other technical details are not published in this repository.

Screenshots are reviewed and blurred before publishing.

The documentation should show the IAM logic, not expose tenant details.

## Lab purpose

This setup creates a safe base for modelling practical IAM scenarios, including:

- group-based access
- joiner, mover and leaver lifecycle events
- application access
- privileged access
- access reviews
- role creep
- approval and ownership logic
- validation evidence

## Summary

This first setup establishes the lab environment, fictional company, test users and documentation structure.

The next page continues with security groups, naming logic and initial memberships.
