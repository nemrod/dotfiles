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

# merge base and local i3 config
[ -r $HOME/.config/i3/config.base ] && cp $HOME/.config/i3/config.base $HOME/.config/i3/config
[ -r $HOME/.config/i3/config.local ] && cat $HOME/.config/i3/config.local >> $HOME/.config/i3/config

type qutebrowser 2> /dev/null && export BROWSER=qutebrowser

exec i3
