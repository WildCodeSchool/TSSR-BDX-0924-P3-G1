######################################################################################################
#                                                                                                    #
#   Création USER automatiquement avec fichier (avec suppression protection contre la suppression)   #
#                                                                                                    #
######################################################################################################

$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

### Chemin à modifier en fonction de la l'on stocke le fichier des users

$File = "C:\Users\Administrator\Downloads\BillU_Users.csv"

### Main program

Clear-Host
If (-not(Get-Module -Name activedirectory))
{
    Import-Module activedirectory
}

# Import du fichier CSV avec un skip pour ne pas prendre en compte la 1ère ligne
$Users = Import-Csv -Path $File -Delimiter ";" -Header "Civilité","Prenom","Nom","Societe","Site","Departement","Service","fonction","Telephone_fixe","Telephone portable" | Select-Object -Skip 1
$ADUsers = Get-ADUser -Filter * -Properties *
$count = 1

# Boucle foreach, qui cycle tous les utilisateurs à ajouter 
Foreach ($User in $Users)
{
    Write-Progress -Activity "Création des utilisateurs dans l'OU" -Status "%effectué" -PercentComplete ($Count/$Users.Length*100) # Affichage du barre de chargement
    $Name              = "$($User.Prenom) $($User.Nom)"
    $DisplayName       = "$($User.Prenom) $($User.Nom)"
    $SamAccountName    = $($User.Nom.substring(0,1).tolower()) +"."+ $($User.Prenom.ToLower())
    $UserPrincipalName = (($User.Nom.substring(0,1).tolower() + $User.Prenom.ToLower()) + "@" + (Get-ADDomain).Forest)
    $GivenName         = $User.Prenom
    $Surname           = $User.Nom
    $OfficePhone       = $User.Telephone_fixe
    $EmailAddress      = $UserPrincipalName
    $Company           = $User.Societe
    $Department        = "$($User.Departement)"
    $Title             = "$($User.fonction)"

    If ($User.Departement -ne "-")
    {
        $Path = "ou=$Department,ou=20-Paris,ou=Paris,ou=France,dc=billu,dc=com"
    }
    Else
    {
        $Path = "cn=Users,dc=billu,dc=com" # Si pas de département alors se retrouve dans le conteneur Users de base de l'AD 
    }

    If (($ADUsers | Where-Object {$_.SamAccountName -eq $SamAccountName}) -eq $null)
    {
        New-ADUser -Name $Name -DisplayName $DisplayName -SamAccountName $SamAccountName -UserPrincipalName $UserPrincipalName `
        -GivenName $GivenName -Surname $Surname -OfficePhone $OfficePhone -MobilePhone $MobilePhone -EmailAddress $EmailAddress `
        -Path $Path -AccountPassword (ConvertTo-SecureString -AsPlainText "Azerty1*" -Force) -Enabled $True `
        -OtherAttributes @{Company = $Company;Department = $Department;Title = $Title} -ChangePasswordAtLogon $True

        Write-Host "Création du USER $SamAccountName" -ForegroundColor Green # Confirmation de la création de l'utilisateur
    }
    Else
    {
        Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Black -BackgroundColor Yellow
    }

    $Count++
    Start-Sleep -Milliseconds 100
}