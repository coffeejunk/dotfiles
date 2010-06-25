echo "good day master!"
source ~/.profile
# Bash customisations to be syncronised between machines.
export PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
export EDITOR='mvim -f'

# History
export HISTCONTROL=erasedups	# when adding an item to history, delete itentical commands upstream
export HISTSIZE=10000		# save 10000 items in history
shopt -s histappend		# append history to ~\.bash_history when exiting shell

set completion-ignore-case On
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

# because spellchecking is nice :)
shopt -s cdspell

# Lazy aliases
alias l='ls -lG'
alias ls='ls -G'
alias la='ls -Al'
alias ..='cd ..'
alias tree='tree -Ca -I ".git|.svn|*.pyc|*.swp"'
alias trls='tree -C | less -R'	# -C outputs colour, -R makes less understand color
alias mkdir="mkdir -vp"

# aliases for the universtiy an so..
alias kiwiproj="./KiWi-FS.sh"
alias ra="cd ~/Dropbox/LMU/MI/Rech*"
alias promo="cd ~/Dropbox/LMU/MI/Pro*"
alias sml="ledit /usr/local/smlnj-110.72/bin/sml"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC --extraintf"
alias xspim="/Applications/spim/bin/xspim"
alias spim="spim -file"
alias dev="cd ~/Dropbox/Development"

# git aliases
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mvim'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'

# Reload .bashrc
alias refresh='. ~/.bashrc'

#beauty
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
