# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{path,extra,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
if [ -f ~/src/z/z.sh ]; then
    . ~/src/z/z.sh
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# save all lines of a multiple-line command in the same history entry
shopt -s cmdhist;

# append history for each tab instead of overwriting.
shopt -s histappend;

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize;

# minor errors in the spelling of a directory component in a cd command will be corrected
shopt -s cdspell;

##
## Completion…
##

# bash completion.
which brew > /dev/null 2>&1
brew_not_found=$?
if [ $brew_not_found -eq 0 ]; then
    if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
        . $(brew --prefix)/share/bash-completion/bash_completion
    fi
    # homebrew completion
    source `brew --repository`/Library/Contributions/brew_bash_completion.sh
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# My group should be able to read/write my files
umask 002
