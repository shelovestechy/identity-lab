# Security Governance: ISO 27001 and NIS2

**Current form:** applied governance analysis through an IAM lens

## Purpose

This project explores how information security expectations become practical identity controls.

The goal is not to reproduce a standard, claim certification expertise or provide legal advice. The goal is to demonstrate my understanding of the chain:

**risk → control → owner → implementation → evidence → review**

ISO/IEC 27001 provides a risk-based information security management system perspective. NIS2 sets cybersecurity risk-management expectations for organizations in scope and explicitly connects cybersecurity with areas such as access control, human resources security and identity and access management.

## Fictional scenario

Ankkalinna Identity Lab Oy needs to improve its identity security governance. The organization can configure users and groups, but it cannot consistently demonstrate:

- who owns sensitive access
- whether access still matches business need
- how privileged identities are protected
- how supplier and external access is reviewed
- what evidence proves that identity controls operate as intended

## Applied control mapping

This is my practical interpretation of selected security themes, not a formal compliance mapping.

| Identity risk | Security governance expectation | IAM control | Suggested owner | Reviewable evidence |
| :--- | :--- | :--- | :--- | :--- |
| Departed user remains active | Access must follow the identity lifecycle | Leaver trigger, account disablement, session revocation and entitlement removal | HR + IAM | Source event, completion time and final access state |
| User retains old departmental access | Access should remain justified and risk-based | Mover review and periodic access review | Manager or business owner | Before/after membership and review decision |
| Privileged account is compromised | High-impact access needs stronger protection | Separate admin identity, strong MFA, limited activation and monitoring | Security + IAM | Role assignment, activation and alert evidence |
| Nobody owns a sensitive group | Accountability must be defined | Named owner, risk classification and review interval | System or data owner | Ownership record and completed review history |
| Supplier access remains after a contract ends | Third-party access needs lifecycle control | Sponsor, expiry, restricted scope and external-user review | Contract owner + system owner | Sponsor, expiry date and review outcome |
| Weak sign-in method bypasses modern controls | Authentication controls should match risk | MFA and legacy authentication blocking | Security | Conditional Access and sign-in log result |
| Access change cannot be reconstructed | Controls need evidence and traceability | Request, approval, implementation and review records | Control owner | End-to-end audit trail |
| Identity incident is detected but ownership is unclear | Incidents need response roles and usable logs | Identity monitoring, escalation path and retained logs | Security operations | Alert, investigation record and response timeline |

## ISO/IEC 27001 perspective

The value of ISO/IEC 27001 for this portfolio is the management-system mindset:

- identify information security risks in organizational context
- select proportionate controls
- define roles and responsibilities
- retain evidence
- review effectiveness
- improve when controls or circumstances change

For IAM, this means that buying or configuring an identity tool is not the same as managing identity risk. The process, owner, evidence and improvement cycle matter as much as the technical setting.

## NIS2 perspective

NIS2 strengthens the connection between cybersecurity risk management and organizational responsibility. From an IAM perspective, relevant themes include:

- access control policies
- identity and access management
- human resources security
- strong authentication where appropriate
- supply-chain and service-provider risk
- incident handling and business continuity
- management accountability and security awareness

The practical question is not only whether a policy exists. It is whether an organization can show that access is controlled, monitored, reviewed and corrected.

## Example evidence pack

A single access-control test could contain:

1. defined risk and control objective
2. named control owner
3. expected identity state
4. sanitized technical output
5. reviewer decision
6. remediation or accepted exception
7. next review date

This structure connects technical IAM work with the type of accountability and evidence that security governance needs.

## Sources used for the interpretation

- [ISO/IEC 27001:2022 overview](https://www.iso.org/standard/27001)
- [NIS2 Directive (EU) 2022/2555](https://eur-lex.europa.eu/eli/dir/2022/2555/oj)
- [ENISA NIS2 Technical Implementation Guidance](https://www.enisa.europa.eu/publications/nis2-technical-implementation-guidance)

## Supporting learning material

- [ISO/IEC 27001 practical view](../../archive/governance-compliance/iso-27001.md)
- [NIS2 practical view](../../archive/governance-compliance/nis2.md)
- [Finnish cybersecurity regulation](../../archive/governance-compliance/finnish-cybersecurity-regulation.md)
- [GDPR practical view](../../archive/governance-compliance/gdpr.md)
- [Audit evidence](../../archive/governance-compliance/audit-evidence.md)

## Next practical milestone

Select one identity risk from the mapping and create a compact control test with fictional data, a sanitized result and a review decision. This would show not only understanding of security governance, but the ability to connect it with technical evidence.

## What this project demonstrates

This project demonstrates that I see IAM as part of information security governance: technical access must be risk-based, owned, reviewable and supported by evidence.
