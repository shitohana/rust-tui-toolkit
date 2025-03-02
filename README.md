# rust-tui-toolkit

This repository contains some useful rust TUI utilities and install scripts to store all their config
files in the same place. All the config files are symlinked from their default locations.
Install script uses `brew` and `Zsh` and installs them, if they are not already present.

Contribute if you have suggestions on other tools, which could be included in this toolkit!

## Overview

This repository contains my personal configuration files (dotfiles) for various command-line tools. It's designed to be easily
deployed on new machines and to keep configurations in sync across multiple systems. To use custom configs, you can fork this repository
and modify the configuration files as needed.

## Tools Included

| Tool | Description |
|------|-------------|
| [Zsh & Oh My Zsh](https://ohmyz.sh/) | Shell with framework |
| [atuin](https://github.com/atuinsh/atuin) | Magical shell history |
| [bat](https://github.com/sharkdp/bat) | A `cat` clone with syntax highlighting |
| [fd](https://github.com/sharkdp/fd) | Modern replacement for `find` |
| [uv](https://github.com/astral-sh/uv) | Fast Python package manager |
| [gitui](https://github.com/gitui-org/gitui) | Terminal-based Git client |
| [pueue](https://github.com/Nukesor/pueue) | Task management tool |
| [rm-improved (rip)](https://github.com/nivekuil/rip) | Safer deletion tool |
| [eza](https://github.com/eza-community/eza) | Modern replacement for `ls` |
| [crabz](https://github.com/sstadick/crabz) | Fast compression/decompression tool |
| [yazi](https://github.com/sxyazi/yazi) | Terminal file manager |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter cd command |
| [ox](https://github.com/curlpipe/ox) | The simple but flexible text editor |
| [xsv](https://github.com/BurntSushi/xsv) | CSV processing toolkit |
| [wthrr](https://github.com/ttytm/wthrr-the-weathercrab) | Terminal weather app |

## Installation

### Prerequisites

- Git
- Bash

### Setup

1. Clone this repository:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

Run the installation script:

```bash
./install.sh
```

This will:

- Install Homebrew (if needed)
- Install required CLI tools
- Backup your existing configuration files
- Create symlinks to the new configuration files

### Manual Installation
If you prefer to install components individually:

1. Install the CLI tools:

```bash
bash install/01-cli-tools.sh
```

Set up configuration symlinks:

```bash
bash install/02-configs.sh
```

Structure
```
dotfiles/
├── bin/                  # Custom scripts
├── configs/              # Configuration files organized by tool
│   ├── atuin/            # Atuin configs
│   ├── bat/              # Bat configs
│   ├── fd/               # fd configs
│   ├── gitui/            # GitUI configs
│   ├── hosts/            # Host-specific configurations
│   ├── pueue/            # Pueue configs
│   ├── rip/              # rm-improved configs
│   ├── yazi/             # Yazi configs
│   ├── zoxide/           # Zoxide configs
│   └── zsh/              # Zsh configs
├── install/              # Installation scripts
│   ├── 00-homebrew.sh
│   ├── 01-cli-tools.sh
│   └── 02-configs.sh
├── install.sh            # Main installation script
└── README.md             # This documentation
```

### Customization
Host-specific Configurations
To add configurations specific to a particular machine:

1. Create a directory with your hostname in configs/hosts/
2. Add configuration files maintaining the same structure as they would be in your home directory
3. These files will be symlinked automatically during installation

### Updating
To update your dotfiles:
```bash
dotfiles-update
```
Or manually:
```bash
cd ~/dotfiles
git pull
./install.sh
```

### Backing Up
To back up your current configuration:
```bash
~/dotfiles/bin/backup-configs
```
To back up and commit to git:
```bash
~/dotfiles/bin/backup-configs --git
```
