# Microsoft Entra ID Zero Trust Baseline

## Overview

This project is part of my Identity Lab portfolio.

The goal of this case study is to design a Microsoft Entra ID baseline for a simulated mid-sized organization using Zero Trust and least privilege principles.

The baseline focuses on:

* Strong authentication
* Conditional Access
* Privileged access management
* User lifecycle management
* Guest access governance
* Group and application governance
* Monitoring and alerting

This is a lab-based design case study, not a production implementation. The repository documents the proposed baseline and related simulations; it does not currently include enough technical evidence to present every control below as implemented.

## Business Problem

Many organizations have identity environments that have grown over time without a clear governance model.

Common problems include:

* Too many users with permanent admin access
* Manual Joiner, Mover and Leaver processes
* Weak authentication methods
* Legacy authentication still allowed
* Guest users without proper lifecycle control
* Applications with excessive permissions
* Limited visibility into privileged activity

These issues increase security risks, create manual work for Service Desk and make access harder to audit.

From an IAM point of view, the main risk is that access is often granted quickly but removed slowly. Over time this creates privilege creep.

## Project Goal

The goal of this project is to create an IAM baseline that answers these questions:

* Who has access?
* Why do they have access?
* Is the access still needed?
* Is the access protected properly?
* Can privileged access be monitored and controlled?

## Scope

### Documented or simulated in this portfolio

* A fictional Microsoft Entra ID tenant structure
* User and group access model
* Conditional Access baseline design
* Dynamic group design considerations
* Privileged Identity Management model
* Admin role protection model
* Guest access governance model
* Application permission review concept
* Monitoring and alerting scenarios

### Not yet evidenced as implemented

* Full HR-driven lifecycle automation
* Access reviews
* Entitlement management and access packages
* Microsoft Sentinel integration
* Production-level reporting and alerting
* Dynamic groups, PIM and Conditional Access results with sanitized configuration evidence

## Architecture

### Identity Flow

HR or source system → Microsoft Entra ID → Users, groups and applications

Microsoft Entra ID acts as the central identity platform. The long-term goal is to move towards HR-driven lifecycle management where the HR system is the source of truth for user identity data.

## Security Layers

### 1. Identity

Employees, administrators, guest users, service accounts and workload identities.

The goal is to understand what identities exist and what they are used for.

### 2. Authentication

MFA, phishing-resistant MFA, passwordless options and blocking weak sign-in methods.

Authentication is one of the most important security layers because identity is often the first target in attacks.

### 3. Access Control

Conditional Access, group-based access, role-based access and application access.

The goal is to make sure users get the access they need, not more.

### 4. Governance

Lifecycle management, access reviews, group ownership, guest reviews and application permission reviews.

Governance keeps the environment clean after the first implementation.

## Key Controls

## Authentication and MFA

MFA is required for all users.

Administrators should use stronger authentication methods such as:

* FIDO2 security keys
* Passkeys
* Windows Hello for Business

Admin accounts are high-value targets. Password-only authentication is not enough for privileged roles.

## Legacy Authentication

Legacy authentication should be blocked.

Legacy protocols do not support modern security controls in the same way as modern authentication. If legacy authentication is allowed, it can become a weak point in the environment.

Before blocking legacy authentication in production, sign-in logs should be reviewed to find old applications or devices that may still use legacy protocols.

## Conditional Access

The baseline includes the following Conditional Access policies:

* Block legacy authentication
* Require MFA for all users
* Require phishing-resistant MFA for administrator roles
* Block high-risk sign-ins
* Require compliant devices for sensitive applications
* Protect admin portals with stricter controls

Conditional Access supports Zero Trust because every sign-in is evaluated based on risk, identity, device, location and application.

Example policy naming:

* CA001 - Block legacy authentication
* CA002 - Require MFA for all users
* CA003 - Require phishing-resistant MFA for admins
* CA004 - Block high-risk sign-ins
* CA005 - Require compliant device for sensitive apps

## Break-Glass Accounts

Break-glass accounts are emergency admin accounts.

Baseline requirements:

* Minimum two break-glass accounts
* Cloud-only accounts
* Excluded from Conditional Access policies
* Strong passwords
* Stored securely
* Not used for daily administration
* Sign-in activity must be monitored and alerted

Break-glass accounts are powerful and risky if they are not monitored. If a break-glass account signs in, someone should know immediately.

## Privileged Identity Management

Privileged Identity Management is used to reduce standing admin privileges.

Instead of permanent admin access, privileged roles should be activated only when needed.

Role activation should require:

* MFA
* Justification
* Approval for highly privileged roles
* Limited activation duration
* Alerts for privileged role activation

Critical roles:

* Global Administrator
* Privileged Role Administrator
* Security Administrator
* Conditional Access Administrator
* Authentication Administrator

Global Administrator should be used as little as possible. More specific roles should be used when possible.

## User Lifecycle Management

The user lifecycle follows the JML model:

* Joiner
* Mover
* Leaver

Lifecycle management is the foundation of IAM. If this process is weak, access becomes messy and risky over time.

### Joiner

When a new user joins:

