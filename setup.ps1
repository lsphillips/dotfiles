# Install tools.
winget install -e --id Microsoft.WindowsTerminal -s winget
winget install -e --id Git.Git -s winget
winget install -e --id JanDeDobbeleer.OhMyPosh -s winget
winget install -e --id Microsoft.VisualStudioCode -s winget
winget install -e --id CoreyButler.NVMforWindows -s winget
winget install -e --id Amazon.AWSCLI -s winget
winget install -e --id GitHub.cli -s winget
winget install -e --id Microsoft.PowerToys -s winget
winget install -e --id JetBrains.Rider -s winget

# Install posh-git.
Install-Module posh-git -Scope CurrentUser

# Refresh path
$env:NVM_HOME    = [System.Environment]::GetEnvironmentVariable("NVM_HOME", "Machine")
$env:NVM_SYMLINK = [System.Environment]::GetEnvironmentVariable("NVM_SYMLINK", "Machine")
$env:Path        = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Install node.
nvm install latest

# Install nerd fonts.
oh-my-posh font install Meslo

# Install vscode extensions.
code --force --install-extension editorconfig.editorconfig
code --force --install-extension ms-vscode.powershell
code --force --install-extension dbaeumer.vscode-eslint
code --force --install-extension leizongmin.node-module-intellisense
code --force --install-extension vscode-icons-team.vscode-icons
code --force --install-extension octref.vetur

# Copy configuration.
copy $PSScriptRoot\.editorconfig         $env:USERPROFILE\.editorconfig
copy $PSScriptRoot\.gitconfig            $env:USERPROFILE\.gitconfig
copy $PSScriptRoot\oh-my-posh.json       $env:USERPROFILE\oh-my-posh.json
copy $PSScriptRoot\vscode.json           $env:APPDATA\Code\User\settings.json
copy $PSScriptRoot\windows-terminal.json $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

# Copy profile.
copy $PSScriptRoot\profile.ps1 $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Configure Windows.
& $PSScriptRoot\windows.ps1
