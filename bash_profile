if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
   startfluxbox
fi
