# cd
function cd {
    builtin cd $@
    l
}

# ls
function l {
    pwd
    echo ---
    ls $@
}

# git
function g {
    if [[ $# > 0 ]]
    then
        git $@
    else
        git status
    fi
}

# emacs
function e {
    if [[ $# > 0 ]]
    then
        emacsclient -a '' -t $@
    else
        emacsclient -a '' -t .
    fi
}

# ping
function p8 {
    ping 8.8.8.8
}

# ps ax | ag something
function psax {
    ps ax | ag $@
}

function psaux {
    ps aux | ag $@
}

# tmux
function t {
    if [[ $# == 0 ]]; then
        SESSION_NAME=`basename $PWD`
    elif [[ $# == 1 ]]; then
        if [[ -d $1 ]]; then
            cd $1
            SESSION_NAME=`basename $PWD`
        else
            SESSION_NAME=$1
        fi
    fi

    if [[ $TMUX ]]; then
        tmux switch-client -t $SESSION_NAME
    else
        tmux new-session -A -s $SESSION_NAME
    fi
}

# mkdir with subdirs and go there
function md {
    mkdir -p $@
    cd $@
}

alias bnudle=bundle
