#!/bin/bash
# Define a simple array of tools and commands
# Format: "package:command"
tools="uv:uv wthrr:wthrr xsv:xsv fd:fd bat:bat pueue:pueue rm-improved:rip eza:eza crabz:crabz atuin:atuin yazi:yazi gitui:gitui zoxide:zoxide ox:ox"

# Check tools installation status
installed_tools=""
to_install=""

for entry in $tools; do
    # Split the entry by the colon
    pkg=$(echo "$entry" | cut -d':' -f1)
    cmd=$(echo "$entry" | cut -d':' -f2)

    if which "$cmd" > /dev/null 2>&1; then
    installed_tools="$installed_tools $cmd"
    else
    to_install="$to_install $pkg"
    fi
done

# Report already installed tools
if [ -n "$installed_tools" ]; then
    echo "The following tools are already installed and will be skipped:"
    for tool in $installed_tools; do
    echo "- $tool"
    done
    echo
fi

# Check if there are any tools to install
if [ -z "$to_install" ]; then
    echo "All tools are already installed. Nothing to install."
else
    # Create Brewfile only for tools that need to be installed
    echo "The following tools will be installed:"
    cat > Brewfile << 'BREWFILE'
    # CLI tools
BREWFILE

    for pkg in $to_install; do
        case "$pkg" in
        "uv")
            echo "brew \"uv\" # Python package manager written in Rust" >> Brewfile
            echo "- uv (Python package manager written in Rust)"
            ;;
        "wthrr")
            echo "brew \"wthrr\" # Terminal weather app" >> Brewfile
            echo "- wthrr (Terminal weather app)"
            ;;
        "xsv")
            echo "brew \"xsv\" # CSV processing tool" >> Brewfile
            echo "- xsv (CSV processing tool)"
            ;;
        "fd")
            echo "brew \"fd\" # Alternative to 'find'" >> Brewfile
            echo "- fd (Alternative to 'find')"
            ;;
        "bat")
            echo "brew \"bat\" # Cat clone with syntax highlighting" >> Brewfile
            echo "- bat (Cat clone with syntax highlighting)"
            ;;
        "pueue")
            echo "brew \"pueue\" # Task management for shell commands" >> Brewfile
            echo "- pueue (Task management for shell commands)"
            ;;
        "rm-improved")
            echo "brew \"rm-improved\" # Safe deletion tool (rip)" >> Brewfile
            echo "- rip (Safe deletion tool)"
            ;;
        "eza")
            echo "brew \"eza\" # Modern replacement for ls" >> Brewfile
            echo "- eza (Modern replacement for ls)"
            ;;
        "crabz")
            echo "brew \"crabz\" # Fast compression/decompression tool" >> Brewfile
            echo "- crabz (Fast compression/decompression tool)"
            ;;
        "atuin")
            echo "brew \"atuin\" # Shell history search tool" >> Brewfile
            echo "- atuin (Shell history search tool)"
            ;;
        "yazi")
            echo "brew \"yazi\" # Terminal file manager" >> Brewfile
            echo "- yazi (Terminal file manager)"
            ;;
        "gitui")
            echo "brew \"gitui\" # Terminal-based Git GUI" >> Brewfile
            echo "- gitui (Terminal-based Git GUI)"
            ;;
        "zoxide")
            echo "brew \"zoxide\" # Smarter cd command" >> Brewfile
            echo "- zoxide (Smarter cd command)"
            ;;
        "ox")
            echo "brew \"ox\" # Text editor" >> Brewfile
            echo "- ox (Text editor)"
            ;;
        esac
    done

    echo
    echo "Installing tools using Homebrew..."
    if brew bundle; then
        echo "Installation complete!"
    else
        echo "Error: Installation failed. Please check the output above for details."
        exit 1
    fi
fi
