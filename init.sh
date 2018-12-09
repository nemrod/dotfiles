# zsh
if ! [ -d ~/.zplug ]; then
	curl -sL zplug.sh/installer | zsh
fi

# Base16
if ! [ -d ~/.config/base16-shell ]; then
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	zsh -ic base16_twilight
fi

# :PromptlineSnapshot ~/.shell_prompt.sh airline
