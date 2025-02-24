#!/bin/sh

# load Xresources
userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
[ -r "$sysresources" ] && xrdb -merge "$sysresources"
[ -r "$userresources" ] && xrdb -merge "$userresources"

# run some default system scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# add tray icons for and start fcitx
if type fcitx5 2> /dev/null; then
	export GTK_IM_MODULE=fcitx
	export QT_IM_MODULE=fcitx
	export XMODIFIERS="@im=fcitx"
	export SDL_IM_MODULE=fcitx
	fcitx5 &
fi

type xbindkeys 2> /dev/null && [ -r $HOME/.xbindkeysrc ] && xbindkeys
type redshift-gtk 2> /dev/null && redshift-gtk &
type start-pulseaudio-x11 2> /dev/null && start-pulseaudio-x11
type xautolock 2> /dev/null && xautolock &
type easystroke 2> /dev/null && easystroke &

type qutebrowser 2> /dev/null && export BROWSER=qutebrowser

exec i3
