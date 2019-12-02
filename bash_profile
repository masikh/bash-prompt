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

spwd () {
	set $PWD
	pwd_length=14
	pwd_symbol="..."
	newPWD="${PWD}"
	if [ $(echo -n $newPWD | wc -c | tr -d " ") -gt $pwd_length ]
	then
		newPWDB=$(echo -n $newPWD | awk -F '/' '{print $1 "/" $2 "/."}')
	       	NF=$(echo -n $newPWD | awk -F '/' '{print NF-3 "./"}')
	       	newPWDE=$(echo -n $newPWD | awk -F '/' '{print $(NF)}')
		newPWD=$newPWDB$NF$newPWDE
	fi
	echo $newPWD
}

PS1="\$(
    RET=\$?;
    echo -n $FRET$RS$FCYN\┌\($RS$FMAG\u@\H$RS$FCYN\);
    echo -n -$RS$FCYN\($RS\[\033[35m\]jobs:\j$RS$FCYN\);
    echo -n -$RS$FCYN\($RS$FMAG\$(spwd)$RS$FCYN\)
    echo -n -\($RS$FMAG\$(ls -1 | wc -l | sed 's: ::g') files,
    echo -n \$(ls -lah | grep -m 1 total | sed 's/total //');
    echo 'b$RS$FCYN)'
    echo -n '$RS$FCYN';
    echo -n $'└';
    echo -n '>$RS$FRED \!';
    if [ \$RET = "0" ]; then 
        echo $RS$FCYN ● $RS; 
    else 
        echo -n $RS$FRED ● $RS
    fi;
)"

PS2="\$(
	RET=\$?;
	[ \$RET = '0' ] && echo '$RS$FCYN└> ● $RS' || echo '$RS$FCYN└>$RS$FRED ● $RS';
)"
