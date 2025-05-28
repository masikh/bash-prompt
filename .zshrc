FRED=$'%F{red}'
FGRN=$'%F{green}'
FCYN=$'%F{cyan}'
FMAG=$'%F{magenta}'
FYEL=$'%F{yellow}'
RS=$'%f%k%b%u'
SPACE=" "

export VIRTUAL_ENV_DISABLE_PROMPT=1

spwd() {
    local pwd_length=20
    local full_pwd="${PWD}"
    local pwd_chars=${#full_pwd}
    if (( pwd_chars <= pwd_length )); then
        print -n "$full_pwd"
    else
        print -n "${FGRN}...${FMAG}${full_pwd[-17,-1]}"
    fi
}

precmd() {
    RETVAL=$?  # bewaar exitcode van vorige commando
    LAST_HISTNO=$HISTNO
    HISTNO=$(history | awk {'print $1'} | tail -1)  # simpele hist-tracking
    if [[ "$HISTNO" == "$LAST_HISTNO" ]]; then
        JUST_ENTER=true
    else
        JUST_ENTER=false
    fi
}

setopt PROMPT_SUBST

PROMPT='$(
    if [[ $JUST_ENTER == true ]]; then 
        print -n "${FCYN} ● ${RS}"
    else
        if [[ -n "$VIRTUAL_ENV" ]]; then
            print -n "${FCYN}[${RS}${FRED}$(basename $VIRTUAL_ENV)${RS}${FCYN}]${SPACE}"
        fi
        print -n "${FCYN}[${RS}${FMAG}%n@%m:$(spwd)${RS}${FCYN}]"
        print "${SPACE}${FCYN}[${RS}${FMAG}jobs:${FRED}%j${RS}${FCYN}]"
        if [[ $RETVAL == 0 ]]; then
            print -n "${FCYN} ● ${RS}"
        else
            print -n "${FRED} ● ${RS}"
        fi
    fi
)'

PS2='$(
    print -n "${FGRN} ● ${RS}"
)'
