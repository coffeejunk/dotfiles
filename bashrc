echo "good day master!"
source .profile
# Bash customisations to be syncronised between machines.
export PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
export EDITOR='/usr/local/bin/vim'

# History
export HISTCONTROL=erasedups	# when adding an item to history, delete itentical commands upstream
export HISTSIZE=10000		# save 10000 items in history
shopt -s histappend		# append history to ~\.bash_history when exiting shell

# Lazy aliases
alias l='ls -lG'
alias ls='ls -G'
alias la='ls -Al'
alias ..='cd ..'
alias tree='tree -C'
alias trls='tree -C | less -R'	# -C outputs colour, -R makes less understand color
alias kiwiproj="./KiWi-FS.sh"
alias ra="cd ~/Dropbox/LMU/MI/Rech*"
alias promo="cd ~/Dropbox/LMU/MI/Pro*"
alias sml="ledit /usr/local/smlnj-110.72/bin/sml"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC --extraintf"
alias xspim="/Applications/spim/bin/xspim"
alias spim="spim -file"

# Reload .bashrc
alias refresh='. ~/.bashrc'

#beauty
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
