export LANG="en_US.UTF-8"
export LANGUAGE=$LANG
export LC_ALL=$LANG

export CLICOLOR=1

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.bash/gary-bernhardt/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/.bash/bin
export PATH=$PATH:~/.gohome/bin
export EDITOR="emacsclient -t -a ''"

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

export HISTSIZE=2000
export HISTFILESIZE=2000

export CDPATH=~/projects:$CDPATH

source "$HOME/.bashrc"
source "$HOME/.bash/apps.sh"
source "$HOME/.bash/aliases.sh"
source "$HOME/.bash/prompt.sh"
source "$HOME/.bash/tmux.sh"
source "$HOME/.bash/rails.sh"

if [[ -f "$HOME/.bash/secrets.sh" ]]; then
    source "$HOME/.bash/secrets.sh"
fi

# bash completion
if command -v brew >/dev/null && [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
fi

source ~/.bash/completions/git-completion.bash

l
echo ---
