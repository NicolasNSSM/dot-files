#ENV
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:$PATH
export PATH=~/.bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export PATH=$(ruby -rubygems -e "puts Gem.user_dir")/bin:$PATH
export PATH=~/workspace/go/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=./vendor/bin:$PATH
export PATH=./bin:$PATH
export PATH=./app:$PATH
export PATH=./:$PATH
export GOPATH=~/Workspace/
export CDPATH=~/Workspace/:$CDPATH
export EDITOR=vim
export PAGER=less
export SYSTEMD_EDITOR=vim
export BROWSER=chrome
export TERM=xterm-256color

eval $(thefuck --alias f)

HISTSIZE=500000
SAVEHIST=500000
HISTFILE=~/.zsh_history
setopt globdots

# Key binding
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

#DOCKERIZED TOOLS
alias php71='docker run --rm -it -v "$PWD":/opt -w /opt php:7.1 php'
alias php56='docker run --rm -it -v "$PWD":/opt -w /opt php:5.6 php'
alias phpstan='find src spec tests features -name "*.php" | xargs -n1 -P0 php -l && docker run --rm -v $PWD:/app phpstan/phpstan analyse --level 7 /app/src'

alias i3cheatsheet='egrep ^bind ~/.config/i3/config | cut -d '\'' '\'' -f 2- | sed '\''s/ /\t/'\'' | column -ts $'\''\t'\'' | pr -2 -w 145 -t | less'
alias battery='upower -i $(upower -e | grep 'BAT') | grep -E "state|time\ to\ full|percentage|capacity"'

#ALIASES
alias :e="vim"
alias apps="find ~/Desktop -name 'chrome*.desktop' -exec '{}' \;"
alias meteo='curl -4 http://wttr\.in/nantes'
alias moon='curl -4 http://wttr\.in/moon'
alias nload='nload -u M -m'
alias tmx='tmux attach -t $(echo ${PWD##*/} | sed "s/[^a-zA-Z0-9]//g") || tmux new -s $(echo ${PWD##*/} | sed "s/[^a-zA-Z0-9]//g") tmux source-file .tmux.conf'

alias docker-cleanup='docker stop $(docker ps -aq); \
        docker rm -vf $(docker ps -aq); \
        docker rmi -f $(docker images -q); \
        docker network rm $(docker network ls -q); \
        docker volume ls -qf dangling=true | xargs -r docker volume rm'
export GPG_TTY=$(tty)
