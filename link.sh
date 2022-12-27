ln -s $HOME/.dotfiles/.zshrc $HOME
ln -s $HOME/.dotfiles/.p10k.zsh $HOME
ln -s $HOME/.dotfiles/.vimrc $HOME
ln -s $HOME/.dotfiles/.tmux.conf $HOME
ln -s $HOME/.dotfiles/.xinitrc $HOME
ln -s $HOME/.dotfiles/.Xresources $HOME
ln -s $HOME/.dotfiles/.bin $HOME

mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3/config.d
mkdir -p $HOME/.config/i3status
mkdir -p $HOME/.config/i3blocks
ln -s $HOME/.dotfiles/.config/i3/config $HOME/.config/i3
ln -s $HOME/.dotfiles/.config/i3status/config $HOME/.config/i3status
ln -s $HOME/.dotfiles/.config/i3blocks/config $HOME/.config/i3blocks

mkdir -p $HOME/.config/dunst
ln -s $HOME/.dotfiles/.config/dunst/dunstrc $HOME/.config/dunst

mkdir -p $HOME/.config/qutebrowser
ln -s $HOME/.dotfiles/.config/qutebrowser/config.py $HOME/.config/qutebrowser

mkdir -p $HOME/.config/termite
ln -s $HOME/.dotfiles/.config/termite/config $HOME/.config/termite

mkdir -p $HOME/.config/alacritty
ln -s $HOME/.dotfiles/.config/alacritty/alacritty.yml $HOME/.config/alacritty
