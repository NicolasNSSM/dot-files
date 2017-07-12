Installation 
============

Clone the repository:

    git clone repo ~/dot-files

Create symbolic links:

    for f in $(ls -1 ~/dot-files); do ln -s ~/dot-files/$f ~/.$f; done

Install vim plugins:
    cd ~/dot-files
    git submodule init
    git submodule update
    for doc in ~/dot-files/vim/pack/plugins/start/**/doc ; do vim -u NONE -c "helptags $doc" -c q ; done
Done!
