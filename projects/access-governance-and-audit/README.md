# Access Governance and Audit

## What I wanted to understand

Service Desk can add or remove a user from a group. That part is usually simple.

The harder questions are:

- Who decided that the access is needed?
- Who owns the risk?
- When should temporary access end?
- How can we prove later what happened?

“Nobody owns it” is not an ownership model.

## The Ankkalinna case

Hannu Hanhi works in Sales. His normal access is:

- `SG-Sales-Basic`
- `SG-App-CRM-Users`

Hannu helps Finance with a short reporting project and receives `SG-Finance-Basic` access. The project ends, but the group membership stays.

Temporary access has a strange habit of becoming permanent when it has no end date or owner.

## What looks risky to me

| Risk | Why I care about it |
| :--- | :--- |
| Role creep | Hannu slowly collects access that no longer matches his job |
| Weak ownership | Service Desk is left to guess whether access is still valid |
| No end date | A short project creates permanent access |
| Poor segregation of duties | Separate permissions may create a risky combination |
| Weak audit trail | Nobody can explain who approved the access or why it remained |
| Larger incident impact | A compromised Sales account can also reach Finance data |

## My review decision

| Access | Decision | Reason |
| :--- | :--- | :--- |
| Sales basic access | Keep | Hannu still works in Sales |
| CRM user access | Keep | Needed for current Sales work |
| Finance basic access | Remove | The temporary Finance project has ended |

The technical change is removing one membership. The IAM work is understanding why that is the correct decision and who should approve it.

## What evidence I would keep

- the original request and business reason
- the person who approved the access
- the planned end or review date
- membership before the review
- the review decision and reason
- membership after the cleanup
- any approved exception

An audit trail should tell the story without requiring five people to remember what happened two years ago.

## PowerShell exercise

I have not worked with Microsoft Graph yet, and I do not currently have a good environment for practising it.

Instead of pretending otherwise, I built the comparison logic first with local CSV files and PowerShell:

- [`Compare-AnkkalinnaAccess.ps1`](./powershell/Compare-AnkkalinnaAccess.ps1)
- [`expected-access.csv`](./powershell/expected-access.csv)
- [`current-access.csv`](./powershell/current-access.csv)
- [`sample-output.csv`](./powershell/sample-output.csv)

The script compares expected and current group memberships and returns:

- `Keep` — the access exists and is expected
- `Missing` — expected access is not present
- `Remove` — the access exists but is not expected
- `Review` — the user is not included in the expected model, so the script should not guess

Run it from the project folder:

```powershell
pwsh -NoProfile -File ./powershell/Compare-AnkkalinnaAccess.ps1
```

Later, Microsoft Graph could replace `current-access.csv` as the data source. The comparison and decision logic can stay mostly the same.

## What I learned

The first version of this exercise is technically small, but it made the access model more concrete. Data needs a clear format before it can be compared, and automation still needs a safe answer for situations it does not understand.

`Review` is sometimes a better result than an automatic removal.

## Supporting notes

- [Role creep case](../../archive/entra-lab/03-role-creep-hannu.md)
- [Group ownership and access model](../../archive/entra-lab/04-group-ownership-and-access-model.md)
- [Manual access review simulation](../../archive/entra-lab/05-manual-access-review-simulation.md)
- [Access creep and ownership](../../archive/iam-thinking/access-creep-and-ownership.md)
- [Segregation of duties as business logic](../../archive/iam-thinking/segregation-of-duties-as-business-logic.md)
- [Audit evidence](../../archive/governance-compliance/audit-evidence.md)

## What I want to improve next

- add clearer exception reasons
- test duplicate and invalid CSV rows
- separate low-risk and high-risk access
- use Microsoft Graph as a data source when I have a suitable practice environment
