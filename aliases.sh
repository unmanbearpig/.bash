# ssh with xterm-256color because many systems don't understand xterm-direct
alias ssh='TERM=xterm-256color ssh'

# Clone github repo
# made by chatgpt 3.5
function repoclone() {
  # Parse the repository URL from the command line argument
  url=$1

  # Remove .git extension, if present
  url=${url%.git}

  # Extract the username and repository name from the URL
  if [[ $url == *"github.com"* ]]; then
    regex="https:\/\/github.com\/(.*)\/(.*)"
    if [[ $url =~ $regex ]]; then
      username=${BASH_REMATCH[1]}
      repo=${BASH_REMATCH[2]}
    else
      echo "Invalid GitHub repository URL"
      return 1
    fi
    base_dir=github.com
  elif [[ $url == *"gitlab.com"* ]]; then
    regex="https:\/\/gitlab.com\/(.*)\/(.*)"
    if [[ $url =~ $regex ]]; then
      username=${BASH_REMATCH[1]}
      repo=${BASH_REMATCH[2]}
    else
      echo "Invalid GitLab repository URL"
      return 1
    fi
    base_dir=gitlab.com
  else
    echo "Unsupported repository URL"
    return 1
  fi

  # Clone the repository into the specified directory if it doesn't exist
  target_dir=~/software/$base_dir/$username/$repo
  if [ ! -d "$target_dir" ]; then
    mkdir -p ~/software/$base_dir/$username
    cd ~/software/$base_dir/$username
    git clone $url.git $repo
  fi

  # Change to the target directory
  cd $target_dir
}



# cd
function cd {
    builtin cd "$@"
    l
}

# ls
function l {
    echo "--- $(pwd)"
    CLICOLOR_FORCE=true ls -tch -- $@
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

# mkdir with subdirs and go there
function md {
    mkdir -p $@
    cd $@
}

# sort -- super slow without it
# alias sort="LC_ALL=C \sort"

# Hack for broken `clear` on macos that doen't clear the scrollback
function clear {
    # printf '\033[3J'
    printf '\033c'
}

alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias leds='surf http://192.168.0.111:7373/'
alias ncdu="ncdu --color=off"

alias fd="NO_COLOR=1 fd"
