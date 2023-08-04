# Luke's dotfiles

My development environment configuration.

## Windows

### Installation

Open an elevated PowerShell terminal and run the following command:

``` powershell
. setup.ps1
```

**Important:** You must have your execution policy set to `Unrestricted` or `Bypass` for this to work:

``` powershell
Set-ExecutionPolicy Unrestricted
```

The following setup will be performed:

- Configures some aspects of Windows.
- Ensures necessary applications are installed; achieved using [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/).
- Copies the applicable configuration files to their required locations.
- Sets up a PowerShell profile.

To apply any updates you just need to pull them down and run the `setup.ps1` script again.

### Profile

The profile initializes `oh-my-posh` and defines the following helper functions:

- `..`\
  Navigates to the parent directory.
- `home`\
  Navigates to the user's Home directory.
- `downloads`\
  Navigates to the user's Downloads directory.
- `hosts`\
  Opens the `hosts` file in Visual Studio Code.
- `ps-profile`\
  Opens the PowerShell profile file in Visual Studio Code.
- `delete`\
  Deletes a file or directory.
- `flush-dns`\
  Flushes the DNS cache.
- `update`\
  Updates all applications, modules and module help files.
- `empty-bin`\
  Empties the Recycle Bin.
