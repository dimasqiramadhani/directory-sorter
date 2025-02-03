# Directory Sorter Script

This is a flexible Bash script for listing and sorting directories based on different criteria like size, time, or name. You can also filter directories by name and size threshold. The script is designed to be easy to use and configurable, and it can be used to sort directories in any specified location.

## Features:
- **Sort directories by size, time, or name.**
- **Reverse the sort order.**
- **Display detailed listing (`ls -l` style).**
- **Filter directories by name pattern (case-insensitive).**
- **Show directories larger than a specified size.**
- **Works in the current directory by default if no directory is provided.**

## General Syntax
```bash
   ./sort-listing-dirs.sh [OPTION] [DIRECTORY]
```

## Usage

1. **List directories in the current directory** (default behavior):
   ```bash
   # This will list directories in the current directory (since no directory is specified, it defaults to .).
   ./sort-listing-dirs.sh

2. **Sorted directory by size**:
   ```bash
   # This will list directories in the current directory sorted by size.
   ./sort-listing-dirs.sh -s SIZE

3. **Sorted directories by SIZE and NAME**:
   ```bash
   # This will show directories larger than 1MB sorted by name.
   ./list_dirs.sh -t 1048576 -s NAME

4. **Filter directories** containing 'project' in their name:
   ```bash
   # This will filter directories whose names contain the word "project".
   ./list_dirs.sh -f project
   
## Installation

1. **Clone the repository** to your local machine:
   ```bash
   git clone https://github.com/dimasqiramadhani/directory-sorter.git
   cd directory-sorter
