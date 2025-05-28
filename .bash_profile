export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LS_COLORS="" 

# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

SPACE="\ "

export VIRTUAL_ENV_DISABLE_PROMPT=1

spwd () {
    local pwd_length=20
    local full_pwd="${PWD}"
    local pwd_chars=${#full_pwd}
    local FGRN=$'\033[32m'
    local FMAG=$'\033[35m'
    local RS=$'\033[0m'

    if [ "$pwd_chars" -le "$pwd_length" ]; then
        echo "$full_pwd"
    else
        echo "${FGRN}...${FMAG}${full_pwd: -17}"
    fi
}

# --- PROMPT_COMMAND logic ---
PROMPT_COMMAND='
    last_histnum=$histnum
    histnum=$(history 1 | awk "{print \$1}")
    if [[ "$histnum" == "$last_histnum" ]]; then
        just_enter=true
    else
        just_enter=false
    fi
'

PS1="\$(
    RET=\$?;
    
    if [[ \"\$just_enter\" == true ]]; then 
        echo -n ${RS}${FCYN} ● ${RS}; 
    else
        if [ -n \"\$VIRTUAL_ENV\" ]; then
            echo -n ${FCYN}[${RS}${FRED}\$(basename \"\$VIRTUAL_ENV\")${RS}${FCYN}]${SPACE};
            echo -n [${RS}${FMAG}\u@\H:\$(spwd)${RS}${FCYN}];
        else
            echo -n ${FCYN}[${RS}${FMAG}\u@\H:\$(spwd)${RS}${FCYN}];
        fi
        echo -n ${SPACE}${RS}${FCYN}[${RS}\[\033[35m\]jobs:${FRED}\j${RS}${FCYN}];
        echo '${RS}${FCYN}';
        if [ \$RET = "0" ]; then
            echo ${RS}${FCYN} ● ${RS};
        else
            echo -n ${RS}${FRED} ● ${RS};
        fi;
    fi;
)"

PS2="\$(
    echo '$RS$FGRN ● $RS';
)"
