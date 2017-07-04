Installation 
============

Clone the repository:

    git clone repo ~/dot-files

Create symbolic links:

    for f in $(ls -1 ~/dot-files); do ln -s ~/dot-files/$f ~/.$f; done

Done!
