# PowerShell Core (multiplatform)

## Setup

- Install PowerShell 7 from the Windows store.

- To keep my PowerShell configuration in this repo, I would *normally* symlink
  the to the config file within this repo.  Unfortunately, this does not work
  well, because PowerShell wants to put the config file (pointed to by the
  `$profile` PowerShell variable) in my `Documents` folder, which is synchronized
  by OneDrive.  This means that when I have multiple PCs, they will all attempt
  to synchronize their unique symlink, resulting in a mess.

  Instead of using the symlink approach I use a common configuration file
  (contained in `powershell_7\sample\Microsoft.PowerShell_profile.ps1`) that
  *dot sources* a configuration file based on machine name.

- In a PowerShell console, set your execution policy (if you haven't already):

  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
  ```

- In an ***admin*** PowerShell console, install dependencies used in this file:

  ```powershell
  Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
  ```
