#!/usr/bin/env zsh

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# fs: Display human-readable file and directory sizes.
#
# Usage: fs [file/directory ...]
#
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# diff: Display color-coded word-level differences using 'git diff'.
#
# This function utilizes 'git diff' to display word-level differences between files,
# providing a color-coded output for added and removed words.
#
# Note: This function is available only if 'git' is installed.
#
# Usage:
#   diff file1 file2
#
if hash git &>/dev/null; then
	function diff() {
		git diff --no-index --color-words "$@";
	}
fi;

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# gcm: Shortcut for 'git commit -m'.
#
# This function is a shortcut for the 'git commit -m' command, allowing you to quickly
# create a commit with a specified commit message.
#
# Usage:
#   gcm <commit-message>
#
# Parameters:
#   <commit-message>: The message to be used for the commit.
#
# Example:
#   gcm "Fix typo in README"
#
function gcm {
  git commit -m "$*"
}

# git_amend_to_commit(): Amend current changes to a specific commit.
#
# This function takes a target commit as an argument and facilitates the process of amending
# current changes into the commit history. It creates a "fixup" commit with the changes and
# then performs an interactive rebase, combining the fixup commit with the specified commit.
#
# Usage:
#   git_amend_to_commit <target-commit>
#
# Parameters:
#   <target-commit>: The commit to which current changes should be amended.
#
# Example:
#   git_amend_to_commit abc123
#   git_amend_to_commit HEAD~3
#
git_amend_to_commit() {
	target_commit=$1
	git commit -m "Amend to commit $target_commit" --fixup=$target_commit
	git rebase -i --autosquash $target_commit~1
}
