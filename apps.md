# mac_setup

## Dev Tools
- Jetbrains Toolbox
    - Install IntelliJ and GoLand
    - Restore old layout:
        - ClassicUI: https://plugins.jetbrains.com/plugin/24468-classic-ui
        - https://dev.to/rytis/bring-back-old-intellij-theme-somewhat-5d6g
- Sublime Text
    - Restore old layout: https://www.youtube.com/watch?v=Rb5wFjo3diE
- Visual Studio Code
- OrbStack
- Neovim + NormalVim
    - https://github.com/engelju/NormalNvim
- iTerm2

## Must-Have
- Firefox
    - Settings
    - about:config
        - layout.css.devPixelsPerPx to 1.1
    - Extensions
        - Adaptive Tab Bar Color
        - Bitwarden Passwort Manager
        - Enhancer for Youtube + Unhook
        - Old Reddit Redirect + Reddit Enhancement Suite
        - Refined Github
        - Stylus: Styles see Repo
        - uBlock Origin (Enabled)
        - Vimium
    - Lepton: https://github.com/black7375/Firefox-UI-Fix
- Microsoft Office Suite for Mac
- Chromium
- Dropbox / OneDrive
- Spotify
- VLC
- Transmission

## Tools / Utilites
- Ice Menu Bar Manager
- Caffeine
- CoconutBattery
- Hammerspoon + config
    - Shortcuts for Apps
        - cmd+1 --> iTerm
        - cmd+2 --> Firefox
        - cmd+3 --> Sublime Text
    - Basic Window Manager w/Gaps
    - Blue Border for Active Window (window-highlight.lua)
    - Other Stuff
        - https://github.com/Adam13531/AdamsApple/tree/main/hammerspoon
        - https://www.hammerspoon.org/Spoons/
- AltTab
- [DockMate](https://www.macenhance.com/dockmate)
    - https://github.com/ejbills/DockDoor/
- Mission Control Plus
- [Easy Move+Resize](https://github.com/dmarcotte/easy-move-resize)
    - [Flexiglass](https://anjuta.com/flexiglass)
    - [SwiftShift](https://www.swiftshift.app/)
- F.lux
- Appcleaner
- Mouse: Mos https://mos.caldis.me/ or https://macmousefix.com/

### Outdated
- Karabiner / Seil
- [HyperSwitch](https://www.bahoom.com/hyperswitch/)
- [HyperDock](https://www.bahoom.com/hyperdock)
- [DockView](https://noteifyapp.com/dockview/)
- [DockExpose](https://dockexpose.netlify.app/)
- [DockAltTab](https://dockalttab.netlify.app/)
- [CDock](https://www.macenhance.com/cdock)
- [ShadowSweeper](https://www.irradiatedsoftware.com/labs/)

## HOMEBREW
Install Brewfile: https://homebrew-file.readthedocs.io/en/latest/installation.html

```bash
# tap repositories and their packages
tap homebrew/core
brew abseil
brew asciinema
brew autoconf
brew autoenv
brew automake
brew bat
brew ccat
brew colordiff
brew fd
brew ffmpeg
brew fzf
brew git-delta
brew gitu
brew gitui
brew htop
brew httpie
brew imagemagick
brew jq
brew lazydocker
brew lazygit
brew mise
brew mosh
brew mpg123
brew mpv
brew neovim
brew pv
brew ripgrep
brew screen
brew shellcheck
brew the_silver_searcher
brew tig
brew tmux
brew transmission-cli
brew tree
brew tree-sitter
brew w3m
brew xz
brew yazi
brew yq
brew yt-dlp

tap homebrew/cask
cask alt-tab
cask appcleaner
cask choosy
cask chromium
cask coconutbattery
cask cursor
cask displaylink
cask dockmate
cask domzilla-caffeine
cask dropbox
cask easy-move+resize
cask elgato-stream-deck
cask firefox
cask flux
cask git-credential-manager
cask hammerspoon
cask iterm2
cask jetbrains-toolbox
cask jordanbaird-ice
cask mac-mouse-fix
cask microsoft-auto-update
cask microsoft-office
cask microsoft-teams
cask mission-control-plus
cask mos
cask orbstack
cask spotify
cask steam
cask sublime-text
cask visual-studio-code
cask vlc
cask whatsapp

tap pablopunk/brew
# nerd-fonts casks

tap rcmdnk/file
brew brew-file

# App Store applications
appstore 426410278 Flexiglass (1.8)
```

