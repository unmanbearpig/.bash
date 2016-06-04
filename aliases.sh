# cd
function cd {
    builtin cd "$@"
    l
}

# ls
function l {
    pwd
    echo ---
    CLICOLOR_FORCE=true ls -tch -- $@
}

function ll {
    pwd
    echo ---
    CLICOLOR_FORCE=true ls -ltch -- $@
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

# ping 8.8.8.8
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


# mkdir with subdirs and go there
function md {
    mkdir -p $@
    cd $@
}

alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias pk="pkill"
alias la="ls -a"
