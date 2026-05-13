# Name Change - Technical Notes

This is a short technical note for handling user name changes in Microsoft Entra ID / Azure AD environments.

Example case:

A user gets married and their name changes.

Old name:

```
Iines Ankka
```

New name:

```
Iines Hanhi
```

The goal is to update the user correctly without breaking login, mailbox, aliases, sync, applications or identity history.

## 1. First check: cloud-only or synced user?

Before changing anything, check where the user is managed.

### Cloud-only user

The user is managed directly in Microsoft Entra ID / Microsoft 365.

Changes can usually be made in:

- Microsoft 365 admin center
- Microsoft Entra admin center
- Exchange admin center
- Microsoft Graph / PowerShell, if allowed

### Synced user

The user is synced from on-premises Active Directory.

In this case, do not randomly edit values directly in Entra.

Change the values in the source system instead, usually:

- on-premises Active Directory
- HR system
- identity management system
- Exchange on-premises / hybrid Exchange tools, depending on environment

If the user is synced, cloud-side edits may be overwritten by sync.

## 2. Attributes that are usually safer to update

These are usually name/display related fields.

Still check source of authority first.

| Attribute | Purpose | Notes |
|---|---|---|
| `displayName` | Visible name in Microsoft 365 apps | Usually safe to update from correct source |
| `givenName` | First name | Name data |
| `surname` / `sn` | Last name | Name data |
| `mailNickname` | Exchange/M365 alias nickname | Be careful in Exchange environments |
| `mail` | Mail attribute | Check Exchange/mail flow impact |
| `proxyAddresses` | Email addresses and aliases | Be careful, especially primary SMTP |
| `userPrincipalName` / `UPN` | Login name | Do not change blindly |
| `sAMAccountName` | Legacy AD logon name | Only relevant in AD/hybrid environments |

## 3. Display name update

If the user only needs their visible name changed, update:

```
displayName
givenName
surname
```

Example target:

```
displayName: Iines Hanhi
givenName: Iines
surname: Hanhi
```

This affects how the user appears in places like:

- Microsoft 365 admin center
- Entra ID
- Teams
- Outlook address book
- SharePoint / OneDrive
- people search

Note: Teams, Outlook and address book views may take time to update. Some clients may show cached old values for a while.

## 4. Email address update

If the user also needs a new email address, update the primary SMTP address and keep the old address as an alias.

Example:

```
Primary SMTP:
SMTP:iines.hanhi@ankkalinnaidentitylab.fi

Old address as alias:
smtp:iines.ankka@ankkalinnaidentitylab.fi
```

Important:

```
SMTP: = primary email address
smtp: = secondary email alias
```

Do not remove the old address too quickly.

Old email address should usually stay as an alias so old messages still arrive.

## 5. UPN / login name change

Do not automatically change UPN just because the name changed.

UPN is used for sign-in.

Example old UPN:

```
iines.ankka@ankkalinnaidentitylab.fi
```

Example new UPN:

```
iines.hanhi@ankkalinnaidentitylab.fi
```

Changing UPN may affect:

- user sign-in
- SSO
- saved credentials
- scripts
- integrations
- application user matching
- reporting
- audit searches
- user instructions
- Windows sign-in experience

Before changing UPN, check:

- is UPN used as login?
- do applications depend on UPN?
- do scripts use UPN?
- does the user know their login name will change?
- are there old systems that use UPN as identifier?
- is the device Entra joined, hybrid joined or AD joined?

My note to self:

Email can often change more safely than UPN.

UPN change needs more checking.

## 6. Outlook name display

If Outlook still shows the old name, check first:

- `displayName`
- Exchange mailbox display information
- Global Address List / address book update delay
- Outlook cached mode
- local Outlook profile cache
- Teams / M365 profile cache

Things to try/check:

- wait for Microsoft 365 propagation
- restart Outlook
- restart Teams
- check Outlook on the web
- check if the name is correct in Microsoft 365 admin center
- check if the name is correct in Entra
- check if Exchange mailbox details are updated
- in some cases, rebuild Outlook profile if local cache is stuck

Do not assume the change failed just because Outlook desktop still shows the old value immediately.

Check from cloud/admin side first.

## 7. Windows sign-in with new name

If UPN is changed, the user may need to sign in with the new UPN.

Example:

```
Old login:
iines.ankka@ankkalinnaidentitylab.fi

New login:
iines.hanhi@ankkalinnaidentitylab.fi
```

Things to remember:

- device type matters
- Entra joined device behaves differently than AD joined device
- cached credentials may still exist
- Windows profile folder name may not rename automatically
- user may need to sign out and back in
- some apps may ask for re-authentication
- Windows Hello / PIN may need attention in some cases
- OneDrive, Office and Teams may need re-authentication

Important note:

Changing the user’s name or UPN does not necessarily rename the local Windows profile folder.

Do not promise the user that everything on the device will visually rename instantly.

## 8. API and application integrations

For APIs and integrations, avoid using changeable values as permanent identifiers.

Risky values as permanent IDs:

```
userPrincipalName
mail
displayName
proxyAddresses
```

Better stable identifiers:

```
Microsoft Entra object ID / Graph user id
employeeId, if HR-owned and reliable
immutable/source anchor in hybrid identity design
```

Main idea:

A user’s name, email and UPN can change.

The system should still know this is the same person.

If an application uses email or UPN as the permanent user key, name changes can break matching.

For API design or integrations, remember:

- do not use display name as identifier
- avoid using email as permanent user ID
- avoid using UPN as permanent user ID if possible
- prefer stable object identifiers
- check how the application maps users
- check if old and new values need to be stored
- keep audit history understandable

## 9. Practical cloud-only change order

For cloud-only user, possible order:

1. Confirm name change request and approval
2. Check current user values
3. Update `displayName`, `givenName`, `surname`
4. Decide if email address changes
5. Add new email address
6. Set new email as primary SMTP
7. Keep old email as alias
8. Decide if UPN changes
9. If UPN changes, inform user before change
10. Test sign-in
11. Test email to new address
12. Test email to old alias
13. Check Outlook/Teams name display
14. Document what changed

## 10. Practical synced user change order

For synced user, possible order:

1. Confirm source of authority
2. Check if HR or AD owns the name values
3. Update name in source system
4. Update AD attributes if needed
5. Update Exchange-related attributes from correct system/tool
6. Run or wait for sync
7. Check Entra values after sync
8. Check mailbox / email addresses
9. Test sign-in
10. Test email flow
11. Check Outlook/Teams display
12. Document what changed

## 11. What I would avoid

Do not:

- create a new account just because the name changed
- remove old email address without alias plan
- change UPN without checking login/app impact
- edit synced user directly in Entra without understanding sync
- change random Exchange attributes without knowing mail flow impact
- assume Outlook desktop updates immediately
- use email/UPN as permanent API identity if object ID is available
- forget to tell the user if their login name changes

## 12. Quick checklist

Before change:

- check cloud-only vs synced
- check source of authority
- check current display name
- check current UPN
- check primary SMTP
- check aliases
- check if UPN really needs to change
- check app/API dependencies
- check if user needs communication

After change:

- display name correct
- new email works
- old email alias works
- sign-in works
- Outlook/Teams eventually show correct name
- no duplicate account created
- old account not left active by accident
- documentation updated

## Note to self

A name change should preserve identity continuity.

The visible name can change.

The email address can change.

Even the UPN can change if needed.

But the user should stay the same identity.

Same account.

Same mailbox continuity.

Same permission history.

Same audit chain.

Do not turn a name change into an accidental identity split.
