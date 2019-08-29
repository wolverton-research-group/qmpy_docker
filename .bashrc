alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias ..='cd ../'                           # Go back 1 directory levelo

if [ -n "$force_color_prompt" ]; then
   if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
       color_prompt=yes
   else
       color_prompt=
   fi
fi

if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W $\[\033[00m\] "

if [ -x /usr/bin/dircolors ]; then
       test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
       alias ls='ls --color=auto'
       alias grep='grep --color=auto'
       alias fgrep='fgrep --color=auto'
       alias egrep='egrep --color=auto'
fi

alias oqmd='source activate oqmd'
# added by Miniconda2 4.0.5 installer
export PATH="/root/miniconda2/bin:$PATH"
