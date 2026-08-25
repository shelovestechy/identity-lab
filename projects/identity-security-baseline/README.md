# Identity Security Baseline

## What I wanted to understand

Microsoft Entra ID has many security settings. I wanted to step back from the portal and think about the bigger question:

**What should an identity security baseline actually protect?**

Creating a policy is not the same as proving that it works. A policy can look very professional and still block the wrong people. A Conditional Access policy that locks out every administrator is very secure, but not especially useful.

## The Ankkalinna case

Mikki Hiiri works as a Security Specialist at Ankkalinna Identity Lab Oy. His normal account is used for email and daily work. Some security tasks may need elevated access.

I do not think Mikki should have permanent broad admin rights just because the word “Security” appears in his job title. Normal work and privileged work should be separated.

The environment also has standard users, applications, guests and an emergency access account. They do not all have the same risk.

## What looks risky to me

| Risk | What I would consider |
| :--- | :--- |
| A stolen password is enough to sign in | MFA for normal users |
| An admin account is compromised | Stronger authentication, separate admin account and limited role activation |
| Old authentication methods are still accepted | Blocking legacy authentication after checking sign-in logs |
| A new policy affects too many users | Report-only mode and a small pilot group |
| Administrators are locked out | Emergency access accounts and a rollback plan |
| Nobody notices a sensitive change | Monitoring role, policy and application consent changes |

## How I would introduce Conditional Access

I would not start by enabling five policies for everyone on Friday afternoon.

My safer order would be:

1. define the risk and expected result
2. check exclusions and emergency access
3. use report-only mode
4. test with fictional pilot users
5. review sign-in logs
6. check user and Service Desk impact
7. decide whether to enforce, change or stop the policy
8. keep a rollback action and owner ready

## What surprised me

At first, Conditional Access looked mainly like a technical configuration topic. The more I studied it, the more it looked like change management as well.

The policy can affect authentication, old applications, administrators, users and Service Desk at the same time. The portal setting is only one part of the work.

## Where I am now

- I have documented the baseline and main risks.
- I have designed Conditional Access, privileged access and emergency access scenarios.
- I have not published a real report-only result or PIM activation result.
- I still need a suitable lab and licensing for some of the hands-on evidence.

## What I want to test next

I want to test one Conditional Access policy properly and document:

- what I expected
- what happened in the sign-in log
- whether the result matched the plan
- what could have gone wrong
- what I would decide before enforcement

## Supporting notes

- [Original Zero Trust baseline](../../archive/iam-projects/entra-zero-trust-baseline/)
- [Conditional Access control design](../../archive/entra-lab/10-conditional-access-control-design.md)
- [Privileged access risk model](../../archive/entra-lab/07-privileged-access-risk-model.md)

## My takeaway

Identity security is not only about adding stronger controls. The controls also need a purpose, an owner, a safe rollout and evidence that they work as expected.
