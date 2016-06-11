
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.bash/gary-bernhardt/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/.bash/bin
export PATH=$PATH:~/.gohome/bin
export EDITOR="emacsclient -t -a ''"

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
