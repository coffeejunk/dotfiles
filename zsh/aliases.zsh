alias ls='ls -G'
alias l='ls -la'
alias ll='ls -l'

alias mongo_start="mongod --fork --config /usr/local/etc/mongod.conf --logpath /dev/null"
alias mongo_stop="kill -2 \$(ps x | grep -v 'grep' | grep mongo | xargs | cut -d' ' -f1)"
alias pg_start="pg_ctl -D /usr/local/var/postgres start > /dev/null"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop > /dev/null"

alias gti='git'
alias gst='git status'
alias gp='git push'
alias gb='git branch'
alias gs="gst"

change_git_mail() {
  ruby -e "fp = File.expand_path('~/.gitconfig'); f = File.read(fp); File.open(fp, 'w') {|file| file.puts f.gsub!(/email\s*=.*/, 'email = $1')}"
}
alias home="change_git_mail 'mxhaack@gmail.com'"

alias remove_trailing_whitespace="find . -name \"*.rb\" -exec sed -i \"\" 's/[ ]*$//' {} \\;"
