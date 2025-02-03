#!/bin/bash

# Function to display usage instructions
usage() {
  echo "Usage: $0 [OPTIONS] [DIRECTORY]"
  echo "Options:"
  echo "  -h, --help                Show this help message"
  echo "  -s, --sort-by SIZE|TIME|NAME  Sort directories by SIZE, TIME or NAME (default: NAME)"
  echo "  -r, --reverse             Reverse the sort order"
  echo "  -l, --long-listing        Use a detailed listing format"
  echo "  -t, --threshold SIZE      Show directories larger than SIZE (in bytes)"
  echo "  -f, --filter NAME         Filter directories by NAME (pattern)"
  exit 1
}

# Parsing command-line arguments
SORT_BY="NAME"
REVERSE=false
LONG_LISTING=false
THRESHOLD=0
FILTER=""
DIRECTORY="."

while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      usage
      ;;
    -s|--sort-by)
      SORT_BY="$2"
      shift 2
      ;;
    -r|--reverse)
      REVERSE=true
      shift
      ;;
    -l|--long-listing)
      LONG_LISTING=true
      shift
      ;;
    -t|--threshold)
      THRESHOLD="$2"
      shift 2
      ;;
    -f|--filter)
      FILTER="$2"
      shift 2
      ;;
    *)
      DIRECTORY="$1"
      shift
      ;;
  esac
done

# Verify if the directory exists
if [ ! -d "$DIRECTORY" ]; then
  echo "Error: $DIRECTORY is not a valid directory."
  exit 1
}

# Find directories larger than the threshold (if specified)
find_dirs() {
  find "$DIRECTORY" -maxdepth 1 -type d -size +"$THRESHOLD"c
}

# Apply name filter to directories
apply_filter() {
  if [ -n "$FILTER" ]; then
    grep -i "$FILTER"
  else
    cat
  fi
}

# Sorting and listing directories
sort_and_list() {
  case $SORT_BY in
    SIZE)
      SORT_OPTION="-S"
      ;;
    TIME)
      SORT_OPTION="-t"
      ;;
    NAME)
      SORT_OPTION="-n"
      ;;
    *)
      SORT_OPTION="-n"
      ;;
  esac

  if [ "$REVERSE" = true ]; then
    SORT_OPTION="$SORT_OPTION -r"
  fi

  if [ "$LONG_LISTING" = true ]; then
    find_dirs | apply_filter | xargs ls -ld $SORT_OPTION
  else
    find_dirs | apply_filter | xargs -n 1 basename | sort $SORT_OPTION
  fi
}

# Execute the main function
sort_and_list
