# Important Dotfiles

## zsh

### Install oh-my-zsh
```sh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
```

### Setup p10k
```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
p10k configure
```

### Setup zsh
```sh
ln -s $HOME/dotfiles/configs/zshrc $HOME/.zshrc
```

## Ghostty

```sh
ln -s $HOME/dotfiles/configs/ghostty $HOME/Library/Application\ Support/com.mitchellh.ghostty/config
```

## Hammerspoon
```sh
ln -s $HOME/dotfiles/configs/hammerspoon $HOME/.hammerspoon
```

## NormalVim
```sh
git clone https://github.com/engelju/NormalNvim.git ~/.config/nvim
```

## Git Config
```sh
ln -s $HOME/dotfiles/configs/gitconfig $HOME/.gitconfig
```

## Brewfile
```sh
ln -s $HOME/dotfiles/configs/Brewfile $HOME/.config/brewfile/Brewfile
brew file install
```

or

```sh
export HOMEBREW_BREWFILE=$HOME/dotfiles/configs/Brewfile
brew file install
```

# TODO
- mise
- vim 9
