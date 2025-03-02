#!/bin/bash

echo "========= Command Line Tools Setup ========="
echo "This script will set up Homebrew, Oh My Zsh, and various CLI tools."
echo

# Check if Homebrew is installed
if command -v brew &> /dev/null; then
    echo "✅ Homebrew is already installed."
else
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for the current session if it was just installed
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    elif [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi

    if ! command -v brew &> /dev/null; then
        echo "❌ Homebrew installation failed or PATH not set correctly."
        echo "Please restart your terminal and try running this script again."
        exit 1
    else
        echo "✅ Homebrew installed successfully."
    fi
fi

# Check if Oh My Zsh is installed
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo "✅ Oh My Zsh is already installed."
else
    echo "📦 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        echo "✅ Oh My Zsh installed successfully."
    else
        echo "❌ Oh My Zsh installation failed."
        exit 1
    fi
fi

cp "$DOTFILES_DIR/configs/zsh/.zshrc-template.sh" "$DOTFILES_DIR/configs/zsh/.zshrc"
(echo "export DOTFILES_DIR=$DOTFILES_DIR"; cat ~/.zshrc) > temp_file && cp temp_file ~/.zshrc && rm temp_file
