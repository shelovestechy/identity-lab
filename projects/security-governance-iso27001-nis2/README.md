# Security Governance: ISO 27001 and NIS2

## Why this interests me

When I first started reading about ISO/IEC 27001, I expected mostly policies, formal documents and words that sound important in meetings.

What interests me more is the evidence question:

**If we say access is controlled and reviewed, how do we prove that it actually happens?**

I am not trying to turn this repository into a compliance consultancy. I want to understand what ISO/IEC 27001 and NIS2 mean for normal identity and access work.

## The Ankkalinna problem

Ankkalinna Identity Lab Oy can create users and groups, but the company cannot always answer:

- Who owns sensitive access?
- Does the access still match the person's work?
- How are admin accounts protected?
- Who reviews supplier and guest access?
- What evidence proves that a control works?

Having a policy that says “access is reviewed regularly” is a good start. Knowing who reviewed it, what they decided and what changed is better.

## How I connect security governance with IAM

My current way of thinking is:

**risk → control → owner → evidence → review**

| Identity risk | IAM control | Who should be involved? | Evidence I would expect |
| :--- | :--- | :--- | :--- |
| A leaver account stays active | Disable the account, revoke sessions and remove access | HR + IAM | Source event, completion time and final account state |
| Hannu keeps old Finance access | Mover review and access review | Manager or Finance owner | Before/after membership and review decision |
| Mikki's admin account is compromised | Separate admin identity, strong MFA and limited activation | Security + IAM | Role assignment, activation and sign-in evidence |
| A sensitive group has no owner | Named owner and review interval | System or data owner | Ownership record and completed review |
| Supplier access stays after the contract | Sponsor, expiry date and external-user review | Contract owner + system owner | Sponsor, expiry and review result |
| Old authentication bypasses MFA | Block legacy authentication after checking dependencies | Security | Conditional Access and sign-in log result |
| An access change cannot be explained later | Request, approval and implementation records | Control owner | A complete audit trail |

“Nobody owns it” is not a control, even if everybody agrees that somebody probably should.

## What ISO/IEC 27001 adds to my thinking

I see ISO/IEC 27001 mainly as a risk and management-system view:

- understand the organization and its risks
- choose controls that match those risks
- define responsibilities
- keep evidence
- review whether the controls work
- improve when something changes or fails

For IAM, this means that buying an identity tool does not automatically solve identity risk. The process, owner and evidence still matter.

## What NIS2 adds to my thinking

The NIS2 topics that connect clearly with IAM include:

- access control
- identity and access management
- human resources security
- strong authentication
- supplier and service-provider risk
- incident handling
- business continuity
- management responsibility

My practical question is not only “Do we have a policy?” It is also “Can we show what happens when the policy meets a real user account?”

## A small evidence pack I would understand

For one access control, I would document:

1. the risk
2. the expected result
3. the control owner
4. a sanitized technical result
5. the review decision
6. any correction or accepted exception
7. the next review date

This is still a learning model, but it helps me connect formal security requirements with practical IAM work.

## What I am still learning

- how organizations choose and document control owners in practice
- how evidence is collected without creating unnecessary manual work
- how ISO/IEC 27001 controls are scoped for different organizations
- how NIS2 requirements are implemented and supervised in real environments

## Sources

- [ISO/IEC 27001:2022 overview](https://www.iso.org/standard/27001)
- [NIS2 Directive (EU) 2022/2555](https://eur-lex.europa.eu/eli/dir/2022/2555/oj)
- [ENISA NIS2 Technical Implementation Guidance](https://www.enisa.europa.eu/publications/nis2-technical-implementation-guidance)

## Supporting notes

- [ISO/IEC 27001 practical view](../../archive/governance-compliance/iso-27001.md)
- [NIS2 practical view](../../archive/governance-compliance/nis2.md)
- [Finnish cybersecurity regulation](../../archive/governance-compliance/finnish-cybersecurity-regulation.md)
- [GDPR practical view](../../archive/governance-compliance/gdpr.md)
- [Audit evidence](../../archive/governance-compliance/audit-evidence.md)

## My takeaway

IAM controls should not only exist. Somebody should own them, somebody should review them and the organization should be able to show what happened.
