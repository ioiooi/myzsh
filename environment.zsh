# Make vim the default editor.
export EDITOR='/usr/bin/vim';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Add /home/<user>/bin to PATH
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi