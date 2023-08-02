# File Explorer.
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"     "Hidden"            1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"     "HideFileExt"       0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" "FullPath"          1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"     "ConfirmFileDelete" 0

# Search.
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" "BingSearchEnabled"           0
Set-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer"     "DisableSearchBoxSuggestions" 1
