# TUI Tools Cheatsheets

## TOC

- [uv](#uv)
- [wthrr](#wthrr)
- [xsv](#xsv)
- [fd](#fd)
- [bat](#bat)
- [pueue](#pueue)
- [rip](#rip)
- [eza](#eza)
- [crabz](#crabz)
- [atuin](#atuin)
- [yazi](#yazi)
- [gitui](#gitui)
- [zoxide](#zoxide)
- [Oh My Zsh](#oh-my-zsh)

---

<a id="uv"></a>

## uv

**Description**: An extremely fast Python package and project manager written in Rust that can replace pip, pip-tools, pipx, poetry, pyenv, and more.

### Essential Commands

- `uv pip install <package>` - Install a package (10-100x faster than pip)
- `uv venv` - Create a virtual environment
- `uv pip sync requirements.txt` - Install dependencies from requirements file
- `uv pip compile requirements.in` - Compile dependencies to a locked file
- `uv add <package>` - Add a package to a project
- `uv run script.py` - Run a script in isolation
- `uv tool run <tool>` - Run a tool in an ephemeral environment (alias: `uvx`)
- `uv tool install <tool>` - Install a CLI tool
- `uv python install <version>` - Install a specific Python version

[Back to TOC](#toc)

---

<a id="wthrr"></a>

## wthrr (the weathercrab)

**Description**: A terminal weather app with a crab mascot that displays current weather conditions and forecasts.

### Essential Commands

- `wthrr` - Show weather for default location
- `wthrr <city>` - Check weather for specific location
- `wthrr -f w` - Show weekly forecast
- `wthrr -f d` - Show daily/hourly forecast
- `wthrr -u f,mph` - Use Fahrenheit and mph units
- `wthrr auto` - Auto-detect location based on IP
- `wthrr -s` - Save current config as default
- `wthrr -r` - Reset configuration

[Back to TOC](#toc)

---

<a id="xsv"></a>

## xsv

**Description**: Fast CSV command-line toolkit with indexing, slicing, analyzing, splitting and joining capabilities.

### Essential Commands

- `xsv headers <file.csv>` - Show CSV headers
- `xsv count <file.csv>` - Count rows in CSV
- `xsv slice -s <start> -e <end> <file.csv>` - Extract specific rows
- `xsv select <columns> <file.csv>` - Select specific columns
- `xsv search <pattern> <file.csv>` - Search CSV for pattern
- `xsv join <column> <file1.csv> <column> <file2.csv>` - Join CSV files
- `xsv sort -s <column> <file.csv>` - Sort CSV by column
- `xsv stats <file.csv>` - Show statistics for each column
- `xsv table <file.csv>` - Pretty-print CSV as table

[Back to TOC](#toc)

---

<a id="fd"></a>

## fd

**Description**: A simple, fast and user-friendly alternative to the `find` command with smart defaults.

### Essential Commands

- `fd <pattern>` - Search for files matching pattern
- `fd -e <ext>` - Search for files with specific extension
- `fd -t f <pattern>` - Search only for files
- `fd -t d <pattern>` - Search only for directories
- `fd -H <pattern>` - Include hidden files in search
- `fd -I <pattern>` - Include ignored files (from .gitignore)
- `fd -x <command>` - Execute command for each search result
- `fd -E <pattern>` - Exclude files/dirs matching pattern
- `fd <pattern> <path>` - Search in specific directory

[Back to TOC](#toc)

---

<a id="bat"></a>

## bat

**Description**: A `cat` clone with syntax highlighting, Git integration, and other features like line numbers and paging.

### Essential Commands

- `bat <file>` - Display a file with syntax highlighting
- `bat -n <file>` - Show line numbers only (no git status)
- `bat -p <file>` - Plain mode (no highlighting)
- `bat -l <language> <file>` - Force a specific language for syntax
- `bat -A <file>` - Show non-printable characters
- `bat -H <line> <file>` - Highlight specific line
- `bat <file1> <file2>` - Concatenate files
- `bat --theme=<theme>` - Use specific theme
- `bat --list-themes` - Show available themes
- `bat --style=<style>` - Set output style (e.g., plain, grid, header)

[Back to TOC](#toc)

---

<a id="pueue"></a>

## pueue

**Description**: A command-line task manager that allows for sequential and parallel execution of long-running tasks with pause/resume capability.

### Essential Commands

- `pueue add <command>` - Add a task to the queue
- `pueue start` - Start the daemon and all tasks
- `pueue pause` - Pause all running tasks
- `pueue status` - Display status of all tasks
- `pueue log <task_id>` - Show output of a task
- `pueue kill <task_id>` - Kill a specific task
- `pueue restart <task_id>` - Restart a task
- `pueue group add <name>` - Create a new task group
- `pueue parallel <num>` - Set number of parallel tasks
- `pueue clean` - Remove finished tasks from the list

[Back to TOC](#toc)

---

<a id="rip"></a>

## rip (rm-improved)

**Description**: A safe, ergonomic replacement for rm that sends deleted files to a graveyard directory to prevent accidental, permanent deletion.

### Essential Commands

- `rip <file>` - Send file to graveyard
- `rip dir1/ file1` - Delete multiple items
- `rip -u` - Undo the last deletion
- `rip -i` - Show file info before deleting
- `rip -s` - List files deleted from current directory
- `rip -su` - Restore all files shown by -s
- `rip -u /path/to/grave/file` - Restore specific file
- `rip -d` - Permanently delete the entire graveyard

[Back to TOC](#toc)

---

<a id="eza"></a>

## eza

**Description**: A modern, feature-rich replacement for `ls` with color highlighting, Git information, and extended file details.

### Essential Commands

- `eza` - List files (like ls)
- `eza -l` - Detailed list view
- `eza -T` - Show files as a tree
- `eza -a` - Show hidden files
- `eza --git` - Show git status
- `eza -l --icons` - Show with icons
- `eza -l --header` - Show header row
- `eza --color-scale=size` - Color files by size
- `eza -s size` - Sort by file size
- `eza -r` - Reverse sort order
- `eza --group-directories-first` - Directories at top

[Back to TOC](#toc)

---

<a id="crabz"></a>

## crabz

**Description**: A cross-platform, fast compression and decompression tool similar to pigz, but written in Rust.

### Essential Commands

- `crabz <file>` - Compress a file (to .gz by default)
- `crabz -d <file.gz>` - Decompress a file
- `crabz -p <num>` - Set number of compression threads
- `crabz -l <1-9>` - Set compression level (default: 6)
- `crabz -f <format>` - Specify format (gzip, bgzf, mgzip, zlib, deflate, snap)
- `crabz -o <output>` - Specify output file
- `crabz -I` - Perform compression/decompression in place
- `crabz < file > file.gz` - Use with stdin/stdout

[Back to TOC](#toc)

---

<a id="atuin"></a>

## atuin

**Description**: A magical shell history tool that stores your commands in a SQLite database and provides powerful search capabilities with context.

### Essential Commands

- `atuin register -u <username> -e <email>` - Register for sync
- `atuin import auto` - Import shell history
- `atuin sync` - Synchronize history across devices
- `atuin history` - List command history
- `atuin search <query>` - Search history
- `atuin search --exit 0` - Search for successful commands
- `atuin stats` - Show command statistics
- `atuin history list` - Show recent history
- `atuin search --before "yesterday"` - Time-based search
- `atuin search --after "2 weeks ago"` - Time-based search

[Back to TOC](#toc)

---

<a id="yazi"></a>

## yazi

**Description**: A fast, feature-rich terminal file manager with async I/O, image previews, and powerful plugins.

### Essential Commands

- `yazi` - Start the file manager
- `h j k l` - Navigate left/down/up/right
- `f` - Filter files in current directory
- `s` - Search file or directory
- `space` - Toggle selection
- `tab` - Toggle preview
- `a` - Create new file/directory
- `d` - Delete selected items
- `c` - Copy selected items
- `x` - Cut selected items
- `p` - Paste items
- `q` - Quit yazi

[Back to TOC](#toc)

---

<a id="gitui"></a>

## gitui

**Description**: A terminal-based GUI client for Git with keyboard-only controls and an intuitive interface.

### Essential Commands

- `gitui` - Launch GitUI in the current repository
- `arrow keys` - Navigate between panels
- `Enter` - Select/expand item
- `c` - Commit changes
- `a` - Stage/unstage selected file or hunk
- `shift+s` - Stash changes
- `b` - Open branch menu
- `p` - Open push/pull menu
- `u` - Open upstream menu
- `?` - Show help
- `q` - Quit or go back

[Back to TOC](#toc)

---

<a id="zoxide"></a>

## zoxide

**Description**: A smarter cd command that learns your habits and allows you to jump to frequently used directories quickly.

### Essential Commands

- `z foo` - Jump to directory matching "foo"
- `z foo bar` - Jump to directory matching "foo" and "bar"
- `z foo/` - Jump to subdirectory starting with "foo"
- `zi foo` - Interactive selection using fzf
- `z -` - Jump to previous directory
- `z ..` - Jump to parent directory
- `zoxide add <path>` - Add path to database
- `zoxide remove <path>` - Remove path from database
- `zoxide query <keywords>` - Search for paths
- `zoxide import from=<name> <path>` - Import history from other tools

[Back to TOC](#toc)

---

## Oh My Zsh

**Description**: A framework for managing zsh configuration that includes plugins, themes, and helpful functions.

### Essential Commands

- `omz` - Oh My Zsh management tool
- `omz update` - Update Oh My Zsh
- `omz theme list` - List available themes
- `omz theme set <theme>` - Change theme
- `omz plugin list` - List active plugins
- `omz plugin enable <plugin>` - Enable plugin
- `omz plugin disable <plugin>` - Disable plugin
- `omz doctor` - Diagnose issues
- `omz reload` - Reload Oh My Zsh
- `omz uninstall` - Uninstall Oh My Zsh

[Back to TOC](#toc)
