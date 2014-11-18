
function g {
    if [[ $# > 0 ]]
    then
        git $@
    else
        git status
    fi
}


function e {
    if [[ $# > 0 ]]
    then
        emacsclient -t $@
    else
        emacsclient -t .
    fi
}

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
        tmux switch-client -t $1
    else
        if tmux has-session -t $SESSION_NAME 2>/dev/null; then
            tmux attach -t $SESSION_NAME
        else
            tmux new-session -s $SESSION_NAME
        fi
    fi
}
