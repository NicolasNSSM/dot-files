Installation
============

Clone the repository:
```
    git clone git@github.com/NicolasNSSM/dot-files.git repo ~/dot-files
```
Create symbolic links:
```
    for f in $(ls -1 ~/dot-files); do ln -fs ~/dot-files/$f ~/.$f; done && mv .tslint.json tslint.json
    cp -vrs ~/dot-files/.config/* ~/.config
    rm -f ~/dot-files/.config/nvim/* && ln -fs ~/dot-files/.config/nvim/* ~/.config/nvim/ && ln -fs ~/dot-files/vim/UltiSnips/* ~/.config/coc/ultisnips/
```
Done!
