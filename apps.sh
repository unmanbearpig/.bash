# Chruby
function chruby-init {
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
}

function chrub {
    if [ ! $GEM_PATH]; then
        PATH=/home/unmanbearpig/.gem/ruby/2.5.0/bin:$PATH
        export GEM_PATH=/home/unmanbearpig/.gem/ruby/2.5.0/:/usr/lib64/ruby/gems/2.5.0/
        export GEM_HOME=/home/unmanbearpig/.gem/ruby/2.5.0/
    fi
}

# Haskell

# PATH=$PATH:$HOME/.cabal/bin
# ESP SDK
export IDF_PATH=$HOME/projects/stuff/electronics/esp-sdk-poking/ESP8266_RTOS_SDK

# heroku cli
export SKIP_ANALYTICS=1

# Rails
alias bnudle=bundle
alias bundel=bundle
alias bnudel=bundle
alias rpsec=rspec
alias respec="spring rspec --only-failures"
alias heroku="TERM=dumb heroku"
