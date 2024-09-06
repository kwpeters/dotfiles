#
# PowerShell configuration for my Dell laptop.
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

function git-config-rok {
    git config user.name "Kevin Peters" && git config user.email "kwpeters@rockwellautomation.com"
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
# # Change the default prompt color to orange.
# $GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
# # Insert a newline before the prompt suffix.
# $GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'

#
# Themes
#

# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\emodipt-extend.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\gruvbox.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:HOME\dev\kwp\dotfiles\powershell_7\oh-my-posh\kwp.omp.json" | Invoke-Expression

# Better way of initializing Oh My Posh.  This skirts issues they see with antivirus interfering oh-my-posh.
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:HOME\dev\kwp\dotfiles\powershell_7\oh-my-posh\kwp.omp.json" --print) -join "`n"))


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
Check-Path -Dir "C:\\Users\\kwpeters\\dev\\kwp\\monorail\\monorail\\snapshot\\.bin"

################################################################################
# Report repos with local work
################################################################################

# Give an overview of local work that has not been committed and pushed.
# Commenting this out, because it is too slow and annoying.
# localWork C:\Users\kwpeters\dev\

################################################################################
# Chocolatey
################################################################################

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}


################################################################################
# Visual Studio Dev Shell
#
# Reference:
# https://intellitect.com/blog/enter-vsdevshell-powershell/
################################################################################

function devShell {

    # See if vswhere.exe is installed.  It will be used to locate the Visual
    # Studio installation directory.
    $vsWhereFilePath = Join-Path ${Env:ProgramFiles(x86)} "Microsoft Visual Studio\\Installer\\vswhere.exe"
    if (![System.IO.File]::Exists($vsWhereFilePath)) {
        Write-Error "Cannot find vswhere.  $vsWhereFilePath does not exist."
        return
    }

    # Invoke vswhere.exe to get the installation path.
    $vsInstallPath = &"$vsWhereFilePath" -property installationpath
    Write-Host "Visual Studio install location: $vsInstallPath"

    # Build the path to the dev shell PowerShell module.
    $moduleFilePath = Join-Path $vsInstallPath "Common7\\Tools\\Microsoft.VisualStudio.DevShell.dll"
    if (![System.IO.File]::Exists($moduleFilePath)) {
        Write-Error "Cannot find Microsoft.VisualStudio.DevShell.dll.  $moduleFilePath does not exist."
        return
    }

    # Import the PowerShell module.
    Import-Module (Join-Path $vsInstallPath "Common7\\Tools\\Microsoft.VisualStudio.DevShell.dll")
    # Enter the dev shell.
    Enter-VsDevShell -VsInstallPath $vsInstallPath -SkipAutomaticLocation
}


################################################################################
# Settings for all machines
################################################################################
$commonProfileFile = Join-Path -Path $PSScriptRoot -ChildPath "PowerShell_profile_common.ps1"
. $commonProfileFile


################################################################################
# Environment variables only needed in PowerShell
################################################################################

# Directory containing all development Git repositories.
$env:GIT_REPO_ROOT_DIR = "C:\Users\kwpeters\dev"




#
# Done.
#
Write-Output "Profile script loaded!"


################################################################################
# Examples
################################################################################

#
# An example of how to prompt the user by reading a line of input.
#

# $input = Read-Host "Make this a Visual Studio developer shell? (y/n) "
# if ($input -eq 'y') {
#     # Do something
# }

#
# An example of how to write text without the trailing newline.
#

# Write-Host -NoNewline "Continue? (y/n)"

#
# An example of waiting for a key press.
#

# $allowed = 89, 78
# do {
#     $keyInfo = $Host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown")
#     # Write-Host $keyInfo.VirtualKeyCode
# } while (
#     -not ($allowed -contains $keyInfo.VirtualKeyCode)
# )
# Write-Host ""
#
# if ($keyInfo.VirtualKeyCode -eq 89) {
#     $vsInstallPath = &"C:\\Program Files (x86)\\Microsoft Visual Studio\\Installer\\vswhere.exe" -property installationpath
#     Import-Module (Join-Path $vsInstallPath "Common7\\Tools\\Microsoft.VisualStudio.DevShell.dll")
#     Enter-VsDevShell -VsInstallPath $vsInstallPath -SkipAutomaticLocation
# }
