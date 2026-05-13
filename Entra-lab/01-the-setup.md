# The Setup

This is the starting point of my Microsoft Entra ID lab.

I wanted to build a small test environment where I can practise identity and access management without touching any real company data or production systems.

The lab is based on a fictional company called **Ankkalinna Identity Lab Oy**.

Why Ankkalinna? Because learning is easier when the lab does not feel like boring corporate sandpaper. Also, fictional users make it safer to document the work publicly.

## What I started with

For the first setup, I created:

- an Azure free account
- a Microsoft Entra tenant
- a fictional tenant display name: **Ankkalinna**
- test users for different departments
- security groups for basic access modelling
- screenshots for documentation

The goal was not to build a perfect enterprise environment on day one.

The goal was to create a simple base that I can expand later.

---

## Lab idea

The lab uses fictional users, departments and roles.

This helps me practise questions like:

- who needs access?
- why do they need it?
- what group should give that access?
- who owns the access?
- what happens when someone changes role?
- how can old access be removed?

I do not want to only learn where buttons are in the portal.

I want to understand the thinking behind access management.

---

The actual technical tenant details are not published in GitHub.

---

## Test users

The first users are fictional characters with different work roles.

| User | Department | Role |
|---|---|---|
| Aku Ankka | IT Support | Support Specialist |
| Iines Ankka | HR | HR Specialist |
| Roope Ankka | Finance | Head of Finance |
| Mikki Hiiri | Security | Security Specialist |
| Minni Hiiri | Application Management | Application Owner |
| Hannu Hanhi | Sales | Sales Representative |

These users give the lab a simple company structure.

For example, Roope needs finance-related access, but that does not mean he should have technical admin rights.

Mikki works with security, so he is a good test user for future privileged access examples.

Hannu is useful for future role creep cases, because every company has someone who somehow collects extra access over time.

---

## First setup steps

This is what I did first:

1. Created/opened an Azure free account
2. Opened Microsoft Entra admin center
3. Checked the tenant overview
4. Changed the tenant display name to Ankkalinna
5. Created fictional test users
6. Created the first security groups
7. Took screenshots while building the lab
8. Started documenting the setup in GitHub

---

## Why this matters

This setup gives me a safe base for learning IAM.

Instead of randomly creating users and groups, I can build small cases around real IAM problems:

- joiner, mover and leaver process
- group-based access
- application access
- privileged access
- access reviews
- role creep
- approval flows

This is only the first step, but now the lab has a structure.

---

## Next pages

More detailed notes will be added to separate pages.

Planned pages:

- security groups and naming
- user and group membership
- access model
- application access example
- privileged access planning
- role creep case
