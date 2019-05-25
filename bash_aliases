alias reload='source ~/.bash_profile'
#alias reload='source ~/.bashrc'
alias vibash='vim ~/.bashrc'

# path shortcuts
export HTDOCS="/Applications/MAMP/htdocs/"
alias htdox="cd $HTDOCS/ && ll"
alias htdocs="cd $HTDOCS/ && ll"
alias notes="cd $HOME/Dropbox/Notizen"
alias tmp="cd $HOME/tmp/ && ll"
alias fhnw="cd $HOME/Dropbox/Job/Studium/FHWN/"
alias oop2="cd $HOME/Dropbox/Job/Studium/FHWN/2.\ Semester/m1_oopl2/"

# bash shortcuts
alias :q="exit"
alias q="exit"
alias c='clear'
alias j='jobs'

# ls options
alias ls="ls --color --time-style=long-iso"
alias l.='ls -dF .[a-zA-Z0-9]*' #only show dotfiles
alias ll.='ls -ldF .[a-zA-Z0-9]*' #only show dotfiles
alias ls="ls -Fh"
alias lsh="ls -aFh"
alias ll="ls -lFh"
alias llh="ls -alFh"

# editor shortcuts
alias vim="mvim -v"
alias vi="vim"
alias qvi="vim --noplugin"

#alias cless="/usr/share/vim/vim73/macros/less.sh"
alias cless="/opt/homebrew-cask/Caskroom/macvim/7.4-74/MacVim-snapshot-74/MacVim.app/Contents/Resources/vim/runtime/macros/less.sh"

# git shortcuts
alias g="git"
alias gs="git status"
alias gstat="git status"
alias ga="git add"
alias gc='git commit'
alias gd="git diff"
alias gls='find ~ -name ".git"'
alias gl="git log"
alias glgraph="git log --graph --pretty=format:'%C(yellow)%h%Creset%C(blue)%d%Creset %C(white bold)%s%Creset %C(white dim)(by %an %ar)%Creset' --all"
alias glbranch="git log --graph --simplify-by-decoration --pretty=format:'%d' --all"

# grep shortcuts
alias grep=ag
#alias grep='grep -rIin --color'
alias pgrep="pgrep -il"

# make shortcuts
alias m="make"
alias mr="make release"
alias mc="make clean"

# screen shortcuts
alias lsscr='screen -list'
alias screen='screen -T xterm-256color -xR'
alias screen-retach='screen -raAd'

# date shortcuts
alias today='date +"%A, %B %-d, %Y"'
alias year='cal -y $(date +"%Y")'

# generic application shortcuts
alias count='wc'
alias linecount='wc -l'
alias xterm='xterm +sb'
alias urxvt='urxvt +sb'
alias mount='mount |column -t'
alias lp='leafpad'
alias mp='mousepad'
alias qb="qutebrowser"
alias rdesktop='rdesktop -k de-ch -g 1280x1024'
alias scrot='import -window root screenshot.png'

# shortcuts for external applications
alias mocp="mocp -T green_theme"
alias mysqli="mycli -u root" #pw: root
alias httpie="http"
alias reddit="rtv"
alias sbb="fahrplan -f"
alias weather="curl wttr.in/zurich"
alias meteogram="finger zurich@graph.no"
alias tunedl="youtube-dl -x --audio-format mp3 --audio-quality 0"
alias watch_adam="streamlink twitch.tv/adam13531 source"
alias killchrome="pkill -9 -f 'Google Chrome\.app/.*/MacOS/Google Chrome Helper .*--type=renderer'"
alias killchrome2='killall -9 -m "Chrome Helper"'
#alias mutt='mutt -f imap://engelju@poseidon.nexus-ag.com'

# text file conv
alias dos2unix='recode dos/CR-LF..l1'
alias unix2win='recode l1..windows-1250'
alias unix2dos='recode l1..dos/CR-LF'