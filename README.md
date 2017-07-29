Installation 
============

Clone the repository:
```
    git clone git@github.com/NicolasNSSM/dot-files.git repo ~/dot-files
```
Create symbolic links:
```
    for f in $(ls -1 ~/dot-files); do ln -fs ~/dot-files/$f ~/.$f; done
    ln -fs ~/dot-files/terminalrc ~/.config/xfce4/terminal/terminalrc
```
Install vim plugins:
```
    cd ~/dot-files
    git submodule init
    git submodule update
    for doc in ~/dot-files/vim/pack/plugins/start/**/doc ; do vim -u NONE -c "helptags $doc" -c q ; done
```
Done!
