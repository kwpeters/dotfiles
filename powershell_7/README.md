# PowerShell Core (multiplatform)

## Installation

- You can get PowerShell 7 from the Windows Store or from the following web page:
  <https://github.com/PowerShell/powershell/releases>

  I prefer to get it from the web page.  There are a lot of artifacts for each release.  Look for the one that ends with `-win-x64.msi`.

- The path to the installed PowerShell executable will be:
  C:\Program Files\PowerShell\7\pwsh.exe

  ### Upgrading

  - You don't have to uninstall the old version first.

  - Just download and install the msi from the above web page.  The installer
    will properly upgrade your installation and preserve your settings.

## Profile Setup

- To keep my PowerShell configuration in this repo, I would *normally* symlink
  the to the config file within this repo.  Unfortunately, this does not work
  well, because PowerShell wants to put the config file (pointed to by the
  `$profile` PowerShell variable) in my `Documents` folder, which is synchronized
  by OneDrive.  This means that when I have multiple PCs, they will all attempt
  to synchronize their unique symlink, resulting in a mess.

  Instead of using the symlink approach I use a common configuration file
  (contained in `powershell_7\sample\Microsoft.PowerShell_profile.ps1`) that
  *dot sources* a configuration file based on machine name.  The
  machine-specific script will be the following path (relative to your home path):

  ```text
  dev\kwp\dotfiles\powershell_7\PowerShell_profile_<machine_name>.ps1
  ```

- To see the path of your PowerShell profile run:

  ```powershell
  $PROFILE
  ```

  On Rockwell PC's this will point into your OneDrive folder, which means that
  as soon as OneDrive syncs, you should have the basic launcher script mentioned
  previously.

  To update the common launcher script, from the root of this repo, run:

  ```powershell
  cp .\powershell_7\sample\Microsoft.PowerShell_profile.ps1 'C:\Users\kwpeters\OneDrive - Rockwell Automation, Inc\Documents\PowerShell\Microsoft.PowerShell_profile.ps1'
  ```

## Other Setup

- In a PowerShell console, set your execution policy (if you haven't already):

  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
  ```

- Install oh-my-posh.  Follow the direction on the
  [oh-my-posh Windows installation page](https://ohmyposh.dev/docs/installation/windows).


  ```powershell
  winget install JanDeDobbeleer.OhMyPosh -s winget
  ```

- In an ***admin*** PowerShell console, install dependencies used in this file:

  ```powershell
  Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
  ```
