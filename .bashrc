
set +H


#TODO split into END specific files, front end aliases are not needed on back end systems and vice versa, also allow specific alias for work without leaking front and back end things etc. on to work.

#-----PREAMBLE-----
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

HISTSIZE=3000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
#----------

#-----SOURCE IF-----
_source_if() { [[ -r "$1" ]] && source "$1"; }
#-----

#------GENERIC ENV VARS-----
export EDITOR=vi
export VISUAL=vi
export USER="${USER:-$(whoami)}"
export REPOS="$HOME/repos"     #not work
export DOTFILES="$REPOS/github.com/truth998877/dotfiles"  
export SCRIPTS="$DOTFILES/scripts"  
export SNIPPETS="$DOTFILES/snippets"
export LOCALSCRIPTS="$DOTFILES/scripts/local/$HOSTNAME"
export GTDEV="$REPOS/github.com/truth998877/GTDev-NG"

export CDPATH=".:$DOTFILES:$REPOS:$SCRIPTS:$SNIPPETS:$LOCALSCRIPTS:$GTDEV"
#-----

#----PROMPT----
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
   foot|xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(git branch 2>/dev/null | grep '^*' | colrm 1 2)\n$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\] \w\[\033[33m\] $(git branch 2>/dev/null | grep '^*' | cut -c3- )\[\033[31m\] [$(unix-time)]'$'\n\[\033[00m\]$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
#-----

#-----DIR COLOURS-----
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
#-----

#-----GENERIC ALIASES-----
# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

alias now="date +'%A, %d %B %Y, %H:%M'"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
#-----

#----SET-PLATFORM-END----
_source_if "$DOTFILES/set-platform-end"
#-----

#----END SPECIFIC ENV VARS-----
case "$END" in
  front|back)
    export GITUSER="truth998877"   #not work
    export GHREPOS="$REPOS/github.com/$GITUSER"  #not work
    export GLREPOS="$REPOS/gitlab.com/$GITUSER"   #not work
    export PGM="$GHREPOS/pgm"
    export FORTIESGAMER="$GHREPOS/fortiesgamer-site"  #not work
    export STUDYWITHTONY="$GHREPOS/studywithtony-site"  #not work
    export LOGBOOKS="$GHREPOS/logbooks"
    export LOGBOOKSINDEX="$HOME/logbooks.json"
    export SCRIPTSINDEX="$HOME/scripts-index.json"
    export NOTEBOOKS="$GHREPOS/notebooks"
		export NOTEBOOKSINDEX="$HOME/notebooks.json"
    export CDPATH="$CDPATH:$FORTIESGAMER:$STUDYWITHTONY:$GHREPOS:$GLREPOS:$PGM:$LOGBOOKS:$NOTEBOOKS"
		export MPVSCALE=50
    ;;
esac
#-----

#-----END SPECIFIC FUNCTIONS-----
if [[ "$END" == front ]];then
  boot() { ssh tony@oldvenus "/home/tony/bootsystem \"$@\""; }
fi

if [[ "$END" == front ]] || [[ "$END" == work ]];then
  #set the current logbook
  #TODO if no argument use bash select to select a logbook based on it's title
  set-clb () { . set-clb-1 "$1" ; clb ; }
  set-cnb () { . set-cnb-1 "$1" ; cnb ; }
fi
#-----

#-----END SPECIFIC ALIASES-----
case "$END" in
  front|back)
    alias '?'=gpt
    alias '??'=duck
    alias '???'=google
    alias '????'=bing
		alias mercury='ssh tony@mercury'
    alias venus='ssh tony@venus'
    alias oldvenus='ssh tony@oldvenus'
    alias earth='ssh -Y tony@earth'
    alias moon='ssh tony@moon'
    alias moonbaby='ssh user@moonbaby'
    alias mars='ssh -Y tony@mars'
    alias jupiter='ssh tony@jupiter'
    alias saturn='ssh tony@saturn'
    alias uranus='ssh tony@uranus'
    alias netpure='ssh tony@neptune'
    alias pluto='ssh tony@pluto'
    alias alpha='ssh -Y tony@alpha'
    alias beta='ssh -Y tony@beta'
    alias gamma='ssh -Y tony@gamma'
		alias eris='ssh -Y tony@eris'
    alias macbook='ssh tony@macbook'
    alias minecraftpi='ssh tony@minecraftpi'
    alias work='ssh -Y tonyr@work'
		alias debiantesting='ssh tony@debiantesting'
		alias openmc-testing='ssh tony@openmc-testing'
		alias kali='ssh -Y tony@kali'
		alias mail='neomutt'
		alias dvwa='ssh tony@dvwa'
		alias titan='ssh -Y tony@titan'
		alias thinkpad='ssh -Y tony@thinkpad'
		alias pihole='ssh -Y tony@pihole'
		alias squid='ssh -Y tony@squid'
		alias sedna='ssh -Y tony@sedna'
		alias gonggong='ssh -Y tony@gonggong'
		alias makemake='ssh -Y tony@makemake'
		alias boilerpi='ssh tony@boilerpi'
  ;;
esac
#-----


#-----PLATFORM SPECIFIC ALIASES
if [[ $PLATFORM == darwin ]];then
  alias ls='ls -G'
fi
#-----


#-----COMPLETION-----
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#these are not just for earth
if [[ $END == front ]];then
  complete -C facebook facebook #front
  complete -C jsonfun jsonfun #front
  complete -C manageytchannel manageytchannel #front
  complete -C picedit picedit #front
  complete -C videdit videdit #front
  complete -C pinterest pinterest #front
  complete -C postvids2blog postvids2blog #front
  complete -C promotevideo promotevideo #front
  complete -C twitter twitter #front
  complete -C youtube youtube #front
  complete -C fbsecrets fbsecrets #front
  complete -C twitch twitch #earth
  complete -C stream stream #earth
  complete -C ankicli ankicli #front
  complete -C scripts-index scripts-index #front
fi

#TODO move to .bashrc_earth
if [[ $HOSTNAME == earth ]]; then
  complete -C gamecaptures gamecaptures #earth
fi
#-----


#-----PATH-----
#TODO finer control of the path for specific machines is needed
export PATH=/opt/flex/bin:/home/tony/.local/bin:$PATH

#scripts and local scripts
export PATH="$HOME/repos/github.com/truth998877/dotfiles/scripts:~/repos/github.com/truth998877/dotfiles/scripts/local/$HOSTNAME:$PATH"

case "$END" in
  front|back)
    #go
    #export PATH="/usr/local/go/bin:$PATH"
    if [ ! -z "$(which go)" ];then
			export PATH="$HOME/go/bin:$PATH"
    fi

    #Install Ruby Gems to ~/gems
    export GEM_HOME="$HOME/gems"
    export PATH="$HOME/gems/bin:$PATH"
    
    #secrets
    export PATH="$HOME/.secrets/facebook:$PATH"
  ;;
esac
#-----

if [ -f $HOME/bin/Write/Write ]; then
    export PATH="$HOME/bin/Write:$PATH"
fi


#-----MACHINE SPECIFIC BASHRC-----
_source_if "$HOME/.bashrc.d/.bashrc_$HOSTNAME"
_source_if "$HOME/.bashrc_kali"
#-----


#-----WORK SPECIFIC BASHRC-----
if [[ $END == work ]]; then 
  _source_if "$HOME/.bashrc.d/.bashrc_work"
fi
#-----



