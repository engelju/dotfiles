alias reload='source ~/.bash_profile'
#alias reload='source ~/.bashrc'

alias xterm='xterm +sb'
alias urxvt='urxvt +sb'
#alias rdesktop='rdesktop -k de-ch -g 1280x1024'

#alias lp='leafpad'
#alias mp='mousepad'

alias mount='mount |column -t'
alias scrot='import -window root screenshot.png'
#alias mutt='mutt -f imap://engelju@poseidon.nexus-ag.com'

alias htdocs="cd /Applications/MAMP/htdocs/"
alias love="/Applications/love.app/Contents/MacOS/love"

# general shortcuts
alias :q="exit"
alias q="exit"
alias c='clear'
alias j='jobs'
alias vim="mvim -v"
alias vi="vim"

alias g="git"
alias gs="git status"
alias gstat="git status"
alias ga="git add"
alias gc='git commit'
alias gd="git diff"

#alias gl="git log"
alias gl="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)'"
#alias glgraph="git log --pretty=oneline --decorate --graph"
alias glgraph="git log --graph --pretty=format:'%C(yellow)%h%Creset%C(blue)%d%Creset %C(white bold)%s%Creset %C(white dim)(by %an %ar)%Creset' --all"
alias glbranch="git log --graph --simplify-by-decoration --pretty=format:'%d' --all"

alias gls='find /home/engelju -name ".git"'

#alias l.='ls -dF .[a-zA-Z0-9]* --color=tty' #only show dotfiles
alias ls="ls --color --time-style=long-iso"
alias l.='ls -dF .[a-zA-Z0-9]*' #only show dotfiles
alias ls="ls -aFh"
alias ll="ls -alFh"

alias count='wc'
alias linecount='wc -l'

# date shortcuts
alias cal='cal -m3'
alias today='date +"%A, %B %-d, %Y"'
alias year="when --past=0 --future=365 c"
alias appointments="when"

# screen shortcuts
alias lsscr='screen -list'
alias screen='screen -T xterm-256color -xR'
alias screen-retach='screen -raAd'

#alias pgrep='pgrep -l'
alias pgrep="pgrep -il"
#alias grep='grep -rIin --color'
#alias grep=~/bin/ack.pl
#alias grep=~/bin/ack.pl
alias grep=ag

#alias vi='vim -p -T xterm-256color'
alias viconk='vim ~/.conkyrc'
alias vibash='vim ~/.bashrc'
alias cless="/usr/share/vim/vim70/macros/less.sh"

alias m="make"
alias mr="make release"
alias mc="make clean"

# text file conv
alias dos2unix='recode dos/CR-LF..l1'
alias unix2win='recode l1..windows-1250'
alias unix2dos='recode l1..dos/CR-LF'

# shortcut to chrome
alias chrome="$HOME/bin/chromer/chrome-wrapper"
alias killchrome="pkill -9 -f 'Google Chrome\.app/.*/MacOS/Google Chrome Helper .*--type=renderer'"
alias killchrome2='killall -9 -m "Chrome Helper"'

# start mocp with fitting theme
#alias mocp="mocp -T lianli"
alias mocp="mocp -T green_theme"

alias mysqli="mycli -u root" #pw: root
alias httpie="http"

alias tunedl="youtube-dl -x --audio-format mp3 --audio-quality 0"
