alias scpresume="rsync --partial --progress --rsh=ssh"

alias :q="exit"

alias ls='ls -G'
alias l='ls -la'
alias ll='ls -l'

alias mongo_start="mongod --fork --config /usr/local/etc/mongod.conf --logpath /dev/null"
alias mongo_stop="kill -2 \$(ps x | grep -v 'grep' | grep mongo | xargs | cut -d' ' -f1)"

alias pg_start="pg_ctl -D /usr/local/var/postgres start > /dev/null"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast > /dev/null"

alias es_start="elasticsearch -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"
alias es_stop="kill -3 \$(ps x | grep '[e]lasticsearch' | xargs | cut -d' ' -f1)"

alias redis_start="redis-server /usr/local/etc/redis.conf"
redis_stop() {
  if [ ! -e "/usr/local/var/run/redis.pid" ]
  then
    echo "redis-server isn't running"
  else
    REDIS_CLI=`which redis-cli`
    CONFIG_FILE=/usr/local/etc/redis.conf
    LISTENING_PORT=`grep -E "^ *port +([0-9]+) *$" "$CONFIG_FILE" | grep -Eo "[0-9]+"`
    $REDIS_CLI -p $LISTENING_PORT SHUTDOWN
  fi
}

alias gti='git'
alias gst='git status -sb'
alias gp='git push'
alias gb='git branch'
alias gs="gst"

change_git_mail() {
  ruby -e "fp = File.expand_path('~/.gitconfig'); f = File.read(fp); File.open(fp, 'w') {|file| file.puts f.gsub!(/email\s*=.*/, 'email = $1')}"
}
alias home="change_git_mail 'mxhaack@gmail.com'"

alias remove_trailing_whitespace="find . -name \"*.rb\" -exec sed -i \"\" 's/[ ]*$//' {} \\;"

alias be='bundle exec'

alias ip="curl http://wtfismyip.com/json"
alias cd..="cd .."
alias sl='ls'
alias rubby='ruby'
alias clera='clear'
alias claer='clear'
alias budnle='bundle'
alias penguin='curl -L http://flightleverage.com/penguin'
alias vlc='open -a vlc'
alias vi='vim'
alias brb='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
