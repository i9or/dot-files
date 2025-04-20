$DOTFILES_DIR = $PWD.Path
$CONFIG_SOURCE = Join-Path $DOTFILES_DIR ".gitconfig"
$CONFIG_DEST = Join-Path $HOME ".gitconfig"
$PLATFORM_CONFIG = Join-Path $HOME ".gitconfig-platform"

Write-Host "Copying .gitconfig to $HOME..."
Copy-Item -Path $CONFIG_SOURCE -Destination $CONFIG_DEST

Write-Host "Creating Windows-specific Git configuration..."
@"
[core]
	autocrlf = true
	safecrlf = false
"@ | Out-File -FilePath $PLATFORM_CONFIG -Encoding utf8

Write-Host "Git configuration complete!"
Write-Host " - Main config: $CONFIG_DEST"
Write-Host " - Platform config: $PLATFORM_CONFIG"
