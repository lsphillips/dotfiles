# Install applications.
write-host "Installing applications" -ForegroundColor "Yellow"
winget install -e --id Microsoft.WindowsTerminal -s winget
winget install -e --id Git.Git -s winget
winget install -e --id Microsoft.PowerShell -s winget
winget install -e --id JanDeDobbeleer.OhMyPosh -s winget
winget install -e --id Microsoft.VisualStudioCode -s winget
winget install -e --id CoreyButler.NVMforWindows -s winget
winget install -e --id Amazon.AWSCLI -s winget
winget install -e --id GitHub.cli -s winget
winget install -e --id Microsoft.PowerToys -s winget
winget install -e --id JetBrains.Rider -s winget

# Install modules.
write-host "Installing PowerShell modules" -ForegroundColor "Yellow"
install-module posh-git -Scope CurrentUser

# Refresh path
$env:NVM_HOME    = [System.Environment]::GetEnvironmentVariable("NVM_HOME", "Machine")
$env:NVM_SYMLINK = [System.Environment]::GetEnvironmentVariable("NVM_SYMLINK", "Machine")
$env:Path        = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Install node.
write-host "Installing latest version of Node (nvm)" -ForegroundColor "Yellow"
nvm install latest
nvm use latest

# Install nerd fonts.
write-host "Installing Meslo font family (oh-my-posh)" -ForegroundColor "Yellow"
oh-my-posh font install Meslo

# Install vscode extensions.
write-host "Installing Visual Studio Code extensions" -ForegroundColor "Yellow"
code --force --install-extension editorconfig.editorconfig
code --force --install-extension ms-vscode.powershell
code --force --install-extension dbaeumer.vscode-eslint
code --force --install-extension leizongmin.node-module-intellisense
code --force --install-extension vscode-icons-team.vscode-icons
code --force --install-extension octref.vetur
code --force --install-extension github.copilot
code --force --install-extension github.copilot-chat

# Install Ubuntu
write-host "Installing Ubuntu (WSL)" -ForegroundColor "Yellow"
wsl --install -d Ubuntu

# Copy configuration.
write-host "Placing configuration files" -ForegroundColor "Yellow"
copy $PSScriptRoot\.editorconfig         $env:USERPROFILE\.editorconfig
copy $PSScriptRoot\.gitconfig            $env:USERPROFILE\.gitconfig
copy $PSScriptRoot\oh-my-posh.json       $env:USERPROFILE\oh-my-posh.json
copy $PSScriptRoot\vscode.json           $env:APPDATA\Code\User\settings.json
copy $PSScriptRoot\github-cli.yml        $env:APPDATA\GitHub CLI\config.yml
copy $PSScriptRoot\windows-terminal.json $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

# Copy Powershell 7 profile.
write-host "Creating PowerShell profile" -ForegroundColor "Yellow"
md $env:USERPROFILE\Documents\Powershell\ -ea 0
copy $PSScriptRoot\profile.ps1 $env:USERPROFILE\Documents\Powershell\Microsoft.PowerShell_profile.ps1

# Configure Windows.
write-host "Configuring Windows" -ForegroundColor "Yellow"
& $PSScriptRoot\windows.ps1
