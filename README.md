# 🔐 Identity Lab

## Service Desk → IAM and identity security

**My goal is to move from Service Desk L1/L2 work toward IAM and identity security.**

I work with user accounts, access problems and Microsoft 365 questions in Service Desk. Many of these appear first as simple tickets but I want to understand what happens behind the ticket.

Who should approve the access? Who owns it? When should it be removed? What happens when nobody remembers the temporary access six months later?

I build these projects outside working hours because IAM and identity security genuinely interest me. I am not presenting this as production IAM engineering experience. This is where I practise, document my thinking and slowly make the work more technical.

## 🏰 Ankkalinna Identity Lab Oy

The lab uses a fictional company called **Ankkalinna Identity Lab Oy**. (Yes, I’m a huge fan—no shame! 🦆)

Aku Ankka, Iines Ankka, Roope Ankka, Mikki Hiiri, Minni Hiiri and Hannu Hanhi have different roles and access needs. The users are fictional. The identity problems are unfortunately quite realistic.

Using the same company and people helps me connect the projects instead of creating a new random example every time.

## 🧪 Featured projects

| Project | What I am trying to understand |
| :--- | :--- |
| [Identity Security Baseline](./projects/identity-security-baseline/) | How to protect normal and privileged identities without creating a policy that ruins everybody's Monday morning |
| [Access Governance and Audit](./projects/access-governance-and-audit/) | Who has access, why they have it and whether somebody remembers to remove it |
| [Identity Continuity and Architecture](./projects/identity-continuity-and-architecture/) | How the same person stays the same identity when names, systems or organizations change |
| [Security Governance: ISO 27001 and NIS2](./projects/security-governance-iso27001-nis2/) | How security requirements become practical IAM controls, owners and evidence |

## 💻 What I am working on now

I am learning PowerShell and using fictional CSV data to compare expected and current access. The first script is part of the [Access Governance and Audit](./projects/access-governance-and-audit/) project.

I have not worked with Microsoft Graph yet. I do not currently have a good environment for practising it, so I decided to build the comparison logic locally first. Graph can become another data source later.

## What you will find here

- Microsoft Entra ID and identity security design
- access ownership, role creep and access review thinking
- practical identity continuity notes from a Service Desk point of view
- ISO/IEC 27001 and NIS2 through an IAM lens
- a small PowerShell exercise using fictional Ankkalinna data
- honest notes about what I have tested and what is still only a plan

## 📁 Learning archive

The earlier lab path and longer notes are still available in the [`archive/`](./archive/).

I did not want the front page to become a warehouse, but I also did not want to hide the learning history. Recruiters can start with the four projects. Curious people can continue into the archive. Very curious people have been warned.

## 🎯 Current direction

My goal is to move from Service Desk L1/L2 work toward IAM and identity security.

I am especially interested in the point where technical identity systems, security, business ownership and practical support work meet. This repository is my way of learning that work step by step outside my normal working hours.
