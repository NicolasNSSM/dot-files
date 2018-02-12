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
Done!
