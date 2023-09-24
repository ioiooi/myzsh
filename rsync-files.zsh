#!/bin/zsh

# Prompt for confirmation to overwrite files
echo -n "Do you want to overwrite existing files? (y/n): "
read choice

if [ "$choice" != "y" ]; then
  echo "Script execution aborted."
  exit 0
fi

# Define a function for copying files with informative messages
copy_file() {
  source="$1"
  target="$2"

  # Copy the file or directory using rsync
  rsync -a "$source" "$target"
  echo "Copied: $(basename "$source") to $target."
}

# Get the absolute path to the directory containing this script
script_dir="$(cd "$(dirname "$0")" && pwd)"

# Define the files and their corresponding target paths
declare -A files=(
  ["$script_dir/.zshrc"]="$HOME/.zshrc"
  ["$script_dir/aliases.zsh"]="$ZSH_CUSTOM/aliases.zsh"
  ["$script_dir/environment.zsh"]="$ZSH_CUSTOM/environment.zsh"
  ["$script_dir/functions.zsh"]="$ZSH_CUSTOM/functions.zsh"
  ["$script_dir/extra.zsh"]="$ZSH_CUSTOM/extra.zsh"
)

# Loop through the files and copy them if needed
for source in ${(k)files}; do
  target="${files[$source]}"
  copy_file "$source" "$target"
done

# Cleanup: Unset variables and the associative array
unset -f copy_file
unset script_dir files source target 

echo "Script execution complete."
