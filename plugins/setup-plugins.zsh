#!/bin/zsh

# Get the absolute path to the directory containing this script
script_dir="$(cd "$(dirname "$0")" && pwd)"

# Define the repositories and their URLs
repositories=(
  "zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git"
  "zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git"
)

# Function to clone or update a Git repository
clone_or_update_repo() {
  local repo_name="$1"
  local repo_url="$2"
  local repo_dir="$script_dir/$repo_name"

  if [ -d "$repo_dir" ]; then
    echo "Updating $repo_name..."
      (cd "$repo_dir" && git pull)
  else
    echo "Cloning $repo_name..."
    git clone "$repo_url" "$repo_dir"
  fi
}

# Loop through the repositories and clone/update them
for repo_info in "${repositories[@]}"; do
  repo_name="${repo_info%% *}"
  repo_url="${repo_info#* }"
  clone_or_update_repo "$repo_name" "$repo_url"
done

# Cleanup: Unset the function and variables
unset -f clone_or_update_repo
unset repositories script_dir repo_info repo_name repo_url

echo "Script execution complete."
