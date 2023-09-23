# myzsh

## Prerequesites

### Install and set up zsh as default

See https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

1. Install `sudo apt install zsh`
1. Verify by running `zsh --version`
1. Make it the default `chsh -s $(which zsh)`
1. Log out and back in
1. Verify by running `echo $SHELL`


### Install oh my zsh
See https://github.com/ohmyzsh/ohmyzsh

Method	Command

Install via curl
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

or install via wget
```zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

## Edit `~/.zshrc`


Set the custom folder

```zsh
ZSH_CUSTOM=~/projects/myzsh
```

Remove the plugins

```
# plugins=(git)
```

## Custom commands or secrets

Add custom commands or secrets that should not be tracked by git to `extra.zsh` and `secrets.zsh`.

## Set up gitconfig

Run the `setup-git-symlinks.zsh` or `rsync-gitconfig.zsh` script.
