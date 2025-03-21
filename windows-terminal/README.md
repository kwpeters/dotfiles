# Windows Terminal Configuration

## Installation

This configuration file typically resides at the following location:

```
~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

I prefer to create a symbolic link at this location, pointing into this Git repo so that I can have version control.  To create the symbolic link, do the following (in PowerShell):

1. See if there is an existing configuration file and delete it or back it up:

    ```PowerShell
    > ls $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
    ```

2. Make a symbolic link to this file:

    ```PowerShell
    > New-Item -Path $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -ItemType SymbolicLink -Value <absolute_path_to_this_file>
    ```

**Note:**
If Windows Terminal is running, it will periodically check for the
existence of a config file and create one if it is missing.  So you
may want to do the above steps all in one command:

In an **admin** cmd.exe:

```
del %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json && mklink %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json c:\users\kwpet\dev\kwp\dotfiles\windows-terminal\settings-<machinename>.json
```
