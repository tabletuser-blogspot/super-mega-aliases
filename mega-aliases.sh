# collection of useful aliases
# ~/.bashrc: executed by bash(1) for non-login shells.
# nano ~/.bash_aliases  then copy paste all these lines
# source ~/.bash_aliases
# or aliases

alias cs='cd;ls'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# alias became avail at saving, and if you make some mistake it will advert you #
# https://askubuntu.com/questions/17536/how-do-i-create-a-permanent-bash-alias #
alias aliases="xdg-open ~/.bash_aliases && source ~/.bash_aliases"

alias l='ls $LS_OPTIONS -lAh'

alias grep='grep --color=auto'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'

# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

# remove Disk /dev/loop only show actual disk
alias fdsk1="sudo fdisk -l | sed -e '/Disk \/dev\/loop/,+5d'"
alias lsblk1="lsblk | grep -v ^loop"
alias blkid1='blkid | grep -v ^/dev/loop'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
	alias reboot='sudo reboot'
	alias update='sudo apt-get upgrade'
fi


# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias cpv='rsync -ah --info=progress2'

alias c='clear'
alias h='history'
alias hg='history | grep $1'

# apt
alias acs="apt-cache search"
alias acp="apt-cache policy"
alias acsh="apt-cache show"
alias agi="apt-get install"
alias aga="apt-get autoremove"

# Opens the current directory in file explorer #
# alias exp='nautilus .' #
alias exp='dolphin .'

# px firefox
alias px='ps aux | grep '

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# update on one command
alias updater='sudo apt-get update && time sudo apt-get upgrade -y && sudo time apt-get dist-upgrade -y && sudo snap refresh'

# become root #
alias root='sudo -i'
alias su='sudo -i'

# system memory, cpu usage, and gpu memory info quickly ##
## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##

## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

## this one saved by butt so many times ##
alias wget='wget -c'

# top is atop, just like vi is vim
alias top='btop'


# A redditor once posted this alias #
# Uses Google text-to-speech to speak text. I use it all the time. Example: gsay hello world #
gsay() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }


# ARCHIVE EXTRACTION
# usage: ex <file>
ex () {
  if [ -f $1 ] ; then
	case $1 in
  	*.tar.bz2)	tar xjf $1	;;
  	*.tar.gz) 	tar xzf $1	;;
  	*.tar.xz) 	tar xf $1 	;;
  	*.tar)    	tar xf $1 	;;
  	*.tar.zst)	uzstd $1  	;;
  	*.bz2)    	bunzip2 $1	;;
  	*.rar)    	unrar x $1	;;
  	*.gz)     	gunzip $1 	;;
  	*.tbz2)   	tar xjf $1	;;
  	*.tgz)    	tar xzf $1	;;
  	*.zip)    	unzip $1  	;;
  	*.Z)      	uncompress $1 ;;
  	*.7z)     	7z x $1   	;;
  	*.deb)    	ar x $1   	;;
  	*)	echo "'$1' cannot be extracted via ex()" ;;
	esac
  else
	echo "'$1' is not a valid file"
  fi
}



# make dir and cd into i
md () {
    	mkdir -p $1
    	cd $1
}

## Next two get error bad substitution ##
# make dir and mv file into it and cd into
mvd () {
    	mkdir -p ${@[$#]}
    	mv $*
    	cd ${@[$#]}
}

# make dir and copy file then cd into
cpd () {
    	mkdir -p ${@[$#]}
    	cp -r $*
    	cd ${@[$#]}
}

#If you have ollama installed you can use these as alias. Change the Model to your liking.
#other small and fast models tinydolphin phi deepseek-coder dolphin-phi stablelm-zephyr

ollama_ask() { echo "$1" | ollama run tinyllama --verbose; }

ollama_say() { echo "$1" | ollama run tinyllama --verbose | tee response.txt| espeak -ven+f2 -s 260; cat response.txt ; }



