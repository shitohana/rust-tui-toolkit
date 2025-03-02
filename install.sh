#!/bin/bash

set -e

# Get the absolute path to the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Dotfiles Installation ==="
echo "Installing dotfiles from: $DOTFILES_DIR"

# Run installation scripts in order
for script in "$DOTFILES_DIR"/install/[0-9]*.sh; do
  if [ -f "$script" ]; then
    echo "Running $script..."
    source "$script"
    echo "Completed $script"
  fi
done

chmod +x "$DOTFILES_DIR"/bin/update-dotfiles

echo
echo "=== Installation Complete ==="
echo "✅ Your dotfiles are now installed and configured."
echo
echo "To apply changes immediately, run:"
echo "  source ~/.zshrc"
