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
export GOPATH=~/Workspaces/
export EDITOR=vim
export PAGER=less
export SYSTEMD_EDITOR=vim
export BROWSER=chrome
export TERM=xterm-256color

eval $(thefuck --alias f)

#ALIASES
alias meteo='curl -4 http://wttr\.in/nantes'
alias moon='curl -4 http://wttr\.in/moon'
alias nload='nload -u M -m'
alias tmx='tmux attach -t  $(echo ${PWD##*/} | sed s/[^a-zA-Z0-9]//g) || tmux new -s $(echo ${PWD##*/} | sed s/[^a-zA-Z0-9]//g) tmux source-file .tmux.conf'
alias ll='ls -lah'

alias docker-cleanup='docker stop $(docker ps -aq); \
		docker rm -vf $(docker ps -aq); \
		docker rmi -f $(docker images -q); \
		docker volume ls -qf dangling=true | xargs -r docker volume rm'

alias php-checker='find src spec tests features -name "*.php" | xargs -n1 -P0 php -l && docker run --rm -v $PWD:/app phpstan/phpstan analyse /app/src'
