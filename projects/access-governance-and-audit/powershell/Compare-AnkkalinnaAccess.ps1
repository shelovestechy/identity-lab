[CmdletBinding()]
param(
    [string]$ExpectedPath = (Join-Path $PSScriptRoot 'expected-access.csv'),
    [string]$CurrentPath = (Join-Path $PSScriptRoot 'current-access.csv'),
    [string]$OutputPath = (Join-Path $PSScriptRoot 'sample-output.csv')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Import-AccessFile {
    param(
        [Parameter(Mandatory)]
        [string]$Path,

        [Parameter(Mandatory)]
        [string]$Label
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "$Label file was not found: $Path"
    }

    $rows = @(Import-Csv -LiteralPath $Path)

    foreach ($row in $rows) {
        $columns = $row.PSObject.Properties.Name
        if ('User' -notin $columns -or 'Group' -notin $columns) {
            throw "$Label file must contain User and Group columns."
        }

        if ([string]::IsNullOrWhiteSpace($row.User) -or [string]::IsNullOrWhiteSpace($row.Group)) {
            throw "$Label file contains an empty User or Group value."
        }

        [pscustomobject]@{
            User  = $row.User.Trim()
            Group = $row.Group.Trim()
        }
    }
}

function New-AccessKey {
    param(
        [Parameter(Mandatory)]
        [string]$User,

        [Parameter(Mandatory)]
        [string]$Group
    )

    '{0}|{1}' -f $User.Trim().ToLowerInvariant(), $Group.Trim().ToLowerInvariant()
}

$expectedRows = @(Import-AccessFile -Path $ExpectedPath -Label 'Expected access')
$currentRows = @(Import-AccessFile -Path $CurrentPath -Label 'Current access')

$expectedByKey = @{}
$currentByKey = @{}
$expectedUsers = @{}

foreach ($row in $expectedRows) {
    $key = New-AccessKey -User $row.User -Group $row.Group
    if ($expectedByKey.ContainsKey($key)) {
        throw "Duplicate expected access row: $($row.User) / $($row.Group)"
    }

    $expectedByKey[$key] = $row
    $expectedUsers[$row.User.ToLowerInvariant()] = $true
}

foreach ($row in $currentRows) {
    $key = New-AccessKey -User $row.User -Group $row.Group
    if ($currentByKey.ContainsKey($key)) {
        throw "Duplicate current access row: $($row.User) / $($row.Group)"
    }

    $currentByKey[$key] = $row
}

$results = [System.Collections.Generic.List[object]]::new()

foreach ($key in $expectedByKey.Keys) {
    $row = $expectedByKey[$key]

    if ($currentByKey.ContainsKey($key)) {
        $decision = 'Keep'
        $reason = 'Matches expected access'
    }
    else {
        $decision = 'Missing'
        $reason = 'Expected access is not in current data'
    }

    $results.Add([pscustomobject]@{
        User     = $row.User
        Group    = $row.Group
        Decision = $decision
        Reason   = $reason
    })
}

foreach ($key in $currentByKey.Keys) {
    if ($expectedByKey.ContainsKey($key)) {
        continue
    }

    $row = $currentByKey[$key]
    $knownUser = $expectedUsers.ContainsKey($row.User.ToLowerInvariant())

    if ($knownUser) {
        $decision = 'Remove'
        $reason = 'Current access is not expected for this user'
    }
    else {
        $decision = 'Review'
        $reason = 'User is not in the expected access model'
    }

    $results.Add([pscustomobject]@{
        User     = $row.User
        Group    = $row.Group
        Decision = $decision
        Reason   = $reason
    })
}

$sortedResults = @($results | Sort-Object User, Group)
$sortedResults | Export-Csv -LiteralPath $OutputPath -NoTypeInformation -Encoding utf8
$sortedResults
