Installing 
----------
1. clone the repo: 

    git clone https://github.com/thenerd247/vimrc.git

2. add an alias to use the vimrc in the cloned repo

    echo 'vimnrd="vim -u /path/to/cloned/repo/vimrc' > ~/.bash_aliases

3. symlink the vundle directory

    cd vundle/
    ln -s ../Vundle.vim/ 

4. install the plugins 

    vimnrd +PluginInstall
