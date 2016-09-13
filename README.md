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
    1. `ln -s ~/dotfiles/vimrc ~/.vimrc`
    2. `ln -s ~/dotfiles/vim ~/.vim`
    3. Start `vim` to automatically start the installation process
