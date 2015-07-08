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

alias sr="spring rspec"
alias te="t && e"

export RAILS_TEMPLATE="~/projects/rails/rails_templates/unmbp.rb"

function rnew {
    project_path=$1
    project_name=`basename $1`
    cd `dirname $project_path`
    rails new $project_name --template=$RAILS_TEMPLATE --skip-test-unit
    cd $project_name
}
