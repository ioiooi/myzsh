#!/usr/bin/env zsh

plugins=(
  aws
  nvm
  npm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Skip all aliases, in lib files and enabled plugins
zstyle ':omz:*' aliases no
