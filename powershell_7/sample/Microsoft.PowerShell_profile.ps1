# The directory where I keep my version controlled profiles.
$profileDir = Join-Path -Path $env:home -ChildPath "dev\kwp\dotfiles\powershell_7"

# The naming convention used by profile files.
$profileFile = "PowerShell_profile_" + $env:COMPUTERNAME + ".ps1"

# Join the two together to get the full path.
$profileFilePath = Join-Path -Path $profiledir -ChildPath $profilefile

if (![System.IO.File]::Exists($profileFilePath)) {
    Write-Error "$profileFilePath does not exist."
}

Write-Host "Loading $profileFilePath..."
# Dot source the profile for this machine.
. $profileFilePath
