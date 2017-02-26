# zsh
if ! [ -d ~/.zplug ]; then
	curl -sL zplug.sh/installer | zsh
fi

# URxvt
if ! [ -d ~/.urxvt/ext ]; then
	curl -fLo ~/.urxvt/ext/font-size --create-dirs https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size
fi

# Base16
if ! [ -d ~/.config/base16-shell ]; then
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	zsh -ic base16_twilight
fi
