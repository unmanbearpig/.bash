is_remote () {
    if [ "$SSH_CONNECTION" ]; then
        return 0;
    fi

    return 1;
}

set_prompt () {
    Last_Code=$? # Must come first!
    Dark='\[\e[30m\]'
    Yellow='\[\e[01;33m\]'
    Blue='\[\e[01;34m\]'
    Purple='\[\e[01;35m\]'
    Grey='\[\e[01;36m\]'
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

    Hostname=''
    if is_remote; then
        Hostname="@$(hostname) "
    fi

    PS1="$Last_Command_Result $Hostname$White$Arrow $Purple\W$Reset $White"
}

PROMPT_COMMAND='set_prompt'

# resets color after enter was pressed
trap 'echo -ne "\e[0m"' DEBUG
