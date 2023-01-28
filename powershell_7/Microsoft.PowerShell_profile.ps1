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
# - In an *admin* PowerShell console, install dependencies used in this file:
#     Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
#


################################################################################
# Reloading Profile
################################################################################

# When running the following function, you must dotsource it:
# . Reload-Profile
function Reload-Profile {
    @(
        $Profile.AllUsersAllHosts,
        $Profile.AllUsersCurrentHost,
        $Profile.CurrentUserAllHosts,
        $Profile.CurrentUserCurrentHost
    ) | ForEach-Object {
        if (Test-Path $_) {
            Write-Verbose "Running $_"
            . $_
        }
    }
}


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


function nvm-use {
    if (Test-Path .nvmrc) {
        nvm use $(Get-Content .nvmrc)
    }
}

function git-config-personal {
    git config user.name "Kevin Peters" && git config user.email "kwpeters@gmail.com"
}


function git-clean {
    git clean -xfd -e .env
}


################################################################################
# Posh Git
################################################################################
Import-Module posh-git

# # In the prompt, replace the home directory path with "~".
# $GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
# # Change the default prompt color ot orange.
# $GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
# # Insert a newline before the prompt suffix.
# $GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'

#
# Themes
#

# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\emodipt-extend.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\gruvbox.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:HOME\dev\kwp\dotfiles\powershell_7\oh-my-posh\kwp.omp.json" | Invoke-Expression

# In order for the following to work, you need to a one-time install:
# Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons


################################################################################
# Elevating to admin
################################################################################

function Enter-AdminPSSession {
    if ($env:OS -eq 'Windows_NT') {
        Start-Process -Verb RunAs (Get-Process -Id $PID).Path
    }
    else {
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

# function capcom {
#     $scriptPath = Join-Path -Path $env:HOME -ChildPath "dev/kwp/juggernaut/capcom.py"
#     python $scriptPath
# }


################################################################################
# PATH environment variable
################################################################################

function Add-Path {
    param ([string]$Dir)

    if (Test-Path -Path $Dir) {
        if (-not ($env:path -match ';$')) {
            $env:path += ";"
        }
        $env:path += $Dir
        $env:path += ";"
        "Added to PATH: $Dir"
    }
    else {
        "--------------------------------------------------------------------------------"
        "E R R O R !"
        "--------------------------------------------------------------------------------"
        "The following directory does not exist and has not been added to PATH."
        $Dir
        # "$Dir Path doesn't exist."
    }
}


function Check-Path {
    param ([string]$Dir)

    if (-not($env:path -match $Dir)) {
        "--------------------------------------------------------------------------------"
        "E R R O R !"
        "--------------------------------------------------------------------------------"
        "The following directory should be in your PATH."
        $dir
    }
}

# When adding PowerShellScripts to PATH, make sure it comes before
# C:\Program Files\Git\usr\bin, because the two contain commands that overlap.
Check-Path -Dir "C:\\Users\\kwpeters\\dev\\kwp\\PowerShellScripts"
Check-Path -Dir "C:\\Users\\kwpeters\\dev\\kwp\\tewl\\clitools\\dist-saved\\src"

# Give an overview of local work that has not been committed and pushed.
# Commenting this out, because it is too slow and annoying.
# localWork C:\Users\kwpeters\dev\

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

Write-Output "Profile script loaded!"
