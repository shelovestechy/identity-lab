# 05 - Manual Access Review Simulation

This page documents a manual access review simulation in the Ankkalinna Entra ID lab.

The review checks whether members of a high-risk finance group still need access for their current role.

This is not an automated Microsoft Entra ID Governance access review.

The focus is the access decision, cleanup action and evidence.

## Review scope

| Group | Purpose | Risk level | Reviewer |
|---|---|---|---|
| SG-Finance-Basic | Basic finance access | High | Head of Finance / Finance Owner |

`SG-Finance-Basic` is a useful review target because finance access may expose sensitive business data.

Even basic finance access should have a clear business reason.

{IMAGE 01: SG-Finance-Basic group overview or membership page before review. Blur UPNs, object IDs and tenant details.}

## Review question

The review question:

> Does each member still need this access for their current role?

The review should confirm whether the access still matches the user’s current role, project or business need.

Access can be valid when granted and invalid later.

## Members before review

Before the review, `SG-Finance-Basic` had the following members:

| User | Current role | Initial review decision | Reason |
|---|---|---|---|
| Roope Ankka | Head of Finance | Keep | Current finance leadership role |
| Hannu Hanhi | Sales Representative | Remove | Temporary finance project access is no longer needed |

## Finding

Hannu Hanhi was still a member of `SG-Finance-Basic`.

Hannu currently works in Sales.

The Finance access was originally granted for a temporary reporting project, but the project is no longer active.

The access no longer matches Hannu’s current role.

## Review decision

| User | Decision | Action |
|---|---|---|
| Roope Ankka | Keep access | No change |
| Hannu Hanhi | Remove access | Remove from `SG-Finance-Basic` |

The decision is based on current business need.

Old history is not enough reason to keep access active.

## Cleanup action

Hannu Hanhi was removed from `SG-Finance-Basic`.

His normal Sales and CRM access remained unchanged.

| User | Access after cleanup |
|---|---|
| Hannu Hanhi | SG-Sales-Basic, SG-App-CRM-Users |
| Roope Ankka | SG-Finance-Basic, SG-Finance-Leadership, SG-App-CRM-Users |

{IMAGE 02: Hannu removed from SG-Finance-Basic or updated membership view. Blur UPNs, object IDs and tenant details.}

{IMAGE 03: SG-Finance-Basic membership after cleanup, showing Roope only or cleaned membership state. Blur UPNs, object IDs and tenant details.}

## Evidence

| Evidence | Purpose |
|---|---|
| Group membership before review | Shows the original access state |
| Review decision table | Shows who was reviewed and what decision was made |
| Cleanup action | Shows that unnecessary access was removed |
| Group membership after cleanup | Shows the final access state |
| Written reason | Explains why access was kept or removed |

The evidence should show what was reviewed, what decision was made and what changed after the review.

## Control view

| Control question | Answer in this lab |
|---|---|
| What risk is this addressing? | Users may keep access that no longer matches their current role |
| What control is being practised? | Manual access review and cleanup |
| What access was reviewed? | `SG-Finance-Basic` membership |
| Who owns the review decision? | Head of Finance / Finance Owner |
| What evidence supports the control? | Before membership, review decision and after membership |
| What should happen if access is no longer valid? | Remove the user from the group |

## Security note

Published screenshots should not expose tenant identifiers, user principal names, group object IDs or other technical identifiers.

The evidence should show the review and cleanup logic, not tenant details.

## Summary

This review identified Finance access that no longer matched Hannu Hanhi’s current Sales role.

The cleanup removed unnecessary access and restored the group membership to match current business need.

The next page focuses on application access modelling and separating standard users, owners and sensitive application access.
