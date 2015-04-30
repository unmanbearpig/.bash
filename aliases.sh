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

alias bnudle=bundle
alias bundel=bundle
alias bnudel=bundle

function rt {
    if [[ $# == 0 ]]; then
        time bundle exec rake test
    else
        time bundle exec rake test TEST=$@
    fi
}

alias sr="spring rake test"
