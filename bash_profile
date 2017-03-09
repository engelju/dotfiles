set -o vi

[ -f ~/.profile ] && source ~/.profile
[ -f ~/.bashrc ] && source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
