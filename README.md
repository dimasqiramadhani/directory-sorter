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
Where `[OPTIONS]` can be:
1. `-h`, `--help`: Show the help message and exit.
2. `-s`, `--sort-by SIZE|TIME|NAME`: Sort directories by SIZE, TIME, or NAME (default is NAME).
3. `-r`, `--reverse`: Reverse the sort order.
4. `-l`, `--long-listing`: Use a detailed listing format (ls -l style).
5. `-t`, `--threshold SIZE`: Show directories larger than the specified SIZE (in bytes).
6. `-f`, `--filter NAME`: Filter directories by NAME (pattern).

## Usage

1. **List directories in the current directory** (default behavior):
   ```bash
   ./sort-listing-dirs.sh

2. **Sorted directory by size**:
   ```bash
   ./sort-listing-dirs.sh -s SIZE

3. **Sorted directories by SIZE and NAME**:
   ```bash
   ./list_dirs.sh -t 1048576 -s NAME

4. **Filter directories** containing 'project' in their name:
   ```bash
   ./list_dirs.sh -f project
   
## Installation

1. **Clone the repository** to your local machine:
   ```bash
   git clone https://github.com/dimasqiramadhani/directory-sorter.git
   cd directory-sorter

## Summary

The Directory Sorter Script is a flexible and efficient tool that allows you to easily list and organize directories on your system. With support for sorting directories by size, modification time, or name, as well as filtering by name pattern or size threshold, this script provides a simple way to automate the management of directories. It also allows for reverse sorting and detailed directory listings, making it a versatile choice for anyone working with directories on Linux or Unix-based systems.
