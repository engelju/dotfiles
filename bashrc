# #######################################################
# .bashrc (c) julie engel
# #######################################################

# Global variables ######################################

# specify english as overall language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# set terminal variable
export TERM=screen-256color

# set editor variable
export EDITOR=vim
export WINEDITOR=mvim

# set colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

# specify JAVA home dir
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-12.0.1.jdk/Contents/Home

# add own bin
PATH="HOME/bin:$PATH"
export PATH=/usr/local/bin:$PATH

# add composer and php from mamp to bin
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/Applications/MAMP/bin/php/php7.0.10/bin/:$PATH

# add the java path to bin
export PATH=$JAVA_HOME/bin:$PATH

# History settings ######################################

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTIGNORE="ls:exit:logout:cd:pwd:reload:fg:cless"

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Source other bash config files ########################

# [ -f /etc/bashrc ] && /etc/bashrc

# set vi keybindings and reset some back to their emacs-bindings
[ -f ~/.bash_bindings ] && source ~/.bash_bindings

# define some aliases
[ -f ~/.bash_aliases ]  && source ~/.bash_aliases

# set up bash prompt
[ -f ~/.bash_prompt ]   && source ~/.bash_prompt

# set up bash functions
[ -f ~/.bash_functions ]   && source ~/.bash_functions