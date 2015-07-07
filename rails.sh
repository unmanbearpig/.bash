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
alias te="t && e"