* User account is created
* Correct groups are assigned
* Licenses are assigned
* Basic access is granted based on role
* MFA registration is required

### Mover

When a user changes role or department:

* Old access is reviewed
* New access is assigned based on the new role
* Unnecessary access is removed
* Privileged access is reviewed separately

### Leaver

When a user leaves:

* Account is disabled
* Sessions are revoked
* Group memberships are removed
* Licenses are removed or reclaimed
* Mailbox and OneDrive handling follows company policy
* Privileged roles are removed immediately

The leaver process is security-critical. A user leaving the organization should not keep access because the removal process is manual or unclear.

## Group Governance

Groups are used to manage access in a scalable way.

Baseline rules:

* Every group must have an owner
* Important access groups should have at least two owners
* Naming standards should be used
* Dynamic groups should be used where possible
* Group purpose should be documented

Example group names:

* GRP-HR-Users
* GRP-FIN-Users
* GRP-IT-Admins
* APP-Salesforce-Users
* APP-SharePoint-Finance-Read

Bad group governance creates confusion fast. If nobody knows what a group does, who owns it or why users are members, the group becomes a risk.

## Guest Access Governance

Guest users need lifecycle governance.

Baseline controls:

* Restrict who can invite guest users
* Require MFA for guests
* Assign guest access through groups where possible
* Use access reviews for external users
* Remove stale guest accounts
* Avoid direct access without clear ownership

Guest accounts are often forgotten. A guest may be invited for a short project but the account can stay active for years if nobody reviews it.

## Application Governance

Applications and service principals are included in the baseline review.

Application governance checks:

* Does the application have an owner?
* Are API permissions required and justified?
* Are admin consents documented?
* Are unused applications removed?
* Are service principals reviewed?
* Are secrets and certificates monitored?

Applications can be a major identity risk. User accounts are not the only identities that need governance. Applications, service principals and workload identities also need control.

## Monitoring and Alerts

Monitoring is needed because IAM controls are not enough if nobody sees when something changes.

The baseline includes monitoring for:

* Global Administrator changes
* Privileged role activations
* Conditional Access policy changes
* High-risk sign-ins
* Break-glass account sign-ins
* New app consent grants
* Guest user activity
* Failed sign-in spikes

The goal is to alert on identity events that could indicate account compromise, privilege abuse or risky configuration changes.

## Risk and Control Mapping

| Risk                              | Baseline control                     |
| --------------------------------- | ------------------------------------ |
| Password-only authentication      | MFA for all users                    |
| Admin account compromise          | Phishing-resistant MFA for admins    |
| Permanent admin rights            | PIM and Just-in-Time access          |
| Legacy protocol attacks           | Block legacy authentication          |
| Stale guest accounts              | Guest lifecycle reviews              |
| Excessive group access            | Group ownership and naming standards |
| Privilege creep                   | JML model and access reviews         |
| Excessive application permissions | Application permission review        |
| No visibility into admin actions  | Monitoring and alerts                |
| Emergency lockout                 | Break-glass accounts                 |

## Security Principles Applied

### Least Privilege

Users, administrators, guests and applications should only have the access they need.

### Zero Trust

Access is not trusted automatically. Sign-ins are evaluated based on identity, risk, device, location and application.

### Identity-First Security

Identity is one of the most important security layers in modern cloud environments.

### Automation Over Manual Work

Manual access management creates delays, mistakes and inconsistent results. Automation improves security, supports Service Desk and makes access easier to audit.

## Deliverables

This project includes:

* IAM baseline design
* Conditional Access policy model
* PIM role activation model
* JML lifecycle model
* Guest access governance model
* Group governance standard
* Application governance checklist
* Monitoring and alerting checklist
* Risk and control mapping

## Key Learnings

This project helped me understand that IAM is not only technical.

A good IAM baseline needs both technical controls and business understanding. Users need access to do their work, but access must be controlled, reviewed and removed when it is no longer needed.

Main learning points:

* Identity lifecycle is the foundation of IAM
* Conditional Access is one of the strongest controls in Microsoft Entra ID
* Privileged access should be temporary, not permanent
* Guest users and applications need governance too
* Service Desk workload can be reduced with clear lifecycle and access processes
* Good naming standards and documentation make IAM easier to manage
* IAM decisions should be based on risk, not only convenience

## Future Improvements

Next improvements:

* Implement full Microsoft Entra ID Governance features
* Create access packages for common business roles
* Automate Joiner, Mover and Leaver processes from HR data
* Use access reviews for guests and high-risk groups
* Integrate identity logs with Microsoft Sentinel
* Create dashboards for privileged access and risky sign-ins
* Improve workload identity governance
* Document a full role-based access model for departments and applications

## Conclusion

This project demonstrates my current design thinking about how a Microsoft Entra ID IAM baseline could improve security and reduce manual work.

The solution focuses on strong authentication, Conditional Access, privileged access management, lifecycle governance and monitoring.

A good IAM baseline does not only protect user accounts. It creates structure, reduces confusion and helps the organization answer one important question:

Who has access, why do they have it and is it still needed?

The case study gives me a structured baseline for future hands-on validation and deeper IAM learning.
