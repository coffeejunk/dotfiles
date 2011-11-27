# some funcitons were taken from oh-my-zsh see
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
# the theme was originally taken from
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/gallois.zsh-theme
# and modified until i liked it.

# load colors to zsh and enable prompt substitution
autoload colors; colors;
setopt prompt_subst

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return ""
  echo ${ref#refs/heads/}
}

# current branch and check if ahead of origin
function branch_info() {
  local branch="$(current_branch)"
  local ahead_commits=$(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' | wc -l | tr -d ' ')
  if [ $ahead_commits -gt 0 ]; then
    echo "$branch ~$ahead_commits"
  else
    echo "$branch"
  fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  if [[ -n $(git status -s 2> /dev/null) ]]; then
    echo "%{$fg[red]%}"
  else
    echo "%{$fg[green]%}"
  fi
}

function git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)[$(branch_info)]%{$reset_color%}"
  fi
}

if [[ -n '$(hash git)' ]]; then
  git_status='$(git_custom_status)'
fi

if [[ -s ~/.rvm/scripts/rvm ]] ; then
  rvm_status='%{$fg[green]%}[`~/.rvm/bin/rvm-prompt`]%{$reset_color%} $EPS1'
fi

RPS1=$git_status$rvm_status

PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
