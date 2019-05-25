# create a new dir and change into it
cmkdir(){ mkdir "$1" && cd "$1" || exit; }

# creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

# extract anything
extract () {
  if [ -f "$1" ] ; then
      case "$1" in
          *.tar.bz2)   tar xvjf "$1"    ;;
          *.tar.gz)    tar xvzf "$1"    ;;
          *.bz2)       bunzip2 "$1"     ;;
          *.rar)       rar x "$1"       ;;
          *.gz)        gunzip "$1"      ;;
          *.tar)       tar xvf "$1"     ;;
          *.tbz2)      tar xvjf "$1"    ;;
          *.tgz)       tar xvzf "$1"    ;;
          *.zip)       unzip "$1"       ;;
          *.Z)         uncompress "$1"  ;;
          *.7z)        7z x "$1"        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# prefix every file in folder with given argument
prefix () {
    for x in * ; do
    	mv "$x" "$1$x" ;
    done
}

# create a .backup file of the given file
bu() {
    cp "$1" "$(basename "$1")"-"$(date +%Y%m%d)".backup ;
}

# plays sound with the help of awk. needs `sox`.
termsound () {
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

# download and play something from youtube with `mplayer`
ytplay() {
     youtube-dl --default-search=ytsearch: \
                --youtube-skip-dash-manifest \
                --output="${TMPDIR:-/tmp/}%(title)-s%(id)s.%(ext)s" \
                --restrict-filenames \
                --format="bestaudio[ext!=webm]" \
                --exec=mplayer -vvv "$*"
}

# use colors for man
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

# displays the given man page with Preview.app
printman() {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

# test if a file should be opened normally, or as root (vi)
argc () {
    count=0
    for arg in "$@"
    do
        if [[ ! "$arg" =~ '-' ]]
            then count=$count+1
        fi
    done
    echo $count
}

viopen () {
    if [[ $(argc "$@") -gt 1 ]]
        then $EDITOR "$@"
    elif [ "$1" = '' ]
        then $EDITOR
    elif [ ! -f "$1" ] || [ -w "$1" ]
        then $EDITOR "$@"
    else
        echo -n "File is readonly. Edit as root? (Y/n): "
        read -n 1 yn
        if [ "$yn" = 'n' ] || [ "$yn" = 'N' ]
            then $EDITOR "$@"
        else 
            sudo $EDITOR "$*"
        fi
    fi
}
