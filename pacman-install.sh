#!/usr/bin/sh

if [[ ! -L ~/.vimrc ]] ; then
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
extra/zsh \
community/tmux \
extra/ruby \
extra/php \
extra/vim \
extra/chromium \
community/the_silver_searcher \
community/thefuck \
community/redshift \
community/npm \
community/nodejs \
extra/ctags

#CONFIG
groupadd docker
sudo usermod -aG docker $USER
sudo ln -s /usr/bin/node /usr/bin/nodejs
sudo npm install tagsgen -g
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/powerline/fonts.git && sh ./fonts/install.sh && rm -rf fonts
sed -i 's/ZSH_THEME\=\"robbyrussell/ZSH_THEME\=\"agnoster/g' ~/.zshrc

#AUTOSTART
sudo systemctl enable docker
systemctl --user enable redshift-gtk.service

#DID YOU TRY TURNING IT OFF AND ON AGAIN?
sudo reboot
