#!/bin/zsh

# Get the absolute path to the directory containing this script
script_dir="$(cd "$(dirname "$0")" && pwd)"

# Define the files and their corresponding symlinks
declare -A files=(
  ["$script_dir/.gitconfig"]="$HOME/.gitconfig"
  ["$script_dir/.git-templates"]="$HOME/.git-templates"
  ["$script_dir/.gitignore"]="$HOME/.gitignore"
)

# Loop through the files and create symlinks if needed
for source in ${(k)files}; do
  target="${files[$source]}"
  if [ -L "$target" ] && [ -e "$target" ]; then
    echo "Symlink for ${source##*/} already exists."
  else
    # Create the symlink
    ln -s "$source" "$target"
    echo "Created symlink for ${source##*/} in $HOME."
  fi
done

# Cleanup: Unset variables and the associative array
unset script_dir files source target 

echo "Script execution complete."
