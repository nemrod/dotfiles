if ! [ -d ~/.zplug ]; then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

if ! [ -d ~/.config/base16-shell ]; then
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	zsh -ic base16_twilight
fi

# :PromptlineSnapshot ~/.shell_prompt.sh airline
