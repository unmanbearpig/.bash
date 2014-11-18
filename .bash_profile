export LANG="en_US.UTF-8"
export LANGUAGE=$LANG
export LC_ALL=$LANG

export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export CLICOLOR=1

export PATH=/usr/local/bin:$PATH
export EDITOR="emacsclient -t"

source "$HOME/.bashrc"
source "$HOME/.bash/apps.sh"
source "$HOME/.bash/aliases.sh"
source "$HOME/.bash/prompt.sh"

if [[ -f "$HOME/.bash/secrets.sh" ]]; then
    source "$HOME/.bash/secrets.sh"
fi

# bash completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
fi

source ~/.bash/completions/git-completion.bash

echo ---
