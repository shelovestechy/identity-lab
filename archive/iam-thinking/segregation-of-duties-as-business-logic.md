# IAM Thinking Case: Segregation of Duties as Business Logic

## Case

A company has several systems that support daily business operations.

Different teams use these systems to create records, update information, approve requests, handle payments, manage users and report business data.

At first, access is mostly reviewed system by system.

One user has access to the finance system.  
Another user has access to supplier data.  
A manager has approval rights.  
An admin can create or modify users.  

Individually, each access right may look reasonable.

The problem appears when the access rights are combined.

A single permission may not be dangerous by itself.  
But two or three permissions together can create a risky chain of actions.

That is where segregation of duties becomes important.

## What this shows

Segregation of duties is often treated like a compliance requirement.

Something that needs to exist because audit, policy or regulation says so.

But in practice, segregation of duties is business logic.

It is about understanding which actions should not be performed by the same person from start to finish.

The point is not to make work difficult.

The point is to prevent one person from having too much control over a sensitive business process without independent review.

For example, the risk is not only that a user has access to a system.

The real question is:

What can this person do when their access rights are combined?

## Example situation

A user works with supplier information and invoice handling.

They have access to create or edit supplier records. They also have access to approve invoices or payment-related actions.

On paper, both access rights may have been approved separately.

The supplier access was approved because the user helps maintain vendor data.  
The invoice approval access was approved because the user supports finance operations.

Both decisions may make sense when viewed alone.

But together, they create a bigger risk.

The same person could potentially:

- create or modify a supplier
- change payment information
- approve an invoice
- influence payment flow

Even if the user never misuses the access, the control model is weak.

The issue is not personal trust.

The issue is that the process allows one person to control too many steps in the same business chain.

## Why this matters for the business

Segregation of duties protects the business from fraud, mistakes and uncontrolled changes.

It creates checks and balances inside important processes.

In finance, this can mean separating supplier creation from payment approval.

In HR, this can mean separating employee record changes from salary approval.

In IT, this can mean separating user creation from privilege approval.

In customer data systems, this can mean separating data modification from final validation or reporting.

The business impact can be serious if these controls are weak.

Incorrect payments may go through.  
Sensitive data may be changed without proper review.  
Reports may become unreliable.  
A mistake may be harder to catch.  
A malicious action may be easier to hide.

This is why segregation of duties should not be treated as decorative compliance language.

It is a practical way to protect business processes.

## Why this matters at the practical level

At the ground level, segregation of duties can be difficult to see.

Service Desk or IT may only see one access request at a time.

A ticket may say:

“Please add user to supplier management group.”

Another ticket later may say:

“Please add user to invoice approval group.”

Both requests may be approved.  
Both may look normal.  
Both may be handled correctly according to the visible process.

But if nobody checks the combination, the risk can slip through.

This is one reason IAM cannot rely only on ticket-by-ticket thinking.

The person handling the request may not have enough visibility into the user’s full access picture. The manager may only think about the immediate task. The system owner may understand one system, but not how access connects across several systems.

This creates a real-world problem:

Everyone may handle their own part correctly, while the overall risk still increases.

That is the sneaky part.

## IAM thinking

A mature IAM question is not only:

“Does this user need this access?”

A better question is:

“What else does this user already have, and what can they do when these accesses are combined?”

That shift matters.

Access should not be reviewed only as isolated permissions.

It should also be reviewed as part of a business process.

For example:

- Can the same person create and approve the same transaction?
- Can the same person request and approve their own access?
- Can the same person modify data and validate the result?
- Can the same person create a supplier and influence payment?
- Can the same person grant privileges and use those privileges?
- Can the same person bypass a control by combining access from multiple systems?

This is where IAM becomes more than user administration.

It becomes a way to understand and control business risk.

## Senior observation

A weak access model often looks fine when each permission is checked separately.

That is why segregation of duties is easy to underestimate.

The danger is not always visible inside one group, one role or one system.

Sometimes the danger is in the combination.

This is also why “the manager approved it” is not always enough.

A manager may understand the user’s job, but not the risk created by access combinations across systems.

IT may understand the technical group, but not the full business process.

Compliance may ask for evidence, but evidence alone does not prove the access model is safe.

A mature IAM model needs rules that understand business logic, not just system permissions.

Otherwise, the organization may end up with access that is approved, documented and still risky.

Very cute. Very official. Still broken.

## What I would look for

In this kind of case, I would not only check whether the user has approved access.

I would look for risky combinations.

Questions I would ask:

- Which business process does this access support?
- What can the user actually do with this access?
- What other related access does the user already have?
- Could this user complete a sensitive process alone?
- Are creation, modification and approval duties separated?
- Are high-risk combinations detected automatically?
- Are managers given enough context to understand SoD conflicts?
- Who owns the SoD rules: business, compliance, IAM or system owners?
- Are exceptions documented and reviewed?
- Is there a compensating control if duties cannot be separated?

The goal is not to block useful work.

The goal is to make sure one person does not accidentally become the whole control chain.

## Better outcome

A stronger approach would define segregation of duties rules around real business processes.

Instead of only listing technical permissions, the organization should identify which combinations create risk.

For example:

- supplier creation and payment approval should be separated
- user administration and privileged access approval should be separated
- salary data changes and salary approval should be separated
- purchase request creation and purchase approval should be separated
- sensitive data modification and final validation should be separated

These rules should be understandable to the business, not only to IT.

The business should help define which actions must be separated. IAM can then help translate that logic into roles, groups, access packages, policies, reviews and monitoring.

This is the important part:

IAM should not invent business risk in isolation.

But IAM should help expose where access creates that risk.

## Summary

This case shows that segregation of duties is not just a compliance checkbox.

It is business logic expressed through access control.

The real risk is not always one permission.

The real risk may be what a person can do when several permissions are combined.

A senior IAM approach does not only ask who has access to which system.

It asks whether the access model protects the business process itself.

Because access is not just about entering a system.

It is about what power the person has once they are inside.
