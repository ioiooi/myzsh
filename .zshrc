# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="steeef"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Skip all aliases, in lib files and enabled plugins
zstyle ':omz:*' aliases no

source $ZSH/oh-my-zsh.sh