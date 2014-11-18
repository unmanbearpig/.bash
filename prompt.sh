set_prompt () {
    Last_Code=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'
    Arrow=$'\xE2\x96\xB8'

    if [[ $Last_Code == 0 ]]; then
        Last_Command_Result="$Green$Last_Code$Reset"
    else
        Last_Command_Result="$Red$Last_Code$Reset"
    fi

    PROMPT_DIRTRIM=2

    PS1="$White$Arrow $Last_Command_Result $White\w$Reset \$ $White"
}

PROMPT_COMMAND='set_prompt'

# resets color after enter was pressed
trap 'echo -ne "\e[0m"' DEBUG
