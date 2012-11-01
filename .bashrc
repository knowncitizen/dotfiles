# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#export JAVA_HOME=/usr/java/jdk1.6.0_35/jre

alias srm='srm -v -E'
function cdl { cd $1; ls;}

function prompt {
MINLENGTH=40
if [[ $MINLENGTH -lt $COLUMNS ]]; then
    LENGTH=$(($COLUMNS-$MINLENGTH))
else
    LENGTH=$MINLENGTH
fi
HALF="$(($LENGTH/2))"
if [ ${#PWD} -gt $(($LENGTH)) ]; then
    NEWPWD=`echo "${PWD:0:$(($HALF-3))}...${PWD:$((${#PWD}-$HALF)):$HALF}" | sed "s/\/home\/$USER/\~/"`
else
    NEWPWD=`echo "$PWD" | sed "s/\/home\/$USER/\~/"`
fi
if [ -r /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
    PS1="${RED}\u${LIGHT_GREEN}@${YELLOW}\h${LIGHT_GREEN}:${NO_COLOR}$NEWPWD$(__git_ps1 "{%s}")${WHITE}\$ ${NO_COLOR}"
else
    PS1="${RED}\u${LIGHT_GREEN}@${YELLOW}\h${LIGHT_GREEN}:${NO_COLOR}$NEWPWD${WHITE}\$ ${NO_COLOR}"
fi
PS2="> "
PS4="+ "
}

# Define some colors:
BLUE="\[\033[0;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_CYAN="\[\033[1;36m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
RED="\[\033[1;31m\]"
LIGHT_RED="\[\033[0;31m\]"
CYAN='\e[1;36m'

NO_COLOR="\[\033[0m\]"
case $TERM in
    xterm*|rxvt*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
esac

PROMPT_COMMAND=prompt

#increase bash history size
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

alias vi=vim
