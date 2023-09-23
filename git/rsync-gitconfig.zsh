#!/bin/zsh

# Get the absolute path to the directory containing this script
script_dir="$(cd "$(dirname "$0")" && pwd)"

# Define the files and their corresponding target paths
declare -A files=(
  ["$script_dir/.gitconfig"]="$HOME/.gitconfig"
  ["$script_dir/.git-templates"]="$HOME/.git-templates"
)

# Loop through the files and copy them if needed
for source in ${(k)files}; do
  target="${files[$source]}"
  if [ -e "$target" ]; then
    echo "File or directory ${source##*/} already exists in $HOME. Skipping."
  else
    # Copy the file or directory using rsync
    rsync -a "$source" "$target"
    echo "Copied ${source##*/} to $HOME."
  fi
done

# Cleanup: Unset variables and the associative array
unset script_dir files source target 

echo "Script execution complete."
