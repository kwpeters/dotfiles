#
# Setup
#
# - Install PowerShell 7 from the Windows store.
#
# - Instead of copying this file to the location where pwsh.exe expects it to
#   be, I prefer to create a symbolic link at that location, pointing to this
#   file.  That way, changes can be made directly in the repo and I don't have
#   to constantly copy this file when backing up and restoring.  To make the
#   symbolic link, first figure out where pwsh.exe wants to find your config
#   file.  In a pwsh.exe window run
#     $profile
#   Copy the output file path.
#   Now run cmd.exe and issue the following command to create the symbolic link:
#
#   mklink <value_of_$profile> <path_to_this_file_within_local_cloned_repo>
#
#   For example: mklink C:\Users\kwpeters.RA-INT\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 c:\Users\kwpeters.RA-INT\dev\kwp\dotfiles\powershell_7\Microsoft.PowerShell_profile.ps1
#
# - In a PowerShell console, set your execution policy (if you haven't already):
#     Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
#
# - In a PowerShell console, install dependencies used in this file:
#     Install-Module posh-git Scope CurrentUser -AllowPrerelease -Force
#

################################################################################
# Overridden Commands
################################################################################

Remove-Alias -Name ls
function ls {
    # ls should always use -Force so that dot files are shown.
    Get-ChildItem -Force $args
}

function ls-mod {
    # List directory and sort so that most recently modified items are first.
    Get-ChildItem | Sort-Object -Descending LastWriteTime
}


################################################################################
# Posh Git
################################################################################
Import-Module posh-git

# In the prompt, replace the home directory path with "~".
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
# Change the default prompt color ot orange.
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
# Insert a newline before the prompt suffix.
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'


################################################################################
# Elevating to admin
################################################################################

function Enter-AdminPSSession {
  if ($env:OS -eq 'Windows_NT') {
    Start-Process -Verb RunAs (Get-Process -Id $PID).Path
  } else {
    sudo (Get-Process -Id $PID).Path
  }
}

# An short name alias for the above function:
# Note: 'psadmin' is a nonstandard alias name; a more conformant name would be
#       the somewhat clunky 'etasn'
#       ('et' for 'Enter', 'a' for admin, and 'sn'` for session)
Set-Alias psadmin Enter-AdminPSSession


################################################################################
# Personal Productivity
################################################################################

function capcom {
    $scriptPath = Join-Path -Path $env:HOME -ChildPath "dev/kwp/juggernaut/capcom.py"
    python $scriptPath
}


################################################################################
# PATH environment variable
################################################################################

# Append script location(s) to the end of the PATH environment variable.
$env:path += ";C:\Users\kwpeters.RA-INT\dev\kwp\PowerShellScripts"
