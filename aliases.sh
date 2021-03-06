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

char_stats() {
    path=.
    if [[ $# > 0 ]]; then
        path="$1"
    fi

    pattern='*.rb'
    if [[ $# > 1 ]]; then
        pattern="$2"
    fi

    find "$path" -name "$pattern" | xargs cat | fold -w1 | gsort --parallel=8 | uniq -c | gsort -n --parallel=8
}

alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias pk="pkill"
alias la="ls -a"
alias list_projects="ls -d ~/projects/stuff/*/ ~/projects/work/*/*/"

# cd into project
cdp() {
    if [[ $# -gt 0 ]]; then
        cd "$(list_projects | fzf -1 -e -q $@)"
    else
        cd "$(list_projects | fzf -e)"
    fi
}

watchfs() {
    watchmedo shell-command --ignore-directories --recursive --command="$1" .
}
