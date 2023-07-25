
set +H

#set-end-platform  () {
#
#case $HOSTNAME in
#
#   earth|jupiter|saturn|alpha|beta|gamma)
#   PLATFORM=debian
#   ;;
#
#   moon)
#   PLATFORM=manjaro
#   ;;
#
#   moonbaby)
#   PLATFORM=postmarketos
#   ;;
#
#   macbook.local)
#   PLATFORM=darwin
#   ;;
#
#   pluto)
#   PLATFORM=freebsd
#   ;;
#
#   *)
#   echo 'Hostname not recognised, assuming debian based'
#   PLATFORM=debian
#
#esac
#
#case $HOSTNAME in
#
#  #set a virtual debian system's hostname to "frontendtest" to test frontend setup
#  earth|saturn|moon|moonbaby|macbook.local|frontendtest)
#  END=front
#  ;;
#
#  venus|jupiter|pluto|alpha|beta|gamma)
#  END=back
#  ;;
#
#  *)
#  END=back
#  unamestr="$(uname -sr)"
#  if [[ $unamestr == CYGWIN* || $unamestr == MINGW* || $unamestr == MINGW32* || $unamestr == MSYS* || $HOSTNAME == work ]]; then
#    END=work
#  fi
#  ;;
#
#esac 
#
#export PLATFORM
#export END
#
#}

#export -f set-end-platform


export USER="${USER:-$(whoami)}"
export GITUSER="truth998877"

export REPOS="$HOME/repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export GLREPOS="$REPOS/gitlab.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export PGM="$GHREPOS/pgm"
export LOCALSCRIPTS="$DOTFILES/scripts/local/$HOSTNAME"
export LOGBOOKS="$GHREPOS/logbooks"
export LOGBOOKSINDEX="$HOME/logbooks.json"
export SCRIPTSINDEX="$HOME/scripts-index.json"
export NOTEBOOKS="$GHREPOS/notebooks"
export SNIPPETS="$DOTFILES/snippets"
export EDITOR=vi
export VISUAL=vi

export CDPATH=".:$LOGBOOKS:$NOTEBOOKS:$GHREPOS:$GLREPOS:$DOTFILES:$REPOS:$SCRIPTS:$SNIPPETS:$LOCALSCRIPTS"
#export CDPATH=".:$REPOS"


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

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\] \w\[\033[33m\] $(git branch 2>/dev/null | grep '^*' | cut -c3- )\[\033[32m\] [$(unix-time)]'$'\n\[\033[00m\]$ '
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


_source_if() { [[ -r "$1" ]] && source "$1"; }

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

#these can be on other systems if ~/.ssh/config is shared across systems
alias venus='ssh tony@venus'
alias oldvenus='ssh tony@oldvenus'
alias earth='ssh tony@earth'
alias moon='ssh tony@moon'
alias moonbaby='ssh user@moonbaby'
alias mars='ssh tony@mars'
alias jupiter='ssh tony@jupiter'
alias saturn='ssh tony@saturn'
alias uranus='ssh tony@uranus'
alias netpure='ssh tony@neptune'
alias pluto='ssh tony@pluto'
alias alpha='ssh -X tony@alpha'
alias beta='ssh -X tony@beta'
alias gamma='ssh -X tony@gamma'
alias macbook='ssh tony@macbook'
alias minecraftpi='ssh tony@minecraftpi'
alias work='ssh tonyr@work'

#these need to be on every system
alias '?'=duck
alias '??'=google
alias '???'=bing
alias now="date +'%A, %d %B %Y, %H:%M'"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## log books
#set the current logbook
#TODO if no argument use bash select to select a logbook based on it's title
set-clb () { . set-clb-1 "$1" ; clb ; }

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
export PATH=/opt/flex/bin:/home/tony/.local/bin:$PATH

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/repos/github.com/truth998877/dotfiles/scripts:~/repos/github.com/truth998877/dotfiles/scripts/local/$HOSTNAME:$HOME/.secrets/facebook:$PATH"

_source_if "$DOTFILES/set-platform-end"

if [[ $PLATFORM == darwin ]];then
  alias ls='ls -G'
fi

#these need to be on all systems
#export SNIPPETS="/home/tony/repos/github.com/truth998877/dotfiles/snippets"
#export LOCALSCRIPTS="$HOME/local-scripts"

#these are just for earth
#export MPVX=2764
#export MPVY=78
#export INKSCAPESHELLY=6
#export WEECHATTMUXY=31
#export WEECHATTMUXX=90

#these are not just for earth
complete -C facebook facebook
complete -C gamecaptures gamecaptures
complete -C jsonfun jsonfun
complete -C manageytchannel manageytchannel
complete -C picedit picedit
complete -C videdit videdit
complete -C pinterest pinterest
complete -C postvids2blog postvids2blog
complete -C promotevideo promotevideo
complete -C twitter twitter
complete -C youtube youtube
complete -C fbsecrets fbsecrets
complete -C twitch twitch
complete -C stream stream
complete -C ankicli ankicli
complete -C scripts-index scripts-index

_source_if "$HOME/.bashrc.d/.bashrc_$HOSTNAME"

if [[ $END == work ]]; then 
  _source_if "$HOME/.bashrc.d/.bashrc_work"
fi
