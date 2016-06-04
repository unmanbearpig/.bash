function _clean_up_session_name {
    echo $1 | tr . -
}

function _open_tmux {
    session_name=$(_clean_up_session_name $1)
    if [[ $TMUX ]]; then
        tmux switch-client -t $session_name
    else
        tmux new-session -A -s $session_name
    fi
}

function t {
    if [[ $# == 0 ]]; then
        session_name=`basename $PWD`
    elif [[ $# == 1 ]]; then
        if [[ -d $1 ]]; then
            cd $1
            session_name=`basename $PWD`
        else
            session_name=$1
        fi
    fi

    session_name=`_clean_up_session_name "$session_name"`

    _open_tmux $session_name
}

function _tmux_pick_session {
    tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse
}

function ts {
    tmux attach -t `_tmux_pick_session`
}

alias ta="tmux attach"
