#!/usr/bin/bash

if [ ! -L ~/.vimrc ] ; then
    echo 'Install dotfiles first'
    exit
fi

#UPDATE
sudo pacman-mirrors -g
sudo pacman-optimize && sync
sudo pacman -Syyu --noconfirm

#DIR
mkdir -p ~/Workspace/{KNPLabs,NSSM,FOSS}

#INSTALL
sudo pacman -S --noconfirm \
    community/docker \
    community/docker-compose \
    community/nodejs \
    community/npm \
    community/redshift \
    community/the_silver_searcher \
    community/thefuck \
    community/tmux \
    community/shellcheck \
    community/tldr \
    extra/chromium \
    extra/ctags \
    extra/php \
    extra/ruby \
    extra/gvim \
    extra/zsh \
    extra/composer \
    extra/yaourt

sudo yaourt -S --noconfirm \
    nord-xfce-terminal

#CONFIG
groupadd docker
sudo usermod -aG docker "$USER"
sudo ln -s /usr/bin/node /usr/bin/nodejs
sudo npm install -g tagsgen eslint stylelint
composer global require hirak/prestissimo
git clone git@github.com:powerline/fonts.git && sh ./fonts/install.sh && rm -rf fonts
git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's/ZSH_THEME\=\"robbyrussell/ZSH_THEME\=\"agnoster/g' ~/.zshrc
sed -i 's/^plugins=(/plugins=(\n  colored-man-pages\n  docker-compose\n  docker/g' ~/.zshrc

#AUTOSTART
sudo systemctl enable docker
systemctl --user enable redshift-gtk.service
chsh -s "which zsh"

#DID YOU TRY TURNING IT OFF AND ON AGAIN?
sudo reboot
