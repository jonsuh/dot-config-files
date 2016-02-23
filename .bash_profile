# Sublime as Editor
export EDITOR='s -w' # Sublime

# Autocomplete symlinked directories
bind 'set mark-symlinked-directories on'

# ----------------------------------
# Paths
# ----------------------------------
# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Go path
# export GOPATH=$HOME/.go

# Node path
export PATH=$PATH:./node_modules/.bin # npm

# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

# ----------------------------------
# Medium
# ----------------------------------
export MEDIUM_INTEGRATION_TOKEN=''
export MEDIUM_USER_ID=''

# ----------------------------------
# Aliases
# ----------------------------------
alias ll='ls -al'
alias clr='clear'
alias o='open .'
alias spotlight.off='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'
alias spotlight.on='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'

# ----------------------------------
# gulp/Grunt Starter
# ----------------------------------
gulpify() {
  if [ "$1" ]; then
    git clone git@github.com:jonsuh/gulp-grunt-starter.git ~/Work/$1
    cd ~/Work/$1
    rm Gruntfile.js LICENSE package.grunt.json README.md
    sudo rm -R .git
    npm install
  else
    echo -e "${RED}Error:${NOCOLOR} Specify a directory name to gulpify."
  fi
}

# ----------------------------------
# Git
# ----------------------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gp='git pull'
alias gs='git status'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'

function glf() {
  git log --all --grep="$1";
}

# ----------------------------------
# Git Prompt
# ----------------------------------
GIT_PROMPT_ONLY_IN_REPO=1

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# ----------------------------------
# MySQL
# ----------------------------------
alias mysql.start='mysql.server start'
alias mysql.stop='mysql.server stop'
alias mysql.status='mysql.server status'

# ----------------------------------
# Apache
# ----------------------------------
alias apache.log='tail -f /var/log/apache2/error_log'
alias apache.restart='sudo apachectl restart'
alias apache.graceful='sudo apachectl graceful'

# ----------------------------------
# PHP
# ----------------------------------
# alias phps='php -S localhost:8000'

# ----------------------------------
# Postgres
# ----------------------------------
# alias pg.start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
# alias pg.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# ----------------------------------
# Miscellaneous
# ----------------------------------
function w() {
  if [ -e ~/Work/$1 ]
  then
    cd ~/Work/$1
    if [ "$1" != "" ]
    then
      echo -e "${GREEN}Switched to $1.${NOCOLOR}"
    else
      echo -e "${GREEN}Switched to work.${NOCOLOR}"
    fi
  else
    echo -e "${RED}Error:${NOCOLOR} Directory $1 does not exist."
  fi
}

function _w() {
  local cur opts
  cur="${COMP_WORDS[COMP_CWORD]}"
  # opts=$(cd ~/Work ; ls -d */. | sed 's|/./||')
  opts=$(cd ~/Work ; ls -d *)
  COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}

complete -F _w w

# Load RVM into a shell session *as a function* (at EOF)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
