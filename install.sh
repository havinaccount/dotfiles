#!/bin/bash
# Automated installer script
echo Installing Configuration files and VSCode Extensions

clear
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/Code/User

cp .bashrc ~/
cp starship.toml ~/.config/
cp config.ghostty ~/.config/ghostty
cp vscode/settings.json ~/.config/Code/User

if command -v code >/dev/null 2>&1;
then
	xargs -a vscode/vscode_extensions.txt -L 1 code --install-extension
	echo Done!
else
	echo VSCode not installed, skipping extensions
	echo You can later retrieve or use the vscode_extensions.txt using:
	echo xargs -a vscode_extensions.txt -L 1 code --install-extension
fi
