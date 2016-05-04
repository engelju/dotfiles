dotfiles
========

On a new computer, clone the repository.

- Add a new dotfile to the repository: ```mv ~/.dotfile ~/dotfiles/dotfile```
- Link a dotfile from the repo to the homedir: ```ln -s ~/dotfiles/dotfile ~/.dotfile```

Also have look at HOWTO.

Bare Necessities:
-----------------

- Setup Bash:
    - Link `bashrc` / `bash_aliases` / `bash_bindings` / `bash_prompt`
- Setup tmux:
    - Link `tmux.conf`
- Setup vim:
    - link `vimrc` and `vim/`
    - Setup [Vundle](https://github.com/VundleVim/Vundle.vim): ```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```
