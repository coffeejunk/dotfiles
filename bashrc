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
alias cls="clear"
alias vim="mvim"
alias v="mvim"
alias l='ls -lG'
alias ls='ls -G'
alias la='ls -Al'
alias ..='cd ..'
alias tree='tree -Ca -I ".git|.svn|*.pyc|*.swp"'
alias trls='tree -C | less -R'	# -C outputs colour, -R makes less understand color
alias mkdir="mkdir -vp"
alias ql="qlmanage -p 2>/dev/null"
alias preview="groff -Tps > /tmp/tmp.ps && open -a Preview /tmp/tmp.ps"

# make a pdf from the specified manpage
man2pdf () { 
	man $1 -t | ps2pdf - $1.pdf
}

# open the man page in Skim (i prefer Skim to Preview, but it works alike if you change to Preview.app)
pman () {
    man -t "${1}" | open -f -a /Applications/Skim.app
}

# opens the manpage in mvim
vman () {
   MANWIDTH=160 MANPAGER='col -bx' man $@ | mvim -
}

# relaunch any app from the terminal
relaunch () {
    for app in $*; do
        osascript -e 'quit app "'$app'"';
        sleep 2;
        open -a $app
    done
}

# open the man page in the default browser
bman () {
	gunzip < `man -w $@` | groff -Thtml -man | bcat
}

# mount the kiwi project files
kiwifs () {
	directory="/Volumes/KiWi"
	if [ -w $directory ];then
		echo "already mounted"
	else 
		mkdir -p $directory 
		sshfs -p 54321 root@totoya.pms.ifi.lmu.de:/root/KiWi $directory 
	fi
}

# aliases for the universtiy an so..
alias ra="cd ~/Dropbox/LMU/MI/Rech*"
alias promo="cd ~/Dropbox/LMU/MI/Pro*"
alias sml="ledit /usr/local/smlnj-110.72/bin/sml"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC --extraintf 1"
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
alias ga='git add'

# Reload .bashrc
alias refresh='. ~/.bashrc'

#beauty
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
