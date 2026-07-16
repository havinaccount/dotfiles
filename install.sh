#!/bin/bash
# Automated installer script
echo Installing Configuration files and VSCode Extensions

echo "Checking installed shells..."

if command -v zsh >/dev/null 2>&1; then
    ZSH_AVAILABLE=true
else
    ZSH_AVAILABLE=false
fi

if command -v bash >/dev/null 2>&1; then
    BASH_AVAILABLE=true
else
    BASH_AVAILABLE=false
fi

echo

echo "Available shells:"
$ZSH_AVAILABLE && echo "1) Zsh"
$BASH_AVAILABLE && echo "2) Bash"

echo
read -p "Choose your shell configuration: " choice
case $choice in
    1)
        if $ZSH_AVAILABLE; then
            echo "Installing Zsh configuration..."
            cp .zshrc ~/.zshrc
        else
            echo "Zsh is not installed!"
        fi
        ;;
    2)
        if $BASH_AVAILABLE; then
            echo "Installing Bash configuration..."
            cp .bashrc ~/.bashrc
        else
            echo "Bash is not installed!"
        fi
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

clear
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/Code/User
mkdir -p ~/.config/shell/

cp starship.toml ~/.config/
cp config.ghostty ~/.config/ghostty
cp vscode/settings.json ~/.config/Code/User
cp aliases ~/.config/shell

if command -v code >/dev/null 2>&1;
then
	xargs -a vscode/vscode_extensions.txt -L 1 code --install-extension
	echo Done!
else
	echo VSCode not installed, skipping extensions
	echo You can later retrieve or use the vscode_extensions.txt using:
	echo xargs -a vscode_extensions.txt -L 1 code --install-extension
fi
