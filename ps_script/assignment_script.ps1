

Connect-AzureAD
$userCount = 20

#Create 20 users

for ($i = 1; $i -le $userCount; $i++) {
    $displayName = "Test User $i"
    $passwordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $passwordProfile.Password = "Varonis123!"
    $userPrincipalName = "testuser$i@eventus.onmicrosoft.com"
    New-AzureADUser -AccountEnabled $true -DisplayName $displayName -PasswordProfile $passwordProfile -UserPrincipalName $userPrincipalName
}

#Create security group

$groupDisplayName = "Varonis Assignment Group"
New-AzureADGroup -DisplayName $groupDisplayName -MailEnabled $false -SecurityEnabled $true -MailNickName "NotSet"
$groupId = (Get-AzureADGroup -SearchString $groupDisplayName).ObjectId

#Try to add all the users to the security group
for ($i = 1; $i -le $userCount; $i++) {
    $userDisplayName = "Test User $i"
    $userPrincipalName = "testuser$i@eventus.onmicrosoft.com"
    $userObjectId = (Get-AzureADUser -ObjectId $userPrincipalName).ObjectId
    $timestamp = Get-Date
    try {
        Add-AzureADGroupMember -ObjectId $groupId -RefObjectId $userObjectId -ErrorAction Stop
        $result = "Success"
    } catch {
        $result = "Failure"
    }
    $logMessage = "Added user $userDisplayName to group $groupDisplayName at $timestamp with result: $result"
    Write-Output $logMessage
}