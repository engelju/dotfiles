# #######################################################
# .bashrc (c) julie engel
# #######################################################

# [ -f /etc/bashrc ] && /etc/bashrc
[ -f ~/.bash_bindings ] && source ~/.bash_bindings
[ -f ~/.bash_aliases ]  && source ~/.bash_aliases
[ -f ~/.bash_prompt ]   && source ~/.bash_prompt

# Global variables ######################################

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export TERM=screen-256color
export EDITOR=vim
export WINEDITOR=mvim

# add own bin
PATH="~/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/Applications/MAMP/bin/php/php7.0.10/bin/:$PATH
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# add webdev root
export HTDOCS="/Applications/MAMP/htdocs/"
alias htdox="cd $HTDOCS/ && ll"
alias htdocs="cd $HTDOCS/ && ll"
alias metanet.ch="cd $HTDOCS/metanet.ch/"
alias barracuda="cd $HTDOCS/barracuda.metanet.ch/"
alias kerio="cd $HTDOCS/kerio.metanet.ch/"

# History settings ######################################

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTIGNORE="ls:exit:logout:cd:pwd:reload:fg:cless"

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# unset LS_COLORS
LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

# Shell functions #######################################

# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

prefix () {
    for x in * ; do 
    	mv "$x" "$1$x" ;
    done
}

bu() {
    cp $1 `basename $1`-`date +%Y%m%d`.backup ;
}

function cless () {
    pygmentize -f terminal "$1" | less -R
}

function termsound () {
awk 'function wl() {
        rate=64000;
        return (rate/160)*(0.87055^(int(rand()*10)))};
    BEGIN {
        srand();
        wla=wl();
        while(1) {
            wlb=wla;
            wla=wl();
            if (wla==wlb)
                {wla*=2;};
            d=(rand()*10+5)*rate/4;
            a=b=0; c=128;
            ca=40/wla; cb=20/wlb;
            de=rate/10; di=0;
            for (i=0;i<d;i++) {
                a++; b++; di++; c+=ca+cb;
                if (a>wla)
                    {a=0; ca*=-1};
                if (b>wlb)
                    {b=0; cb*=-1};
                if (di>de)
                    {di=0; ca*=0.9; cb*=0.9};
                printf("%c",c)};
            c=int(c);
            while(c!=128) {
                c<128?c++:c--;
                printf("%c",c)};};}' | sox -t raw -r 64k -c 1 -e unsigned -b 8 - -d
}

#test if a file should be opened normally, or as root (vi)
#argc () {
        #count=0;
        #for arg in "$@"; do
                #if [[ ! "$arg" =~ '-' ]]; then count=$(($count+1)); fi;
        #done;
        #echo $count;
#}

#vi () { if [[ `argc "$@"` > 1 ]]; then /usr/bin/vim $@;
#                elif [ $1 = '' ]; then /usr/bin/vim;
#                elif [ ! -f $1 ] || [ -w $1 ]; then /usr/bin/vim $@;
#                else
#                        echo -n "File is readonly. Edit as root? (Y/n): "
#                        read -n 1 yn; echo;
#                        if [ "$yn" = 'n' ] || [ "$yn" = 'N' ];
#                            then /usr/bin/vim $*;
#                            else su -c "/usr/bin/vim $*";
#                        fi
#                fi
#            }

# Internet shortcuts ####################################

google() {
    search=""
    echo "$1"
    for term in $*; do
        search="$search%20$term"
    done
    #xdg-open "http://www.google.com/search?q=$search"
    exec w3m "http://www.google.com/search?q=$search"
}

leo() {
    search=""
    echo "$1"
    for term in $*; do
        search="$search%20$term"
    done
    exec w3m "http://pda.leo.org/ende?lp=ende&lang=de&searchLoc=0&cmpType=relaxed&sectHdr=on&spellToler=on&chinese=both&pinyin=diacritic&search=$search&relink=on"
}

wiki() {
    search=""
    echo "$1"
    for term in $*; do
        search="$search%20$term"
    done
    exec w3m "http://de.m.wikipedia.org/wiki/$search"
}

wiki-en() {
    search=""
    echo "$1"
    for term in $*; do
        search="$search%20$term"
    done
    exec w3m "http://en.m.wikipedia.org/wiki/$search"
}

uusers() {
    search=""
    echo "$1"
    for term in $*; do
        search="$search%20$term"
    done
    exec w3m "http://wiki.ubuntuusers.de/$search"
}

soflow() {
    search=""
    echo "$1"
    for term in $*; do
        search="$search+$term"
    done
    exec w3m "http://sa.column80.com/?s=$search&t=intitle"
}

function ytplay {
     youtube-dl --default-search=ytsearch: \
                --youtube-skip-dash-manifest \
                --output="${TMPDIR:-/tmp/}%(title)-s%(id)s.%(ext)s" \
                --restrict-filenames \
                --format="bestaudio[ext!=webm]" \
                --exec=mplayer -vvv "$*"
}

man() {
    env \
        LESS_TERMCAP_mb=$'\e[1;31m' \
        LESS_TERMCAP_md=$'\e[1;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[1;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[1;32m' \
            man "$@"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
