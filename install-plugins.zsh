#!/bin/zsh

# Get the oh my zsh custom plugins directory
zsh_custom_plugins_dir="$ZSH_CUSTOM/plugins"

# Define the repositories and their URLs
repositories=(
  "zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git"
  "zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git"
)

# Function to clone or update a Git repository
clone_or_update_repo() {
  local repo_name="$1"
  local repo_url="$2"
  local repo_dir="$zsh_custom_plugins_dir/$repo_name"

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
unset repositories zsh_custom_plugins_dir repo_info repo_name repo_url

echo "Script execution complete."
