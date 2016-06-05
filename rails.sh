alias bnudle=bundle
alias bundel=bundle
alias bnudel=bundle

alias rpsec=rspec

function rt {
    if [[ $# == 0 ]]; then
        time bundle exec rake test
    else
        time bundle exec rake test TEST=$@
    fi
}

alias sr="spring rspec"
alias te="t && e"

alias r="rails"

alias respec="spring rspec --only-failures"
alias rs="respec --fail-fast"

export RAILS_TEMPLATE="~/projects/rails/rails_templates/unmbp.rb"

function rnew {
    project_path=$1
    project_name=`basename $1`
    cd `dirname $project_path`
    rails new $project_name --template=$RAILS_TEMPLATE --skip-test-unit
    cd $project_name
}

_capybara_last_html_screenshot() {
    echo "./tmp/capybara/`ls -tc tmp/capybara/ | grep .html | head -n1`"
}

_capybara_last_html_screenshot_in_ascii() {
    links -source "$(_capybara_last_html_screenshot)"
}

capybara_last_error() {
    if [ -t 1 ]; then
        _capybara_last_html_screenshot_in_ascii | head -n35
    else
        _capybara_last_html_screenshot_in_ascii
    fi
}

routes() {
    if [[ $# == 0 ]]; then
        spring rake routes | awk '{ print $1 " " $3 " " $4 }' | grep -v -E '[A-Z]+' | column -t
    else
        spring rake routes | ag $@ | awk '{ print $1 " " $3 " " $4 }' | grep -v -E '[A-Z]+' | column -t
    fi
}

alias capyerr=capybara_last_error
alias rc="spring rails c"
