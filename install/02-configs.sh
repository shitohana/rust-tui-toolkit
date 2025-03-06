#!/bin/bash

set -e

echo "Setting up configuration symlinks..."

# Get the absolute path to the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Define a function to create symlinks with backups
create_symlink() {
    local source="$1"
    local target="$2"

    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target")"

    # Backup existing file if it exists and is not a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        local backup="$target.backup.$(date +%Y%m%d%H%M%S)"
        echo "Backing up $target to $backup"
        mv "$target" "$backup"
    fi

    # Remove existing symlink if it exists
    if [ -L "$target" ]; then
        rm "$target"
    fi

    # Create symlink
    echo "Creating symlink: $target -> $source"
    ln -sf "$source" "$target"
}

# Create necessary directories - using individual mkdir commands for bash < 4 compatibility
mkdir -p ~/.config/atuin
mkdir -p ~/.config/bat
mkdir -p ~/.config/fd
mkdir -p ~/.config/gitui
mkdir -p ~/.config/pueue
mkdir -p ~/.config/yazi
mkdir -p ~/.config/zoxide
mkdir -p ~/.config/oh-my-zsh/custom
mkdir -p ~/.local/bin

# Zsh configurations
create_symlink "$DOTFILES_DIR/configs/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/configs/zsh/.zshenv" "$HOME/.zshenv"
create_symlink "$DOTFILES_DIR/configs/zsh/custom/plugins" "$HOME/.oh-my-zsh/custom/plugins"
create_symlink "$DOTFILES_DIR/configs/zsh/custom/themes" "$HOME/.oh-my-zsh/custom/themes"
create_symlink "$DOTFILES_DIR/configs/zsh/custom/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
create_symlink "$DOTFILES_DIR/configs/zsh/custom/functions.zsh" "$HOME/.oh-my-zsh/custom/functions.zsh"
create_symlink "$DOTFILES_DIR/configs/zsh/custom/path.zsh" "$HOME/.oh-my-zsh/custom/path.zsh"

# Atuin configuration
create_symlink "$DOTFILES_DIR/configs/atuin/config.toml" "$HOME/.config/atuin/config.toml"

# Bat configuration
create_symlink "$DOTFILES_DIR/configs/bat/config" "$HOME/.config/bat/config"
create_symlink "$DOTFILES_DIR/configs/bat/themes" "$HOME/.config/bat/themes"

# fd configuration
create_symlink "$DOTFILES_DIR/configs/fd/ignore" "$HOME/.config/fd/ignore"

# GitUI configuration
create_symlink "$DOTFILES_DIR/configs/gitui/key_bindings.ron" "$HOME/.config/gitui/key_bindings.ron"
create_symlink "$DOTFILES_DIR/configs/gitui/theme.ron" "$HOME/.config/gitui/theme.ron"

# Pueue configuration
create_symlink "$DOTFILES_DIR/configs/pueue/pueue.yml" "$HOME/.config/pueue/pueue.yml"

# Yazi configuration
create_symlink "$DOTFILES_DIR/configs/yazi/yazi.toml" "$HOME/.config/yazi/yazi.toml"
create_symlink "$DOTFILES_DIR/configs/yazi/keymap.toml" "$HOME/.config/yazi/keymap.toml"
create_symlink "$DOTFILES_DIR/configs/yazi/theme.toml" "$HOME/.config/yazi/theme.toml"

# Zoxide configuration (if any specific files)
create_symlink "$DOTFILES_DIR/configs/zoxide/config" "$HOME/.config/zoxide/config"

# uv configuration
create_symlink "$DOTFILES_DIR/configs/uv/config.toml" "$HOME/.config/uv/config.toml"

# rm-improved configuration
create_symlink "$DOTFILES_DIR/configs/rip/config" "$HOME/.config/rip/config"

# ox config
create_symlink "$DOTFILES_DIR/configs/ox/.oxrc" "$HOME/.oxrc"

# helix config
create_symlink "$DOTFILES_DIR/configs/helix/config.toml" "$HOME/.config/helix/config.toml"

# Custom scripts
for script in "$DOTFILES_DIR/bin/"*; do
    if [ -f "$script" ]; then
        script_name=$(basename "$script")
        create_symlink "$script" "$HOME/.local/bin/$script_name"
        chmod +x "$HOME/.local/bin/$script_name"
    fi
done

# Host-specific configurations
hostname=$(hostname)
if [ -d "$DOTFILES_DIR/configs/hosts/$hostname" ]; then
    echo "Applying host-specific configurations for $hostname..."

    find "$DOTFILES_DIR/configs/hosts/$hostname" -type f | while read -r file; do
        rel_path=$(echo "$file" | sed "s|$DOTFILES_DIR/configs/hosts/$hostname/||")
        target="$HOME/$rel_path"
        create_symlink "$file" "$target"
    done
fi

# Zsh plugins installation
if cd "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"; then git pull; else git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"; fi
if cd "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"; then git pull; else git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions; fi
if cd "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"; then git pull; else git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting; fi
if cd "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"; then git pull; else git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search; fi
if cd "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use"; then git pull; else git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use; fi
if cd "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions"; then git pull; else git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions; fi


echo "Configuration symlinks setup complete!"
