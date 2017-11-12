#!/bin/sh

# load Xresources
userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
[ -r "$sysresources" ] && xrdb -merge "$sysresources"
[ -r "$userresources" ] && xrdb -merge "$userresources"

# run some default system scripts
for f in /etc/X11/xinit/xinitrc.d/* ; do
	[ -x "$f" ] && . "$f"
done
unset f

# add tray icons for and start fcitx
if type fcitx 2> /dev/null; then
	export GTK_IM_MODULE=fcitx
	export QT_IM_MODULE=fcitx
	export XMODIFIERS="@im=fcitx"
	fcitx
fi

type xbindkeys 2> /dev/null && [ -r $HOME/.xbindkeysrc ] && xbindkeys
type redshift-gtk 2> /dev/null && redshift-gtk &
type start-pulseaudio-x11 2> /dev/null && start-pulseaudio-x11
type xautolock 2> /dev/null && xautolock &
type easystroke 2> /dev/null && easystroke &

# merge base and local i3 config
[ -r $HOME/.i3/config.base ] && cp $HOME/.i3/config.base $HOME/.i3/config
[ -r $HOME/.i3/config.local ] && cat $HOME/.i3/config.local >> $HOME/.i3/config

type termite 2> /dev/null && TERMINAL=termite

exec i3
