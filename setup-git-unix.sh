#!/bin/bash

DOTFILES_DIR=$(pwd)
CONFIG_SOURCE="$DOTFILES_DIR/.gitconfig"
CONFIG_DEST="$HOME/.gitconfig"
PLATFORM_CONFIG="$HOME/.gitconfig-platform"

echo "Copying .gitconfig to $HOME..."
cp "$CONFIG_SOURCE" "$CONFIG_DEST"

echo "Creating Unix-like-specific Git configuration..."
cat > "$PLATFORM_CONFIG" << EOF
[core]
	autocrlf = input
	safecrlf = false
EOF

echo "Git configuration complete!"
echo " - Main config: $CONFIG_DEST"
echo " - Platform config: $PLATFORM_CONFIG"
